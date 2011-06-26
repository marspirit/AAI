ScrollDelay = 0;
		autoScrollSpeed = 0;
	};
	// FIN Zone liste des joueurs
	
	
	class R3F_ARTY_dlg_SM_btn_ordonner_tir_courbe : R3F_ARTY_dlg_SM_bouton_basique
	{
		x = 0.285; y = 0.57;
		w = 0.155; h = 0.07;
		sizeEx = 0.035;
		text = "$STR_R3F_ARTY_dlg_SM_btn_ordonner_tir_courbe";
		action = "[""courbe""] execVM ""R3F_ARTY_AND_LOG\R3F_ARTY\dlg_chef_batterie\ordonner_tir.sqf"";"; 
	};
	
	class R3F_ARTY_dlg_SM_btn_ordonner_tir_tendu : R3F_ARTY_dlg_SM_bouton_basique
	{
		x = 0.555; y = 0.57;
		w = 0.155; h = 0.07;
		sizeEx = 0.035;
		text = "$STR_R3F_ARTY_dlg_SM_btn_ordonner_tir_tendu";
		action = "[""tendu""] execVM ""R3F_ARTY_AND_LOG\R3F_ARTY\dlg_chef_batterie\ordonner_tir.sqf"";"; 
	};
	
	class R3F_ARTY_dlg_SM_credits : R3F_ARTY_dlg_SM_texte_basique
	{
		style = ST_RIGHT;
		x = 0.68; y = 0.96;
		w = 0.20; h = 0.02;
		sizeEx = 0.02;
		text = "$STR_R3F_ARTY_LOG_nom_produit";
	};
	
	class R3F_ARTY_dlg_SM_btn_fermer : R3F_ARTY_dlg_SM_bouton_basique
	{
		x = 0.88; y = 0.93;
		w = 0.1; h = 0.05;
		sizeEx = 0.035;
		text = "$STR_R3F_ARTY_dlg_SM_btn_fermer";
		action = "closeDialog 0;"; 
	};
};/**
 * Enregistre les valeurs des champs avant fermeture de la boîte de dialogue de saisie de mission.
 * R3F_ARTY_preremplir_dlg_saisie_mission.sqf s'en servira pour le préremplir à l'ouverture
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

disableSerialization; // A cause des displayCtrl

private ["_dlg_saisie_mission", "_table_correspondance_index_artilleur", "_lite_pseudo_artilleurs"];

#include "dlg_constantes.h"

_dlg_saisie_mission = findDisplay R3F_ARTY_IDD_dlg_saisie_mission;

uiNamespace setVariable ["R3F_ARTY_mem_position_batterie_valeur_long", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_long)];
uiNamespace setVariable ["R3F_ARTY_mem_position_batterie_valeur_lat", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_lat)];
uiNamespace setVariable ["R3F_ARTY_mem_position_batterie_valeur_alt", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_alt)];

uiNamespace setVariable ["R3F_ARTY_mem_position_cible_valeur_long", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_cible_valeur_long)];
uiNamespace setVariable ["R3F_ARTY_mem_position_cible_valeur_lat", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_cible_valeur_lat)];
uiNamespace setVariable ["R3F_ARTY_mem_position_cible_valeur_alt", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_position_cible_valeur_alt)];

uiNamespace setVariable ["R3F_ARTY_mem_correction_valeur_add_drop", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_correction_valeur_add_drop)];
uiNamespace setVariable ["R3F_ARTY_mem_correction_valeur_left_right", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_correction_valeur_left_right)];
uiNamespace setVariable ["R3F_ARTY_mem_correction_valeur_dir_cible", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_correction_valeur_dir_cible)];

uiNamespace setVariable ["R3F_ARTY_mem_info_tir_valeur_munition", lbCurSel (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_info_tir_valeur_munition)];
uiNamespace setVariable ["R3F_ARTY_mem_info_tir_valeur_nb_tirs", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_info_tir_valeur_nb_tirs)];
uiNamespace setVariable ["R3F_ARTY_mem_info_tir_valeur_dispersion", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_info_tir_valeur_dispersion)];

uiNamespace setVariable ["R3F_ARTY_mem_param_tir_valeur_distance", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_param_tir_valeur_distance)];
uiNamespace setVariable ["R3F_ARTY_mem_param_tir_valeur_azimut", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_param_tir_valeur_azimut)];
uiNamespace setVariable ["R3F_ARTY_mem_param_tir_valeur_altitude", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_param_tir_valeur_altitude)];

uiNamespace setVariable ["R3F_ARTY_mem_tir_courbe_valeur_elevation", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_elevation)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_courbe_valeur_elevation2", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_elevation2)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_courbe_valeur_azimut", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_azimut)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_courbe_valeur_azimut2", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_azimut2)];
uiNamespace setVariable ["R3F_ARTY_mem_tir_courbe_valeur_temps_vol", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_temps_vol)];

uiNamespace setVariable ["R3F_ARTY_mem_tir_tendu_valeur_elevation", ctrlText (_dlg_saisie_mission displayCtrl R3F_ARTY_IDC_d