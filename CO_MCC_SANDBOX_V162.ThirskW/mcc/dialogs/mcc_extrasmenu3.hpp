// By: Shay_gman
// Version: 1.1 (August 2010)
#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997
#define ExtrasDialog3_IDD 2996

#define MAIN 3293
#define MENU2 3294
#define MENU3 3295
#define MENU4 3296
#define LOGOUT 3290
#define LOGIN 3291

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002
#define ZONE_B 3015
	
#define MCC_FACTION 3003
#define CAPTURE 3204

#define TRIGGER_ACTIVEATE 7000
#define TRIGGER_COND 7001
#define TRIGGER_SIZEX 7002
#define TRIGGER_SIZEY 7003
#define TRIGGER_ANGLE 7004
#define TRIGGER_SHAPE 7005 
#define TRIGGER_TEXT 7006 
#define TRIGGER_SELECTED 7007

#define GITA_SIZEX 7010
#define GITA_TEXT 7012 
#define GITA_DAMAGE 7013
#define GITA_STYLE 7014

#define MODULES_ANIMAL 7015 
#define MODULES_ALICE 7016 
#define MODULES_ALICE2 7017 
#define MODULES_SILVIE 7018 

#define BATTLEFIELD_RADIUS 7025

#define MOBILESPAWN_CARS 7030 
#define MOBILESPAWN_TANKS 7031
#define MOBILESPAWN_HELIS 7032
#define MOBILESPAWN_SIDE 7033

#define DELETE_ZONE 7040
#define DELETE_CLASS 7041

#define COIN_VEHICLE 7050
#define COIN_FUNDS 7052 

#define MCC_PLAYERS 7060 
#define COMMAND_LINE 7061

