// By: Shay_gman
// Version: 1.1 (August 2010)

#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003

#define BRIEFINGSBOX 6000
#define TASKNAMEBOX 6001
#define TASKDESCRIPTIONBOX 6002
#define ACTIVETASKS 6003 

#define MARKER_COLOR 6050 
#define MARKER_COLOR2 6051 
#define MARKER_SIZEX 6052 
#define MARKER_SIZEY 6053 
#define MARKER_SHAPE 6054 
#define MARKER_BRUSH 6055 
#define MARKER_TYPE 6056 
#define MARKERSTEXT 6057 
#define MARKERSTEXT2 6058 


//-----------------------------------------------------------------------------
// Main dialog
//-----------------------------------------------------------------------------
class ExtrasDialog2 {
  idd = ExtrasDialog2_IDD;
  movingEnable = true;
  onLoad = "[] execVM 'mcc\dialogs\mcc_extra_init2.sqf'"; 
  
  controlsBackground[] = 
  {
	MCC_Bckgrnd,		//mcc background
	MCC_mapBackground,	//map background
	zonesFrame,
	briefingBackground,
	taskNameBackground,
	taskDescriptionBackground,
	briefingFrame,
	tasksFrame,
	factionFrame,
	MarkersTextBackground,
	markersFrame,
	brushesFrame,
	brushesTextBackground
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
	
	briefings,	//Briefings
	briefingsBox,
	diarySituation,
	diaryEnemyForces,
	diaryFriendlyForces,
	diaryMission,
	diarySpecialTasks,
	diaryFireSupport,
	
	createTasks,	//Tasks
	createTasksName,
	taskNameBox,
	createTasksDescription,
	taskDescriptionBox,
	TaskCreate,
	activeTasks,
	TaskWP,
	TaskSucceeded,
	TaskFailed,
	TaskCanceled,
	markers,
	markersColorTitle,
	markersColor,
	markersSizeTitle,
	markerSizeX,
	markerSizeY,
	markersShapeTitle,
	markerShape,
	markersBrushTitle,
	markerBrush,
	markerType,
	markersTypeTitle,
	markerCreate,
	markerDelete,
	markersTextTitle,
	markersText,
	markersColor2,
	markersColor2Title,
	brushes,
	brushesTextTitle,
	markersText2,
	brushesCreate,
	brushesDelete
	
  };
 //========================================= Background========================================
 class MCC_Title : RscText {x = 0.02; y = 0.01;w = 3; colorBackground[] = { 1, 1, 1, 0 };text = "MCC Sandbox V1.1 redone by Shay_gman";};
 class MCC_Bckgrnd : RscPicture {idc = -1; moving = true; x = 0.0; y = 0.0; w = 1.5; h = 1.5; text = "\ca\ui\data\igui_background_diary_ca.paa";};
 class MCC_mapBackground : RscText {idc = -1; moving = true; colorBackground[] = { 1, 1, 1, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44;	w = 0.52; h = 0.4; text = "";};
 class zonesFrame : RscFrame {moving = true; x = 0.35; y = 0.61;w = 0.21; h = 0.23;};
 class briefingBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.36; y = 0.08;w = 0.7; h = 0.15;text = "";};
 class taskNameBackground : briefingBackground {x = 0.36; y = 0.34;w = 0.2; h = 0.04;text = "";};
 class taskDescriptionBackground : briefingBackground {x = 0.565; y = 0.34;w = 0.38; h = 0.09;text = "";};
 class briefingFrame : RscFrame {moving = true; x = 0.35; y = 0.04;w = 0.725; h = 0.23;};
 class tasksFrame : RscFrame {moving = true; x = 0.35; y = 0.27;w = 0.725; h = 0.23;};
 class factionFrame : RscFrame {moving = true; x = 0.35; y = 0.5;w = 0.21; h = 0.11;};
 class MarkersTextBackground : briefingBackground {x = 0.07; y = 0.12;w = 0.2; h = 0.04;text = "";};
 class markersFrame : factionFrame {x = 0.005; y = 0.04;w = 0.345; h = 0.16;}; 
 class brushesFrame : markersFrame {y = 0.2;w = 0.345; h = 0.2;}; 
 class brushesTextBackground : MarkersTextBackground {y = 0.33;};
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
  class activeTasks : Zone_Number {idc = ACTIVETASKS;x = 0.36;y = 0.39;w = 0.19;h = 0.03;};
//markers
  class markersColor : Zone_Number {idc = MARKER_COLOR;x = 0.07;y = 0.08;sizeEx = 0.03;w = 0.1; h = 0.03;};
  class markerSizeX : markersColor {idc = MARKER_SIZEX;x = 0.09;y = 0.28;sizeEx =0.028;w = 0.06; h = 0.028;};
  class markerSizeY : markerSizeX {idc = MARKER_SIZEY;x = 0.16;};
  class markersColor2 : markerSizeX {idc = MARKER_COLOR2;x = 0.28;};
  class markerShape : markersColor {idc = MARKER_SHAPE;x = 0.07;y = 0.23;};
  class markerBrush : markerShape {idc = MARKER_BRUSH;x = 0.24;};
  class markerType : markerShape {idc = MARKER_TYPE;x = 0.24;y = 0.08;};
 
//-------------------------------------------Titels-------------------------------------------
//Zones
  class Zone_NumberTitle : RscText {idc = -1;style = ST_LEFT;colorBackground[] = { 1, 1, 1, 0 };colorText[] = { 1, 1, 1, 1 };x = 0.35; y = 0.65 - 0.015;	w = 0.22; h = 0.05;	sizeEx = 0.03;text = "Zone:";};
  class Zone_xTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05;text = "Size X:";};
  class Zone_yTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05 + 0.05;text = "Size Y:";};
  class factionTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.55;text = "Faction:";};
