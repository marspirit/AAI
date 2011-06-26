Of _x} count R3F_LOG_CFG_remorqueurs > 0) then
	{
		// On mémorise sur le réseau que le véhicule remorque quelque chose
		_remorqueur setVariable ["R3F_LOG_remorque", objNull, true];
		// On mémorise aussi sur le réseau que le objet est attaché en remorque
		_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];
		
		detach _objet;
		_objet setVelocity [0, 0, 0];
		
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 7;
		
		if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
		{
			// Si personne n'a re-remorquer l'objet pendant le sleep 7
			if (isNull (_remorqueur getVariable "R3F_LOG_remorque") &&
				(isNull (_objet getVariable "R3F_LOG_est_transporte_par")) &&
				(isNull (_objet getVariable "R3F_LOG_est_deplace_par"))
			) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\deplacer.sqf";
			};
		}
		else
		{
			player globalChat localize "STR_R3F_LOG_action_detacher_fait";
		};
	}
	else
	{
		player globalChat localize "STR_R3F_LOG_action_detacher_impossible_pour_ce_vehicule";
	};
	
	R3F_LOG_mutex_local_verrou = false;
};/**
 * Remorque l'objet déplacé par le joueur avec un remorqueur
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
	
	private ["_objet", "_remorqueur"];
	
	_objet = R3F_LOG_joueur_deplace_objet;
	
	_remorqueur = nearestObjects [_objet, R3F_LOG_CFG_remorqueurs, 22];
	// Parce que le remorqueur peut être un objet remorquable
	_remorqueur = _remorqueur - [_objet];
	
	if (count _remorqueur > 0) then
	{
		_remorqueur = _remorqueur select 0;
		
		if (alive _remorqueur && isNull (_remorqueur getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _remorqueur < 6) && (getPos _remorqueur select 2 < 2) && !(_remorqueur getVariable "R3F_LOG_disabled")) then
		{
			// On mémorise sur le réseau que le véhicule remorque quelque chose
			_remorqueur setVariable ["R3F_LOG_remorque", _objet, true];
			// On mémorise aussi sur le réseau que le canon est attaché en remorque
			_objet setVariable ["R3F_LOG_est_transporte_par", _remorqueur, true];
			
			// On place le joueur sur le côté du véhicule, ce qui permet d'éviter les blessure et rend l'animation plus réaliste
			player attachTo [_remorqueur, [
				(boundingBox _remorqueur select 1 select 0),
				(boundingBox _remorqueur select 0 select 1) + 1,
				(boundingBox _remorqueur select 0 select 2) - (boundingBox player select 0 select 2)
			]];
			
			player setDir 270;
			player setPos (getPos player);
			
			// Faire relacher l'objet au joueur (si il l'a dans "les mains")
			R3F_LOG_joueur_deplace_objet = objNull;
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 2;
			
			// Attacher à l'arrière du véhicule au ras du sol
			_objet attachTo [_remorqueur, [
				0,
				(boundingBox _remorqueur select 0 select 1) + (boundingBox