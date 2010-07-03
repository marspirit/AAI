/**
 * Larguer un objet en train d'�tre h�liport�
 * 
 * @param 0 l'h�liporteur
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat localize "STR_R3F_LOG_mutex_action_en_cours";
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	
	private ["_heliporteur", "_objet"];
	
	_heliporteur = _this select 0;
	_objet = _heliporteur getVariable "R3F_LOG_heliporte";
	
	// On m�morise sur le r�seau que le v�hicule n'h�liporte plus rien
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, true];
	// On m�morise aussi sur le r�seau que l'objet n'est plus attach�
	_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];
	
	detach _objet;
	
	_objet setPos [getPos _objet select 0, getPos _objet select 1, 0];
	_objet setVelocity [0, 0, 0];
	
	player globalChat format [localize "STR_R3F_LOG_action_heliport_larguer_fait", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
	
	R3F_LOG_mutex_local_verrou = false;
};