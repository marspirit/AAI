// Redone By: Shay_gman
// Version: 1.1 (August 2010)
// Desc: A popup menu dialog
// By: Dr Eyeball
// Version: 1.1 (May 2007)
//-----------------------------------------------------------------------------
// PUM3_ is the unique prefix associated with all unique classes for this dialog.

//-----------------------------------------------------------------------------
// IDD's & IDC's
//-----------------------------------------------------------------------------


#define PUM3_IDD_PopupMenuDialog 390

#define PUM3_IDC_Caption0 892
#define PUM3_IDC_Caption1 893
#define PUM3_IDC_Caption2 894

#define PUM3_IDC_Button000 870
#define PUM3_IDC_Button001 871
#define PUM3_IDC_Button002 872
#define PUM3_IDC_Button003 873
#define PUM3_IDC_Button004 874
#define PUM3_IDC_Button005 875
#define PUM3_IDC_Button006 876
#define PUM3_IDC_Button007 877
#define PUM3_IDC_Button008 878
#define PUM3_IDC_Button009 879
#define PUM3_IDC_Button010 880
#define PUM3_IDC_Button011 881
#define PUM3_IDC_Button012 882
#define PUM3_IDC_Button013 883
#define PUM3_IDC_Button014 884
#define PUM3_IDC_Button015 885
#define PUM3_IDC_Button016 886
#define PUM3_IDC_Button017 887
#define PUM3_IDC_Button018 888
#define PUM3_IDC_Button019 889

#define PUM3_IDC_Button100 1870
#define PUM3_IDC_Button101 1871
#define PUM3_IDC_Button102 1872
#define PUM3_IDC_Button103 1873
#define PUM3_IDC_Button104 1874
#define PUM3_IDC_Button105 1875
#define PUM3_IDC_Button106 1876
#define PUM3_IDC_Button107 1877
#define PUM3_IDC_Button108 1878
#define PUM3_IDC_Button109 1879
#define PUM3_IDC_Button110 1880
#define PUM3_IDC_Button111 1881
#define PUM3_IDC_Button112 1882
#define PUM3_IDC_Button113 1883
#define PUM3_IDC_Button114 1884
#define PUM3_IDC_Button115 1885
#define PUM3_IDC_Button116 1886
#define PUM3_IDC_Button117 1887
#define PUM3_IDC_Button118 1888
#define PUM3_IDC_Button119 1889

#define PUM3_IDC_Button200 2870
#define PUM3_IDC_Button201 2871
#define PUM3_IDC_Button202 2872
#define PUM3_IDC_Button203 2873
#define PUM3_IDC_Button204 2874
#define PUM3_IDC_Button205 2875
#define PUM3_IDC_Button206 2876
#define PUM3_IDC_Button207 2877
#define PUM3_IDC_Button208 2878
#define PUM3_IDC_Button209 2879
#define PUM3_IDC_Button210 2880
#define PUM3_IDC_Button211 2881
#define PUM3_IDC_Button212 2882
#define PUM3_IDC_Button213 2883
#define PUM3_IDC_Button214 2884
#define PUM3_IDC_Button215 2885
#define PUM3_IDC_Button216 2886
#define PUM3_IDC_Button217 2887
#define PUM3_IDC_Button218 2888
#define PUM3_IDC_Button219 2889

#define PUM3_IDD_PopupMenuDialog 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003
#define GROUP_INF 3005
#define GROUP_MOTO 3006
#define GROUP_MECH 3007
#define GROUP_ARMOR 3008
#define GROUP_AIR 3009

#define UNIT_INF 3010
#define UNIT_CAR 3011
#define UNIT_TANK 3012
#define UNIT_MOTOR 3013
#define UNIT_HELI 3014
#define UNIT_AIR 3015
#define UNIT_SHIP 3016
#define UNIT_DOC 3017
#define UNIT_AMMO 3018
#define UNIT_AAMMO 3019

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
#define PUM3_dlg_x 0.005
#define PUM3_dlg_y 0.39
#define PUM3_dlg_wid 0.34
#define PUM3_dlg_hgt 0.9

//-----------------------------------------------------------------------------
// Personalisation - Custom modifications to the standard control classes
//-----------------------------------------------------------------------------