//Briefings
  class briefings : Zone_NumberTitle {x = 0.45-0.1;y = 0.03;colorText[] = {0,0,1,1};text = "Briefings Generator:";};
//Tasks
  class createTasks : Zone_NumberTitle {x = 0.45-0.1;y = 0.26;colorText[] = {0,0,1,1};text = "Tasks Generator:";};
  class createTasksName : Zone_NumberTitle {x = 0.45-0.1;y = 0.30;text = "Name:";};
  class createTasksDescription : createTasksName {x = 0.65-0.1;text = "Description:";};
//Markers
  class markers : briefings {x = 0;text = "Markers Generator:";};
  class markersColorTitle : markers {y = 0.08-0.01;colorText[] = { 1, 1, 1, 1 };text = "Color:";};
  class markersTypeTitle : markersColorTitle {x = 0.18;y = 0.08-0.01;text = "Type:";};
  class markersSizeTitle : markersColorTitle {y = 0.28-0.01;text = "SizeX/Y:";};
  class markersShapeTitle : markersColorTitle {y = 0.23-0.01;text = "Shape:";};
  class markersBrushTitle : markersColorTitle {x = 0.18;y = 0.23-0.01;text = "Brush:";};
  class markersTextTitle : markersColorTitle {y = 0.13-0.01;text = "Text:";};
  class markersColor2Title : markersColorTitle {x = 0.22;y = 0.28-0.01;text = "Color:";};
  class brushes : markers {y = 0.19;text = "Brushes Generator:";};
  class brushesTextTitle : markersTextTitle {y = 0.33-0.01;text = "Text:";};
 	
//----------------------------------------TextBox---------------------------------------------
  class briefingsBox : RscText {idc = BRIEFINGSBOX;type = CT_EDIT;style = ST_MULTI;colorBackground[] = { 0, 0, 0, 0 };colorText[] = { 1, 1, 1, 1 };colorSelection[] = { 1, 1, 1, 1 };colorBorder[] = { 1, 1, 1, 1 };
		BorderSize = 0.01;autocomplete = false;x = 0.36; y = 0.08;w = 0.7; h = 0.15;sizeEx = 0.03;text = "";};
  class taskNameBox : briefingsBox {idc = TASKNAMEBOX;x = 0.36; y = 0.34;w = 0.2; h = 0.04;};
  class taskDescriptionBox : taskNameBox {idc = TASKDESCRIPTIONBOX;x = 0.565; y = 0.34;w = 0.38; h = 0.09;};
