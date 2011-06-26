_basique
	{
		idc = R3F_ARTY_IDC_dlg_artilleur_valeur_elevation;
		style = ST_RIGHT;
		x = 0.61; y = 0.38;
		w = 0.07; h = 0.04;
		text = "";
	};
	// FIN Info pièce d'artillerie
	
	class R3F_ARTY_dlg_artilleur_astuce_bordure : R3F_ARTY_dlg_artilleur_texte_basique
	{
		x = -0.003; y = 0.826;
		w = 0.406; h = 0.178;
		colorBackground[] = {0, 0, 0, 0.8};
		text = "";
	};
	
	class R3F_ARTY_dlg_artilleur_astuce_texte : R3F_ARTY_dlg_artilleur_texte_basique
	{
		type = CT_STRUCTURED_TEXT;
		size = 0.03;
		x = 0.0; y = 0.83;
		w = 0.4; h = 0.17;
		colorBackground[] = {0.25, 0.35, 0.22, 0.5};
		text = "$STR_R3F_ARTY_dlg_artilleur_astuce_texte";
		class Attributes
		{
			font = "BitStream";
			color = "#aaee88";
			align = "left";
			valign = "top";
			shadow = false;
			shadowColor = "#000000";
			size = "1";
		};
	};
	
	class R3F_ARTY_dlg_artilleur_credits : R3F_ARTY_dlg_artilleur_texte_basique
	{
		style = ST_RIGHT;
		x = 0.20; y = 0.977;
		w = 0.20; h = 0.02;
		sizeEx = 0.02;
		colorBackground[] = {0,0,0,0};
		colorText[] = {0.75, 1, 0.55, 0.5};
		text = "$STR_R3F_ARTY_LOG_nom_produit";
	};
};/**
 * Constantes pour rendre les définitions des boîtes de dialogue plus lisible et maintenable
 */

#define R3F_ARTY_ID_artilleur_START 65330

#define R3F_ARTY_IDD_dlg_artilleur (R3F_ARTY_ID_artilleur_START + 1)

#define R3F_ARTY_IDC_dlg_artilleur_label_ordre_titre (R3F_ARTY_ID_artilleur_START + 2)
#define R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_azimut (R3F_ARTY_ID_artilleur_START + 3)
#define R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_elevation (R3F_ARTY_ID_artilleur_START + 4)
#define R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_munition (R3F_ARTY_ID_artilleur_START + 5)
#define R3F_ARTY_IDC_dlg_artilleur_valeur_ordre_emetteur (R3F_ARTY_ID_artilleur_START + 6)
#define R3F_ARTY_IDC_dlg_artilleur_label_info_purger (R3F_ARTY_ID_artilleur_START + 7)

#define R3F_ARTY_IDC_dlg_artilleur_valeur_azimut (R3F_ARTY_ID_artilleur_START + 8)
#define R3F_ARTY_IDC_dlg_artilleur_valeur_elevation (R3F_ARTY_ID_artilleur_START + 9)

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