class PUM3_Caption: Dlg_Caption
{
  y = PUM3_dlg_y;
  w = PUM3_dlg_wid;
  text = "Popup Menu";
};

class PUM3_MenuItem: RscButton
{
  style = ST_LEFT;

  sizeEx = Dlg_TEXTHGT * PUM3_dlg_hgt;
  //size = Dlg_TEXTHGT;
  font = "Zeppelin32";
  //colorDisabled[] = {Dlg_Color_Gray_7, 0.7};
  colorBackgroundDisabled[] = {Dlg_ColorScheme_3DControlBackground,1};

  x = PUM3_dlg_x;
  y = PUM3_dlg_y;
  w = PUM3_dlg_wid;
  h = Dlg_TEXTHGT * PUM3_dlg_hgt;

  text = "";
  action = "";
};
class PUM3_MenuItem0: PUM3_MenuItem
{
  x = PUM3_dlg_x;
};
class PUM3_MenuItem1: PUM3_MenuItem
{
  x = PUM3_dlg_x + (PUM3_dlg_wid * 1);
};
class PUM3_MenuItem2: PUM3_MenuItem
{
  x = PUM3_dlg_x + (PUM3_dlg_wid * 2);
};

//-----------------------------------------------------------------------------
// Main dialog
//-----------------------------------------------------------------------------
class PUM3_PopupMenuDialog {
  idd = PUM3_IDD_PopupMenuDialog;
  movingEnable = true;
  onLoad = "[] execVM 'mcc\dialogs\mcc_Pop_init.sqf'";
  
