tr _elevation;
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
};/**
 * Affiche l'ordre de tir actuel dans la boîte de dialogue de l'artilleur
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_dlg_artilleur", "_nb_ordres"];

disableSerialization; // A cause des displayCtrl

// Récupération des control des champs de texte
#include "dlg_constantes.h"
_dlg_artilleur = uiNamespace getVariable "R3F_ARTY_dlg_artilleur";

_nb_ordres = {count _x > 0} count R3F_ARTY_ordres_recus;

if (_nb_ordres == 0) then
{
	(_dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_label_ordre_titre) ctrlSetText (format [localize "STR_R3F_ARTY_dlg_artilleur_label_ordre_titre", 0]);
	(_dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_azimut) ctrlSetText "-      ";
	(_dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_elevation) ctrlSetText "-      ";
	(_dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_munition) ctrlSetText "-";
	(_dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_emetteur) ctrlSetText "-";
	(_dlg_artilleur displayCtrl R3F_ARTY_IDC_dlg_artilleur_label_info_purger) ctrlSetText localize "STR_R3F_ARTY_dlg_artilleur_label_info_purger_aucun_ordre";
}
else
{
	private ["_index_premier_ordre", "_ordre", "_texte"];
	
	// Recherche du premier ordre non accompli
	_index_premier_ordre = 0;
	while {count (R3F_ARTY_ordres_recus select _index_premier_ordre) == 0} do
	{
		_index_premier_ordre = _index_premier_ordre + 1
	};
	
	_ordre = R3F_ARTY_ordres_rec