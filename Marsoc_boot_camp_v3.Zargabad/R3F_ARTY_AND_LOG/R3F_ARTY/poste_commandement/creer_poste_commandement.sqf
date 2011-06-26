ntable", true];
};

_calculateur addAction [("<t color=""#dddd00"">" + (localize "STR_R3F_ARTY_action_ouvrir_dlg_SM") + "</t>"), "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\ouvrir_dlg_saisie_mission.sqf", nil, 6, true, true, "", "vehicle player == player && isNull R3F_LOG_joueur_deplace_objet && (isNull (_target getVariable ""R3F_LOG_est_deplace_par"") || (!alive (_target getVariable ""R3F_LOG_est_deplace_par""))) && isNull (_target getVariable ""R3F_LOG_est_transporte_par"") && (_target getVariable ""R3F_ARTY_est_calculateur"")"];
_calculateur addAction [("<t color=""#dddd00"">" + (localize "STR_R3F_ARTY_action_demonter_poste") + "</t>"), "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\deplacer_calculateur.sqf", nil, 5, true, true, "", "vehicle player == player && isNull R3F_LOG_joueur_deplace_objet && (isNull (_target getVariable ""R3F_LOG_est_deplace_par"") || (!alive (_target getVariable ""R3F_LOG_est_deplace_par""))) && isNull (_target getVariable ""R3F_LOG_est_transporte_par"") && (_target getVariable ""R3F_ARTY_est_calculateur"") && (_target getVariable ""R3F_ARTY_demontable"")"];/**
 * Supprime un poste de de commandement lié à un calculateur
 * A exécuter sur le serveur (via d'un publicVariable)
 * 
 * @param 0 le calculateur du poste de commandement d'artillerie
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

if (isServer) then
{
	private ["_fnct_calc_pos_angle", "_calculateur", "_position", "_temp_pos", "_direction", "_est_calculateur", "_filet", "_caisse_mun", "_pancarte",  "_table", "_calculateur", "_chaise", "_chaise2"];
	
	/**
	 * Calcule la position d'un objet en fonction de :
	 * 
	 * @param 0 le décalage par rapport à la position centrale (tableau de 2 éléments)
	 * @param 1 la rotation appliquée
	 * @param 2 la position centrale (tableau de 2 ou 3 éléments)
	 * 
	 * @return la position calculée (tableau de 2 éléments)
	 */
	_fnct_calc_pos_angle =
	{
		private ["_decalage", "_direction", "_position"];
		_decalage = _this select 0;
		_direction = _this select 1;
		_position = _this select 2;
		
		[
			(_position select 0) + ((_decalage select 0)*cos _direction) + ((_decalage select 1)*sin _direction),
			(_position select 1) - ((_decalage select 0)*sin _direction) + ((_decalage select 1)*cos _direction)
		]
	};
	
	_calculateur = _this select 0;
	_position = getPos _calculateur;
	_direction = getDir _calculateur;
	
	// Définition réseau de la variable lors du premier lancement du script, pour indiquer que l'objet est bien un calculateur d'artillerie
	_est_calculateur = _calculateur getVariable "R3F_ARTY_est_calculateur";
	if (isNil "_est_calculateur") then
	{
		_calculateur setVariable ["R3F_ARTY_est_calculateur", true, true];
	};
	
	_temp_pos = [[3, -1.5], _direction, _position] call _fnct_calc_pos_angle;
	_filet = "Land_CamoNet_NATO" createVehicle _temp_pos;
	_filet setVariable ["R3F_LOG_disabled", true, true];
	_filet setPos _temp_pos;
	_filet setDir (_direction+180);
	sleep 0.2;
	
	_temp_pos = [[6.75, -1], _direction, _position] call _fnct_calc_pos_angle;
	_caisse_mun = "USVehicleBox" createVehicle _temp_pos;
	_caisse_mun setVariable ["R3F_LOG_disabled", true, true];
	_caisse_mun setPos _temp_pos;
	_caisse_mun setDir (_direction+10);
	clearMagazineCargo _caisse_mun;
	sleep 0.2;
	
	_temp_pos = [[2.5, -3.5], _direction, _position] call _fnct_calc_pos_angle;
	_pancarte = "Notice_board" createVehicle _temp_pos;
	_pancarte setVariable ["R3F_LOG_disabled", true, true];
	_pancarte setPos _temp_p