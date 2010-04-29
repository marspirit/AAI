/*

RESPAWN AT BASE SCRIPT

© AUGUST 2009 - norrin
****************************************************************************
respawn_at_base.sqf
*/
disableserialization;

_spawn_pos 				= _this select 0;
_name 					= _this select 1;

_no_respawn_points  	= NORRN_revive_array select 12;
_Base_1 				= NORRN_revive_array select 13;
_Base_2 				= NORRN_revive_array select 14;
_Base_3 				= NORRN_revive_array select 15;
_Base_4 				= NORRN_revive_array select 16;
_max_respawns			= NORRN_revive_array select 38;
_mobile_spawn 			= NORRN_revive_array select 51;
_mobile_base_start 		= NORRN_revive_array select 52;
_respawnAtBaseWait		= NORRN_revive_array select 68;
_baseWait				= false;
_height 				= 0;

_no_base_1  			= no_base_1;
_no_base_1b 			= no_base_1b;
_no_base_2  			= no_base_2;
_no_base_2b 			= no_base_2b;
_no_base_3  			= no_base_3;
_no_base_3b 			= no_base_3b;
_no_base_4  			= no_base_4;
_no_base_4b 			= no_base_4b;

_r_dialog_1 = "";
_r_dialog_2 = "";
_r_dialog_3 = "";
_r_dialog_4 = "";
_r_display  = "";

detach _name;