  controlsBackground[] = 
  {
	MCC_Bckgrnd,		//mcc background
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
	timeFrame
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
	zoneTitle,
	faction,
	factionTitle,
	Update_Faction,
	
	Close_dialog,	//butonns
	Refresh_dialog,
	Ghost_on,
	teleport,
	Start_west,
	Start_east,
	Start_guer,
	Start_HALO,
	Disable_Respawn,
	Logout,
	Safe,
	Load,
		
	GroupTitle, //groups
	group_infantry,
	GroupInfTitle,
	group_Motorized,
	GroupMotoTitle,
	group_Mechanized,
	GroupMechTitle,
	group_Armored,
	GroupArmorTitle,
	group_Air,
	GroupAirTitle,
	GroupInfSpawn,
	GroupMotoSpawn,
	GroupMechSpawn,
	GroupArmorSpawn,
	GroupAirSpawn,
	
	unit_Infantry, //units
	unit_Car,
	unit_Tank,
	unit_Motor,
	unit_Heli,
	unit_Air,
	unit_Ship, 
	UnitTitle,
	UnitInfTitle,
	UnitInfSpawn,
	UnitCarTitle,
	UnitCarSpawn,
	UnitTankTitle,
	UnitTankSpawn,
	UnitMotorTitle,
	UnitMotorSpawn,
	UnitHeliTitle,
	UnitHeliSpawn,
	UnitAirTitle,
	UnitAirSpawn,
	UnitShipTitle,
	UnitShipSpawn,
	
	objectTitle,	//objects
	unit_Doc,
	unit_Ammo,
	unit_aceAmmo,
	UnitDocTitle,
	UnitDocSpawn,
	UnitAmmoTitle,
	UnitAmmoSpawn,
	UnitAceAmmoTitle,
	UnitAceAmmoSpawn,
	paratroops,
	paratroopsTitle,
	paratroopsSpawn,
	
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
	Save_RTE,
	
	set_grass, 	//CS settings
	set_view,
	click_grass,
	click_view,
	grassTitle,
	viewTitle,
	CSTitle,
				
    PUM3_Caption0,
    PUM3_Caption1,
    PUM3_Caption2,
	
    PUM3_MenuItem000,
    PUM3_MenuItem001,
    PUM3_MenuItem002,
    PUM3_MenuItem003,
    PUM3_MenuItem004,
    PUM3_MenuItem005,
    PUM3_MenuItem006,
    PUM3_MenuItem007,
    PUM3_MenuItem008,
    PUM3_MenuItem009,
    PUM3_MenuItem010,
    PUM3_MenuItem011,
    PUM3_MenuItem012,
    PUM3_MenuItem013,
    PUM3_MenuItem014,
    PUM3_MenuItem015,
    PUM3_MenuItem016,
    PUM3_MenuItem017,
    PUM3_MenuItem018,
    PUM3_MenuItem019,
    
    PUM3_MenuItem100,
    PUM3_MenuItem101,
    PUM3_MenuItem102,
    PUM3_MenuItem103,
    PUM3_MenuItem104,
    PUM3_MenuItem105,
    PUM3_MenuItem106,
    PUM3_MenuItem107,
    PUM3_MenuItem108,
    PUM3_MenuItem109,
    PUM3_MenuItem110,
    PUM3_MenuItem111,
    PUM3_MenuItem112,
    PUM3_MenuItem113,
    PUM3_MenuItem114,
    PUM3_MenuItem115,
    PUM3_MenuItem116,
    PUM3_MenuItem117,
    PUM3_MenuItem118,
    PUM3_MenuItem119,
    
    PUM3_MenuItem200,
    PUM3_MenuItem201,
    PUM3_MenuItem202,
    PUM3_MenuItem203,
    PUM3_MenuItem204,
    PUM3_MenuItem205,
    PUM3_MenuItem206,
    PUM3_MenuItem207,
    PUM3_MenuItem208,
    PUM3_MenuItem209,
    PUM3_MenuItem210,
    PUM3_MenuItem211,
    PUM3_MenuItem212,
    PUM3_MenuItem213,
    PUM3_MenuItem214,
    PUM3_MenuItem215,
    PUM3_MenuItem216,
    PUM3_MenuItem217,
    PUM3_MenuItem218,
    PUM3_MenuItem219
	
  };
 //========================================= Background========================================
 class MCC_Title : RscText {x = 0.02; y = 0.01;w = 3; colorBackground[] = { 1, 1, 1, 0 };text = "MCC Sandbox V1.3 redone by Shay_gman";};
 class MCC_Bckgrnd : RscPicture {idc = -1; moving = true; x = 0.0; y = 0.0; w = 1.5; h = 1.5; text = "\ca\ui\data\igui_background_diary_ca.paa";};
 class MCC_logo : RscPicture {idc = -1; moving = true; x = 0.005; y = 0.04; w = 0.343; h = 0.36; text = "mcc\pop_menu\mcc1.paa";};
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
 class environmentFrame : groupFrame {moving = true; x = 0.005; y = 0.7;w = 0.345; h = 0.14;};
 class RTEFrame : groupFrame {moving = true; x = 0.005; y = 0.61;w = 0.345; h = 0.09;}; 
 class CSFrame : startLocationFrame {moving = true; x = 0.005; y = 0.44;w = 0.345; h = 0.4;};
 class CSBackground : MCC_SpawnSettingsBckgrnd {moving = true; x = 0.005; y = 0.44;w = 0.345; h = 0.4;};
 class logoFrame : RscFrame {moving = true; x = 0.005; y = 0.04;w = 0.343; h = 0.36;};
 class timeFrame : environmentFrame {y = 0.7; h = 0.05;};
 
  //========================================= Controls========================================
  
  //mapDialog
  class MCC_map : RscMapControl {idc = -1; moving = true; colorBackground[] = { 0, 0, 0, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44; w = 0.52; h = 0.4;text = "";};
  
