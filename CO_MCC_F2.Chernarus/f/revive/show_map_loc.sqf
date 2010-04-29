/*

SHOW MAP LOCATION  SCRIPT

© JUNE 2009 - norrin
****************************************************************************
show_map_loc.sqf
*/
private ["_dialog","_display", "_ctrl"];

_base 					= _this select 0;
_no_respawn_points 		= NORRN_revive_array select 12;
_Base_1 				= NORRN_revive_array select 13;
_Base_2 				= NORRN_revive_array select 14;
_Base_3 				= NORRN_revive_array select 15;
_Base_4 				= NORRN_revive_array select 16;
_mobile_spawn 			= NORRN_revive_array select 51;
_spawnPos				= [];
NORRN_OK_diag_off		= false;

if (_mobile_spawn == 1) then 
{
	if (NORRN_camo_net) then
	{	
		_no_respawn_points =	NORRN_revive_array select 12;
		_Base_1 = 				NORRN_revive_array select 13;
		_Base_2 = 				NORRN_revive_array select 14;
		_Base_3 = 				NORRN_revive_array select 15;
		_Base_4 = 				NORRN_revive_array select 16;		
	}else{
		_no_respawn_points =	NORRN_revive_array select 12;
		_no_respawn_points = 	_no_respawn_points - 1;
		_Base_1 = 				NORRN_revive_array select 14;
		_Base_2 = 				NORRN_revive_array select 15;
		_Base_3 = 				NORRN_revive_array select 16;	
	};
};

disableserialization;

closeDialog 0; 
waitUntil {!dialog};
_dialog_1 = createDialog "OK_map";
switch (_base) do {
	case 1: {_spawnPos = getMarkerPos _Base_1};
	case 2: {_spawnPos = getMarkerPos _Base_2};
	case 3: {_spawnPos = getMarkerPos _Base_3};
	case 4: {_spawnPos = getMarkerPos _Base_4};
};

_display = findDisplay 202024;
_ctrlmap = _display displayctrl 202001;
ctrlMapAnimClear _ctrlmap;

_start_pos = position unconscious_body;
_ctrlmap ctrlmapanimadd [0.0, 1.00, _start_pos]; // show map location
_ctrlmap ctrlmapanimadd [0.8, 0.90, _spawnPos]; // show map location
_ctrlmap ctrlmapanimadd [0.1, 0.20, _spawnPos]; // zoom map location
ctrlmapanimcommit _ctrlmap;

NORRN_r_OK = 1;
sleep 0.1;
waitUntil {NORRN_r_OK == 2||NORRN_r_OK == 3||NORRN_OK_diag_off};
sleep 0.1;
if (NORRN_r_OK == 2) exitWith {[_base,player] execVM "f\revive\respawn_at_base.sqf";_base = nil;};
if (NORRN_r_OK == 3 || NORRN_OK_diag_off) exitWith {_base = nil;};
