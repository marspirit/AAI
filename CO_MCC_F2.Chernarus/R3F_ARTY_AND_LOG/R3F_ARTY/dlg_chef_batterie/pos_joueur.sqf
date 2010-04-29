/**
 * R�cup�re les coordonn�es du joueur et pr�remplie les champs correspondant � la position de la batterie
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_pos", "_x_grille", "_y_grille", "_longitude", "_latitude", "_dlg_saisie_mission"];

// R�cup�ration de la position 2D
_pos = getPosASL player;

// Conversion de la pos 2D en coordonn�es GPS � 4 chiffres
_x_grille = round ((_pos select 0) / 10);
_y_grille = round ((R3F_ARTY_CFG_hauteur_ile - (_pos select 1)) / 10);

if (_x_grille < 0 || _y_grille < 0) exitWith {player globalChat localize "STR_R3F_ARTY_dlg_clic_carte_erreur_hors_champ";};

// Passage en notation � 4 chiffres, avec z�ros devant
_longitude = str _x_grille;
while {count toArray _longitude < 4} do {_longitude = "0" + _longitude;};
_latitude = str _y_grille;
while {count toArray _latitude < 4} do {_latitude = "0" + _latitude;};

disableSerialization; // A cause des displayCtrl

#include "dlg_constantes.h"

_dlg_saisie_mission = findDisplay R3F_ARTY_IDD_dlg_saisie_mission;
// Mise � jour des champs de texte
_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_long ctrlSetText _longitude;
_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_lat ctrlSetText _latitude;
_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_alt ctrlSetText str (round (_pos select 2));

player globalChat localize "STR_R3F_ARTY_pos_joueur_fait";