// By: Shay_gman
// Version: 1.1 (August 2010)

#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997
#define ExtrasDialog3_IDD 2996

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003

#define TRIGGER_ACTIVEATE 7000
#define TRIGGER_COND 7001
#define TRIGGER_SIZEX 7002
#define TRIGGER_SIZEY 7003
#define TRIGGER_ANGLE 7004
#define TRIGGER_SHAPE 7005 
#define TRIGGER_TEXT 7006 


//-----------------------------------------------------------------------------
// Main dialog
//-----------------------------------------------------------------------------
class ExtrasDialog3 {
  idd = ExtrasDialog3_IDD;
  movingEnable = true;
  onLoad = "[] execVM 'mcc\dialogs\mcc_extra_init3.sqf'"; 
  
  controlsBackground[] = 
  {
	MCC_Bckgrnd,		//mcc background
	MCC_mapBackground,	//map background
	zonesFrame,
	briefingFrame,
	factionFrame,
	markersFrame,
	triggerTextBackground
  };
  

  //---------------------------------------------
  objects[] = 
  { 
  };
  
  controls[] = 
  {
	MCC_map,		//Map dialog
	MCC_Title,
	
	Zone_Number,	//Zones
	Zone_NumberTitle,
	Zone_x,
	Zone_xTitle,
	Zone_y,
	Zone_yTitle,
	Zone_set,
	Zone_select,
	faction,
	factionTitle,
	Update_Faction,
	
	Close_dialog,	//butonns
	Logout,
	Safe,
	Load,
	Extras,
	
	triggersGeneratorTittle, //Triggers
	triggerActivateTitle,
	triggerActivate,
	triggerCondTitle,
	triggerCond,
	triggersSizeXTittle,
	triggerSizeX,
	triggerSizeYTitle,
	triggerSizeY,
	triggersAngleTittle,
	triggerAngle,
	triggersShapeTittle,
	triggerShape,
	triggersTextTittle,
	triggersText,
	triggersCaptureButton
  };
 //========================================= Background========================================
 class MCC_Title : RscText {x = 0.02; y = 0.01;w = 3; colorBackground[] = { 1, 1, 1, 0 };text = "MCC Sandbox V1.3 redone by Shay_gman";};
 class MCC_Bckgrnd : RscPicture {idc = -1; moving = true; x = 0.0; y = 0.0; w = 1.5; h = 1.5; text = "\ca\ui\data\igui_background_diary_ca.paa";};
 class MCC_mapBackground : RscText {idc = -1; moving = true; colorBackground[] = { 1, 1, 1, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44;	w = 0.52; h = 0.4; text = "";};
 class zonesFrame : RscFrame {moving = true; x = 0.35; y = 0.61;w = 0.21; h = 0.23;};
 class briefingFrame : RscFrame {moving = true; x = 0.35; y = 0.04;w = 0.725; h = 0.23;};
 class factionFrame : RscFrame {moving = true; x = 0.35; y = 0.54;w = 0.21; h = 0.07;};
 class markersFrame : factionFrame {x = 0.005; y = 0.04;w = 0.345; h = 0.36;}; 
 class triggerTextBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.09; y = 0.2;w = 0.16; h = 0.04;text = "";};
 //========================================= Controls========================================
  
//mapDialog
  class MCC_map : RscMapControl {idc = -1; moving = true; colorBackground[] = { 0, 0, 0, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44; w = 0.52; h = 0.4;text = "";};
  
//-------------------------------------------ComboBox-------------------------------------------
//zones
  class Zone_Number : RscComboBox {	idc = MCC_ZONE_NUMBERS;	style = ST_LEFT;colorText[] = { 1, 1, 1, 1 };colorSelect[] = { 1.0, 0.35, 0.3, 1 };	colorBackground[] = { 0, 0, 0, 0.6 };
									colorSelectBackground[] = { 0, 0, 0, 1 };font = "BitStream";sizeEx =0.028;	x = 0.42; y = 0.65;w = 0.06; h = 0.028;};
  class Zone_x : Zone_Number {idc = MCC_ZONE_X;y = 0.65 + 0.05;};
  class Zone_y : Zone_Number {idc = MCC_ZONE_Y;y = 0.65 + 0.05 + 0.05;};
  class faction : Zone_Number {idc = MCC_FACTION;y = 0.56;};
//Triggers
  class triggerActivate : Zone_Number {idc = TRIGGER_ACTIVEATE;x = 0.09;y = 0.08;sizeEx = 0.03;w = 0.09; h = 0.03;};
  class triggerCond : triggerActivate {idc = TRIGGER_COND;x = 0.24;};
  class triggerSizeX : triggerActivate {idc = TRIGGER_SIZEX;y = 0.12;};
  class triggerSizeY : triggerSizeX {idc = TRIGGER_SIZEY;x = 0.24;};
  class triggerAngle : triggerActivate {idc = TRIGGER_ANGLE;y = 0.16;};
  class triggerShape : triggerAngle {idc = TRIGGER_SHAPE;x = 0.24;};
 
//-------------------------------------------Titels-------------------------------------------
//Zones
  class Zone_NumberTitle : RscText {idc = -1;style = ST_LEFT;colorBackground[] = { 1, 1, 1, 0 };colorText[] = { 1, 1, 1, 1 };x = 0.35; y = 0.65 - 0.015;	w = 0.22; h = 0.05;	sizeEx = 0.03;text = "Zone:";};
  class Zone_xTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05;text = "Size X:";};
  class Zone_yTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05 + 0.05;text = "Size Y:";};
  class factionTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.55;text = "Faction:";};