  //-------------------------------------------ComboBox-------------------------------------------
  //zones
  class Zone_Number : RscComboBox {	idc = MCC_ZONE_NUMBERS;	style = ST_LEFT;colorText[] = { 1, 1, 1, 1 };colorSelect[] = { 1.0, 0.35, 0.3, 1 };	colorBackground[] = { 0, 0, 0, 0.6 };
									colorSelectBackground[] = { 0, 0, 0, 1 };font = "BitStream";sizeEx =0.028;	x = 0.42; y = 0.65;w = 0.06; h = 0.028;};
  class Zone_x : Zone_Number {idc = MCC_ZONE_X;y = 0.65 + 0.05;};
  class Zone_y : Zone_Number {idc = MCC_ZONE_Y;y = 0.65 + 0.05 + 0.05;};
  class faction : Zone_Number {idc = MCC_FACTION;x = 0.45;y = 0.05;sizeEx = 0.028;w = 0.10; h = 0.028;};
  //spawn groups
	class group_Infantry : Zone_Number {idc = GROUP_INF;x = 0.45;y = 0.15;sizeEx = 0.028;w = 0.10; h = 0.028;};
	class group_Motorized : group_Infantry {idc = GROUP_MOTO;x = 0.45+0.11;y = 0.15;};
	class group_Mechanized : group_Infantry {idc = GROUP_MECH;x = 0.45+0.22;y = 0.15;};
	class group_Armored : group_Infantry {idc = GROUP_ARMOR;x = 0.45+0.33;y = 0.15;};
	class group_Air : group_Infantry {idc = GROUP_AIR;x = 0.45+0.44;y = 0.15;};
 //spawn units
	class unit_Infantry : Zone_Number {idc = UNIT_INF;x = 0.45;y = 0.25;sizeEx = 0.02;w = 0.07; h = 0.028;};
	class unit_Car : unit_Infantry {idc = UNIT_CAR;x = 0.45+0.09;};
	class unit_Tank : unit_Infantry {idc = UNIT_TANK;x = 0.45+0.18;};
	class unit_Motor : unit_Infantry {idc = UNIT_MOTOR;x = 0.45+0.27;};
	class unit_Heli : unit_Infantry {idc = UNIT_HELI;x = 0.45+0.36;};
	class unit_Air : unit_Infantry {idc = UNIT_AIR;x = 0.45+0.45;};
	class unit_Ship : unit_Infantry {idc = UNIT_SHIP;x = 0.45+0.54;};
	 class unit_Doc : unit_Infantry {idc = UNIT_DOC;x = 0.45;y = 0.35;}; //objects
	class unit_Ammo : unit_Doc {idc = UNIT_AMMO;x = 0.45+0.09;};
	class unit_aceAmmo : unit_Doc {idc = UNIT_AAMMO;x = 0.45+0.18;};
	class paratroops : unit_Doc {idc = SUPPORT_PARATROOPS;y = 0.41;}; 
	 class setting_Empty : unit_Infantry {idc = SETTING_EMPTY;x = 0.45+0.27;y = 0.4;}; //Spawn setting
	class setting_Behavior : setting_Empty {idc = SETTING_BEHAVIOR;x = 0.45+0.36;};
	class setting_Awerness : setting_Empty {idc = SETTING_AWERNESS;x = 0.45+0.45;};
	class setting_Track : setting_Empty {idc = SETTING_TRACK;x = 0.45+0.54;};
//mission settings
	class set_month : unit_Infantry {idc = SET_MONTH;x = 0.01;y = 0.8;};
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
	class GroupTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.15;colorText[] = {0,1,1,1};text = "Group:";};
		class GroupInfTitle : Zone_NumberTitle {x = 0.45;y = 0.1;text = "Infantry:";};
		class GroupInfSpawn : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45; y = 0.15+0.03;w = 0.08;h = 0.03;size = 0.02;sizeEx = 0.02;text = "Spawn";onButtonClick = "mcc_spawntype=""GROUP"";[1] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class GroupMotoTitle : Zone_NumberTitle {x = 0.45+0.11;y = 0.1;text = "Motorized:";};
		class GroupMotoSpawn : GroupInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.11;text = "Spawn";onButtonClick = "[2] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class GroupMechTitle : Zone_NumberTitle {x = 0.45+0.22;y = 0.1;text = "Mechanized:";};
		class GroupMechSpawn : GroupInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.22;text = "Spawn";onButtonClick = "[3] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class GroupArmorTitle : Zone_NumberTitle {x = 0.45+0.33;y = 0.1;text = "Armored:";};
		class GroupArmorSpawn : GroupInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.33;text = "Spawn";onButtonClick = "[4] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class GroupAirTitle : Zone_NumberTitle {x = 0.45+0.44;y = 0.1;text = "Air:";};
		class GroupAirSpawn : GroupInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.44;text = "Spawn";onButtonClick = "[5] execVM 'mcc\pop_menu\spawn_group.sqf'";};
