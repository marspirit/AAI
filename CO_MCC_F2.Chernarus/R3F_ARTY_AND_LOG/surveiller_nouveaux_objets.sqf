/**
 * Recherche p�riodiquement les nouveaux objets pour leur ajouter les fonctionnalit�s d'artillerie et de logistique si besoin
 * Script � faire tourner dans un fil d'ex�cution d�di�
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "R3F_ARTY_disable_enable.sqf"

// Attente fin briefing
sleep 0.1;

private ["_liste_objets_depl_heli_remorq_transp", "_liste_vehicules_connus", "_liste_vehicules", "_count_liste_vehicules", "_i", "_objet"];

// Union des tableaux de types d'objets servant dans un isKindOf
_liste_objets_depl_heli_remorq_transp = R3F_LOG_CFG_objets_deplacables + R3F_LOG_CFG_objets_heliportables +
	R3F_LOG_CFG_objets_remorquables + R3F_LOG_classes_objets_transportables;

// Contiendra la liste des v�hicules (et objets) d�j� initialis�s
_liste_vehicules_connus = [];

while {true} do
{
	// R�cup�ration des tout les nouveaux v�hicules de la carte et des nouveaux objets d�rivant de "Static" (caisse de mun, drapeau, ...) proches du joueur
	_liste_vehicules = (vehicles + nearestObjects [player, ["Static"], 80]) - _liste_vehicules_connus;
	_count_liste_vehicules = count _liste_vehicules;
	
	if (_count_liste_vehicules > 0) then
	{
		// On parcoure tout les v�hicules pr�sents dans le jeu en _tempo secondes
		for [{_i = 0}, {_i < _count_liste_vehicules}, {_i = _i + 1}] do
		{
			_objet = _liste_vehicules select _i;
			
			// Si l'objet est un objet d�pla�able/h�liportable/remorquable/transportable
			if ({_objet isKindOf _x} count _liste_objets_depl_heli_remorq_transp > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\objet_init.sqf";
			};
			
			// Si l'objet est un v�hicule h�liporteur
			if ({_objet isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\heliporteur_init.sqf";
			};
			
			// Si l'objet est un v�hicule remorqueur
			if ({_objet isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorqueur_init.sqf";
			};
			
			// Si l'objet est un v�hicule remorqueur
			if ({_objet isKindOf _x} count R3F_LOG_classes_transporteurs > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\transporteur\transporteur_init.sqf";
			};
			
			#ifdef R3F_ARTY_enable
			// Si l'objet est un pi�ce d'artillerie d'un type � g�rer
			if ({_objet isKindOf _x} count R3F_ARTY_CFG_pieces_artillerie > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\piece\piece_init.sqf";
			};
			
			// Si c'est un calculateur
			if (typeOf _objet == "SatPhone") then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\calculateur_init.sqf";
			};
			#endif
			
			sleep (20/_count_liste_vehicules);
		};
		
		// Les objets ont �t� initialis�s, on les m�morise pour ne plus les r�-initialiser
		_liste_vehicules_connus = _liste_vehicules_connus + _liste_vehicules;
	}
	else
	{
		sleep 20;
	};
};