//Trigers
  class triggersGeneratorTittle : Zone_NumberTitle {x = 0;y = 0.03;colorText[] = {0,1,1,1};text = "Triggers Generator:";};
  class triggerActivateTitle : triggersGeneratorTittle {y = 0.07;colorText[] = { 1, 1, 1, 1 };text = "Activate:";};
  class triggerCondTitle : triggerActivateTitle {x = 0.18;text = "Cond:";};
  class triggersSizeXTittle : triggerActivateTitle {y = 0.11;text = "SizeX:";};
  class triggerSizeYTitle : triggersSizeXTittle {x = 0.18;text = "SizeY:";};
  class triggersAngleTittle : triggerActivateTitle {y = 0.15;text = "Angle:";};
  class triggersShapeTittle : triggersAngleTittle {x = 0.18;text = "Shape:";};
  class triggersTextTittle : triggerActivateTitle {y = 0.19;text = "Text:";};
//----------------------------------------TextBox---------------------------------------------
  class triggersText : RscText {idc = TRIGGER_TEXT;type = CT_EDIT;style = ST_MULTI;colorBackground[] = { 0, 0, 0, 0 };colorText[] = { 1, 1, 1, 1 };colorSelection[] = { 1, 1, 1, 1 };colorBorder[] = { 1, 1, 1, 1 };
		BorderSize = 0.01;autocomplete = false;x = 0.09; y = 0.2;w = 0.16; h = 0.04;sizeEx = 0.03;text = "";};
//-------------------------------------------Buttons-------------------------------------------
//Zones
  class Zone_set : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.35; y = 0.8;	text = "Update Zone";onButtonClick = "[1] execVM 'mcc\pop_menu\zones.sqf'";};
  class Zone_select : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.48; y =0.65 ;w = 0.07; h = 0.0422876;size = 0.02;sizeEx = 0.02821;text = "select";onButtonClick = "[0] execVM 'mcc\pop_menu\zones.sqf'";};
//Bottom Buttons
  class Close_dialog : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.895; y = 0.84;text = "Close";onButtonClick = "closeDialog 0";};
  class Update_Faction : Zone_select {y = 0.55;text = "Update";onButtonClick = "mcc_screen=2;[] execVM 'mcc\pop_menu\faction.sqf'";};
  class Logout : Close_dialog {x = 0.7;text = "Logout";onButtonClick = "mcc_resetmissionmaker=true;nul=[0] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';closeDialog 0";};
  class Safe : Close_dialog {x = 0.01;text = "Safe";onButtonClick = "mcc_safe='mcc_isloading=true;' + mcc_safe + 'mcc_isloading=false;';copyToClipboard mcc_safe;hint 'SAVED to Clipboard! Now you can paste this code where you like to save it. Simple copy it all back in clipboard (ctrl-c) and press load to rebuild your mission.';";};
  class Load : Close_dialog {x = 0.2;text = "Load";onButtonClick = "mcc_safe = CopyFromClipboard; [] spawn compile mcc_safe;";};
  class Extras : Close_dialog {x = 0.01;y=0.4;w = 0.33;text = "Main Menu";onButtonClick = "mcc_screen=0;closeDialog 0;[] execVM 'mcc\pop_menu\mcc_CreatePopupMenu.sqf'";};
//Triggers
  class triggersCaptureButton : RscButton {idc = -1;x = 0.26;y = 0.2;w = 0.08;h = 0.04;colorText[] = {0,1,0,1};text = "Generate";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\triggers\triggers.sqf';} else {player globalchat 'Access Denied'};";};
  };
