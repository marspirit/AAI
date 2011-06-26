f", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_remorque_valide"];
	
	_objet addAction [("<t color=""#dddd00"">" + (localize "STR_R3F_LOG_action_detacher") + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\detacher.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_detacher_valide"];
};

if ({_objet isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) then
{
	if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
	{
		_objet addAction [("<t color=""#dddd00"">" + (localize "STR_R3F_LOG_action_charger_deplace") + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\transporteur\charger_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_charger_deplace_valide"];
	};
	
	_objet addAction [("<t color=""#dddd00"">" + (localize "STR_R3F_LOG_action_selectionner_objet_charge") + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\transporteur\selectionner_objet.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_charge_valide"];
};/**
 * Détacher un objet d'un véhicule
 * 
 * @param 0 l'objet à détacher
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
	
	private ["_remorqueur", "_objet"];
	
	_objet = _this select 0;
	_remorqueur = _objet getVariable "R3F_LOG_est_transporte_par";
	
	// Ne pas permettre de décrocher un objet s'il est porté héliporté
	if ({_remorqueur isKind