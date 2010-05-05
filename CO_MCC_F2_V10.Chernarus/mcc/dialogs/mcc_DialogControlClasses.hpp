// Desc: The top section contains the standard dialog #define constants, used for 
// controls, styles & fonts. The bottom section contains the standard base dialog 
// control class definitions, from which you can inherit.
//
// Notes: There are many slightly different versions of this file around.
// By: public code taken from various sources: BIS pbo's, tutorials, WIKI & other scripts
// Colors and coeff's referenced from quickmap.hpp, by mi2slow & Vienna.
// Version: 1.1 (May 2007, Dr Eyeball)
//-----------------------------------------------------------------------------


// Constants to standardize and help simplify positioning and sizing
#define Dlg_ROWS 36 // determines default text and control height
#define Dlg_COLS 90 // guide for positioning controls

// (Calculate proportion, then /100 to represent as percentage)
#define Dlg_CONTROLHGT ((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH ((100/Dlg_COLS)/100)

// modifiers
#define Dlg_TEXTHGT_MOD 0.9
#define Dlg_ROWSPACING_MOD 1.3

#define Dlg_ROWHGT (Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT (Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)

//-----------------------------------------------------------------------------
// Fonts
#define FontM "TahomaB"
#define FontHTML "TahomaB"
//"CourierNewB64" "TahomaB" "Bitstream" "Zeppelin32"

//-----------------------------------------------------------------------------
// Control Types 
#define CT_STATIC 0 
#define CT_BUTTON 1 
#define CT_EDIT 2 
#define CT_SLIDER 3 
#define CT_COMBO 4 
#define CT_LISTBOX 5 
#define CT_TOOLBOX 6 
#define CT_CHECKBOXES 7 
#define CT_PROGRESS 8 
#define CT_HTML 9 
#define CT_STATIC_SKEW 10 
#define CT_ACTIVETEXT 11 
#define CT_TREE 12 
#define CT_STRUCTURED_TEXT 13 
#define CT_CONTEXT_MENU 14 
#define CT_CONTROLS_GROUP 15 

/*
// 3D not used in ArmA
#define CT_3DSTATIC 20
#define CT_3DACTIVETEXT 21
#define CT_3DLISTBOX 22
#define CT_3DHTML 23
#define CT_3DSLIDER 24
#define CT_3DEDIT 25
*/

#define CT_XKEYDESC 40 
#define CT_XBUTTON 41 
#define CT_XLISTBOX 42 
#define CT_XSLIDER 43 
#define CT_XCOMBO 44 
#define CT_ANIMATED_TEXTURE 45 

#define CT_OBJECT 80 
#define CT_OBJECT_ZOOM 81 
#define CT_OBJECT_CONTAINER 82 
#define CT_OBJECT_CONT_ANIM 83 

#define CT_LINEBREAK 98 
#define CT_USER 99 
#define CT_MAP 100 
#define CT_MAP_MAIN 101 

//-----------------------------------------------------------------------------
// Static styles 
#define ST_POS 0x0F 
#define ST_HPOS 0x03 
#define ST_VPOS 0x0C 

#define ST_LEFT 0x00 
#define ST_RIGHT 0x01 
#define ST_CENTER 0x02 
#define ST_DOWN 0x04 
#define ST_UP 0x08 

#define ST_VCENTER 0x0c 
#define ST_TYPE 0xF0 

#define ST_SINGLE 0 
#define ST_MULTI 16 
#define ST_TITLE_BAR 32 
#define ST_PICTURE 48 
#define ST_FRAME 64 
#define ST_BACKGROUND 80 
#define ST_GROUP_BOX 96 
#define ST_GROUP_BOX2 112 
#define ST_HUD_BACKGROUND 128 
#define ST_TILE_PICTURE 144 
#define ST_WITH_RECT 160 
#define ST_LINE 176 

//-----------------------------------------------------------------------------
// standard base dialog control class definitions
//-----------------------------------------------------------------------------
class RscText
{
  type = CT_STATIC;
  idc = -1;
  style = ST_LEFT;
  
  x = 0.0;
  y = 0.0;
  w = 0.3;
  h = Dlg_CONTROLHGT;
  sizeEx = Dlg_CONTROLHGT;
  
  colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
  colorText[] = {Dlg_ColorScheme_DialogText, 1};
  font = FontM;
  
  text = "";
};
//-------------------------------------
class RscFrame
{
  type = CT_STATIC;
  idc = -1;
  style = ST_FRAME;

  x = 0.0;
  y = 0.0;
  w = 1.0;
  h = 1.0;
  sizeEx = Dlg_CONTROLHGT;
  
