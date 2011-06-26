eu", "_nb_iterations"];
			_res_calcul = [-100, 0];
			_nb_iterations = 0;
			
			// Dichotomie entre angle_min et angle_max tant que la précision souhaitée n'est pas atteinte
			while {abs (_distance_cible - (_res_calcul select 0)) > _precision && (_nb_iterations < 15)} do
			{
				_angle_milieu = (_angle_sup+_angle_inf)/2;
				
				// Calculer la portée pour un angle de (angle_min+angle_max)/2
				_res_calcul = [_angle_milieu, _altitude_cible, _vitesse_initiale, _coef_frottement, R3F_ARTY_CFG_deltat] call R3F_ARTY_FNCT_calculer_portee;
				
				// Mise à jour des bornes sup et inf
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

_retour/**
 * Calcule la portée du projectile pour l'angle de tir et l'altitude d'impact relative au canon donnés
 * 
 * @param 0 angle d'élévation du canon pour le tir
 * @param 1 différence d'altitude en mètres du sol pour impact
 * @param 2 vitesse initiale du projectile en m/s
 * @param 3 coefficient de frottement dans l'air du projectile
 * @param 4 pas de temps en secondes pour la simulation balistique
 * 
 * @return tableau au format [portée en mètres du tir avant de tomber à l'altitude donnée, temps de vol en secondes], [0, 0] si impact pendant l'ascension
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
private ["_elevation", "_altitude_impact", "_vitesse_initiale", "_coef_frottement", "_deltat"];
private ["_gravite", "_pos_x", "_pos_y", "_vitesse", "_vitesse_x", "_vitesse_y", "_temps_vol", "_altitude_apogee"];

// Paramètres d'entrées
_elevation = _this select 0;
_altitude_impact = _this select 1; // Relative au canon
_vitesse_initiale = _this select 2;
_coef_frottement = _this select 3; // Positif, proche de 0
_deltat = _this select 4;

_gravite = 9.80665;

// Initialisation des variables de la simulation de la balistique
_pos_x = 0; // Distance par rapport au canon
_pos_y = 0; // Altitude par rapport au canon
_vitesse = _vitesse_initiale;
_vitesse_x = _vitesse * (cos _ele