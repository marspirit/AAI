her_impossible_pour_ce_vehicule,	"Only the pilot can detach this object.",	"Seul le pilote peut décrocher cet objet."

STR_R3F_LOG_action_contenu_vehicule,	"View the vehicle content",	"Voir le contenu du véhicule"
STR_R3F_LOG_action_decharger_en_cours,	"Unloading in progress...",	"Déchargement en cours..."
STR_R3F_LOG_action_decharger_fait,	"The object has been unloaded from the vehicle.",	"L'objet a été déchargé du véhicule."
STR_R3F_LOG_action_decharger_deja_fait,	"The object has already been unloaded.",	"L'objet a déjà été déchargé."

STR_R3F_LOG_transport_en_cours,	"This vehicle is being transported.",	"Ce véhicule est en cours de transport."
STR_R3F_LOG_mutex_action_en_cours,	"The current operation isn't finished.",	"L'opération en cours n'est pas finie."

STR_R3F_LOG_dlg_CV_titre,	"Content of vehicle",	"Contenu du véhicule"
STR_R3F_LOG_dlg_CV_capacite_vehicule,	"Loading : %1/%2",	"Chargement : %1/%2"
STR_R3F_LOG_dlg_CV_btn_decharger,	"Unload",	"Décharger"
STR_R3F_LOG_dlg_CV_btn_fermer,	"Cancel",	"Annuler"

