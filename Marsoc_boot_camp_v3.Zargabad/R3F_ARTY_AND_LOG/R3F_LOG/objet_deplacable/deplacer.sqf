0];
	} forEach R3F_LOG_CFG_objets_transportables;
	
	
	/** Indique quel est l'objet concern� par les variables d'actions des addAction */
	R3F_LOG_objet_addAction = objNull;
	
	// Liste des variables activant ou non les actions de menu
	R3F_LOG_action_charger_deplace_valide = false;
	R3F_LOG_action_charger_selection_valide = false;
	R3F_LOG_action_contenu_vehicule_valide = false;
	
	R3F_LOG_action_remorquer_deplace_valide = false;
	R3F_LOG_action_remorquer_selection_valide = false;
	
	R3F_LOG_action_heliporter_valide = false;
	R3F_LOG_action_heliport_larguer_valide = false;
	
	R3F_LOG_action_deplacer_objet_valide = false;
	R3F_LOG_action_remorquer_deplace_valide = false;
	R3F_LOG_action_selectionner_objet_remorque_valide = false;
	R3F_LOG_action_detacher_valide = false;
	R3F_LOG_action_charger_deplace_valide = false;
	R3F_LOG_action_selectionner_objet_charge_valide = false;
	
	/** Ce fil d'ex�cution permet de diminuer la fr�quence des v�rifications des conditions normalement faites dans les addAction (~60Hz) */
	execVM "R3F_ARTY_AND_LOG\R3F_LOG\surveiller_conditions_actions_menu.sqf";
};/**
 * Fait d�placer un objet par le joueur. Il garde l'objet tant qu'il ne le rel�che pas ou ne meurt pas.
 * L'objet est relach� quand la variable R3F_LOG_joueur_deplace_objet passe � objNull ce qui terminera le script
 * 
 * @param 0 l'objet � d�placer
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
	
	R3F_LOG_objet_selectionne = objNull;
	
	private ["_objet", "_est_calculateur", "_arme_principale", "_action_menu", "_azimut_canon"];
	
	_objet = _this select 0;
	
	// Si l'objet est un calculateur d'artillerie, on laisse le script sp�cialis� g�rer
	_est_calculateur = _objet getVariable "R3F_ARTY_est_calculateur";
	if !(isNil "_est_calculateur") exitWith
	{
		R3F_LOG_mutex_local_verrou = false;
		[_objet] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\deplacer_calculateur.sqf";
	};
	
	_objet setVariable ["R3F_LOG_est_deplace_par", player, true];
	
	R3F_LOG_joueur_deplace_objet = _objet;
	
	// Sauvegarde et retrait de l'arme primaire
	_arme_principale = primaryWeapon player;
	if (_arme_principale != "") then
	{
		player playMove "AidlPercMstpSnonWnonDnon04";
		sleep 2;
		player removeWeapon _arme_principale;
	}
	else {sleep 0.5;};
	
	// Si le joueur est mort pendant le sleep, on remet tout comme avant
	if (!alive player) exitWith
	{
		R3F_LOG_joueur_deplace_objet = objNull;
		_objet setVariable ["R3F_LOG_est_deplace_par", objNull, true];
		// Car attachTo de "charger" positionne l'objet en altitude :
		_objet setPos [getPos _objet select 0, getPos _objet select 1, 0];
		_objet setVelocity [0, 0, 0];
		
		R3F_LOG_mutex_local_verrou = false;
	};
	
	_objet attachTo [player, [
		0,
		(((boundingBox _objet select 1 select 1) max (-(boundingBox _objet select 0 select 1))) max ((boundingBox _objet select 1 select 0) max (-(boundingBox _objet select 0 select 0)))) + 1,
		1]
	];
	
	if (count (weapons _objet) > 0) then
	{
		// Le canon doit pointer devant nous (sinon on a l'impression de se faire empaler)
		_azimut_canon = ((_objet weaponDirection (weapons _objet select 0)) select 0) atan2 ((_objet weaponDirection (weapons _objet select 0)) select 1);
		
		// On est oblig� de demander au serveur de tourner le canon pour nous
		R3F_ARTY_AND_LOG_PUBVAR_setDir = [_objet, (getDir _objet)-_azimut_canon];
		if (isServer) then
		{
			["R3F_ARTY_AND_LOG_PUBVAR_setDir", R3F_ARTY_AND_LOG_PUBVAR_setDir] spawn R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
		}
		else
		{
			publicVariable "R3F_ARTY_AND_LOG_PUBVAR_setDir";
		};
	};
	
	R3F_LOG_mutex_local_verrou = false;
	
	_action_menu = player addAction [("<t color=""#dddd00"">" + (localize "STR_R3F_LOG_action_relacher_objet")+ "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\relacher.sqf", nil, 5, true, true];
	
	// On limite la vitesse de march