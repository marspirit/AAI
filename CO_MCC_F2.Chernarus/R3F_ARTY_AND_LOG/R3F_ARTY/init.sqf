/**
 * Script principal qui initialise le système d'artillerie réaliste
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

// Un serveur dédié n'en a pas besoin
if !(isServer && isDedicated) then
{
	// Load of pre-computed tables - add here the new tables
	// Chargement des tables précalculées - ajouter ici les nouvelles tables
	R3F_ARTY_tables =
	[
		#include "tables\table_M119_et_D30.sqf"
		,
		#include "tables\table_M252_et_2b14_82mm.sqf"
	];
	
	// Compilation de quelques fonctions
	R3F_ARTY_FNCT_calculer_portee = compile preprocessFile "R3F_ARTY_AND_LOG\R3F_ARTY\calcul_balistique\calculer_portee.sqf";
	R3F_ARTY_FNCT_calculer_elevation = compile preprocessFile "R3F_ARTY_AND_LOG\R3F_ARTY\calcul_balistique\calculer_elevation.sqf";
	R3F_ARTY_FNCT_get_chargeurs_compatibles_piece = compile preprocessFile "R3F_ARTY_AND_LOG\R3F_ARTY\piece\get_chargeurs_compatibles_piece.sqf";
	R3F_ARTY_FNCT_tirer_position_dans_zone_elliptique = compile preprocessFile "R3F_ARTY_AND_LOG\R3F_ARTY\tirer_position_dans_zone_elliptique.sqf";
	R3F_ARTY_FNCT_formater_deux_decimales = compile preprocessFile "R3F_ARTY_AND_LOG\R3F_ARTY\formater_deux_decimales.sqf";
	
	// Liste des ordres ; 2 dimensions ; 1ère dim : les ordres ; 2ème dim : [émetteur, récepteur, azimut, élévation, index_munition]
	R3F_ARTY_ordres_recus = [];
	
	// Contient la référence vers l'intercace de l'artilleur, ou displayNull si elle n'est pas affichée
	uiNamespace setVariable ["R3F_ARTY_dlg_artilleur", displayNull];
	
	// Quand on reçoit un message contenant des ordres de tir
	R3F_ARTY_FNCT_PUBVAR_table_ordres_tirs =
	{
		private ["_table_ordres_tirs"];
		_table_ordres_tirs = _this select 1;
		
		if (alive player) then
		{
			private ["_nb_ordres"];
			
			_nb_ordres = {_x select 1 == name player} count _table_ordres_tirs;
			
			// Si on a des ordres pour nous
			if (_nb_ordres > 0) then
			{
				private ["_emetteur"];
				
				// Ajout des ordres nous concernant dans la file d'attente
				{
					if (_x select 1 == name player) then
					{
						_emetteur = _x select 0;
						R3F_ARTY_ordres_recus = R3F_ARTY_ordres_recus + [_x];
					};
				} forEach _table_ordres_tirs;
				
				// Raffraichissement de l'interface si le joueur est dans une pièce
				if (!isNull (uiNamespace getVariable "R3F_ARTY_dlg_artilleur")) then
				{
					execVM "R3F_ARTY_AND_LOG\R3F_ARTY\dlg_artilleur\afficher_ordre.sqf";
				};
				
				if (_nb_ordres == 1) then
				{
					player globalChat format [localize "STR_R3F_ARTY_dlg_SM_ordres_recus_un", _emetteur];
				}
				else
				{
					player globalChat format [localize "STR_R3F_ARTY_dlg_SM_ordres_recus", _emetteur, _nb_ordres];
				};
			};
		};
	};
	"R3F_ARTY_table_ordres_tirs" addPublicVariableEventHandler R3F_ARTY_FNCT_PUBVAR_table_ordres_tirs;
	
	// Mémorisation de la liste du menu des munitions pour l'interface
	private ["_table_correspondance_index_munition", "_table_correspondance_index_nom_munition"];
	_table_correspondance_index_munition = [];
	_table_correspondance_index_nom_munition = [];
	// Pour chaque pièce à gérer, on insère dans la listes les munitions compatibles
	for [{_i = 0}, {_i < count R3F_ARTY_CFG_pieces_artillerie}, {_i = _i + 1}] do
	{
		private ["_munitions_compatibles", "_nom_piece"];
		
		_munitions_compatibles = [R3F_ARTY_CFG_pieces_artillerie select _i] call R3F_ARTY_FNCT_get_chargeurs_compatibles_piece;
		_nom_piece = getText (configFile >> "CfgVehicles" >> (R3F_ARTY_CFG_pieces_artillerie select _i) >> "displayName");
		
		_table_correspondance_index_munition = _table_correspondance_index_munition + [""];
		_table_correspondance_index_nom_munition = _table_correspondance_index_nom_munition + [" "];
		
		_table_correspondance_index_munition = _table_correspondance_index_munition + [""];
		_table_correspondance_index_nom_munition = _table_correspondance_index_nom_munition + [("----- " + _nom_piece + " -----")];
		for [{_j = 0}, {_j < count _munitions_compatibles}, {_j = _j + 1}] do
		{
			_table_correspondance_index_munition = _table_correspondance_index_munition + [_munitions_compatibles select _j];
			_table_correspondance_index_nom_munition = _table_correspondance_index_nom_munition + [getText (configFile >> "CfgMagazines" >> (_munitions_compatibles select _j) >> "displayName")];
		};
	};
	// On mémorise la correspondance car on a accès qu'à l'index sélectionné lors de la validation
	uiNamespace setVariable ["R3F_ARTY_table_correspondance_index_munition", + _table_correspondance_index_munition];
	uiNamespace setVariable ["R3F_ARTY_table_correspondance_index_nom_munition", + _table_correspondance_index_nom_munition];
};

if (isServer) then
{
	// Service offert par le serveur : créer un poste de commandement d'artillerie (valeur = calculateur associé)
	R3F_ARTY_FNCT_PUBVAR_creer_poste_commandement =
	{
		[_this select 1] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\creer_poste_commandement.sqf";
	};
	"R3F_ARTY_PUBVAR_creer_poste_commandement" addPublicVariableEventHandler R3F_ARTY_FNCT_PUBVAR_creer_poste_commandement;
	
	// Service offert par le serveur : supprimer un poste de commandement d'artillerie (valeur = calculateur associé)
	R3F_ARTY_FNCT_PUBVAR_supprimer_poste_commandement =
	{
		[_this select 1] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\supprimer_poste_commandement.sqf";
	};
	"R3F_ARTY_PUBVAR_supprimer_poste_commandement" addPublicVariableEventHandler R3F_ARTY_FNCT_PUBVAR_supprimer_poste_commandement;
};