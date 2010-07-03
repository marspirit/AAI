/**
 * Calcule les �l�vations en tir tendu et tir courb� que doit avoir le canon pour atteindre sa cible en s'appuyant sur les tables pr�calcul�es
 * 
 * @param 0 distance en m�tres de la cible
 * @param 1 diff�rence d'altitude en m�tres de la cible
 * @param 2 vitesse initiale du projectile en m/s
 * @param 3 coefficient de frottement dans l'air du projectile
 * @param 4 �cart maximale en m�tres souhait� pour la pr�cision de la solution
 * 
 * @return tableau au format suivant [bool�en tir tendu possible, �l�vation tir tendu, temps vol tendu, bool�en tir courb� possible, �l�vation tir courb�, temps vol courb�]
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
private ["_distance_cible", "_altitude_cible", "_vitesse_initiale", "_coef_frottement", "_precision", "_retour", "_table", "_i"];

// Param�tres d'entr�es
_distance_cible = _this select 0; // Par rapport au canon
_altitude_cible = _this select 1; // Relative au canon
_vitesse_initiale = _this select 2;
_coef_frottement = _this select 3; // Positif, proche de 0
_precision = _this select 4; // Positif, proche de 0

_retour = [false, 0, 0, false, 0, 0];

// Recherche de la table correspondant � la vitesse initiale et au coef de frottement
for [{_i = 0}, {_i < count R3F_ARTY_tables && isNil "_table"}, {_i = _i+1}] do
{
	if (R3F_ARTY_tables select _i select 0 select 0 == _vitesse_initiale && (R3F_ARTY_tables select _i select 0 select 1 == _coef_frottement)) then
	{
		_table = R3F_ARTY_tables select _i;
	};
};

// Si la table n'est pas trouv�e, on abandonne le calcul
if (isNil "_table") then
{
	player globalChat localize "STR_R3F_ARTY_pas_de_table_munition";
}
else
{
	private ["_donnees_altitude_sup", "_donnees_altitude_inf"];
	
	// Recherche des bornes d'altitude sup et d'altitude inf en fonction des altitudes pr�sentes dans la table
	for [{_i = 0}, {_i < count (_table select 0 select 2) && isNil "_donnees_altitude_sup"}, {_i = _i+1}] do
	{
		private ["_altitude_parcourue"];
		_altitude_parcourue = _table select 0 select 2 select _i;
		
		if (_altitude_parcourue >= _altitude_cible) then
		{
			_donnees_altitude_sup = _table select 1 select _i;
		};
		
		if (_altitude_parcourue <= _altitude_cible) then
		{
			_donnees_altitude_inf = _table select 1 select _i;
		};
	};
	
	// S'il n'y a pas d'altitude sup ou pas d'altitude inf, on abandonne le calcul
	if (isNil "_donnees_altitude_sup" || isNil "_donnees_altitude_inf") then
	{
		player globalChat localize "STR_R3F_ARTY_altitude_hors_table";
	}
	else
	{
		private ["_angle_sup", "_angle_inf"];
		
		// Cas du tir tendu :
		// angle_sup = premier angle dans l'altitude sup qui a une port�e sup�rieure ou �gale � celle souhait�e
		for [{_i = 0}, {_i < count _donnees_altitude_sup && (isNil "_angle_sup")}, {_i = _i+1}] do
		{
			if (_donnees_altitude_sup select _i >= _distance_cible) then
			{
				_angle_sup = _table select 0 select 3 select _i;
			};
		};
		
		// angle_inf = dernier angle dans l'altitude inf qui a une port�e inf�rieure ou �gale � celle souhait�e
		for [{_i = 0}, {_i < count _donnees_altitude_inf}, {_i = _i+1}] do
		{
			if !(_donnees_altitude_inf select _i <= _distance_cible) exitWith {};
			
			_angle_inf = _table select 0 select 3 select _i;
		};
		
		// Si la port�e recherch�e est atteignable en tir tendu
		if !(isNil "_angle_sup" || isNil "_angle_inf") then
		{
			private ["_res_calcul", "_angle_milieu", "_nb_iterations"];
			_res_calcul = [-100, 0];
			_nb_iterations = 0;
			
			// Dichotomie entre angle_min et angle_max tant que la pr�cision souhait�e n'est pas atteinte
			while {abs (_distance_cible - (_res_calcul select 0)) > _precision && (_nb_iterations < 20)} do
			{
				_angle_milieu = (_angle_sup+_angle_inf)/2;
				
				// Calculer la port�e pour un angle de (angle_min+angle_max)/2
				_res_calcul = [_angle_milieu, _altitude_cible, _vitesse_initiale, _coef_frottement, R3F_ARTY_CFG_deltat] call R3F_ARTY_FNCT_calculer_portee;
				
				// Mise � jour des bornes sup et inf
				if (_res_calcul select 0 < _distance_cible) then
				{
					_angle_inf = _angle_milieu;
				}
				else
				{
					_angle_sup = _angle_milieu;
				};
				
				_nb_iterations = _nb_iterations + 1;
			};
			
			if (_nb_iterations < 20) then
			{
				// On enregistre la solution de tir
				_retour set [0, true];
				_retour set [1, _angle_milieu];
				_retour set [2, _res_calcul select 1];
			}
			else
			{
				player globalChat localize "STR_R3F_ARTY_altitude_erreur_calcul_tendu";
			};
		};
		
		
		_angle_sup = nil;
		_angle_inf = nil;
		// Cas du tir courb� :
		// Note : _angle_inf est plus grand que _angle_sup mais sa port�e est inf�rieure
		// angle_sup = premier angle dans l'altitude sup qui a une port�e sup�rieure ou �gale � celle souhait�e
		for [{_i = count _donnees_altitude_sup - 1}, {_i >= 0 && (isNil "_angle_sup")}, {_i = _i-1}] do
		{
			if (_donnees_altitude_sup select _i >= _distance_cible) then
			{
				_angle_sup = _table select 0 select 3 select _i;
			};
		};
		
		// angle_inf = dernier angle dans l'altitude inf qui a une port�e inf�rieure ou �gale � celle souhait�e
		for [{_i = count _donnees_altitude_inf - 1}, {_i >= 0}, {_i = _i-1}] do
		{
			if !(_donnees_altitude_inf select _i <= _distance_cible) exitWith {};
			
			_angle_inf = _table select 0 select 3 select _i;
		};
		
		// Si la port�e recherch�e est atteignable en tir courb�
		if !(isNil "_angle_sup" || isNil "_angle_inf") then
		{
			private ["_res_calcul", "_angle_milieu", "_nb_iterations"];
			_res_calcul = [-100, 0];
			_nb_iterations = 0;
			
			// Dichotomie entre angle_min et angle_max tant que la pr�cision souhait�e n'est pas atteinte
			while {abs (_distance_cible - (_res_calcul select 0)) > _precision && (_nb_iterations < 15)} do
			{
				_angle_milieu = (_angle_sup+_angle_inf)/2;
				
				// Calculer la port�e pour un angle de (angle_min+angle_max)/2
				_res_calcul = [_angle_milieu, _altitude_cible, _vitesse_initiale, _coef_frottement, R3F_ARTY_CFG_deltat] call R3F_ARTY_FNCT_calculer_portee;
				
				// Mise � jour des bornes sup et inf
				if (_res_calcul select 0 < _distance_cible) then
				{
					_angle_inf = _angle_milieu;
				}
				else
				{
					_angle_sup = _angle_milieu;
				};
				
				_nb_iterations = _nb_iterations + 1;
			};
			
			if (_nb_iterations < 15) then
			{
				// On enregistre la solution de tir
				_retour set [3, true];
				_retour set [4, _angle_milieu];
				_retour set [5, _res_calcul select 1];
			}
			else
			{
				player globalChat localize "STR_R3F_ARTY_altitude_erreur_calcul_courbe";
			};
		};
	};
};

_retour