_pos = getPos _name;
_offset = _name distance _pos;
_name setVariable ["NORRN_uncPos", [(_pos select 0),(_pos select 1), _offset], true];

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
	_respawn_message = format ["You have respawned at %1", _Base_1]; 
	if (_name == player) then {titletext [_respawn_message, "BLACK FADED", 1]};
	_name setVariable ["NORRN_respawn_at_base", true, true];
	NORRN_spawn_chosen = true;
	_baseWait = true;
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
};
if (_spawn_pos == 1 && _Base_1 != "" && _no_base_1 || _spawn_pos == 1 && _Base_1 != "" && _no_base_1b) then
{
	if (NORRN_r_time_expire) then
	{
		switch (_no_respawn_points) do {
			case 1: {_dialog_1 = createDialog "respawn_button_1map";ctrlSetText [1, _Base_1];};
			case 2: {_dialog_1 = createDialog "respawn_button_2map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];};
			case 3: {_dialog_1 = createDialog "respawn_button_3map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];};
			case 4: {_dialog_1 = createDialog "respawn_button_4map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];ctrlSetText [4, _Base_4];};
		};
		sleep 0.1;
		titletext ["\n\n\n\n\n\n\n\n\n\n\nThis spawn point is currently occupied by enemy forces \n\nRevive timer has been exceeded. Choose marker for respawn", "BLACK FADED", 10];
	}else{
		closedialog 0;
		//_r_display closedisplay 10004;
		//_r_display closedisplay 10005;
		waitUntil {!dialog};
		
		switch (_no_respawn_points) do {
			case 1: {_r_dialog_1 = createDialog "respawn_button_1";_r_display = findDisplay 99124;_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"]};
			case 2: {_r_dialog_2 = createDialog "respawn_button_2";_r_display = findDisplay 99125;_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"]};
			case 3: {_r_dialog_3 = createDialog "respawn_button_3";_r_display = findDisplay 99126;_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"]};
			case 4: {_r_dialog_4 = createDialog "respawn_button_4";_r_display = findDisplay 99127;_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"]};
		};
		if (_no_respawn_points > 0) then {ctrlSetText [1, _Base_1]};
		if (_no_respawn_points > 1) then {ctrlSetText [2, _Base_2]};
		if (_no_respawn_points > 2) then {ctrlSetText [3, _Base_3]};
		if (_no_respawn_points > 3) then {ctrlSetText [4, _Base_4]};
		sleep 0.2;
		titleCut ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
	     };
	if (NORRNCustomExec4 != "") then {call compile NORRNCustomExec4};
};

if (_spawn_pos == 2 && _Base_2 != "" && !_no_base_2 && !_no_base_2b) then
{
	_pos_spawn = getMarkerPos _Base_2;
	if (!surfaceIsWater _pos_spawn) then {_height = 0} else {_height = 500};
	_name setpos [((_pos_spawn select 0) + round(random 5)),((_pos_spawn select 1) + round(random 5)), _height];
	_respawn_message = format ["You have respawned at %1", _Base_2]; 
	if (_name == player) then {titleText [_respawn_message, "BLACK FADED", 1]};
	_name setVariable ["NORRN_respawn_at_base", true, true];
	NORRN_spawn_chosen = true;
	_baseWait = true;
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
};
if (_spawn_pos == 2 && _Base_2 != "" && _no_base_2 ||  _spawn_pos == 2 && _Base_2 != "" && _no_base_2b) then
{
	if (NORRN_r_time_expire) then
	{
		switch (_no_respawn_points) do {
			case 2: {_dialog_1 = createDialog "respawn_button_2map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];};
			case 3: {_dialog_1 = createDialog "respawn_button_3map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];};
			case 4: {_dialog_1 = createDialog "respawn_button_4map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];ctrlSetText [4, _Base_4];};
		};
		sleep 0.1;
		titletext ["\n\n\n\n\n\n\n\n\n\n\nThis spawn point is currently occupied by enemy forces \n\nRevive timer has been exceeded. Choose marker for respawn", "BLACK FADED", 10];
	}else{
		closedialog 0;
		//_r_display closedisplay 10004;
		//_r_display closedisplay 10005;
		waitUntil {!dialog};
		
		switch (_no_respawn_points) do {
			case 2: {_r_dialog_2 = createDialog "respawn_button_2";_r_display = findDisplay 99125;_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"]};
			case 3: {_r_dialog_3 = createDialog "respawn_button_3";_r_display = findDisplay 99126;_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"]};
			case 4: {_r_dialog_4 = createDialog "respawn_button_4";_r_display = findDisplay 99127;_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"]};
		};
		if (_no_respawn_points > 0) then {ctrlSetText [1, _Base_1]};
		if (_no_respawn_points > 1) then {ctrlSetText [2, _Base_2]};
		if (_no_respawn_points > 2) then {ctrlSetText [3, _Base_3]};
		if (_no_respawn_points > 3) then {ctrlSetText [4, _Base_4]};
		sleep 0.1;
		titleCut ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
	     };
	if (NORRNCustomExec4 != "") then {call compile NORRNCustomExec4};
};

if (_spawn_pos == 3 && _Base_3 != "" && !_no_base_3 && !_no_base_3b) then
{
	_pos_spawn = getMarkerPos _Base_3;
	if (!surfaceIsWater _pos_spawn) then {_height = 0} else {_height = 500};
	_name setpos [((_pos_spawn select 0) + round(random 5)),((_pos_spawn select 1) + round(random 5)), _height];
	_respawn_message = format ["You have respawned at %1", _Base_3]; 
	if (_name == player) then {titleText [_respawn_message, "BLACK FADED", 1]};
	_name setVariable ["NORRN_respawn_at_base", true, true];
	NORRN_spawn_chosen = true;
	_baseWait = true;
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
};
if (_spawn_pos == 3 && _Base_3 != "" && _no_base_3 || _spawn_pos == 3 && _Base_3 != "" && _no_base_3b) then
{
	if (NORRN_r_time_expire) then 
	{	
		closedialog 0;
		switch (_no_respawn_points) do {
			case 3: {_dialog_1 = createDialog "respawn_button_3map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];};
			case 4: {_dialog_1 = createDialog "respawn_button_4map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];ctrlSetText [4, _Base_4];};
		};
		sleep 0.1;
		titleText ["\n\n\n\n\n\n\n\n\n\n\nThis spawn point is currently occupied by enemy forces \n\nRevive timer has been exceeded. Choose marker for respawn", "BLACK FADED", 10];
	}else{
			titleCut ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
	     };
	if (NORRNCustomExec4 != "") then {call compile NORRNCustomExec4};
};

if (_spawn_pos == 4 && _Base_4 != "" && !_no_base_4 && !_no_base_4b) then
{
	_pos_spawn = getMarkerPos _Base_4;
	if (!surfaceIsWater _pos_spawn) then {_height = 0} else {_height = 500};
	_name setpos [((_pos_spawn select 0) + round(random 5)),((_pos_spawn select 1) + round(random 5)), _height];
	_respawn_message = format ["You have respawned at %1", _Base_4]; 
	if (_name == player) then {titleText [_respawn_message, "BLACK FADED", 1]};
	_name setVariable ["NORRN_respawn_at_base", true, true];
	NORRN_spawn_chosen = true;
	_baseWait = true;
	sleep 1;
	If (NORRNCustomExec3 != "") then {call compile NORRNCustomExec3};
};
if (_spawn_pos == 4 && _Base_4 != "" && _no_base_4 || _spawn_pos == 4 && _Base_4 != "" && _no_base_4b) then
{	
	if (NORRN_r_time_expire) then 
	{	
		closedialog 0;
		if (_no_respawn_points == 4) then {_dialog_1 = createDialog "respawn_button_4map";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];ctrlSetText [4, _Base_4];};
		sleep 0.1;
		titletext ["\n\n\n\n\n\n\n\n\n\n\nThis spawn point is currently occupied by enemy forces \n\nRevive timer has been exceeded. Choose marker for respawn", "BLACK FADED", 10];
	}else{
			titleCut ["This spawn point is currently occupied by enemy forces", "PLAIN", 0.3];
	     };
	if (NORRNCustomExec4 != "") then {call compile NORRNCustomExec4};
};
sleep 2;

if ((_respawnAtBaseWait select 0) == 1 && _baseWait && _max_respawns != 2000) then 
{	
	_timer	= (_respawnAtBaseWait select 1);
	_c = 1;
	_name setCaptive true;
	while {_timer >= 0} do
	{
			if (_c >= 1 ) then
			{	
				_timer_message = format ["You will respawn in %1 seconds", _timer];
				if (_name == player) then {titletext [_timer_message,"BLACK FADED", 0.3]};
				_timer = _timer - 1;
				_c = 0;
			};
			sleep 0.05;
			_c = _c + 0.05;
	};
};
_name setCaptive false;	
if(true) exitWith {};