#define POPZ_ACTION 7070 
#define POPZ_INTANSE 7071

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
	MCC_layout,
	MCC_layoutbckgrnd,
	MCC_mapBackground,	//map background
	zonesFrame,
	briefingFrame,
	factionFrame,
	markersFrame,
	triggerTextBackground,
	gitaTextBackground,
	gitaFrame,
	modulesFrame,
	battlefieldFrame,
	mobileSpawnFrame,
	deleteFrame,
	coinFrame,
	playersManagmentBackGround,
	commandLineFrame,
	commandLineBackGround,
	POPZFrame,
	POPZFrame2
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
	zoneTitle,
	Zone_x,
	Zone_xTitle,
	Zone_y,
	Zone_yTitle,
	Zone_set,
	faction,
	factionTitle,
	Update_Faction,
	
	Close_dialog,	//butonns
	Refresh_dialog,
	Safe,
	Load,
	Extras,
	Extras1,
	Extras2,
	Extras3,
	trigger_capturing,
	Login,
	Logout,
	
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
	triggersGenerateButton,
	triggersTriggerTittle,
	triggerSelected,
	triggersMoveButton,
	townGeneratorTittle, //Gita
	gitaXTittle,
	gitaSizeX,
	gitaText,
	gitaTextTittle,
	placeMarkerGita,
	gitaDamageTittle,
	gitaDamage,
	gitaStyleTittle,
	gitaStyle,
	ModuleTittle, //Modules
	animal,
	alice,
	alice2,
	silvie,
	battlefieldTittle, //battlefield
	battlefieldRadiusTittle,
	battlefieldRadius,
	battlefieldGenerate,
	mobileSpawnTittle,	//Mobile spawn
	mobileSpawnSideTittle,
	mobileSpawnCarsTittle,
	mobileSpawnTanksTittle,
	mobileSpawnHelisTittle,
	mobileSpawnCars,
	mobileSpawnTanks,
	mobileSpawnHelis,
	mobileSpawnCarsButton,
	mobileSpawnTanksButton,
	mobileSpawnHelisButton,
	mobileSpawnSide,
	deleteTittle,	//delete
	deleteZoneTittle,
	deleteTypeTittle,
	deleteZone,
	deleteClass,
	deleteButton,
	coinTittle,	//coin
	coinVehicleTypeTitle,
	coinFundsTittle,
	coinVehicle,
	coinFunds,
	coinButton,
	coinButtonAddFunds,
	coinButtonSubFunds,
	playersManagment, 	//Players
	playersManagmentTittle,
	UMTeleportButton,
	UMTeleportLHDButton,
	UMHijakButton,
	UMMarkerkButton,
	UMHighCommandButton,
	UMHCClearAllButton,
	UMHCAddGroupButton,
	UMPlayerButton,
	UMEastButton,
	UMWestButton,
	UMGurButton,
	UMunitOrGroupButton,
	UMParaDropButton,
	commandLineTittle,
	commandLineText,
	commandLineExecButton,
	commandLineBroadcastButton,
	UMMultiSelectionText,
	POPZTittle,		//POPZ (populate zone)
	POPZActionTittle,
	POPZAction,
	POPZIntanseTittle,
	POPZIntanse,
	POPZActionButton
  };
 //========================================= Background========================================
 class MCC_Title : RscText {x = 0.00; y = 0.01;w = 3; colorBackground[] = { 1, 1, 1, 0 };text = "MCC Sandbox V1.6.1 redone by Shay_gman";};
 class MCC_layout : RscPicture {idc = -1; moving = true; x = -0.16; y = -0.2; w = 1.4; h = 1.4; text = "\ca\ui\data\ui_gps_ca.paa";};
 class MCC_layoutbckgrnd : RscText {idc = -1; moving = true; colorBackground[] = { 0, 0, 0, 1}; x = 0.002; y = 0.04; w = 1.075; h = 0.8; text = "";};
 class MCC_Bckgrnd : RscPicture {idc = -1; moving = true; x = 0.0; y = 0.0; w = 1.5; h = 1.5; text = "\ca\ui\data\igui_background_diary_ca.paa";};
 class MCC_mapBackground : RscText {idc = -1; moving = true; colorBackground[] = { 1, 1, 1, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44;	w = 0.52; h = 0.4; text = "";};
 class zonesFrame : RscFrame {moving = true; x = 0.35; y = 0.61;w = 0.21; h = 0.23;};
 class briefingFrame : RscFrame {moving = true; x = 0.35; y = 0.04;w = 0.725; h = 0.23;};
 class factionFrame : RscFrame {moving = true; x = 0.35; y = 0.54;w = 0.21; h = 0.07;};
 class markersFrame : factionFrame {x = 0.005; y = 0.04;w = 0.345; h = 0.36;}; 
 class triggerTextBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.09; y = 0.2;w = 0.16; h = 0.04;text = "";};
 class gitaTextBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.11; y = 0.52;w = 0.14; h = 0.04;text = "";};
 class gitaFrame : markersFrame {y = 0.44;w = 0.345; h = 0.4;};
 class modulesFrame : markersFrame {y = 0.04; h = 0.26;};
 class battlefieldFrame : markersFrame {y = 0.44; h = 0.18;};
 class mobileSpawnFrame : markersFrame {y = 0.7; h = 0.14;};
 class deleteFrame : RscFrame {moving = true; x = 0.35; y = 0.44;w = 0.21; h = 0.1;};
 class coinFrame : RscFrame {moving = true; x = 0.35; y = 0.04;w = 0.21; h = 0.23;};
 class playersManagmentBackGround : gitaTextBackground {x=0.58; y=0.0725; w=0.25; h=0.16;};
 class commandLineFrame : RscFrame {moving = true; x = 0.35; y = 0.27;w = 0.725; h = 0.05;};
 class commandLineBackGround : gitaTextBackground {x = 0.5; y = 0.275;w = 0.4;};
 class POPZFrame : RscFrame {moving = true; x = 0.35; y = 0.32;w = 0.725; h = 0.12;};
 class POPZFrame2 : RscFrame {moving = true; x = 0.35; y = 0.32;w = 0.26; h = 0.12;};
 //========================================= Controls========================================
  
