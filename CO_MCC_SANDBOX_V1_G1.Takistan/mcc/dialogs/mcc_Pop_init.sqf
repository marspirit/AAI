unit_array_ready=false;
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
#define SET_WEATHER 3252

#define SET_GRASS 3260
#define SET_VIEW 3261

private ["_mccdialog","_comboBox","_displayname","_it","_x"];
disableSerialization;
_mccdialog = findDisplay PUM3_IDD_PopupMenuDialog;

if (!enable_west) then { ctrlEnable [START_WEST,false];}; //disable start locations
if (!enable_east) then { ctrlEnable [START_EAST,false];};
if (!enable_gue) then { ctrlEnable [START_GUE,false];};
if (!enable_respawn) then { ctrlEnable [DISABLE_RESPAWN,false];};

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
	} foreach zones_y;
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

_comboBox = _mccdialog displayCtrl SET_HOUR;		//fill combobox HOUR
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach hours_array;
_comboBox lbSetCurSel hours_index;

_comboBox = _mccdialog displayCtrl SET_WEATHER;		//fill combobox WEATHER
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach weather_array;
_comboBox lbSetCurSel weather_index;
//----------------------------------------------------------Client Side settings----------------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl SET_GRASS;		//fill combobox HOUR
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach grass_array;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl SET_VIEW;		//fill combobox WEATHER
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_comboBox lbAdd _displayname;
} foreach view_array;
_comboBox lbSetCurSel 0;
	
if (faction_choice) then {waituntil {(unit_array_ready)}}; //wait for arrays to build up if faction choice
faction_choice=false; 	

//-----------------------------------------------------------------------------Groups-----------------------------------------------------------------

_comboBox = _mccdialog displayCtrl GROUP_INF;		//fill combobox CFG group's infantry
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 3];
		_comboBox lbAdd _displayname;
	} foreach GEN_INFANTRY;
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl GROUP_MOTO;		//fill combobox CFG group's Motorized
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 3];
		_comboBox lbAdd _displayname;
	} foreach GEN_MOTORIZED;
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl GROUP_MECH;		//fill combobox CFG group's MECHANIZED
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 3];
		_comboBox lbAdd _displayname;
	} foreach GEN_MECHANIZED;
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl GROUP_ARMOR;		//fill combobox CFG group's ARMOR
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 3];
		_comboBox lbAdd _displayname;
	} foreach GEN_ARMOR;
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl GROUP_AIR;		//fill combobox CFG group's AIR
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 3];
		_comboBox lbAdd _displayname;
	} foreach GEN_AIR;
	_comboBox lbSetCurSel 0;
	
//------------------------------------------------------------------Units----------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl UNIT_INF;		//fill combobox CFG unit's infantry
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_GEN_SOLDIER;
_comboBox lbSetCurSel 0;

//hint format ["%1",U_GEN_CAR];
_comboBox = _mccdialog displayCtrl UNIT_CAR;		//fill combobox CFG unit's Car
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_GEN_CAR;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_TANK;		//fill combobox CFG unit's TANK
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_GEN_TANK;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_MOTOR;		//fill combobox CFG unit's MOTOR
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_GEN_MOTORCYCLE;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_HELI;		//fill combobox CFG unit's HELI
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_GEN_HELICOPTER;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_AIR;		//fill combobox CFG unit's AIR
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_GEN_AIRPLANE;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_SHIP;		//fill combobox CFG unit's SHIP
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_GEN_SHIP;
_comboBox lbSetCurSel 0;

//----------------------------------------------------------------Objects-----------------------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl UNIT_DOC;		//fill combobox CFG unit's DOC
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach GEN_DOC1;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_AMMO;		//fill combobox CFG unit's AMMO
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_AMMO;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_AAMMO;		//fill combobox CFG unit's Ace AMMO
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_comboBox lbAdd _displayname;
} foreach U_ACE_AMMO;
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


	