lg_SM_tir_tendu_valeur_elevation)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_tendu_valeur_elevation2", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation2)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_tendu_valeur_azimut", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_tendu_valeur_azimut2", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut2)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_tendu_valeur_temps_vol", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_temps_vol)];

_table_correspondance_index_artilleur = uiNamespace getVariable "R3F_ARTY_dlg_SM_table_correspondance_index_artilleur";
_lite_pseudo_artilleurs = [];
{
	_lite_pseudo_artilleurs = _lite_pseudo_artilleurs + [_table_correspondance_index_artilleur select _x];
} forEach (lbSelection (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_artilleurs_liste));
uiNamespace setVariable ["R3F_ARTY_mem_artilleurs_liste", _lite_pseudo_artilleurs];/**
 * Exécuté lors du clic sur un bouton "ordonner" (haut ou bas)
 * Génère une série de paramètres de tir et les envoi au joueurs sélectionnés
 * 
 * @param 0 : "tendu" ou "courbe" selon le tir à effectuer
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_type_tir", "_nb_tirs", "_index_munition", "_azimut", "_azimut2", "_elevation", "_elevation2", "_listbox_artilleurs", "_liste_artilleurs", "_table_correspondance_index_artilleur", "_i"];

_type_tir = _this select 0;

disableSerialization; // A cause des displayCtrl

#include "dlg_constantes.h"

_dlg_saisie_mission = findDisplay R3F_ARTY_IDD_dlg_saisie_mission;
_listbox_artilleurs = _dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_artilleurs_liste;

// Récupération des données de tir
_nb_tirs = ctrlText R3F_ARTY_IDC_dlg_SM_info_tir_valeur_nb_tirs;
_index_munition = lbCurSel R3F_ARTY_IDC_dlg_SM_info_tir_valeur_munition;

if (_type_tir == "tendu") then
{
	_azimut = ctrlText R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut;
	_azimut2 = ctrlText R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut2;
	_elevation = ctrlText R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation;
	_elevation2 = ctrlText R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation2;
}
else
{
	_azimut = ctrlText R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_azimut;
	_azimut2 = ctrlText R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_azimut2;
	_elevation = ctrlText R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_elevation;
	_elevation2 = ctrlText R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_elevation2;
};

_liste_artilleurs = lbSelection _listbox_artilleurs;
_table_correspondance_index_artilleur = uiNamespace getVariable "R3F_ARTY_dlg_SM_table_correspondance_index_artilleur";

// Vérification des entrées
if (0 in _liste_artilleurs || count _liste_artilleurs == 0) exitWith {player globalChat localize "STR_R3F_ARTY_dlg_SM_erreur_saisie_artilleurs";};
if (parseNumber _nb_tirs <= 0) exitWith {player globalChat localize "STR_R3F_ARTY_dlg_SM_erreur_saisie_valeur_nb_tirs";};
if (_azimut == "" || _azimut2 == "" || _elevation == "" || _elevation2 == "") exitWith {player globalChat localize "STR_R3F_ARTY_dlg_SM_erreur_saisie_pas_de_calcul";};
if (_azimut == "-" || _azimut2 == "-" || _elevation == "-" || _elevation2 == "-") exitWith {player globalChat localize "STR_R3F_ARTY_dlg_SM_erreur_saisie_pas_de_calcul";};

_nb_tirs = parseNumber _nb_tirs;
_azimut = parseNumber _azimut;
_azimut2 = parseNumber _azimut2;
// Gestion du cas ou on franchit l'azimut nord
if (_azimut > _azimut2) then
{
	_azimut2 = _azimut2 + 360;
};
_elevation = parseNumber _elevation;
_elevation2 = parseNumber _elevation2;

private ["_milieu_azimut", "_milieu_elevation", "_amplitude_azimut", "_amplitude_elevation", "_table_ordres_tirs"];

_milieu_azimut = (_azimut + _azimut2) /2;
_milieu_elevation = (_elevation + _elevation2) /2;
_amplitude_azimut = _milieu_azimut - _azimut;
_amplitude_elevation = _milieu_elevation - _elevation;

_table_ordres_tirs = [];
// Autant de fois qu'on a de tir a effectué, on génère une position dans la zone et on l'affecte à un artilleur
// Le principe de tirage d'une position dans la zone est de s'écarter du centre avec un pas fonction du nombre de tirs, et de choisir un angle aléatoire
for [{_i = 0}, 