icon = "\ca\ui\data\map_waypoint_ca.paa";
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};
		
		class Task
		{
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
			iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
			iconDone = "#(argb,8,8,3)color(0,0,0,1)";
			iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
			colorCreated[] = {1,1,1,1};
			colorCanceled[] = {1,1,1,1};
			colorDone[] = {1,1,1,1};
			colorFailed[] = {1,1,1,1};
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};
		
		class WaypointCompleted
		{
			icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};
		
		class ActiveMarker
		{
			icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};		
	};
};/**
 * Constantes pour rendre les définitions des boîtes de dialogue plus lisible et maintenable
 */

#define R3F_ARTY_ID_chef_batterie_START 65430

#define R3F_ARTY_IDD_dlg_clic_carte (R3F_ARTY_ID_chef_batterie_START + 1)
#define R3F_ARTY_IDC_dlg_clic_carte_carte (R3F_ARTY_ID_chef_batterie_START + 2)

#define R3F_ARTY_IDD_dlg_saisie_mission (R3F_ARTY_ID_chef_batterie_START + 3)

#define R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_long (R3F_ARTY_ID_chef_batterie_START + 4)
#define R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_lat (R3F_ARTY_ID_chef_batterie_START + 5)
#define R3F_ARTY_IDC_dlg_SM_position_batterie_valeur_alt (R3F_ARTY_ID_chef_batterie_START + 6)
#define R3F_ARTY_IDC_dlg_SM_position_batterie_btn_pos_joueur (R3F_ARTY_ID_chef_batterie_START + 7)
#define R3F_ARTY_IDC_dlg_SM_position_batterie_btn_clic_carte (R3F_ARTY_ID_chef_batterie_START + 8)

#define R3F_ARTY_IDC_dlg_SM_position_cible_valeur_long (R3F_ARTY_ID_chef_batterie_START + 9)
#define R3F_ARTY_IDC_dlg_SM_position_cible_valeur_lat (R3F_ARTY_ID_chef_batterie_START + 10)
#define R3F_ARTY_IDC_dlg_SM_position_cible_valeur_alt (R3F_ARTY_ID_chef_batterie_START + 11)
#define R3F_ARTY_IDC_dlg_SM_position_cible_btn_clic_carte (R3F_ARTY_ID_chef_batterie_START + 12)

#define R3F_ARTY_IDC_dlg_SM_correction_valeur_add_drop (R3F_ARTY_ID_chef_batterie_START + 13)
#define R3F_ARTY_IDC_dlg_SM_correction_valeur_left_right (R3F_ARTY_ID_chef_batterie_START + 14)
#define R3F_ARTY_IDC_dlg_SM_correction_valeur_dir_cible (R3F_ARTY_ID_chef_batterie_START + 15)

#define R3F_ARTY_IDC_dlg_SM_info_tir_valeur_nb_tirs (R3F_ARTY_ID_chef_batterie_START + 16)
#define R3F_ARTY_IDC_dlg_SM_info_tir_valeur_munition (R3F_ARTY_ID_chef_batterie_START + 17)
#define R3F_ARTY_IDC_dlg_SM_info_tir_valeur_dispersion (R3F_ARTY_ID_chef_batterie_START + 18)

#define R3F_ARTY_IDC_dlg_SM_param_tir_valeur_distance (R3F_ARTY_ID_chef_batterie_START + 19)
#define R3F_ARTY_IDC_dlg_SM_param_tir_valeur_azimut (R3F_ARTY_ID_chef_batterie_START + 20)
#define R3F_ARTY_IDC_dlg_SM_param_tir_valeur_altitude (R3F_ARTY_ID_chef_batterie_START + 21)

#define R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_elevation (R3F_ARTY_ID_chef_batterie_START + 22)
#define R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_elevation2 (R3F_ARTY_ID_chef_batterie_START + 23)
#define R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_azimut (R3F_ARTY_ID_chef_batterie_START + 24)
#define R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_azimut2 (R3F_ARTY_ID_chef_batterie_START + 25)
#define R3F_ARTY_IDC_dlg_SM_tir_courbe_valeur_temps_vol (R3F_ARTY_ID_chef_batterie_START + 26)

#define R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation (R3F_ARTY_ID_chef_batterie_START + 27)
#define R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_elevation2 (R3F_ARTY_ID_chef_batterie_START + 28)
#define R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut (R3F_ARTY_ID_chef_batterie_START + 29)
#define R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_azimut2 (R3F_ARTY_ID_chef_batterie_START + 30)
#define R3F_ARTY_IDC_dlg_SM_tir_tendu_valeur_temps_vol (R3F_ARTY_ID_chef_batterie_START + 31)

#define R3F_ARTY_IDC_dlg_SM_artilleurs_liste (R3F_ARTY_ID_chef_batterie_START + 32)

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUT_BUTTON  16 // Arma 2 - textured button

#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_List