//mapDialog
  class MCC_map : RscMapControl {idc = -1; moving = true; colorBackground[] = { 0, 0, 0, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44; w = 0.52; h = 0.4;text = "";onMouseButtonDown = "[_this] execVM 'mcc\mouseDown.sqf'";onMouseButtonUp = "[_this] execVM 'mcc\mouseUp.sqf'";};
  
//-------------------------------------------ComboBox-------------------------------------------
//zones
  class Zone_Number : RscComboBox {	idc = MCC_ZONE_NUMBERS;	style = ST_LEFT;colorText[] = { 1, 1, 1, 1 };colorSelect[] = { 1.0, 0.35, 0.3, 1 };	colorBackground[] = { 0, 0, 0, 0.6 };
									colorSelectBackground[] = { 0, 0, 0, 1 };font = "BitStream";sizeEx =0.028;	x = 0.42; y = 0.65;w = 0.06; h = 0.028;onLBSelChanged = "[0,4] execVM 'mcc\pop_menu\zones.sqf'";};
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
  class triggerSelected : triggerAngle {idc = TRIGGER_SELECTED;y = 0.25;w = 0.16;};
//Gita
  class gitaSizeX : triggerActivate {idc = GITA_SIZEX;y = 0.48;};
  class gitaDamage : gitaSizeX {idc = GITA_DAMAGE;x = 0.26;w = 0.04;};
  class gitaStyle : triggerActivate {idc = GITA_STYLE;y = 0.58;};
//Battlefield
  class battlefieldRadius : triggerActivate {idc = BATTLEFIELD_RADIUS;y = 0.66;};
//Mobile Spawn
 class mobileSpawnSide : triggerActivate {idc = MOBILESPAWN_SIDE;x = 0.21;y = 0.7;};
 class mobileSpawnCars : triggerActivate {idc = MOBILESPAWN_CARS;x = 0.01;y = 0.76;};
 class mobileSpawnTanks: mobileSpawnCars {idc = MOBILESPAWN_TANKS;x = 0.11;};
 class mobileSpawnHelis: mobileSpawnCars {idc = MOBILESPAWN_HELIS;x = 0.21;};
 //Delete Vehicle
 class deleteZone : triggerActivate {idc = DELETE_ZONE;x = 0.42;y = 0.47;w = 0.06;};
 class deleteClass : deleteZone {idc = DELETE_CLASS;y = 0.51;};
 //Coin
 class coinVehicle : Zone_Number {idc = COIN_VEHICLE;x = 0.45;y = 0.08;sizeEx = 0.03;w = 0.07; h = 0.03;};
 class coinFunds : coinVehicle {idc = COIN_FUNDS;y = 0.12;};
 //players
 class playersManagment : RscListBox {idc=MCC_PLAYERS; type = CT_LISTBOX; style = LB_MULTI; colorText[]={1,1,1,1}; colorSelect[]={1.0,0.35,0.3,1}; colorBackground[]={0,0,0,0.6};
									colorSelectBackground[]={0,0,1,1}; font="BitStream"; sizeEx=0.028; x=0.58; y=0.0725; w=0.25; h=0.16; rowHeight=0.022; autoScrollRewind=0;
									autoScrollDelay=0; autoScrollSpeed = 0;onLBSelChanged = "if (mcc_missionmaker == (name player)) then {nul=[4] execVM 'mcc\general_scripts\unitManage\um.sqf';}";onMouseButtonUp = "[8,_this] execVM 'mcc\general_scripts\unitManage\um.sqf'";};
 //POPZ
 class POPZAction : triggerActivate {idc = POPZ_ACTION;x = 0.45;y = 0.36;w = 0.08;};
 class POPZIntanse : POPZAction {idc = POPZ_INTANSE;y = 0.4;};
 
//-------------------------------------------Titels-------------------------------------------
//Zones
  class Zone_NumberTitle : RscText {idc = -1;style = ST_LEFT;colorBackground[] = { 1, 1, 1, 0 };colorText[] = { 1, 1, 1, 1 };x = 0.35; y = 0.65 - 0.015;	w = 0.22; h = 0.05;	sizeEx = 0.03;text = "Zone:";};
  class Zone_xTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05;text = "Size X:";};
  class Zone_yTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05 + 0.05;text = "Size Y:";};
  class factionTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.55;text = "Faction:";};
  class zoneTitle : Zone_NumberTitle {x = 0.39;y = 0.6;colorText[] = {0,1,1};text = "Zones:*";};
