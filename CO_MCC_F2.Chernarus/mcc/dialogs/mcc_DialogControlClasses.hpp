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

//-------------------------------------

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

//-------------------------------------
