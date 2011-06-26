5.33, 25.66, 26, 26.33, 26.66, 27, 27.33, 27.66, 28, 28.33, 28.66, 29, 29.33, 29.66,
	30, 30.33, 30.66, 31, 31.33, 31.66, 32, 32.33, 32.66, 33, 33.33, 33.66, 34, 34.33, 34.66, 35, 35.33, 35.66, 36, 36.33, 36.66, 37, 37.33, 37.66, 38, 38.33, 38.66, 39, 39.33, 39.66,
	40, 40.33, 40.66, 41, 41.33, 41.66, 42, 42.33, 42.66, 43, 43.33, 43.66, 44, 44.33, 44.66, 45, 45.33, 45.66, 46, 46.33, 46.66, 47, 47.33, 47.66, 48, 48.33, 48.66, 49, 49.33, 49.66,
	50, 50.33, 50.66, 51, 51.33, 51.66, 52, 52.33, 52.66, 53, 53.33, 53.66, 54, 54.33, 54.66, 55, 55.33, 55.66, 56, 56.33, 56.66, 57, 57.33, 57.66, 58, 58.33, 58.66, 59, 59.33, 59.66,
	60, 60.33, 60.66, 61, 61.33, 61.66, 62, 62.33, 62.66, 63, 63.33, 63.66, 64, 64.33, 64.66, 65, 65.33, 65.66, 66, 66.33, 66.66, 67, 67.33, 67.66, 68, 68.33, 68.66, 69, 69.33, 69.66,
	70, 70.33, 70.66, 71, 71.33, 71.66, 72, 72.33, 72.66, 73, 73.33, 73.66, 74, 74.33, 74.66, 75, 75.33, 75.66, 76, 76.33, 76.66, 77, 77.33, 77.66, 78, 78.33, 78.66, 79, 79.33, 79.66,
	80, 80.33, 80.66, 81, 81.33, 81.66, 82, 82.33, 82.66, 83, 83.33, 83.66, 84, 84.33, 84.66, 85, 85.33, 85.66, 86
];/**
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
					_str_elevation = s