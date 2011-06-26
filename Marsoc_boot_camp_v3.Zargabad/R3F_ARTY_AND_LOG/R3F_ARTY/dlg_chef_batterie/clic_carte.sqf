];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut2, [_tir_tendu_valeur_azimut2] call R3F_ARTY_FNCT_formater_deux_decimales];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation, [_tir_tendu_valeur_elevation] call R3F_ARTY_FNCT_formater_deux_decimales];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation2, [_tir_tendu_valeur_elevation2] call R3F_ARTY_FNCT_formater_deux_decimales];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_temps_vol, ((str round _tir_tendu_valeur_temps_vol) + "s")];
}
else
{
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut, "-"];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut2, "-"];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation, "-"];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation2, "-"];
	ctrlSetText [R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_temps_vol, "-"];
};

// Avertissement quand aucune solution trouvée (sinon on croit qu'il ne se passe rien ou que ça plante)
if !(_tir_courbe_possible || _tir_tendu_possible) then
{
	player globalChat localize "STR_R3F_ARTY_aucune_solution_trouvee";
};/**
 * Récupère les coordonnées du clic et préremplie les champs correspondant à la position de la batterie ou de la cible
 * 
 * @param les infos du clic effectué sur la carte
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// Si c'est un clic gauche
if (_this select 1 == 0) then
{
	private ["_pos_2D", "_altitude", "_vehicule", "_x_grille", "_y_grille", "_longitude", "_latitude"];
	
	// Récupération de la position 2D
	_pos_2D = (_this select 0) ctrlMapScreenToWorld [_this select 2, _this select 3];
	
	// Récupération de l'altitude
	_vehicule = "Logic" createVehicleLocal _pos_2D;
	sleep 0.2;
	_altitude = round (getPosASL _vehicule select 2);
	deleteVehicle _vehicule;
	
	// Conversion de la pos 2D en coordonnées GPS à 4 chiffres
	_x_grille = round ((_pos_2D select 0) / 10);
	_y_grille = round ((R3F_ARTY_CFG_hauteur_ile - (_pos_2D select 1)) / 10);
	
	if (_x_grille < 0 || _y_grille < 0) exitWith {player globalChat localize "STR_R3F_ARTY_dlg_clic_carte_erreur_hors_champ";};
	
	// Passage en notation à 4 chiffres, avec zéros devant
	_longitude = str _x_grille;
	while {count toArray _longitude < 4} do {_longitude = "0" + _longitude;};
	_latitude = str _y_grille;
	while {count toArray _latitude < 4} do {_latitude = "0" + _latitude;};
	
	disableSerialization; // A cause des displayCtrl
	
	#include "dlg_constantes.h"
	
	// Si l'appel a été fait pour la position de la cible
	if (uiName