  colorBackground[] = {Dlg_ColorScheme_Red, 1};
  colorText[] = {Dlg_ColorScheme_Yellow, 1};
  font = FontM;

  text = "";
};
//-------------------------------------
class RscActiveText
{
  type = CT_ACTIVETEXT;
  idc = -1;
  style = ST_LEFT;
  
  x = 0.1;
  y = 0.1;
  w = 0.2;
  h = Dlg_CONTROLHGT;  
  sizeEx = Dlg_TEXTHGT;
  
  color[] = {Dlg_ColorScheme_WindowText,1};
  colorActive[] = {Dlg_ColorScheme_3DControlFocus,1};
  font = FontM;
  
  soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
  soundPush[] = {"\ca\ui\data\sound\new1", 0.2, 1};
  soundClick[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
  soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
  
  default = false;
  text = "";
};
//-------------------------------------
class RscButton
{
  type = CT_BUTTON;
  idc = -1;
  style = ST_CENTER;
  
  x = 0.0;
  y = 0.0;
  w = 0.1;
  h = Dlg_CONTROLHGT;
  sizeEx = Dlg_TEXTHGT;
  offsetX = 0;
  offsetY = 0;
  offsetPressedX = 0;
  offsetPressedY = 0;
  borderSize = 0.001;
  
  colorText[] = {Dlg_ColorScheme_3DControlText,1};
  colorBackground[] = {Dlg_ColorScheme_3DControlBackground, 1};
  colorFocused[] = {Dlg_ColorScheme_3DControlFocus,1};

  colorShadow[] = {Dlg_Color_Pink,0.2};
  colorBorder[] = {Dlg_Color_White,0.2};
  colorBackgroundActive[] = {Dlg_ColorScheme_HighlightBackground,1.0};
  colorDisabled[] = {Dlg_Color_Gray_7, 0.7};
  colorBackgroundDisabled[] = {Dlg_ColorScheme_3DControlBackground,0.3};
  font = FontM;

  soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
  soundPush[] = {"\ca\ui\data\sound\new1", 0.2, 1};
  soundClick[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
  soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};

  default = false;
  text = "";
  action = "";
};
//-------------------------------------
class RscEdit
{
  type = CT_EDIT;
  idc = -1;
  style = ST_LEFT;

  x = 0.1;
  y = 0.1;
  w = 0.1;
  h = Dlg_CONTROLHGT;
  sizeEx = Dlg_TEXTHGT;

  colorText[] = {Dlg_ColorScheme_WindowText,1};
  colorSelection[] = {Dlg_ColorScheme_HighlightBackground,1};
  colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
  font = FontM;

  autocomplete = false;
  text = "";
};
//-------------------------------------
class RscLB_LIST
{
  // type = defined in derived class
  idc = -1;
  style = ST_LEFT;

  x = 0.1;
  y = 0.1;
  w = 0.2;
  h = Dlg_CONTROLHGT;
  sizeEx = Dlg_TEXTHGT;
  rowHeight = Dlg_TEXTHGT;

  color[] = {Dlg_Color_White,1};
  colorText[] = {Dlg_ColorScheme_WindowText,1};
  colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1}; // always clear?
  colorSelect[] = {Dlg_ColorScheme_WindowText,1};
  colorSelect2[] = {Dlg_ColorScheme_WindowText,1};
  colorScrollbar[] = {Dlg_Color_White,1};
  colorSelectBackground[] = {Dlg_ColorScheme_3DControlBackground,1};
  colorSelectBackground2[] = {Dlg_ColorScheme_HighlightBackground,1};
  font = FontM;
  
