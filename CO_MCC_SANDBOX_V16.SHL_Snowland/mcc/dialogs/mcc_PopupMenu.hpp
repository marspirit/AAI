	// Redone By: Shay_gman
	// Version: 1.1 (August 2010)
	//-----------------------------------------------------------------------------
	// IDD's & IDC's
	//-----------------------------------------------------------------------------
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

	#define MCC_MM 2980
	#define MCC_CFPS 2981
	#define MCC_SFPS 2982
	
	#define GROUP_TYPE 3005
	#define GROUP_CLASS 3006
	#define GROUP_SPAWN_B 3007

	#define UNIT_TYPE 3010
	#define UNIT_CLASS 3011
	#define UNIT_SPAWN_B 3012
	
	#define SETTING_EMPTY 3020
	#define SETTING_BEHAVIOR 3021
	#define SETTING_AWERNESS 3022
	#define SETTING_TRACK 3023

	#define START_WEST 3200
	#define START_EAST 3201
	#define START_GUE 3202
	#define DISABLE_RESPAWN 3203

	#define SET_MONTH 3250
	#define SET_HOUR 3251
	#define SET_DAY 3252
	#define SET_MINUTE 3253
	#define SET_WEATHER 3254
	#define SET_FOG 3255

	#define SUPPORT_PARATROOPS 5501

	#define SET_GRASS 3260
	#define SET_VIEW 3261

	//-----------------------------------------------------------------------------
	// Personalisation - Custom modifications to the standard control classes
	//-----------------------------------------------------------------------------

	//-----------------------------------------------------------------------------
	// Main dialog
	//-----------------------------------------------------------------------------
	class MCC_Sandbox {
	  idd = MCC_SANDBOX_IDD;
	  movingEnable = true;
	  onLoad = "[] execVM 'mcc\dialogs\mcc_Pop_init.sqf'";
	  
	  controlsBackground[] = 
	  {
		MCC_Bckgrnd,		//mcc background
		MCC_layout,
		MCC_layoutbckgrnd,
		MCC_mapBackground,	//map background
		MCC_SpawnSettingsBckgrnd,	//Spawn Setting background
		MCC_logo,			//mcc logo
		CSBackground,
		startLocationFrame,
		groupFrame,
		unitFrame,
		objectFrame,
		factionFrame,
		toolsFrame,
		toolsBackground,
		zonesFrame,
		environmentFrame,
		RTEFrame,
		CSFrame,
		logoFrame,
		timeFrame,
		boxFrame,
		infoFrame
	  };
	  

	  //---------------------------------------------
	  objects[] = 
	  { 
	  };
	  
	  controls[] = 
	  {
		MCC_map,		//Map dialog
		MCC_Title,
		MCC_MM,
		
		Zone_Number,	//Zones
		Zone_NumberTitle,
		Zone_x,
		Zone_xTitle,
		Zone_y,
		Zone_yTitle,
		Zone_set,
		zoneTitle,
		faction,
		factionTitle,
		Update_Faction,
		
		Close_dialog,	//butonns
		Refresh_dialog,
		Ghost_on,
		teleport,
		spectator,
		Start_west,
		Start_east,
		Start_guer,
		Start_HALO,
		Disable_Respawn,
		Login,
		Logout,
		Safe,
		Load,
		Extras,
		Extras1,
		Extras2,
		Extras3,
		trigger_capturing,
			
		GroupTitle, //groups
		group_type,
		GroupTypeTitle,
		group_Class,
		GroupClassTitle,
		GroupSpawn,
				
		UnitTitle,	//units
		unit_type,	
		UnitTypeTitle,
		unit_Class,
		UnitClassTitle,
		UnitSpawn,
		UnitSpawn3d,
		
		setting_Empty, //Spawn setting
		setting_Behavior,
		setting_Awerness,
		SpawnTitle,
		EmptyTitle,
		BehaviorTitle,
		AwerenessTitle,
		setting_Track,
		TrackTitle,
		startLocations,
		
		set_month,	//mission settings
		set_day,
		set_hour,
		set_minute,
		set_weather,
		monthTitle,
		dayTitle,
		hourTitle,
		minuteTitle,
		weatherTitle,
		set_time,
		set_weat,
		fogTitle,
		set_fog,
		fogButton,
			
		Start_RTEp,	//RTE
		Start_RTE,
		
		set_grass, 	//CS settings
		set_view,
		click_grass,
		click_view,
		grassTitle,
		viewTitle,
		CSTitle,
		boxGen,
		
		infoTitle,	//Info
		clientFPSTitle,
		serverFPSTitle
	  };
	 //========================================= Background========================================
	 class MCC_Title : RscText {x = 0.00; y = 0.01;w = 3; colorBackground[] = { 1, 1, 1, 0 };text = "MCC Sandbox V1.5.8 redone by Shay_gman";};
	 class MCC_layout : RscPicture {idc = -1; moving = true; x = -0.16; y = -0.2; w = 1.4; h = 1.4; text = "\ca\ui\data\ui_gps_ca.paa";};
	 class MCC_layoutbckgrnd : RscText {idc = -1; moving = true; colorBackground[] = { 0, 0, 0, 1}; x = 0.002; y = 0.04; w = 1.075; h = 0.8; text = "";};
	 class MCC_Bckgrnd : RscPicture {idc = -1; moving = true; x = 0.0; y = 0.0; w = 1.5; h = 1.5; text = "\ca\ui\data\igui_background_diary_ca.paa";};
	 class MCC_logo : RscPicture {idc = -1; moving = true; x = 0.005; y = 0.042; w = 0.343; h = 0.36; text = "mcc\pop_menu\mcc1.paa";};
	 class MCC_mapBackground : RscText {idc = -1; moving = true; colorBackground[] = { 1, 1, 1, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44;	w = 0.52; h = 0.4; text = "";};
	 class MCC_SpawnSettingsBckgrnd : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.71; y = 0.31;w = 0.36; h = 0.13;text = "";};
	 class startLocationFrame : RscFrame {moving = true; x = 0.35; y = 0.44;w = 0.7; h = 0.4;};
	 class groupFrame : RscFrame {moving = true; x = 0.35; y = 0.11;w = 0.725; h = 0.1;};
	 class unitFrame : groupFrame {moving = true;y = 0.21;};
	 class objectFrame : groupFrame {moving = true;y = 0.31;w = 0.725; h = 0.13;};
	 class factionFrame : groupFrame {moving = true; x = 0.35; y = 0.04;w = 0.725; h = 0.07;};
	 class toolsFrame : groupFrame {moving = true; x = 0.675; y = 0.04;w = 0.4; h = 0.07;};
	 class toolsBackground : MCC_SpawnSettingsBckgrnd {moving = true; x = 0.675; y = 0.041;w = 0.4; h = 0.067;};
	 class zonesFrame : groupFrame {moving = true; x = 0.35; y = 0.61;w = 0.21; h = 0.23;};
	 class environmentFrame : groupFrame {moving = true; x = 0.005; y = 0.68;w = 0.345; h = 0.16;};
	 class RTEFrame : groupFrame {moving = true; x = 0.005; y = 0.61;w = 0.345; h = 0.07;}; 
	 class CSFrame : startLocationFrame {moving = true; x = 0.005; y = 0.44;w = 0.345; h = 0.4;};
	 class CSBackground : MCC_SpawnSettingsBckgrnd {moving = true; x = 0.005; y = 0.44;w = 0.345; h = 0.4;};
	 class logoFrame : RscFrame {moving = true; x = 0.005; y = 0.04;w = 0.343; h = 0.36;};
	 class timeFrame : environmentFrame {y = 0.68; h = 0.07;};
	 class boxFrame : groupFrame {x = 0.89; h = 0.2; w = 0.185;};
	 class infoFrame : boxFrame {x = 0.35;y = 0.31;h = 0.13;w = 0.32;};
	 
	  //========================================= Controls========================================
	  
	  //mapDialog
	  class MCC_map : RscMapControl {idc = -1; moving = true; colorBackground[] = { 0, 0, 0, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44; w = 0.52; h = 0.4;text = "";onMouseButtonDown = "[_this] execVM 'mcc\mouseDown.sqf'";onMouseButtonUp = "[_this] execVM 'mcc\mouseUp.sqf'";};
	  
	  //-------------------------------------------ComboBox-------------------------------------------
	  //zones
	  class Zone_Number : RscComboBox {	idc = MCC_ZONE_NUMBERS;	style = ST_LEFT;colorText[] = { 1, 1, 1, 1 };colorSelect[] = { 1.0, 0.35, 0.3, 1 };	colorBackground[] = { 0, 0, 0, 0.6 };
										colorSelectBackground[] = { 0, 0, 0, 1 };font = "BitStream";sizeEx =0.028;	x = 0.42; y = 0.65;w = 0.06; h = 0.028;onLBSelChanged = "[0,1] execVM 'mcc\pop_menu\zones.sqf'";};
	  class Zone_x : Zone_Number {idc = MCC_ZONE_X;y = 0.65 + 0.05;};
	  class Zone_y : Zone_Number {idc = MCC_ZONE_Y;y = 0.65 + 0.05 + 0.05;};

	  class faction : Zone_x {idc = MCC_FACTION;x = 0.45;y = 0.05;sizeEx = 0.028;w = 0.10; h = 0.028;};
	  
	 //spawn groups
		class group_type : Zone_x {idc = GROUP_TYPE;x = 0.45;y = 0.15;sizeEx = 0.028;w = 0.10; h = 0.028;onLBSelChanged = "[0] execVM 'mcc\pop_menu\group_change.sqf'";};
		class group_Class : Zone_x {idc = GROUP_CLASS;x = 0.45+0.11;y = 0.15;sizeEx = 0.028;w = 0.20; h = 0.028;};

	 //spawn units
		class unit_type : Zone_Number {idc = UNIT_TYPE;x = 0.45;y = 0.25;sizeEx = 0.028;w = 0.10; h = 0.028;onLBSelChanged = "[1] execVM 'mcc\pop_menu\group_change.sqf'";};
		class unit_Class : Zone_x {idc = UNIT_CLASS;x = 0.45+0.11;y = 0.25;sizeEx = 0.028;w = 0.20; h = 0.028;};
		
	//Spawn setting
		class setting_Empty : Zone_Number {idc = SETTING_EMPTY;x = 0.45+0.27;y = 0.4;sizeEx = 0.028;w = 0.07; h = 0.028;};
		class setting_Behavior : setting_Empty {idc = SETTING_BEHAVIOR;x = 0.45+0.36;};
		class setting_Awerness : setting_Empty {idc = SETTING_AWERNESS;x = 0.45+0.45;};
		class setting_Track : setting_Empty {idc = SETTING_TRACK;x = 0.45+0.54;};
		
	//mission settings
		class set_month : setting_Empty {idc = SET_MONTH;x = 0.01;y = 0.8;};
		class set_day : set_month {idc = SET_DAY;x = 0.09;};
		class set_hour : set_month {idc = SET_HOUR;x = 0.17;};
		class set_minute : set_month {idc = SET_MINUTE;x = 0.25;};
		class set_weather : set_month {idc = SET_WEATHER;x = 0.09;y = 0.7;};
		class set_fog : set_month {idc = SET_FOG;x = 0.25;y = 0.7;w = 0.05;};
	//CS settings
		class set_grass : set_month {idc = SET_GRASS;x = 0.15;y = 0.5;};
		class set_view : set_grass {idc = SET_VIEW;x = 0.15;y = 0.55;};
		
	  //-------------------------------------------Titels-------------------------------------------
	//Zones
	  class Zone_NumberTitle : RscText {idc = -1;style = ST_LEFT;colorBackground[] = { 1, 1, 1, 0 };colorText[] = { 1, 1, 1, 1 };x = 0.35; y = 0.65 - 0.015;	w = 0.22; h = 0.05;	sizeEx = 0.03;text = "Zone:";};
	  class Zone_xTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05;text = "Size X:";};
	  class Zone_yTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05 + 0.05;text = "Size Y:";};
	  class factionTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.05;colorText[] = {0,1,1,1};text = "Faction:";};
	  
	//Groups
		class GroupTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.13;colorText[] = {0,1,1,1};text = "Group:";};
			class GroupTypeTitle : Zone_NumberTitle {x = 0.45;y = 0.1;text = "Type:";};
			class GroupClassTitle : Zone_NumberTitle {x = 0.45+0.11;y = 0.1;text = "Class:";};
			class GroupSpawn : RscGUIShortcutButton {idc = GROUP_SPAWN_B;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.77; y = 0.15;w = 0.1;h = 0.06;size = 0.03;sizeEx = 0.04;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {[0,false] execVM 'mcc\pop_menu\spawn_group.sqf'} else {player globalchat 'Access Denied'};";};
			class boxGen : RscGUIShortcutButton {idc=-1; x=0.9; y=0.15; w=0.12; h=0.06; size=0.025; sizeEx=0.023; text="Box Gen."; onButtonClick = "if (mcc_missionmaker == (name player)) then {createDialog 'boxGen';} else {player globalchat 'Access Denied'};";};
			
	//Units
		class UnitTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.23;colorText[] = {0,1,1,1};text = "Unit:";};
			class UnitTypeTitle : Zone_NumberTitle {x = 0.45;y = 0.2;text = "Type:";};
			class UnitSpawn : GroupSpawn {idc = UNIT_SPAWN_B;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.77;y = 0.23;w = 0.1; h = 0.06;size = 0.03;sizeEx = 0.04;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {[1,false] execVM 'mcc\pop_menu\spawn_group.sqf'} else {player globalchat 'Access Denied'};";};
			class UnitSpawn3d : GroupSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.9;y = 0.22;w = 0.12; h = 0.08;size = 0.03;sizeEx = 0.04;text = "3D Editor";onButtonClick = "if (mcc_missionmaker == (name player)) then {[0] execVM 'mcc\pop_menu\spawn_group3d.sqf'} else {player globalchat 'Access Denied'};";};
			class UnitClassTitle : Zone_NumberTitle {x = 0.45+0.11;y = 0.2;text = "Class:";};

	//Spawn Settings
		class SpawnTitle : Zone_NumberTitle {x = 0.45+0.35;y = 0.32;colorText[] = { 0.253906,0.410156,0.878906, 1 };text = "Spawn Setting:";};
			class EmptyTitle : Zone_NumberTitle {x = 0.45+0.26;y = 0.36;text = "Empty:";};
			class BehaviorTitle : EmptyTitle {x = 0.45+0.34;text = "Behavior:";};
			class AwerenessTitle : EmptyTitle {x = 0.45+0.42;text = "Awereness:";};
			class TrackTitle : EmptyTitle {x = 0.45+0.53;text = "Track:";};
			
	//Start Location
		class startLocations : Zone_NumberTitle {x = 0.37;y = 0.45;colorText[] = {0,1,1};text = "Start Locations:";};
		class zoneTitle : Zone_NumberTitle {x = 0.39;y = 0.6;colorText[] = {0,1,1};text = "Zones:";};
		
	//Environment Settings
		class monthTitle : zoneTitle {idc =-1;x = 0;y = 0.75-0.01;colorText[] = { 1,1,1, 1 };text = "Month:";};
		class dayTitle : monthTitle {x = 0.08;text = "Day:";};
		class hourTitle : monthTitle {x = 0.14;text = "Hour:";};
		class minuteTitle : monthTitle {x = 0.21;text = "Min:";};
		class weatherTitle : monthTitle {idc = -1;x = 0;y = 0.7-0.01;colorText[] = {0,1,1};text = "Weather:";};
		class grassTitle : monthTitle {y = 0.5-0.01;text = "Grass Density:";};
		class fogTitle : monthTitle {x = 0.21;y = 0.69;text = "Fog:";};
		
	//Client Side Settings
		class viewTitle : monthTitle {y = 0.55-0.01;text = "View Distance:";};
		class CSTitle : startLocations {x = 0;colorText[] = {0,1,1};text = "Client Side Settings:";};
	
	//Info
		class infoTitle : Zone_NumberTitle {x = 0.35;y = 0.3;colorText[] = {0,1,1};text = "General Info:";};
		class MCC_MM : RscText {idc = MCC_MM;x = 0.36;y = 0.34;w = 0.33; colorBackground[] = { 1, 1, 1, 0 };};
		class clientFPSTitle : Zone_NumberTitle {idc = MCC_CFPS;x = 0.36;y = 0.36;text = "Client FPS:";};
		class serverFPSTitle : Zone_NumberTitle {idc = MCC_SFPS;x = 0.36;y = 0.39;text = "Server FPS:";};
		
	//-------------------------------------------Buttons-------------------------------------------
	//Zones
	  class Zone_set : RscGUIShortcutButton {idc = ZONE_B;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.35; y = 0.8;	text = "Update Zone";onButtonClick = "[1,1] execVM 'mcc\pop_menu\zones.sqf'";};

	//Bottom Buttons
	class Update_Faction : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.56; y = 0.05;w = 0.105825; h = 0.0422876;size = 0.02821;sizeEx = 0.02821;text = "Update";onButtonClick = "mcc_screen=0;[] execVM 'mcc\pop_menu\faction.sqf'";};   

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
	  
	//Magic
	  class Ghost_on : RscButton {idc = -1;x = 0.7 ;y = 0.05;w = 0.1;colorText[] = {1,1,1,1};text = "Ghost Mode";onButtonClick = "if (mcc_missionmaker == (name player)) then{if (captive player) then {player setcaptive false; [-2, {hint 'Mission maker is no longer cheating'}] call CBA_fnc_globalExecute;} else {player setcaptive true; [-2, {hint 'Mission maker is cheating'}] call CBA_fnc_globalExecute;}} else {player globalchat 'Access Denied'};";};
	  class teleport : RscButton {idc = -1;x = 0.82;y = 0.05;w = 0.1;colorText[] = {1,1,1,1};text = "Teleport";onButtonClick = "if (mcc_missionmaker == (name player)) then {hint 'Click on the map';onMapSingleClick 'vehicle player setPos _pos; onMapSingleClick '''';true;'} else {player globalchat 'Access Denied'};";};
	  class spectator : RscButton {idc = -1;x = 0.94;y = 0.05;w = 0.1;colorText[] = {1,1,1,1};text = "Spectator";onButtonClick = "if (mcc_missionmaker == (name player)) then {ace_sys_spectator_can_exit_spectator = true;[] call ace_fnc_startSpectator;} else {player globalchat 'Access Denied'};";};
	  
	//Start Locations
	  class Start_west : RscButton {idc = START_WEST;x = 0.35;y = 0.5;colorText[] = {0,0,1,1};text = "Start West";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\mcc_start_location.sqf';} else {player globalchat 'Access Denied'};";};
	  class Start_east : Start_west {idc = START_EAST;x = 0.35+0.1;y = 0.5;colorText[] = {1,0,0,1};text = "Start East";action = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\mcc_start_location.sqf';} else {player globalchat 'Access Denied'};";};
	  class Start_guer : Start_west {idc = START_GUE;x = 0.35;y = 0.5+0.03;colorText[] = {0,1,0,1};text = "Start Guer";action = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\mcc_start_location.sqf';} else {player globalchat 'Access Denied'};";};
	  class Start_HALO : Start_west {idc = -1 ;x = 0.35+0.1;y = 0.5+0.03;colorText[] = {1,1,1,1};text = "SF HALO";action = "nul=[3] execVM 'mcc\general_scripts\paradrop\sf_droppoint.sqf';";};
	  class Disable_Respawn : Start_west {idc = DISABLE_RESPAWN;x = 0.37;y = 0.5+0.07;w = 0.15;colorText[] = {1,1,0,1};text = "Disable Respawn";action = "if (mcc_missionmaker == (name player)) then { MCC_TRAINING = FALSE;publicVariable ""MCC_TRAINING"";hint ""Mission started, respawn is off"";ctrlEnable [DISABLE_RESPAWN,false];enable_respawn=false;closeDialog 0;[] execVM 'mcc\dialogs\mcc_PopupMenu.sqf'} else {player globalchat 'Access Denied'};";};
		
	//Enviormet Settings
	  class set_time : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0+ 0.28; y =0.75 ;w = 0.07; h = 0.0422876;size = 0.02;sizeEx = 0.02821;text = "set";onButtonClick = "if (mcc_missionmaker == (name player)) then {[1] execVM 'mcc\Pop_menu\mission_settings.sqf'} else {player globalchat 'Access Denied'};";};
	  class set_weat : set_time {x = 0+ 0.16; y =0.7 ;w = 0.05; h = 0.0422876;size = 0.02;sizeEx = 0.02821;text = "set";onButtonClick = "if (mcc_missionmaker == (name player)) then {[2] execVM 'mcc\Pop_menu\mission_settings.sqf'} else {player globalchat 'Access Denied'};";};
	  class fogButton : set_weat {x = 0.3;onButtonClick = "if (mcc_missionmaker == (name player)) then {[0] execVM 'mcc\Pop_menu\mission_settings.sqf'} else {player globalchat 'Access Denied'};";};
	  
	//RTE 
	  class Start_RTEp : Start_HALO {x = 0.04;y =0.63;text = "RTE @ Player";action = "nul=[3] execVM 'mcc\general_scripts\RTE\rte.sqf';";};
	  class Start_RTE  : Start_HALO {x = 0.04+0.12;y =0.63;text = "RTE MapClick";action = "nul=[3] execVM 'mcc\general_scripts\RTE\rte_p.sqf';";};
	  	  
	//Client Side Settings
	  class click_grass : set_time { y =0.5; x = 0.24;onButtonClick = "[3] execVM 'mcc\Pop_menu\mission_settings.sqf'";}; 
	  class click_view : set_time { y =0.55; x = 0.24;onButtonClick = "[4] execVM 'mcc\Pop_menu\mission_settings.sqf'";}; 
	  
	};