//Trigers
  class triggersGeneratorTittle : Zone_NumberTitle {x = 0;y = 0.03;colorText[] = {0,1,1,1};text = "Triggers Generator:";};
  class triggerActivateTitle : triggersGeneratorTittle {y = 0.07;colorText[] = { 1, 1, 1, 1 };text = "Activate:";};
  class triggerCondTitle : triggerActivateTitle {x = 0.18;text = "Cond:";};
  class triggersSizeXTittle : triggerActivateTitle {y = 0.11;text = "SizeX:";};
  class triggerSizeYTitle : triggersSizeXTittle {x = 0.18;text = "SizeY:";};
  class triggersAngleTittle : triggerActivateTitle {y = 0.15;text = "Angle:";};
  class triggersShapeTittle : triggersAngleTittle {x = 0.18;text = "Shape:";};
  class triggersTextTittle : triggerActivateTitle {y = 0.19;text = "Text:";};
  class triggersTriggerTittle : triggerActivateTitle {y = 0.24;text = "Trigger:";};
//Gita
  class townGeneratorTittle : Zone_NumberTitle {x = 0;y = 0.43;colorText[] = {0,1,1,1};text = "Town Generator:";};
  class gitaXTittle : triggerActivateTitle {y = 0.47;text = "Radius:";};
  class gitaTextTittle : gitaXTittle {y = 0.51;text = "Town Name:";};
  class gitaDamageTittle : gitaXTittle {x = 0.18;text = "Damage:";};
  class gitaStyleTittle : gitaTextTittle {y = 0.57;text = "Style:";};
//Modules
  class ModuleTittle : townGeneratorTittle {y = 0.29;text = "Enable Modules:";};
//Battlefield
  class battlefieldTittle : ModuleTittle {y = 0.61;text = "Battlefield Generator:";};
  class battlefieldRadiusTittle : triggerActivateTitle {y = 0.65;text = "Radius:";};
//Mobile Spawn
  class mobileSpawnTittle : ModuleTittle {y = 0.69;text = "Mobile Spawn:";};
  class mobileSpawnSideTittle : triggerActivateTitle {x = 0.16;y = 0.69;text = "Side:";};
  class mobileSpawnCarsTittle : triggerActivateTitle {x = 0.01;y = 0.72;text = "Cars:";};
  class mobileSpawnTanksTittle : mobileSpawnCarsTittle {x = 0.11;text = "Tanks:";};
  class mobileSpawnHelisTittle : mobileSpawnCarsTittle {x = 0.21;text = "Helis:";};
//Delete Vehicle
  class deleteTittle : ModuleTittle {x = 0.35; y = 0.43;text = "Clear Area:";};
  class deleteZoneTittle : mobileSpawnCarsTittle {x = 0.35; y = 0.46;text = "Radius:";};
  class deleteTypeTittle : deleteZoneTittle {y = 0.5;text = "Class:";};
//Coin
  class coinTittle : Zone_NumberTitle {x = 0.35;y = 0.03;colorText[] = {0,1,1,1};text = "Construction HQ:";};
  class coinVehicleTypeTitle : coinTittle {y = 0.07;colorText[] = { 1, 1, 1, 1 };text = "Side:";};
  class coinFundsTittle : coinVehicleTypeTitle {y = 0.11;text = "Funds:";};
//Unit managment
  class playersManagmentTittle : Zone_NumberTitle {x=0.56; y=0.03; colorText[]={0,1,1,1}; text="Units management:";};
  class UMMultiSelectionText : Zone_NumberTitle {idc=-1; x=0.83; y=0.23; w = 0.25 ;sizeEx = 0.025;text = "*Hold Ctrl for Multi-selection";};
//Commandline
  class commandLineTittle : Zone_NumberTitle {x=0.35; y=0.27; colorText[]={0,1,1,1}; text="Command Line:";};
//Populate Zone
  class POPZTittle : Zone_NumberTitle {x=0.35; y=0.32; colorText[]={0,1,1,1}; text="Populate Zone:";};
  class POPZActionTittle : mobileSpawnCarsTittle {x = 0.35;y = 0.35;text="Action:";};
  class POPZIntanseTittle : POPZActionTittle {y = 0.39;text="Intensity:";};
  
