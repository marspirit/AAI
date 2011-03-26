#define MCC3D_IDD 100
#define MCC_FACTION 3003

#define UNIT_TYPE 3010
#define UNIT_CLASS 3011
#define SETTING_EMPTY 3020
#define NAMEBOX 88554 
#define INITBOX 88555 
#define PRESETS 88553

private ["_mccdialog","_comboBox","_displayname","_x"];
disableSerialization;

_mccdialog = findDisplay MCC3D_IDD;

_comboBox = _mccdialog displayCtrl MCC_FACTION;		//fill combobox CFG factions
	lbClear _comboBox;
	{
		_displayname = format ["%1(%2)",_x select 0,_x select 1];
		_comboBox lbAdd _displayname;
	} foreach U_FACTIONS;
	_comboBox lbSetCurSel faction_index;

_comboBox = _mccdialog displayCtrl UNIT_TYPE;		//fill combobox CFG unit
lbClear _comboBox;
{
	_displayname =  _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Infantry", "Vehicles", "Tracked/Static", "Motorcycle", "Helicopter", "Fixed-wing", "Ship", "D.O.C", "Ammo", "ACE Ammo", "Fortifications", "Dead Bodies", "Furnitures", 
			"Military", "Misc", "Signs", "Warfare", "Wrecks", "Buildings", "Ruins", "Fire (Only on 3D)"];
_comboBox lbSetCurSel class_index;

_comboBox = _mccdialog displayCtrl SETTING_EMPTY;		//fill combobox Empty on/off
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_comboBox lbAdd _displayname;
} foreach spawn_empty;
_comboBox lbSetCurSel empty_index;

_comboBox = _mccdialog displayCtrl PRESETS;		//fill combobox Presets
lbClear _comboBox;
{
	_displayname = _x select 0;
	_comboBox lbAdd _displayname;
} foreach mccPresets;
_comboBox lbSetCurSel 0;