  soundSelect[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
  soundExpand[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
  soundCollapse[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
};
//-------------------------------------
class RscListBox: RscLB_LIST
{
  type = CT_LISTBOX;

  onLBSelChanged = "";
  onLBDblClick = "";
};
//-------------------------------------
class RscCombo: RscLB_LIST
{
  type = CT_COMBO;

  wholeHeight = 0.3;
};
//-------------------------------------
class RscObject
{
	type = CT_OBJECT;

	scale = 1.0;
	direction[] = {0, 0, 1};
	up[] = {0, 1, 0};
};
//-------------------------------------
class Rsc3DStatic
{
	type = CT_3DSTATIC;
	style = ST_LEFT;

	size = Dlg_TEXTHGT;
	angle = 0;

	color[] = {Dlg_Color_Black,1};
	font = FontM;

	selection = "display";
};
//-------------------------------------
class RscPicture
{
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;

  x = 0.1;
  y = 0.1;
  w = 0.4;
  h = 0.2;
	sizeEx = Dlg_TEXTHGT;

	colorBackground[] = Dlg_ColorAttribute_Clear;
	colorText[] = {Dlg_ColorScheme_WindowText, 1};
	font = FontM;

  text = "";
};
//-------------------------------------
class RscHTML
{
  type = CT_HTML;
  idc = -1;
  style = ST_LEFT;
  
  x = 0.1;
  y = 0.1;
  w = 0.2;
  h = 0.4;

	colorText[] = {Dlg_ColorScheme_WindowText,1};
	colorLink[] = {0.05, 0.2, 0.05, 1};
	colorBold[] = {0, 1, 1, 1};
	colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
	colorLinkActive[] = {0, 0, 0.2, 1};
	colorPicture[] = {Dlg_Color_Black, 1};
	colorPictureLink[] = {Dlg_Color_Black, 1};
	colorPictureSelected[] = {Dlg_Color_Black, 1};
	colorPictureBorder[] = {Dlg_Color_Black, 1};

	prevPage = "\ca\ui\data\arrow_left_ca.paa";
	nextPage = "\ca\ui\data\arrow_right_ca.paa";
	filename = "";
	
	class HeadingStyle {
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = Dlg_TEXTHGT;
	};
	
	class H1: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.5;
	};
	
	class H2: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.4;
	};
	
	class H3: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.3;
	};
	
	class H4: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.2;
	};
	
	class H5: HeadingStyle {
		sizeEx = Dlg_TEXTHGT * 1.1;
	};
	
	class H6: HeadingStyle {
		sizeEx = Dlg_TEXTHGT;
	};
	
	class P: HeadingStyle {
		sizeEx = Dlg_TEXTHGT;
	};
};
//-------------------------------------
class RscStructuredText
{
	access = ReadAndWrite;
  type = CT_STRUCTURED_TEXT;
	idc = -1;
  style = ST_MULTI;
  
  x = 0.1;
  y = 0.1;
	w = 0.1;
	h = 0.05;
	sizeEx = Dlg_CONTROLHGT;
  size = Dlg_TEXTHGT;
	lineSpacing = 1;

	colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
	colorText[] = {Dlg_ColorScheme_DialogText, 1};

	text = "";

  class Attributes
  {
     font = FontM;
     color = "#ffffff";
     align = "left";
     shadow = false;
  };
};
//-------------------------------------
// Apparently, RscTree can only be used hard coded.
/*
class RscTree
{
  access = ReadAndWrite;
  type = CT_TREE;
  style = ST_SINGLE;

  colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
  colorSelect[] = {1, 1, 1, 1};
  colorText[] = {Dlg_ColorScheme_DialogText, 1};
  colorBorder[] = {1, 1, 1, 1};
  colorArrow[] = {1, 1, 1, 1};
  font = FontM;

  sizeEx = 0.04;
};
*/
//-------------------------------------
class RscMapControl 
{
  type = CT_MAP_MAIN;
  idc = -1;
  style = ST_PICTURE;

  x = 0.1;
  y = 0.1;
  w = 0.3;
  h = 0.3;

  colorSea[] = {0.56, 0.8, 0.98, 0.5};
	colorForest[] = {0.6, 0.8, 0.2, 0.5};
	colorRocks[] = {0.6, 0.45, 0.27, 0.4};
	colorCountlines[] = {0.7, 0.55, 0.3, 0.6};
	colorCountlinesWater[] = {0, 0.53, 1, 0.5};
  colorMainCountlines[] = {0.65, 0.45, 0.27, 1};
  colorMainCountlinesWater[] = {0, 0.53, 1, 1};
  colorPowerLines[] = {Dlg_Color_Black, 1};
  colorLevels[] = {Dlg_Color_Black, 1};
	colorForestBorder[] = {0.4, 0.8, 0, 1};
	colorRocksBorder[] = {0.6, 0.45, 0.27, 0.4};
	colorNames[] = {Dlg_Color_Black, 1};
	colorInactive[] = {Dlg_Color_White, 0.5};
  colorBackground[] = {Dlg_Color_White, 1};
  colorText[] = {Dlg_Color_White, 1};
  
  font = "Zeppelin32";
  sizeEx = 0.05;
  
  fontLabel = "Zeppelin32";
	sizeExLabel = 0.0286458;
	fontGrid = "Zeppelin32";
	sizeExGrid = 0.0286458;
	fontUnits = "Zeppelin32";
	sizeExUnits = 0.0286458;
	fontNames = "Zeppelin32";
	sizeExNames = 0.0286458;
	fontInfo = "Zeppelin32";
	sizeExInfo = 0.0286458;
	fontLevel = "Zeppelin32";
	sizeExLevel = 0.0286458;
  
