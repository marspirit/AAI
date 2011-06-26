#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997
#define ExtrasDialog3_IDD 2996

#define MCC_MM 2980
#define MCC_CFPS 2981
#define MCC_SFPS 2982

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003
#define GROUP_TYPE 3005
#define GROUP_SPAWN_B 3007

#define UNIT_TYPE 3010
#define UNIT_CLASS 3011
#define UNIT_SPAWN_B 3012

#define ZONE_B 3015

#define SETTING_EMPTY 3020
#define SETTING_BEHAVIOR 3021
#define SETTING_AWERNESS 3022
#define SETTING_TRACK 3023
#define CAPTURE 3204

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

#define SET_GRASS 3260
#define SET_VIEW 3261

#define LOGOUT 3290
#define LOGIN 3291

#define MAIN 3293
#define MENU2 3294
#define MENU3 3295
#define MENU4 3296

private ["_mccdialog","_comboBox","_displayname","_it","_x"];
disableSerialization;

ctrlEnable [MAIN,false]; //Disable switching menus till the init is done
ctrlEnable [MENU2,false];
ctrlEnable [MENU3,false];
ctrlEnable [MENU4,false];

_mccdialog = findDisplay MCC_SANDBOX_IDD;

if (!enable_west) then { ctrlEnable [START_WEST,false];}; //disable start locations
if (!enable_east) then { ctrlEnable [START_EAST,false];};
if (!enable_gue) then { ctrlEnable [START_GUE,false];};
if (!enable_respawn) then { ctrlEnable [DISABLE_RESPAWN,false];};
if (!mcc_capture_state) then { ctrlEnable [CAPTURE,false];};
  
if (MCCFirstOpenUI) then //First Lunch
	{
	MCCFirstOpenUI = false; 
	closeDialog 0;
	[] execVM 'mcc\dialogs\mcc_PopupMenu.sqf'
	};

_comboBox = _mccdialog displayCtrl MCC_ZONE_NUMBERS; //fill combobox zone's numbers
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_numbers;
	_comboBox lbSetCurSel zone_index;

_comboBox = _mccdialog displayCtrl MCC_ZONE_X;		//fill combobox X length
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel zoneX_index;

_comboBox = _mccdialog displayCtrl MCC_ZONE_Y;		//fill comboboxYlength
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel zoneY_index;
	
_comboBox = _mccdialog displayCtrl MCC_FACTION;		//fill combobox CFG factions
	lbClear _comboBox;
	{
		_displayname = format ["%1(%2)",_x select 0,_x select 1];
		_comboBox lbAdd _displayname;
	} foreach U_FACTIONS;
	_comboBox lbSetCurSel faction_index;
//--------------------------------------Mission settings--------------------------------------------------------------------------

	_comboBox = _mccdialog displayCtrl SET_MONTH;		//fill combobox MONTH
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach months_array;
_comboBox lbSetCurSel moths_index;

_comboBox = _mccdialog displayCtrl SET_DAY;			//fill combobox Days
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_comboBox lbAdd _displayname;
} foreach days_array;
_comboBox lbSetCurSel day_index;

_comboBox = _mccdialog displayCtrl SET_HOUR;		//fill combobox HOUR
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach hours_array;
_comboBox lbSetCurSel hours_index;

_comboBox = _mccdialog displayCtrl SET_MINUTE;			//fill combobox Minutes
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_comboBox lbAdd _displayname;
} foreach minutes_array;
_comboBox lbSetCurSel minutes_index;

_comboBox = _mccdialog displayCtrl SET_WEATHER;		//fill combobox WEATHER
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach weather_array;
_comboBox lbSetCurSel weather_index;

_comboBox = _mccdialog displayCtrl SET_FOG;		//fill combobox FOG
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach fog_array;
_comboBox lbSetCurSel fog_index;
//----------------------------------------------------------Client Side settings----------------------------------------------------------------------------

_comboBox = _mccdialog displayCtrl SET_GRASS;		//fill combobox Grass
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach grass_array;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl SET_VIEW;		//fill combobox View distance
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_comboBox lbAdd _displayname;
} foreach view_array;
_comboBox lbSetCurSel 0;

//-----------------------------------------------------------------------------Groups-----------------------------------------------------------------

_comboBox = _mccdialog displayCtrl GROUP_TYPE;		//fill combobox CFG group
	lbClear _comboBox;
	{
		_displayname = _x;
		_index = _comboBox lbAdd _displayname;
	} foreach ["Infantry", "Motorized", "Mechanized", "Armor", "Air", "Paratroopers"];
	_comboBox lbSetCurSel 0;
	
