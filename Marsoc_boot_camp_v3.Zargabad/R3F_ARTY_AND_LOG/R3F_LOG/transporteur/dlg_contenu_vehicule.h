_N_Box       102 // Arma 2 - N columns list box

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20/**
 * Interface d'affichage du contenu du véhicule
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "dlg_constantes.h"

class R3F_LOG_dlg_contenu_vehicule
{
	idd = R3F_LOG_IDD_dlg_contenu_vehicule;
	name = "R3F_LOG_dlg_contenu_vehicule";
	movingEnable = false;
	
	controlsBackground[] = {R3F_LOG_dlg_CV_arriere_plan};
	objects[] = {};
	controls[] =
	{
		R3F_LOG_dlg_CV_titre,
		
		R3F_LOG_dlg_CV_capacite_vehicule,
		R3F_LOG_dlg_CV_liste_contenu,
		
		R3F_LOG_dlg_CV_credits,
		R3F_LOG_dlg_CV_btn_decharger,
		R3F_LOG_dlg_CV_btn_fermer
	};
	
	// Définition des classes de base
	class R3F_LOG_dlg_CV_texte
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_LEFT;
		x = 0.0; w = 0.3;
		y = 0.0; h = 0.03;
		sizeEx = 0.023;
		colorBackground[] = {0.5, 0.5, 0.5, 0};
		colorText[] = {0.85, 0.85, 0.85, 1};
		font = "Zeppelin32";
		text = "";
	};
	
	class R3F_LOG_dlg_CV_btn
	{
		idc = -1;
		type = 16;
		style = 0;
		
		text = "btn";
		action = "";
		
		x = 0;
		y = 0;
		
		w = 0.23;
		h = 0.11;
		
		size = 0.03921;
		sizeEx = 0.03921;
		
		color[] = {0.543, 0.5742, 0.4102, 1.0};
		color2[] = {0.95, 0.95, 0.95, 1};
		colorBackground[] = {1, 1, 1, 1};
		colorbackground2[] = {1, 1, 1, 0.4};
		colorDisabled[] = {1, 1, 1, 0.25};
		periodFocus = 1.2;
		periodOver = 0.8;
		
		class HitZone 
		{
			left = 0.004;
			top = 0.029;
			right = 0.004;
			bottom = 0.029;
		};
		
		class ShortcutPos 
		{
			left = 0.0145;
			top = 0.026;
			w = 0.0392157;
			h = 0.0522876;
		};
		
		class TextPos 
		{
			left = 0.05;
			top = 0.034;
			right = 0.005;
			bottom = 0.005;
		};
		
		textureNoShortcut = "";
		animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
		animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
		animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
		animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
		animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
		animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
		period = 0.4;
		font = "Zeppelin32";
		
		soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
		soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
		soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
		soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
		
		class Attributes 
		{
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "left";
			shadow = "true";
		};
		
		class AttributesImage 
		{
			font = "Zeppelin32";
			color = "#E5E5E5";
			align = "left";
			shadow = "true";
		};
	};
	
	class R3F_LOG_dlg_CV_liste
	{
		type = CT_LISTBOX;
		style = ST_LEFT;
		idc = -1;
		text = "";
		w = 0.275;
		h = 0.04;
		colorSelect[] = {1, 1, 1, 1};
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0.8,0.8,0.8,1};
		colorSelectBackground[] = {0, 0, 0, 1};
		colorScrollbar[] = {0.2, 0.2, 0.2, 1};
		arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
		wholeHeight = 0.45;
		rowHeight = 0.06;
		color[] = {0.8, 0.8, 0.8, 1};
		colorActive[] = {0,0,0,1};
		colorDisabled[] = {0,0,0,0.3};
		font = "Zeppelin32";
		sizeEx = 0.035;
		soundSelect[] = {"",0.1,1};
		soundExpand[] = {"",0.1,1};
		soundCollapse[] = {"",0.1,1};
		maxHistoryDelay = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		
		class ScrollBar
		{
			color[] = {1, 1, 1, 0.6};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
			arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
			arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
			border = "\ca\ui\data\ui_border_scroll_ca.paa";
		};
	};
	// FIN Définition des classes de base
	
	
	class R3F_LOG_dlg_CV_arriere_plan
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = 0.25; w = 0.5;
		y = 0.1; h = 0.8;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "\ca\ui\data\ui_gameoptions_background_ca.paa";
		font = "Zeppelin32";
		sizeEx = 0.032;
	};
	
	class R3F_LOG_dlg_CV_titre : R3F_LOG_dlg_CV_texte
	{
		x = 0.28; w = 0.4;
		y = 0.125; h = 0.05;
		sizeEx = 0.05;
		text = "$STR_R3F_LOG_dlg_CV_titre";
	};
	
	class R3F_LOG_dlg_CV_cap