  ptsPerSquareSea	= 6;
  ptsPerSquareTxt	= 8;
  ptsPerSquareCLn	= 8;
  ptsPerSquareExp	= 8;
  ptsPerSquareCost = 8;
  ptsPerSquareFor = "4.0f";
  ptsPerSquareForEdge = "10.0f";
  ptsPerSquareRoad = 2;
  ptsPerSquareObj = 10;
	
	text = "\ca\ui\data\map_background2_co.paa";
  ShowCountourInterval = 0;
  scaleDefault = 0.1;
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
	
  class ActiveMarker {
    color[] = {0.3, 0.1, 0.9, 1};
    size	= 50;
  };

	class Legend {
		x = 0.729;
		y = 0.05;
		w = 0.237;
		h = 0.127;
		font = "Zeppelin32";
		sizeEx = 0.0208333;
		colorBackground[] = {0.906, 0.901, 0.88, 0.8};
		color[] = {Dlg_Color_Black, 1};
	};
	
	class Bunker {
    color[] = {0, 0.35, 0.7, 1};
		icon = "\ca\ui\data\map_bunker_ca.paa";
		size = 14;
		importance = 1.5 * 14 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 14;
		importance = 0.2 * 14 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 10;
		importance = 1 * 10 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Command {
		icon = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {0, 0.9, 0, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	
	class Cross {
	color[] = {0, 0.35, 0.7, 1};
		icon = "\ca\ui\data\map_cross_ca.paa";
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Fortress {
		icon = "\ca\ui\data\map_bunker_ca.paa";
	color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Fuelstation {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
	color[] = {1.0, 0.35, 0.35, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.75;
		coefMax = 4;
	};
	
	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 12;
		importance = 1 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	
	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
	color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 1 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
	color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 20;
		importance = 3 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
	color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	
	class Rock {
	color[] = {0.35, 0.35, 0.35, 1};
		icon = "\ca\ui\data\map_rock_ca.paa";
		size = 12;
		importance = 0.5 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1.2 * 16 * 0.05;
		coefMin = 1;
		coefMax = 4;
	};
	
	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = 0.6 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
	color[] = {0, 0.35, 0.7, 1};
		size = 20;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = 0.9 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1 * 16 * 0.05;
		coefMin = 0.7;
		coefMax = 4;
	};
	
	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
	color[] = {0, 0.35, 0.7, 1};
		size = 20;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
	color[] = {0, 0.35, 0.7, 1};
		size = 16;
		importance = 2.5 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	
	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 32;
		importance = 1.2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
  	color[] = {0, 0.35, 0.7, 1};
  	size = 32;
  	coefMin = 1.00;
  	coefMax = 1.00;
  	importance = 1.00;
	};
	
	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
  	color[] = {Dlg_Color_Black, 1};
  	size = 24;
  	importance = 1.00;
  	coefMin = 1.00;
  	coefMax = 1.00;
	};
};
//-------------------------------------
class RscMap 
{
	access = ReadAndWrite;
	
	class controls {
		class Map : RscMapControl {
			moveOnEdges = 0;
			x = 0;
			y = 0;
			w = 0.83;
			h = 1;
		};
	};
};

//=============================================================================
// Some common class definitions - most dialogs need a background, frame, etc
class Dlg_FullBackground: RscText
{
  x = 0.0;
  y = 0.0;
  w = 1.0;
  h = 1.0;

  colorBackground[] = {Dlg_ColorScheme_DialogBackground,0.9};
};
//-------------------------------------
class Dlg_FullBackgroundFrame: RscFrame
{
  x = 0.0;
  y = 0.0;
  w = 1.0;
  h = 1.0;

  text = " Selection Dialog ";
};
//-------------------------------------
class Dlg_Caption: RscText
{
  x = 0.0;
  y = 0.0;
  w = 0.3;

  colorBackground[] = {Dlg_ColorScheme_CaptionBackground, 1};
  colorText[] = {Dlg_ColorScheme_CaptionText, 1};
};
//-------------------------------------
class RscMemo: RscStructuredText
{
	type = CT_STATIC;
	style = ST_LEFT + ST_MULTI;

  font = FontM;
};
//-------------------------------------
class RscControlsGroup
{
	type = CT_CONTROLS_GROUP;
	idc = -1;
  style = ST_LEFT;
  
  x = 0.1;
  y = 0.1;
  w = 0.3;
  h = 0.3;
  
  class VScrollbar
  {
    color[] = {1, 1, 1, 1};
    width = 0.021;
  };

  class HScrollbar
  {
    color[] = {1, 1, 1, 1};
    height = 0.028;
  };

  class Controls {};
};
//-------------------------------------
