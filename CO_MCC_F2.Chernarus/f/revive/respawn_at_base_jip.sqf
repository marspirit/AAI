/*

RESPAWN AT BASE SCRIPT (JIP)

© AUGUST 2009 - norrin 
****************************************************************************
respawn_at_base_jip.sqf
*/

_spawn_pos = _this select 0;
_name = _this select 1;

_no_respawn_points 	= NORRN_revive_array select 12;
_Base_1 			= NORRN_revive_array select 13;
_Base_2 			= NORRN_revive_array select 14;
_Base_3 			= NORRN_revive_array select 15;
_Base_4 			= NORRN_revive_array select 16;
_mobile_spawn 		= NORRN_revive_array select 51;

_height 				= 0;


_no_base_1  = no_base_1;
_no_base_1b = no_base_1b;
_no_base_2  = no_base_2;
_no_base_2b = no_base_2b;
_no_base_3  = no_base_3;
_no_base_3b = no_base_3b;
_no_base_4  = no_base_4;
_no_base_4b = no_base_4b;


//Respawn point name for mobile spawn
if (_mobile_spawn == 1) then 
{
	if (!NORRN_camo_net) then
	{
		_Base_1 				= NORRN_revive_array select 14;
		_Base_2 				= NORRN_revive_array select 15;
		_Base_3 				= NORRN_revive_array select 16;
		_no_respawn_points  		= _no_respawn_points - 1;		
		if (_spawn_pos == 2 and _Base_2 == "") then {_Base_2 = NORRN_revive_array select 14};
		if (_spawn_pos == 3 and _Base_3 == "") then {_Base_2 = NORRN_revive_array select 14};
		if (_spawn_pos == 4 and _Base_4 == "") then {_Base_2 = NORRN_revive_array select 14};
		_no_base_1  = no_base_2;
		_no_base_1b = no_base_2b;
		_no_base_2  = no_base_3;
		_no_base_2b = no_base_3b;
		_no_base_3  = no_base_4;
		_no_base_3b = no_base_4b;
	};
};

if (_spawn_pos == 1 && _Base_1 != "" && !_no_base_1 && !_no_base_1b) then
{
	_pos_spawn = getMarkerPos _Base_1;
	if (!surfaceIsWater _pos_spawn) then {_height = 0} else {_height = 500};
	_name setpos [((_pos_spawn select 0) + round(random 5)),((_pos_spawn select 1) + round(random 5)), _height];
	//_name setpos _pos_spawn;
	if (local _name && isplayer _name) then {titleText ["You have respawned at position 1", "PLAIN", 0.5]};
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
};
if (_spawn_pos == 1 && _Base_1 != "" && _no_base_1 || _spawn_pos == 1 && _Base_1 != "" && _no_base_1b) then
{
	switch (_no_respawn_points) do {
		case 1: {_dialog_1 = createDialog "respawn_button_1b";ctrlSetText [1, _Base_1];};
		case 2: {_dialog_1 = createDialog "respawn_button_2b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];};
		case 3: {_dialog_1 = createDialog "respawn_button_3b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];};
		case 4: {_dialog_1 = createDialog "respawn_button_4b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];ctrlSetText [4, _Base_4];};
	};
	sleep 0.01;
	titletext ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
};

if (_spawn_pos == 2 && _Base_2 != "" && !_no_base_2 && !_no_base_2b) then
{	
	_pos_spawn = getMarkerPos _Base_2;
	if (!surfaceIsWater _pos_spawn) then {_height = 0} else {_height = 500};
	_name setpos [((_pos_spawn select 0) + round(random 5)),((_pos_spawn select 1) + round(random 5)), _height];
	//_name setpos _pos_spawn;
	if (local _name && isplayer _name) then {titleText ["You have respawned at position 2", "PLAIN", 0.5]};
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
};
if (_spawn_pos == 2 && _Base_2 != "" && _no_base_2 ||  _spawn_pos == 2 && _Base_2 != "" && _no_base_2b) then
{
	switch (_no_respawn_points) do {
		case 2: {_dialog_1 = createDialog "respawn_button_2b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];};
		case 3: {_dialog_1 = createDialog "respawn_button_3b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];};
		case 4: {_dialog_1 = createDialog "respawn_button_4b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];ctrlSetText [4, _Base_4];};
	};
	sleep 0.01;
	titletext ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
};

if (_spawn_pos == 3 && _Base_3 != "" && !_no_base_3 && !_no_base_3b) then
{
	_pos_spawn = getMarkerPos _Base_3;
	if (!surfaceIsWater _pos_spawn) then {_height = 0} else {_height = 500};
	_name setpos [((_pos_spawn select 0) + round(random 5)),((_pos_spawn select 1) + round(random 5)), _height];
	//_name setpos _pos_spawn;
	if (local _name && isplayer _name) then {titleText ["You have respawned at position 3", "PLAIN", 0.5]};
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
	closeDialog 0;
};
if (_spawn_pos == 3 && _Base_3 != "" && _no_base_3 || _spawn_pos == 3 && _Base_3 != "" && _no_base_3b) then
{
	titletext ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
};

if (_spawn_pos == 4 && _Base_4 != "" && !_no_base_4 && !_no_base_4b) then
{
	_pos_spawn = getMarkerPos _Base_4;
	if (!surfaceIsWater _pos_spawn) then {_height = 0} else {_height = 500};
	_name setpos [((_pos_spawn select 0) + round(random 5)),((_pos_spawn select 1) + round(random 5)), _height];
	//_name setpos _pos_spawn;
	if (local _name && isplayer _name) then {titleText ["You have respawned at position 4", "PLAIN", 0.5]};
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
	closeDialog 0;

};
if (_spawn_pos == 4 && _Base_4 != "" && _no_base_4 || _spawn_pos == 4 && _Base_4 != "" && _no_base_4b) then
{
	titleText ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
};

if(true) exitWith {};