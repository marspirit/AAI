private ["_mccdialog","_comboBox","_displayname","_volume"];
unit_array_ready=false;
#define ExtrasDialog3_IDD 2996

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003

#define CAPTURE 3204

#define TRIGGER_ACTIVEATE 7000
#define TRIGGER_COND 7001
#define TRIGGER_SIZEX 7002
#define TRIGGER_SIZEY 7003
#define TRIGGER_ANGLE 7004
#define TRIGGER_SHAPE 7005
#define TRIGGER_SELECTED 7007

#define GITA_SIZEX 7010
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

disableSerialization;
_mccdialog = findDisplay ExtrasDialog3_IDD;
if (!mcc_capture_state) then { ctrlEnable [CAPTURE,false];};

if (animalModule) then {ctrlEnable [MODULES_ANIMAL,false];}; //enable buttons for active modules
if (aliceModule) then {ctrlEnable [MODULES_ALICE,false];};
if (aliceModule2) then {ctrlEnable [MODULES_ALICE2,false];};
if (silvieModule) then {ctrlEnable [MODULES_SILVIE,false];};

//-----------------------------------------------------Zones & Factions--------------------------------------------
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

//--------------------------------------------------Triggers---------------------------------------------------------------------------

_comboBox = _mccdialog displayCtrl TRIGGER_ACTIVEATE; //fill combobox Activate by

	lbClear _comboBox;
	{
		_displayname = _x;
		_comboBox lbAdd _displayname;
	} foreach musicActivateby_array;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl TRIGGER_COND; //fill combobox Condition

	lbClear _comboBox;
	{
		_displayname =_x;
		_comboBox lbAdd _displayname;
	} foreach musicCond_array;
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl TRIGGER_SIZEX;		//fill combobox Trigger X 
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl TRIGGER_SIZEY;		//fill combobox Trigger Y
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_y;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl TRIGGER_ANGLE;		//fill combobox Trigger Angle 
	lbClear _comboBox;
	{
		_displayname = format ["%1", _x];
		_comboBox lbAdd _displayname;
	} foreach angle_array;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl TRIGGER_SHAPE;		//fill combobox Trigger Shape 
	lbClear _comboBox;
	{
		_displayname = _x;
		_comboBox lbAdd _displayname;
	} foreach shapeMarker;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl TRIGGER_SELECTED;		//fill combobox Active triggers 
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach mcc_triggers;
	_comboBox lbSetCurSel 0;
	
//------------------------------------Gita--------------------------------------------------------------------------------------------------------
	
_comboBox = _mccdialog displayCtrl GITA_SIZEX;		//fill combobox gita size 
	lbClear _comboBox;
	{
		_displayname = format ["%1", _x];
		_comboBox lbAdd _displayname;
	} foreach [100,200,300,400,500,600,700,800,900,1000];
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl GITA_DAMAGE;		//fill combobox Gita damage
	lbClear _comboBox;
	{
		_displayname = format ["%1", _x];
		_comboBox lbAdd _displayname;
	} foreach [0,1,2,3,4,5,6,7,8,9,10];
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl GITA_STYLE;		//fill combobox gita style
	lbClear _comboBox;
	{
		_displayname = _x;
		_comboBox lbAdd _displayname;
	} foreach ["European", "Takistany"];
	_comboBox lbSetCurSel 0;

//------------------------------------Battlefield--------------------------------------------------------------------------------------------------------
	
_comboBox = _mccdialog displayCtrl BATTLEFIELD_RADIUS;		//fill combobox Battlefield size 
	lbClear _comboBox;
	{
		_displayname =  _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel 0;


//------------------------------Delete Vehicle---------------------------------------------------------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl DELETE_ZONE; //fill combobox zone's numbers
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl DELETE_CLASS;		//fill combobox class to delete
	lbClear _comboBox;
	{
		_displayname = format ["%1", _x];
		_comboBox lbAdd _displayname;
	} foreach deleteTypes;
	_comboBox lbSetCurSel 0;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
if (faction_choice) then {waituntil {(unit_array_ready)}}; //wait for arrays to build up if faction choice
faction_choice=false; 
//-------------------------------Mobile Spawn--------------------------------------------------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl MOBILESPAWN_CARS;		//fill combobox CFG unit's Car
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MOBILESPAWN_TANKS;		//fill combobox CFG unit's TANK
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_TANK;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MOBILESPAWN_HELIS;		//fill combobox CFG unit's HELI
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_HELICOPTER;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MOBILESPAWN_SIDE;		//fill combobox CFG unit's HELI
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach [west, east, resistance];
_comboBox lbSetCurSel 0;



