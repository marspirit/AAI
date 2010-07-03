/**
 * Ouvre la boîte de dialogue de l'artilleur et affiche en continu l'orientation du canon (azimut et élévation)
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

R3F_ARTY_fil_exec_affichage_dlg_artilleur = [] spawn
{
	if (vehicle player != player) then
	{
		private ["_piece", "_canon"];
		
		_piece = vehicle player;
		_canon = weapons _piece select 0;
		
		disableSerialization; // A cause des displayCtrl
		
		// Récupération des control des champs de texte
		#include "dlg_constantes.h"
		
		// Tant qu'il ne descend pas de la pièce
		while {vehicle player == _piece} do
		{
			// Si il est en tireur, on met à jour les paramètres de la pièce
			if (gunner _piece == player) then
			{
				private ["_dlg_artilleur", "_champ_azimut", "_champ_elevation", "_azimut", "_elevation", "_str_azimut", "_str_elevation"];
				
				_dlg_artilleur = uiNamespace getVariable "R3F_ARTY_dlg_artilleur";
				if (isNull _dlg_artilleur) then
				{
					1 cutRsc ["R3F_ARTY_dlg_artilleur", "PLAIN"];
					waitUntil {!isNull (uiNamespace getVariable "R3F_ARTY_dlg_artilleur")};
					_dlg_artilleur = uiNamespace getVariable "R3F_ARTY_dlg_artilleur";
				};
				
				_champ_azimut = _dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_valeur_azimut;
				_champ_elevation = _dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_valeur_elevation;
				
				// Calcul de l'azimut du canon avec une précision au centième
				_azimut = ((_piece weaponDirection _canon) select 0) atan2 ((_piece weaponDirection _canon) select 1);
				_azimut = round (_azimut*100) / 100;
				if (_azimut < 0) then {_azimut = _azimut + 360};
				
				// Calcul de l'élevation du canon avec une précision au centième
				_elevation = asin ((_piece weaponDirection _canon) select 2);
				_elevation = round (_elevation*100) / 100;
				
				// Formatage de l'azimut à 2 décimales
				_str_azimut = str _azimut;
				if (round (_azimut*100) mod 10 == 0) then {
					if (round (_azimut*100) mod 100 == 0) then {
						_str_azimut = _str_azimut + ".00";
					} else {
						_str_azimut = _str_azimut + "0";
					};
				};
				
				
				// Formatage de l'élévation à 2 décimales
				if (_elevation >= 0) then
				{
					_str_elevation = str _elevation;
					if (round (_elevation*100) mod 10 == 0) then {
						if (round (_elevation*100) mod 100 == 0) then {
							_str_elevation = _str_elevation + ".00";
						} else {
							_str_elevation = _str_elevation + "0";
						};
					};
				}
				else
				{
					_str_elevation = str (-_elevation);
					if (round (-_elevation*100) mod 10 == 0) then {
						if (round (-_elevation*100) mod 100 == 0) then {
							_str_elevation = _str_elevation + ".00";
						} else {
							_str_elevation = _str_elevation + "0";
						};
					};
					
					_str_elevation = "-" + _str_elevation;
				};
				
				// Affichage à l'écran des paramètres de la pièce
				_champ_azimut ctrlSetText _str_azimut;
				_champ_elevation ctrlSetText _str_elevation;
				
				sleep 0.06;
			}
			else
			{
				(uiNamespace getVariable "R3F_ARTY_dlg_artilleur") closeDisplay 0;
				uiNamespace setVariable ["R3F_ARTY_dlg_artilleur", displayNull];
				
				sleep 1;
			};
		};
		
		(uiNamespace getVariable "R3F_ARTY_dlg_artilleur") closeDisplay 0;
		uiNamespace setVariable ["R3F_ARTY_dlg_artilleur", displayNull];
	};
};