//Units
	class UnitTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.25;colorText[] = {0,1,1,1};text = "Unit:";};
		class UnitInfTitle : Zone_NumberTitle {x = 0.45;y = 0.2;text = "Infantry:";};
		class UnitInfSpawn : GroupInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45;y = 0.25+0.03;w = 0.08; h = 0.03;size = 0.02;sizeEx = 0.02;text = "Spawn";onButtonClick = "mcc_spawntype=""MAN"";[6] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitCarTitle : Zone_NumberTitle {x = 0.45+0.09;y = 0.2;text = "Car:";};
		class UnitCarSpawn : UnitInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.09;text = "Spawn";onButtonClick = "[7] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitTankTitle : Zone_NumberTitle {x = 0.45+0.18;y = 0.2;text = "Tank:";};
		class UnitTankSpawn : UnitInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.18;text = "Spawn";onButtonClick = "[8] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitMotorTitle : Zone_NumberTitle {x = 0.45+0.27;y = 0.2;text = "Motor:";};
		class UnitMotorSpawn : UnitInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.27;text = "Spawn";onButtonClick = "[9] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitHeliTitle : Zone_NumberTitle {x = 0.45+0.36;y = 0.2;text = "Helicopter:";};
		class UnitHeliSpawn : UnitInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.36;text = "Spawn";onButtonClick = "[10] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitAirTitle : Zone_NumberTitle {x = 0.45+0.45;y = 0.2;text = "Air:";};
		class UnitAirSpawn : UnitInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.45;text = "Spawn";onButtonClick = "[11] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitShipTitle : Zone_NumberTitle {x = 0.45+0.54;y = 0.2;text = "Ship:";};
		class UnitShipSpawn : UnitInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.54;text = "Spawn";onButtonClick = "[12] execVM 'mcc\pop_menu\spawn_group.sqf'"};
//Objects
	class objectTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.35;colorText[] = {0,1,1,1};text = "Object:";};
		class UnitDocTitle : Zone_NumberTitle {x = 0.44;y = 0.3;text = "D.O.C:";};
		class UnitDocSpawn : UnitInfSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.44;y = 0.35+0.03;text = "Spawn";onButtonClick = "[13] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitAmmoTitle : UnitDocTitle {x = 0.45+0.08;text = "Ammo:";};
		class UnitAmmoSpawn : UnitDocSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.08;text = "Spawn";onButtonClick = "[14] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class UnitAceAmmoTitle : UnitDocTitle {x = 0.45+0.15;text = "Ace Ammo:";};
		class UnitAceAmmoSpawn : UnitDocSpawn {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.45+0.17;text = "Spawn";onButtonClick = "[15] execVM 'mcc\pop_menu\spawn_group.sqf'";};
		class paratroopsTitle : objectTitle {y = 0.4;colorText[] = {0,1,1,1};text = "Paratroops:";};
		class paratroopsSpawn : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.53; y = 0.41;w = 0.07;h = 0.04;size = 0.025;sizeEx = 0.028;text = "Spawn";onButtonClick = "[16] execVM 'mcc\pop_menu\spawn_group.sqf'";};
//Spawn Settings
	class SpawnTitle : Zone_NumberTitle {x = 0.45+0.35;y = 0.32;colorText[] = { 0.253906,0.410156,0.878906, 1 };text = "Spawn Setting:";};
		class EmptyTitle : Zone_NumberTitle {x = 0.45+0.26;y = 0.36;text = "Manned:";};
		class BehaviorTitle : EmptyTitle {x = 0.45+0.34;text = "Behavior:";};
		class AwerenessTitle : EmptyTitle {x = 0.45+0.42;text = "Awereness:";};
		class TrackTitle : EmptyTitle {x = 0.45+0.53;text = "Track:";};
//Start Location
	class startLocations : Zone_NumberTitle {x = 0.37;y = 0.45;colorText[] = {0,1,1};text = "Start Locations:";};
	class zoneTitle : Zone_NumberTitle {x = 0.39;y = 0.6;colorText[] = {0,1,1};text = "Zones:";};
//Enviormet Settings
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
	
//-------------------------------------------Buttons-------------------------------------------
//Zones
  class Zone_set : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.35; y = 0.8;	text = "Update Zone";onButtonClick = "[1] execVM 'mcc\pop_menu\zones.sqf'";};
  class Zone_select : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.48; y =0.65 ;w = 0.07; h = 0.0422876;size = 0.02;sizeEx = 0.02821;text = "select";onButtonClick = "[0] execVM 'mcc\pop_menu\zones.sqf'";};