STR_R3F_LOG_nom_pc_arti,	"Artillery CQ",	"PC d'artillerie"/**
 * V�rifie r�guli�rement des conditions portant sur l'objet point� par l'arme du joueur
 * Permet de diminuer la fr�quence des v�rifications des conditions normalement faites dans les addAction (~60Hz)
 * La justification de ce syst�me est que les conditions sont tr�s complexes (count, nearestObjects)
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
private ["_objet_pointe"];

while {true} do
{
	R3F_LOG_objet_addAction = objNull;
	
	_objet_pointe = cursorTarget;
	
	if !(isNull _objet_pointe) then
	{
		if (player distance _objet_pointe < 13) then
		{
			R3F_LOG_objet_addAction = _objet_pointe;
			
			// Note : les expressions de conditions ne sont pas factoris�es pour garder de la clart� (d�j� que c'est pas vraiment �a) (et le gain serait minime)
			
			// Si l'objet est un objet d�pla�able
			if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
			{
				// Condition action deplacer_objet
				R3F_LOG_action_deplacer_objet_valide = (vehicle player == player && (count crew _objet_pointe == 0) && (isNull R3F_LOG_joueur_deplace_objet) &&
					(isNull (_objet_pointe getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet_pointe getVariable "R3F_LOG_est_deplace_par"))) &&
					isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			// Si l'objet est un objet remorquable
			if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) then
			{
				// Et qu'il est d�pla�able
				if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
				{
					// Condition action remorquer_deplace
					R3F_LOG_action_remorquer_deplace_valide = (vehicle player == player && (alive R3F_LOG_joueur_deplace_objet) &&
						(count crew _objet_pointe == 0) && (R3F_LOG_joueur_deplace_objet == _objet_pointe) &&
						({_x != _objet_pointe && alive _x && isNull (_x getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _x < 6) && (getPos _x select 2 < 2) && !(_x getVariable "R3F_LOG_disabled")} count (nearestObjects [_objet_pointe, R3F_LOG_CFG_remorqueurs, 18])) > 0 &&
						!(_objet_pointe getVariable "R3F_LOG_disabled"));
				};
				
				// Condition action selectionner_objet_remorque
				R3F_LOG_action_selectionner_objet_remorque_valide = (vehicle player == player && (alive _objet_pointe) && (count crew _objet_pointe == 0) &&
					isNull R3F_LOG_joueur_deplace_objet && isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") &&
					(isNull (_objet_pointe getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet_pointe getVariable "R3F_LOG_est_deplace_par"))) &&
					!(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				// Condition action detacher
				R3F_LOG_action_detacher_valide = (vehicle player == player && (isNull R3F_LOG_joueur_deplace_objet) &&
					!isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			// Si l'objet est un objet transportable
			if ({_objet_pointe isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) then
			{
				// Et qu'il est d�pla�able
				if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
				{
					// Condition action charger_deplace
					R3F_LOG_action_charger_deplace_valide = (vehicle player == player && (count crew _objet_pointe == 0) && (R3F_LOG_joueur_deplace_objet == _objet_pointe) &&
						{_x != _objet_pointe && alive _x && ([0,0,0] distance velocity _x < 6) && (getPos _x select 2 < 2) &&
						!(_x getVariable "R3F_LOG_disabled")} count (nearestObjects [_objet_pointe, R3F_LOG_classes_transporteurs, 18]) > 0 &&
						!(_objet_pointe getVariable "R3F_LOG_disabled"));
				};
				
				// Condition action selectionner_objet_charge
				R3F_LOG_action_selectionner_objet_charge_valide = (vehicle player == player && (count crew _objet_pointe == 0) &&
					isNull R3F_LOG_joueur_deplace_objet && isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") &&
					(isNull (_objet_pointe getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet_pointe getVariable "R3F_LOG_est_deplace_par"))) &&
					!(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			// Si l'objet est un v�hicule remorqueur
			if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
			{
				// Condition action remorquer_deplace
				R3F_LOG_action_remorquer_deplace_valide = (vehicle player == player && (alive _objet_pointe) && (!isNull R3F_LOG_joueur_deplace_objet) &&
					(alive R3F_LOG_joueur_deplace_objet) && !(R3F_LOG_joueur_deplace_objet getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_joueur_deplace_objet isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) &&
					isNull (_objet_pointe getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _objet_pointe < 6) &&
					(getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				// Condition action remorquer_selection
				R3F_LOG_action_remorquer_selection_valide = (vehicle player == player && (alive _objet_pointe) && (isNull R3F_LOG_joueur_deplace_objet) &&
					(!isNull R3F_LOG_objet_selectionne) && (R3F_LOG_objet_selectionne != _objet_pointe) &&
					!(R3F_LOG_objet_selectionne getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_objet_selectionne isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) &&
					isNull (_objet_pointe getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _objet_pointe < 6) &&
					(getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			// Si l'objet est un v�hicule transporteur
			if ({_objet_pointe isKindOf _x} count R3F_LOG_classes_transporteurs > 0) then
			{
				// Condition action charger_deplace
				R3F_LOG_action_charger_deplace_valide = (alive _objet_pointe && (vehicle player == player) && (!isNull R3F_LOG_joueur_deplace_objet) &&
					!(R3F_LOG_joueur_deplace_objet getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_joueur_deplace_objet isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) &&
					([0,0,0] distance velocity _objet_pointe < 6) && (getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				// Condition action charger_selection
				R3F_LOG_action_charger_selection_valide = (alive _objet_pointe && (vehicle player == player) && (isNull R3F_LOG_joueur_deplace_objet) &&
					(!isNull R3F_LOG_objet_selectionne) && (R3F_LOG_objet_selectionne != _objet_pointe) &&
					!(R3F_LOG_objet_selectionne getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_objet_selectionne isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) &&
					([0,0,0] distance velocity _objet_pointe < 6) && (getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				// Condition action contenu_vehicule
				R3F_LOG_action_contenu_vehicule_valide = (alive _objet_pointe && (vehicle player == player) && isNull R3F_LOG_joueur_deplace_objet &&
					([0,0,0] distance velocity _objet_pointe < 6) && (getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
		};
	};
	
	// Pour l'h�liportation, l'objet n'est plus point�, mais on est dedans
	// Si le joueur est dans un h�liporteur
	if ({(vehicle player) isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
	{
		R3F_LOG_objet_addAction = vehicle player;
		
		// On est dans le v�hicule, on affiche pas les options de transporteur et remorqueur
		R3F_LOG_action_charger_deplace_valide = false;
		R3F_LOG_action_charger