//----------------------------------------TextBox---------------------------------------------
  class triggersText : RscText {idc = TRIGGER_TEXT;type = CT_EDIT;style = ST_MULTI;colorBackground[] = { 0, 0, 0, 0 };colorText[] = { 1, 1, 1, 1 };colorSelection[] = { 1, 1, 1, 1 };colorBorder[] = { 1, 1, 1, 1 };
		BorderSize = 0.01;autocomplete = true;x = 0.09; y = 0.2;w = 0.16; h = 0.04;sizeEx = 0.03;text = "";};
  class gitaText : triggersText {idc = GITA_TEXT;x = 0.11; y = 0.52;w = 0.14;};
  class commandLineText : triggersText {idc = COMMAND_LINE;x = 0.5; y = 0.275;w = 0.4;};
//-------------------------------------------Buttons-------------------------------------------
//Zones
  class Zone_set : RscGUIShortcutButton {idc = ZONE_B;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.35; y = 0.8;	text = "Update Zone";onButtonClick = "[1] execVM 'mcc\pop_menu\zones.sqf'";};
//Bottom Buttons
	class Update_Faction : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.48;y = 0.55;w = 0.07; h = 0.0422876;size = 0.02;sizeEx = 0.02821;text = "Update";onButtonClick = "mcc_screen=3;[] execVM 'mcc\pop_menu\faction.sqf'";};
	class Close_dialog : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.89; y = 0.84;w = 0.18;text = "Close";onButtonClick = "closeDialog 0";};
	class Refresh_dialog : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.71; y = 0.84;w = 0.18;text = "Refresh";onButtonClick = "closeDialog 0;[] execVM 'mcc\dialogs\mcc_PopupMenu.sqf'";};

	class Login  : RscGUIShortcutButton {idc = LOGIN; x = 0.35; y = 0.84;w = 0.18;text = "Login"; onButtonClick = "mcc_resetmissionmaker=true;mcc_loginmissionmaker=true; nul=[0] execVM 'mcc\pop_menu\mcc_login.sqf'";};
	class Logout : RscGUIShortcutButton {idc = LOGOUT;x = 0.53; y = 0.84;w = 0.18;text = "Logout";onButtonClick = "mcc_resetmissionmaker=true;mcc_loginmissionmaker=false; nul=[0] execVM 'mcc\pop_menu\mcc_login.sqf'; closeDialog 0";};

	class Safe : RscGUIShortcutButton {x = 0.01; y = 0.84;w = 0.16;text = "Safe";onButtonClick = "copyToClipboard mcc_safe;hint 'SAVED to Clipboard! Now you can paste this code where you like to save it. Simple copy it all back in clipboard (ctrl-c) and press load to rebuild your mission.';";};
	class Load : RscGUIShortcutButton {x = 0.17; y = 0.84;w = 0.16;text = "Load";onButtonClick = "mcc_safe = CopyFromClipboard;mcc_load='mcc_isloading=true;' + mcc_safe + ';mcc_isloading=false;';[] spawn compile mcc_load;";};

	class Extras  : RscGUIShortcutButton {idc = MAIN ;x = 0.35;y=0.0;w = 0.18;text = "MAIN";onButtonClick = "mcc_screen=0;closeDialog 0;[] execVM 'mcc\dialogs\mcc_PopupMenu.sqf'";};
	class Extras1 : RscGUIShortcutButton {idc = MENU2 ;x = 0.53;y=0.0;w = 0.18;text = "Menu 2";onButtonClick = "mcc_screen=1;closeDialog 0;[] execVM 'mcc\dialogs\mcc_PopupMenu.sqf'";};
	class Extras2 : RscGUIShortcutButton {idc = MENU3 ;x = 0.71;y=0.0;w = 0.18;text = "Menu 3";onButtonClick = "mcc_screen=2;closeDialog 0;[] execVM 'mcc\dialogs\mcc_PopupMenu.sqf'";};
	class Extras3 : RscGUIShortcutButton {idc = MENU4 ;x = 0.89;y=0.0;w = 0.18;text = "Menu 4";onButtonClick = "mcc_screen=3;closeDialog 0;[] execVM 'mcc\dialogs\mcc_PopupMenu.sqf'";};

	class trigger_capturing : RscGUIShortcutButton {idc = CAPTURE;x = 0.01;y=0.4;w = 0.33;text = "Stop Capturing";action = "ctrlEnable [3204,false];mcc_capture_state=false;";};