//Markers
  class markersText : taskNameBox {idc = MARKERSTEXT;x = 0.07; y = 0.12;};
  class markersText2 : markersText {idc = MARKERSTEXT2;x = 0.07; y = 0.33;};
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
//Briefings Buttons
  class diarySituation : RscButton {idc = -1;x = 0.37;y = 0.23;colorText[] = {1,1,1,1};text = "Briefing";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\pop_menu\briefing.sqf';} else {player globalchat 'Access Denied'};";};
  class diaryEnemyForces : diarySituation {x = 0.37+0.11;colorText[] = {1,0,0,1};text = "Enemy Force";action = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\pop_menu\briefing.sqf';} else {player globalchat 'Access Denied'};";};
  class diaryFriendlyForces : diarySituation {x = 0.38+0.22;colorText[] = {0,0,1,1};text = "Friendly Force";action = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\pop_menu\briefing.sqf';} else {player globalchat 'Access Denied'};";};
  class diaryMission : diarySituation {x = 0.38+0.33;colorText[] = {1,1,1,1};text = "Mission";action = "if (mcc_missionmaker == (name player)) then {nul=[3] execVM 'mcc\pop_menu\briefing.sqf';} else {player globalchat 'Access Denied'};";};
  class diarySpecialTasks : diarySituation {x = 0.38+0.44;colorText[] = {1,1,1,1};text = "Special Tasks";action = "if (mcc_missionmaker == (name player)) then {nul=[4] execVM 'mcc\pop_menu\briefing.sqf';} else {player globalchat 'Access Denied'};";};
  class diaryFireSupport : diarySituation {x = 0.38+0.55;colorText[] = {1,1,1,1};text = "Support";action = "if (mcc_missionmaker == (name player)) then {nul=[5] execVM 'mcc\pop_menu\briefing.sqf';} else {player globalchat 'Access Denied'};";};
//Tasks Buttons
  class TaskCreate : diarySituation {x = 0.95;y = 0.34;h = 0.09;text = "Create";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\pop_menu\tasks_req.sqf';} else {player globalchat 'Access Denied'};";};
  class TaskWP : RscButton {idc = -1;x = 0.35;y = 0.43;colorText[] = {1,1,1,1};text = "WP";action = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\pop_menu\tasks_req.sqf';} else {player globalchat 'Access Denied'};";};
  class TaskSucceeded : RscButton {idc = -1;x = 0.45;y = 0.43;colorText[] = {0,1,0,1};text = "Succeeded";action = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\pop_menu\tasks_req.sqf';} else {player globalchat 'Access Denied'};";};
  class TaskFailed : RscButton {idc = -1;x = 0.35;y = 0.46;colorText[] = {1,0,0,1};text = "Failed";action = "if (mcc_missionmaker == (name player)) then {nul=[3] execVM 'mcc\pop_menu\tasks_req.sqf';} else {player globalchat 'Access Denied'};";};
  class TaskCanceled : RscButton {idc = -1;x = 0.45;y = 0.46;colorText[] = {1,1,1,1};text = "Canceled";action = "if (mcc_missionmaker == (name player)) then {nul=[4] execVM 'mcc\pop_menu\tasks_req.sqf';} else {player globalchat 'Access Denied'};";};
  //Markers Buttons
  class markerCreate : RscButton {idc = -1;x = 0.28;y = 0.12;w = 0.06;colorText[] = {1,1,1,1};text = "Create";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\pop_menu\markers_req.sqf';} else {player globalchat 'Access Denied'};";};
  class markerDelete : RscButton {idc = -1;x = 0.28;y = 0.16;w = 0.06;colorText[] = {1,1,1,1};text = "Delete";action = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\pop_menu\markers_req.sqf';} else {player globalchat 'Access Denied'};";};
  class brushesCreate : RscButton {idc = -1;x = 0.28;y = 0.33;w = 0.06;colorText[] = {1,1,1,1};text = "Create";action = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\pop_menu\markers_req.sqf';} else {player globalchat 'Access Denied'};";};
  class brushesDelete : RscButton {idc = -1;x = 0.28;y = 0.37;w = 0.06;colorText[] = {1,1,1,1};text = "Delete";action = "if (mcc_missionmaker == (name player)) then {nul=[3] execVM 'mcc\pop_menu\markers_req.sqf';} else {player globalchat 'Access Denied'};";};
   };
