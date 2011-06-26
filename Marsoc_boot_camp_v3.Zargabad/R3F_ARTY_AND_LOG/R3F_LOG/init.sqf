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
	
	// On mémorise sur le réseau que le véhicule n'héliporte plus rien
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, true];
	// On mémorise aussi sur le réseau que l'objet n'est plus attaché
	_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];
	
	detach _objet;
	
	_objet setPos [getPos _objet select 0, getPos _objet select 1, 0];
	_objet setVelocity [0, 0, 0];
	
	player globalChat format [localize "STR_R3F_LOG_action_heliport_larguer_fait", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
	
	R3F_LOG_mutex_local_verrou = false;
};/**
 * Script principal qui initialise le système de logistique
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "config.sqf"

if (isServer) then
{
	// On crée le point d'attache qui servira aux attachTo pour les objets à charger virtuellement dans les véhicules
	R3F_LOG_PUBVAR_point_attache = "HeliHEmpty" createVehicle [0, 0, 0];
	publicVariable "R3F_LOG_PUBVAR_point_attache";
};

// Un serveur dédié n'en a pas besoin
if !(isServer && isDedicated) then
{
	// Le client attend que le serveur ai créé et publié la référence de l'objet servant de point d'attache
	waitUntil {!isNil "R3F_LOG_PUBVAR_point_attache"};
	
	/** Indique quel objet le joueur est en train de déplacer, objNull si aucun */
	R3F_LOG_joueur_deplace_objet = objNull;
	
	/** Pseudo-mutex permettant de n'exécuter qu'un script de manipulation d'objet à la fois (true : vérouillé) */
	R3F_LOG_mutex_local_verrou = false;
	
	/** Objet actuellement sélectionner pour être chargé/remorqué */
	R3F_LOG_objet_selectionne = objNull;
	
	// On construit la liste des classes des transporteurs dans les quantités associés (pour les nearestObjects, count isKindOf, ...)
	R3F_LOG_classes_transporteurs = [];
	
	{
		R3F_LOG_classes_transporteurs = R3F_LOG_classes_transporteurs + [_x select 0];
	} forEach R3F_LOG_CFG_transporteurs;
	
	// On construit la liste des classes des transportables dans les quantités associés (pour les nearestObjects, count isKindOf, ...)
	R3F_LOG_classes_objets_transportables = [];
	
	{
		R3F_LOG_classes_objets_transportables = R3F_LOG_classes_objets_transportables + [_x select 