//Bottom Buttons
  class Close_dialog : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.895; y = 0.84;text = "Close";onButtonClick = "closeDialog 0";};
  class Refresh_dialog : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.7; y = 0.84;text = "Refresh";onButtonClick = "closeDialog 0;[] execVM 'mcc\pop_menu\mcc_CreatePopupMenu.sqf'";};
  class Update_Faction : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.56; y = 0.05;w = 0.105825; h = 0.0422876;size = 0.02821;sizeEx = 0.02821;text = "Update";onButtonClick = "mcc_screen=0;[] execVM 'mcc\pop_menu\faction.sqf'";};
  class Logout : Close_dialog {x = 0.5;text = "Logout";onButtonClick = "mcc_resetmissionmaker=true;nul=[0] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';closeDialog 0";};
  class Safe : Close_dialog {x = 0.01;text = "Safe";onButtonClick = "copyToClipboard mcc_safe;hint 'SAVED to Clipboard! Now you can paste this code where you like to save it. Simple copy it all back in clipboard (ctrl-c) and press load to rebuild your mission.';";};
  class Load : Close_dialog {x = 0.2;text = "Load";onButtonClick = "mcc_safe = CopyFromClipboard;mcc_load='mcc_isloading=true;' + mcc_safe + 'mcc_isloading=false;';[] spawn compile mcc_load;";};
//Magic
  class Ghost_on : RscButton {x = 0.54 + 0.2;y = 0.05;w = 0.12;colorText[] = {1,1,1,1};text = "Ghost Mode";onButtonClick = "if (mcc_missionmaker == (name player)) then{if (captive player) then {player setcaptive false; [-2, {hint 'Mission maker is no longer cheating'}] call CBA_fnc_globalExecute;} else {player setcaptive true; [-2, {hint 'Mission maker is cheating'}] call CBA_fnc_globalExecute;}} else {player globalchat 'Access Denied'};";};
  class teleport : RscButton {x = 0.56 + 0.32;y = 0.05;w = 0.12;colorText[] = {1,1,1,1};text = "Teleport";onButtonClick = "if (mcc_missionmaker == (name player)) then {hint 'Click on the map';onMapSingleClick 'vehicle player setPos _pos; onMapSingleClick '''';true;'} else {player globalchat 'Access Denied'};";};