//------------------------------------------------------------------Units----------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl UNIT_TYPE;		//fill combobox CFG unit
lbClear _comboBox;
{
	_displayname =  _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Infantry", "Vehicles", "Tracked/Static", "Motorcycle", "Helicopter", "Fixed-wing", "Ship", "D.O.C", "Ammo", "ACE Ammo", "Fortifications", "Dead Bodies", "Furnitures", 
			"Military", "Misc", "Signs", "Warfare", "Wrecks", "Buildings", "Ruins", "Fire (Only on 3D)"];
_comboBox lbSetCurSel 1; //class_index;	
sleep 0.05;
_comboBox lbSetCurSel 0;

//----------------------------------------------------------------Spawn Settings-----------------------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl SETTING_EMPTY;		//fill combobox Empty on/off
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach spawn_empty;
_comboBox lbSetCurSel empty_index;

_comboBox = _mccdialog displayCtrl SETTING_BEHAVIOR;		//fill combobox BEHAVIOR
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach spawn_behavior;
_comboBox lbSetCurSel behavior_index;

_comboBox = _mccdialog displayCtrl SETTING_AWERNESS;		//fill combobox AWERNESS
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach spawn_awereness;
_comboBox lbSetCurSel awereness_index;

_comboBox = _mccdialog displayCtrl SETTING_TRACK;		//fill combobox TRACK
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach spawn_track;
_comboBox lbSetCurSel track_index;

//-------------------------------------------------
// GUI enhancements

(_mccdialog displayCtrl MAIN) ctrlSetTooltip "Main/Login";
(_mccdialog displayCtrl MENU2) ctrlSetTooltip "LHD/AirDrop/UAV/CAS/Artillery/IED/Convoy";
(_mccdialog displayCtrl MENU3) ctrlSetTooltip "Markers/Briefing/Brushes/Tasks/Evac/JukeBox";
(_mccdialog displayCtrl MENU4) ctrlSetTooltip "Triggers/Gita";

sleep 0.3; // to allow server to notice mcc_missionmaker logging in..

ctrlSetText [MCC_MM, format["Mission Maker: %1",mcc_missionmaker]];

if (count mcc_zone_size <1) then 
{
	// set button text to 'create zone'
	_mccdialog = findDisplay MCC_SANDBOX_IDD;	
	(_mccdialog displayCtrl ZONE_B) ctrlSetStructuredText parseText format["Create Zone"];
};

if (mcc_missionmaker == '') then
 { ctrlEnable [LOGIN,true];}
else 
 { ctrlEnable [LOGIN,false];};

if (mcc_missionmaker == (name player)) then
 { 
	ctrlEnable [LOGOUT,true];
	if ( (count mcc_zone_size) > 1 ) then 
	{
		ctrlEnable [UNIT_SPAWN_B,true];
		ctrlEnable [GROUP_SPAWN_B,true];
	}
	else
	{
		ctrlEnable [UNIT_SPAWN_B,false];
		ctrlEnable [GROUP_SPAWN_B,false];
	};
}
else 
{ 
	ctrlEnable [LOGOUT,false];
	ctrlEnable [UNIT_SPAWN_B,false];
	ctrlEnable [GROUP_SPAWN_B,false]; 
};

ctrlEnable [MAIN,false]; //Enable switching menus 
ctrlEnable [MENU2,true];
ctrlEnable [MENU3,true];
ctrlEnable [MENU4,true];

//-------------------------------------------------FPS Loop  -----------------------------
while {dialog} do 
	{
	clientFPS  = round(diag_fps);
	[0, {serverFPS = round(diag_fps);publicvariable "serverFPS";}] call CBA_fnc_globalExecute;
	ctrlSetText [MCC_CFPS, format["Client FPS: %1",clientFPS]];
	ctrlSetText [MCC_SFPS, format["Server FPS: %1",serverFPS]];
	sleep 1;
	};
//------------------------------------------------------------------------------------------

//player sidechat format["mcc_pop_init.sqf"]; // debug
/*
if (mcc_missionmaker == '') then
 { ctrlEnable [LOGIN,true]; }
else 
 { ctrlEnable [LOGIN,false]; };

if (mcc_missionmaker == (name player)) then
 { ctrlEnable [LOGOUT,true]; }
else 
 { ctrlEnable [LOGOUT,false]; };
 */ 