//Triggers
  class triggersGenerateButton : RscButton {idc = -1;x = 0.26;y = 0.2;w = 0.08;h = 0.04;colorText[] = {0,1,0,1};text = "Generate";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\triggers\triggers.sqf';} else {player globalchat 'Access Denied'};";};
  class triggersMoveButton : RscButton {idc = -1;x = 0.26;y = 0.25;w = 0.08;h = 0.04;colorText[] = {0,0,1,1};text = "Move";action = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\triggers\triggers.sqf';} else {player globalchat 'Access Denied'};";};
//Gita  
  class placeMarkerGita : RscButton {idc = -1;x = 0.26;y = 0.52;w = 0.08;h = 0.04;colorText[] = {0,0,1,1};text = "Create";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\gita\generate_request.sqf';} else {player globalchat 'Access Denied'};";};
//Modules
  class animal : RscButton {idc = MODULES_ANIMAL;x = 0.01;y = 0.34;w = 0.07;h = 0.04;colorText[] = {0,0,1,1};text = "Animals";action = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\gita\generate_request.sqf';} else {player globalchat 'Access Denied'};";};
  class alice : RscButton {idc = MODULES_ALICE;x = 0.09;y = 0.34;w = 0.07;h = 0.04;colorText[] = {0,0,1,1};text = "Civ Euro";action = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\gita\generate_request.sqf';} else {player globalchat 'Access Denied'};";};
  class alice2 : RscButton {idc = MODULES_ALICE2;x = 0.18;y = 0.34;w = 0.07;h = 0.04;colorText[] = {0,0,1,1};text = "Civ Arab";action = "if (mcc_missionmaker == (name player)) then {nul=[3] execVM 'mcc\general_scripts\gita\generate_request.sqf';} else {player globalchat 'Access Denied'};";};
  class silvie : RscButton {idc = MODULES_SILVIE;x = 0.27;y = 0.34;w = 0.07;h = 0.04;colorText[] = {0,0,1,1};text = "Vehicles";action = "if (mcc_missionmaker == (name player)) then {nul=[4] execVM 'mcc\general_scripts\gita\generate_request.sqf';} else {player globalchat 'Access Denied'};";};
//Battlefield
  class battlefieldGenerate : RscButton {idc = -1;x = 0.2;y = 0.65;w = 0.08;h = 0.04;colorText[] = {0,0,1,1};text = "Create";action = "if (mcc_missionmaker == (name player)) then {nul=[5] execVM 'mcc\general_scripts\gita\generate_request.sqf';} else {player globalchat 'Access Denied'};";};
//MobileSpawn
  class mobileSpawnCarsButton : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.01; y = 0.8;w = 0.08;h = 0.04;size = 0.02;sizeEx = 0.03;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\mobileSpawn\mobileSpawn_request.sqf';} else {player globalchat 'Access Denied'};";};
  class mobileSpawnTanksButton : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.11; y = 0.8;w = 0.08;h = 0.04;size = 0.02;sizeEx = 0.03;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\mobileSpawn\mobileSpawn_request.sqf';} else {player globalchat 'Access Denied'};";};
  class mobileSpawnHelisButton : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.21; y = 0.8;w = 0.08;h = 0.04;size = 0.02;sizeEx = 0.03;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\mobileSpawn\mobileSpawn_request.sqf';} else {player globalchat 'Access Denied'};";};
//Delete vhiecle
  class deleteButton : RscButton {idc = -1;x = 0.49; y = 0.47;w = 0.06;h = 0.06;size = 0.02;sizeEx = 0.03;text = "Clear";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[] execVM 'mcc\general_scripts\delete\delete_req.sqf';} else {player globalchat 'Access Denied'};";};
//coin
  class coinButton : RscButton {idc = -1;x = 0.4; y = 0.18;w = 0.1;h = 0.06;size = 0.02;sizeEx = 0.03;text = "Create";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\coin\coin_req.sqf';} else {player globalchat 'Access Denied'};";};
  class coinButtonAddFunds : RscButton {idc = -1;x = 0.42; y = 0.12;w = 0.02;h = 0.03;size = 0.02;sizeEx = 0.03;text = "-";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\coin\coin_req.sqf';} else {player globalchat 'Access Denied'};";};
  class coinButtonSubFunds : RscButton {idc = -1;x = 0.53; y = 0.12;w = 0.02;h = 0.03;size = 0.02;sizeEx = 0.03;text = "+";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\coin\coin_req.sqf';} else {player globalchat 'Access Denied'};";};
//Unit managment
  class UMTeleportButton : RscButton {idc=-1; x=0.85; y=0.07; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="Teleport"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat format ['Access Denied: %1', mcc_missionmaker == (name player)];};";};
  class UMTeleportLHDButton : RscButton {idc=-1; x=0.85; y=0.11; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="Tel. 2 LHD"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat 'Access Denied'};";};
  class UMHijakButton : RscButton {idc=-1; x=0.85; y=0.15; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="Hijak"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat 'Access Denied'};";};
  class UMMarkerkButton : RscButton {idc=-1; x=0.85; y=0.19; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="Mark"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[3] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat 'Access Denied'};";};
  class UMHighCommandButton : RscButton {idc=-1; x=0.96; y=0.07; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="Commander"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[5] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat 'Access Denied'};";};
  class UMHCClearAllButton : RscButton {idc=-1; x=0.96; y=0.11; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="HC: Clear All"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[6] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat 'Access Denied'};";};
  class UMHCAddGroupButton : RscButton {idc=-1; x=0.96; y=0.15; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="HC: Add Group"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[7] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat 'Access Denied'};";};
  class UMParaDropButton : RscButton {idc=-1; x=0.96; y=0.19; w=0.1; h=0.03; size=0.02; sizeEx=0.02; text="Paradrop"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[9] execVM 'mcc\general_scripts\unitManage\um.sqf';} else {player globalchat 'Access Denied'};";};
  class UMPlayerButton : RscButton {idc=-1; x=0.59; y=0.235; w=0.05; h=0.027; size=0.02; sizeEx=0.025; text="Players"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\unitManage\side_change.sqf';} else {player globalchat 'Access Denied'};";};
  class UMEastButton : RscButton {idc=-1; x=0.65; y=0.235; w=0.05; h=0.027; size=0.02; sizeEx=0.025;colorText[] = {1,0,0,1}; text="East"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\unitManage\side_change.sqf';} else {player globalchat 'Access Denied'};";};
  class UMWestButton : RscButton {idc=-1; x=0.71; y=0.235; w=0.05; h=0.027; size=0.02; sizeEx=0.025;colorText[] = {0,0,1,1}; text="West"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\unitManage\side_change.sqf';} else {player globalchat 'Access Denied'};";};
  class UMGurButton : RscButton {idc=-1; x=0.77; y=0.235; w=0.05; h=0.027; size=0.02; sizeEx=0.025;colorText[] = {0,1,0,1}; text="GUR"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[3] execVM 'mcc\general_scripts\unitManage\side_change.sqf';} else {player globalchat 'Access Denied'};";};
  class UMunitOrGroupButton : RscToolbox {idc=-1; x=0.73; y=0.04; w=0.1; h=0.027; rows=1; columns=2; strings[]={"Units","Groups"}; values[] = {0, 1}; onToolBoxSelChanged = "UMUnit = (_this select 1);";};
//Command Line
  class commandLineExecButton : RscButton {idc=-1; x=0.91; y=0.28; w=0.07; h=0.03; size=0.02; sizeEx=0.02; text="Execute"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\commandLine\commandLine.sqf';} else {player globalchat 'Access Denied'};";};
  class commandLineBroadcastButton : RscButton {idc=-1; x=0.99; y=0.28; w=0.07; h=0.03; size=0.02; sizeEx=0.02; text="Broadcast"; onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\commandLine\commandLine.sqf';} else {player globalchat 'Access Denied'};";};
//POPZ
  class POPZActionButton : RscButton {idc = -1;x = 0.54; y = 0.36;w = 0.06;h = 0.06;size = 0.02;sizeEx = 0.025;text = "Confirm";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[] execVM 'mcc\general_scripts\popz\popz_req.sqf';} else {player globalchat 'Access Denied'};";};
   };