//Start Locations
  class Start_west : RscButton {idc = START_WEST;x = 0.35;y = 0.5;colorText[] = {0,0,1,1};text = "Start West";action = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\mcc_start_location.sqf';} else {player globalchat 'Access Denied'};";};
  class Start_east : Start_west {idc = START_EAST;x = 0.35+0.1;y = 0.5;colorText[] = {1,0,0,1};text = "Start East";action = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\mcc_start_location.sqf';} else {player globalchat 'Access Denied'};";};
  class Start_guer : Start_west {idc = START_GUE;x = 0.35;y = 0.5+0.03;colorText[] = {0,1,0,1};text = "Start Guer";action = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\mcc_start_location.sqf';} else {player globalchat 'Access Denied'};";};
  class Start_HALO : Start_west {idc = -1 ;x = 0.35+0.1;y = 0.5+0.03;colorText[] = {1,1,1,1};text = "SF HALO";action = "nul=[3] execVM 'mcc\general_scripts\paradrop\sf_droppoint.sqf';";};
  class Disable_Respawn : Start_west {idc = DISABLE_RESPAWN;x = 0.37;y = 0.5+0.07;w = 0.15;colorText[] = {1,1,0,1};text = "Disable Respawn";action = "if (mcc_missionmaker == (name player)) then { MCC_TRAINING = FALSE;publicVariable ""MCC_TRAINING"";hint ""Mission started, respawn is off"";ctrlEnable [DISABLE_RESPAWN,false];enable_respawn=false;closeDialog 0;[] execVM 'mcc\pop_menu\mcc_CreatePopupMenu.sqf'} else {player globalchat 'Access Denied'};";};
//Enviormet Settings
  class set_time : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0+ 0.28; y =0.75 ;w = 0.07; h = 0.0422876;size = 0.02;sizeEx = 0.02821;text = "set";onButtonClick = "if (mcc_missionmaker == (name player)) then {[1] execVM 'mcc\Pop_menu\mission_settings.sqf'} else {player globalchat 'Access Denied'};";};
  class set_weat : set_time {x = 0+ 0.16; y =0.7 ;w = 0.05; h = 0.0422876;size = 0.02;sizeEx = 0.02821;text = "set";onButtonClick = "if (mcc_missionmaker == (name player)) then {[2] execVM 'mcc\Pop_menu\mission_settings.sqf'} else {player globalchat 'Access Denied'};";};
  class fogButton : set_weat {x = 0.3;onButtonClick = "if (mcc_missionmaker == (name player)) then {[0] execVM 'mcc\Pop_menu\mission_settings.sqf'} else {player globalchat 'Access Denied'};";};
//RTE 
  class Start_RTEp : Start_HALO {x = 0.04;y =0.62;text = "RTE @ Player";action = "nul=[3] execVM 'mcc\general_scripts\RTE\rte.sqf';";};
  class Start_RTE  : Start_HALO {x = 0.04+0.12;y =0.62;text = "RTE MapClick";action = "nul=[3] execVM 'mcc\general_scripts\RTE\rte_p.sqf';";};
  class Save_RTE  : Start_HALO {x = 0.025;y =0.66;w = 0.25;text = "Save Hostage Script to clipboard";action = "hostage_safe=""_null = this addaction ['Secure Hostage','mcc\general_scripts\hostages\hostage.sqf'];removeAllWeapons this ;this switchmove 'AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon';this allowFleeing 0 ; this setcaptive true;"";copyToClipboard hostage_safe;hint 'SAVED to Clipboard! Now you can paste this code to the init of the spawned unit in RTE (ctrl-V).';";};
//Client Side Settings
  class click_grass : set_time { y =0.5; x = 0.24;onButtonClick = "[3] execVM 'mcc\Pop_menu\mission_settings.sqf'";}; 
  class click_view : set_time { y =0.55; x = 0.24;onButtonClick = "[4] execVM 'mcc\Pop_menu\mission_settings.sqf'";}; 
  
//--------------------------------------------------------------------------------------
//							Dr. Eyeball Generic menu
//---------------------------------------------------------------------------------------
  class PUM3_Caption0: PUM3_Caption { idc = PUM3_IDC_Caption0; x	= PUM3_dlg_x; y = PUM3_dlg_y; };
  class PUM3_Caption1: PUM3_Caption { idc = PUM3_IDC_Caption1; x = PUM3_dlg_x + (PUM3_dlg_wid * 1); y = PUM3_dlg_y+Dlg_CONTROLHGT; };
  class PUM3_Caption2: PUM3_Caption { idc = PUM3_IDC_Caption2; x = PUM3_dlg_x + (PUM3_dlg_wid * 2); y = PUM3_dlg_y+(2*Dlg_CONTROLHGT); };
  //---------------------------------------------
  // buttons - menu 0
  class PUM3_MenuItem000: PUM3_MenuItem0 { idc = PUM3_IDC_Button000; y = 0*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem001: PUM3_MenuItem0 { idc = PUM3_IDC_Button001; y = 1*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem002: PUM3_MenuItem0 { idc = PUM3_IDC_Button002; y = 2*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem003: PUM3_MenuItem0 { idc = PUM3_IDC_Button003; y = 3*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem004: PUM3_MenuItem0 { idc = PUM3_IDC_Button004; y = 4*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem005: PUM3_MenuItem0 { idc = PUM3_IDC_Button005; y = 5*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem006: PUM3_MenuItem0 { idc = PUM3_IDC_Button006; y = 6*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem007: PUM3_MenuItem0 { idc = PUM3_IDC_Button007; y = 7*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem008: PUM3_MenuItem0 { idc = PUM3_IDC_Button008; y = 8*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem009: PUM3_MenuItem0 { idc = PUM3_IDC_Button009; y = 9*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem010: PUM3_MenuItem0 { idc = PUM3_IDC_Button010; y = 10*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem011: PUM3_MenuItem0 { idc = PUM3_IDC_Button011; y = 11*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem012: PUM3_MenuItem0 { idc = PUM3_IDC_Button012; y = 12*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem013: PUM3_MenuItem0 { idc = PUM3_IDC_Button013; y = 13*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem014: PUM3_MenuItem0 { idc = PUM3_IDC_Button014; y = 14*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem015: PUM3_MenuItem0 { idc = PUM3_IDC_Button015; y = 15*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem016: PUM3_MenuItem0 { idc = PUM3_IDC_Button016; y = 16*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem017: PUM3_MenuItem0 { idc = PUM3_IDC_Button017; y = 17*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem018: PUM3_MenuItem0 { idc = PUM3_IDC_Button018; y = 18*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem019: PUM3_MenuItem0 { idc = PUM3_IDC_Button019; y = 19*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  //---------------------------------------------
  // buttons - menu 1
  class PUM3_MenuItem100: PUM3_MenuItem1 { idc = PUM3_IDC_Button100; y = 0*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem101: PUM3_MenuItem1 { idc = PUM3_IDC_Button101; y = 1*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem102: PUM3_MenuItem1 { idc = PUM3_IDC_Button102; y = 2*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem103: PUM3_MenuItem1 { idc = PUM3_IDC_Button103; y = 3*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem104: PUM3_MenuItem1 { idc = PUM3_IDC_Button104; y = 4*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem105: PUM3_MenuItem1 { idc = PUM3_IDC_Button105; y = 5*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem106: PUM3_MenuItem1 { idc = PUM3_IDC_Button106; y = 6*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem107: PUM3_MenuItem1 { idc = PUM3_IDC_Button107; y = 7*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem108: PUM3_MenuItem1 { idc = PUM3_IDC_Button108; y = 8*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem109: PUM3_MenuItem1 { idc = PUM3_IDC_Button109; y = 9*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem110: PUM3_MenuItem1 { idc = PUM3_IDC_Button110; y = 10*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem111: PUM3_MenuItem1 { idc = PUM3_IDC_Button111; y = 11*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem112: PUM3_MenuItem1 { idc = PUM3_IDC_Button112; y = 12*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem113: PUM3_MenuItem1 { idc = PUM3_IDC_Button113; y = 13*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem114: PUM3_MenuItem1 { idc = PUM3_IDC_Button114; y = 14*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem115: PUM3_MenuItem1 { idc = PUM3_IDC_Button115; y = 15*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem116: PUM3_MenuItem1 { idc = PUM3_IDC_Button116; y = 16*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem117: PUM3_MenuItem1 { idc = PUM3_IDC_Button117; y = 17*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem118: PUM3_MenuItem1 { idc = PUM3_IDC_Button118; y = 18*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem119: PUM3_MenuItem1 { idc = PUM3_IDC_Button119; y = 19*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  //---------------------------------------------
  // buttons - menu 2
  class PUM3_MenuItem200: PUM3_MenuItem2 { idc = PUM3_IDC_Button200; y = 0*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem201: PUM3_MenuItem2 { idc = PUM3_IDC_Button201; y = 1*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem202: PUM3_MenuItem2 { idc = PUM3_IDC_Button202; y = 2*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem203: PUM3_MenuItem2 { idc = PUM3_IDC_Button203; y = 3*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem204: PUM3_MenuItem2 { idc = PUM3_IDC_Button204; y = 4*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem205: PUM3_MenuItem2 { idc = PUM3_IDC_Button205; y = 5*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem206: PUM3_MenuItem2 { idc = PUM3_IDC_Button206; y = 6*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem207: PUM3_MenuItem2 { idc = PUM3_IDC_Button207; y = 7*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem208: PUM3_MenuItem2 { idc = PUM3_IDC_Button208; y = 8*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem209: PUM3_MenuItem2 { idc = PUM3_IDC_Button209; y = 9*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem210: PUM3_MenuItem2 { idc = PUM3_IDC_Button210; y = 10*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem211: PUM3_MenuItem2 { idc = PUM3_IDC_Button211; y = 11*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem212: PUM3_MenuItem2 { idc = PUM3_IDC_Button212; y = 12*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem213: PUM3_MenuItem2 { idc = PUM3_IDC_Button213; y = 13*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem214: PUM3_MenuItem2 { idc = PUM3_IDC_Button214; y = 14*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem215: PUM3_MenuItem2 { idc = PUM3_IDC_Button215; y = 15*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem216: PUM3_MenuItem2 { idc = PUM3_IDC_Button216; y = 16*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem217: PUM3_MenuItem2 { idc = PUM3_IDC_Button217; y = 17*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem218: PUM3_MenuItem2 { idc = PUM3_IDC_Button218; y = 18*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem219: PUM3_MenuItem2 { idc = PUM3_IDC_Button219; y = 19*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  //---------------------------------------------
};
