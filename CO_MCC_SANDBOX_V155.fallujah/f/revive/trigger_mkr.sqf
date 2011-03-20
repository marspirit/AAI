/*
TRIGGER MAKING SCRIPT

This script automatically creates the triggers required for the revive_player.sqf script

© OCTOBER 2008 - norrin

*************************************************************************************************************************************
trigger_mkr.sqf
*/

_mission_end_function = NORRN_revive_array select 0;
_Base_1 = 			NORRN_revive_array select 13;
_Base_2 = 			NORRN_revive_array select 14;
_Base_3 = 			NORRN_revive_array select 15;
_Base_4 = 			NORRN_revive_array select 16;
_Base_free_respawn =	NORRN_revive_array select 36;

_no_enemy_sides =		NORRN_revive_array select 22;
_enemy_side_1 =		NORRN_revive_array select 23;
_enemy_side_2 =		NORRN_revive_array select 24;

_mobile_spawn = 		NORRN_revive_array select 51;
_mobile_base_start = 	NORRN_revive_array select 52;

_Base_1_respawn 		= _Base_free_respawn select 0;
_Base_2_respawn 		= _Base_free_respawn select 1;
_Base_3_respawn 		= _Base_free_respawn select 2;
_Base_4_respawn 		= _Base_free_respawn select 3;

if (_mission_end_function == 1) then
{
	_trig_0 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];	
	_trig_0 setTriggerType "END6";
	_trig_0 setTriggerActivation ["LOGIC", "", false];
	_trig_0 setTriggerArea [1, 1, 0, false];
	_trig_0 setTriggerStatements ["mission_Over", "titleText [""Mission Failed - all players are unconscious"", ""Black Faded"", 1]", ""];
	_trig_0 setTriggerTimeout [15, 15, 15, false];
};

_trig_1 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
_trig_1 setTriggerType "NONE";
_trig_1 setTriggerActivation ["LOGIC", "", true];
_trig_1 setTriggerArea [1, 1, 0, false];
_trig_1 setTriggerStatements ["onConnect", "call{[] execVM ""f\revive\onConnect.sqf""}",""];

_trig_2 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
_trig_2 setTriggerType "NONE";
_trig_2 setTriggerActivation ["LOGIC", "", true];
_trig_2 setTriggerArea [1, 1, 0, false];
_trig_2 setTriggerStatements ["connected", "call{[] execVM ""f\revive\connected.sqf""}", ""];

_trig_3 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
_trig_3 setTriggerType "NONE";
_trig_3 setTriggerActivation ["LOGIC", "", true];
_trig_3 setTriggerArea [1, 1, 0, false];
_trig_3 setTriggerStatements ["onConnect", "call{[] execVM ""f\revive\respawn_counter.sqf""}", ""];

if (_no_enemy_sides == 1 || _no_enemy_sides == 2) then
{	
	if (_Base_1_respawn == 0 && _mobile_spawn == 0) then 
	{ 
		_trig_4 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		_trig_4 setTriggerType "NONE";
		_trig_4 setTriggerActivation [_enemy_side_1, "PRESENT", true];
		_trig_4 setTriggerArea [50, 50, 0, false];
		_trig_4 setTriggerStatements ["this && !no_base_1", "no_base_1 = true;publicvariable ""no_base_1""",""];

		_trig_5 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		_trig_5 setTriggerType "NONE";
		_trig_5 setTriggerActivation [_enemy_side_1, "NOT PRESENT", true];
		_trig_5 setTriggerArea [50, 50, 0, false];
		_trig_5 setTriggerStatements ["this && no_base_1", "no_base_1 = false;publicvariable ""no_base_1""",""];
	};
	
	if (_Base_2_respawn == 0) then 
	{ 
		_trig_6 = createTrigger["EmptyDetector", getMarkerPos _Base_2];
		_trig_6 setTriggerType "NONE";
		_trig_6 setTriggerActivation [_enemy_side_1, "PRESENT", true];
		_trig_6 setTriggerArea [50, 50, 0, false];
		_trig_6 setTriggerStatements ["this && !no_base_2", "no_base_2 = true; publicvariable ""no_base_2""", ""];

		_trig_7 = createTrigger["EmptyDetector", getMarkerPos _Base_2];
		_trig_7 setTriggerType "NONE";
		_trig_7 setTriggerActivation [_enemy_side_1, "NOT PRESENT", true];
		_trig_7 setTriggerArea [50, 50, 0, false];
		_trig_7 setTriggerStatements ["this && no_base_2", "no_base_2 = false; publicvariable ""no_base_2""", ""];
	};
	if (_Base_3_respawn == 0) then 
	{ 
		_trig_8 = createTrigger["EmptyDetector", getMarkerPos _Base_3];
		_trig_8 setTriggerType "NONE";
		_trig_8 setTriggerActivation [_enemy_side_1, "PRESENT", true];
		_trig_8 setTriggerArea [50, 50, 0, false];
		_trig_8 setTriggerStatements ["this && !no_base_3", "no_base_3 = true; publicvariable ""no_base_3""", ""];

		_trig_9 = createTrigger["EmptyDetector", getMarkerPos _Base_3];
		_trig_9 setTriggerType "NONE";
		_trig_9 setTriggerActivation [_enemy_side_1, "NOT PRESENT", true];
		_trig_9 setTriggerArea [50, 50, 0, false];
		_trig_9 setTriggerStatements ["this && no_base_3", "no_base_3 = false; publicvariable ""no_base_3""", ""];
	};
	
	if (_Base_4_respawn == 0) then 
	{ 
		_trig_10 = createTrigger["EmptyDetector", getMarkerPos _Base_4];
		_trig_10 setTriggerType "NONE";
		_trig_10 setTriggerActivation [_enemy_side_1, "PRESENT", true];
		_trig_10 setTriggerArea [50, 50, 0, false];
		_trig_10 setTriggerStatements ["this && !no_base_4", "no_base_4 = true; publicvariable ""no_base_4""", ""];

		_trig_11 = createTrigger["EmptyDetector", getMarkerPos _Base_4];
		_trig_11 setTriggerType "NONE";
		_trig_11 setTriggerActivation [_enemy_side_1, "NOT PRESENT", true];
		_trig_11 setTriggerArea [50, 50, 0, false];
		_trig_11 setTriggerStatements ["this && no_base_4", "no_base_4 = false; publicvariable ""no_base_4""", ""];
	};
};

If (_no_enemy_sides == 2) then
{	
	if (_Base_1_respawn == 0 && _mobile_spawn == 0) then 
	{ 
		_trig_12 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		_trig_12 setTriggerType "NONE";
		_trig_12 setTriggerActivation [_enemy_side_2, "PRESENT", true];
		_trig_12 setTriggerArea [50, 50, 0, false];
		_trig_12 setTriggerStatements ["this && !no_base_1b", "no_base_1b = true; publicvariable ""no_base_1b""", ""];

		_trig_13 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		_trig_13 setTriggerType "NONE";
		_trig_13 setTriggerActivation [_enemy_side_2, "NOT PRESENT", true];
		_trig_13 setTriggerArea [50, 50, 0, false];
		_trig_13 setTriggerStatements ["this && no_base_1b", "no_base_1b = false; publicvariable ""no_base_1b""", ""];
	};
	if (_Base_2_respawn == 0) then 
	{ 
		_trig_14 = createTrigger["EmptyDetector", getMarkerPos _Base_2];
		_trig_14 setTriggerType "NONE";
		_trig_14 setTriggerActivation [_enemy_side_2, "PRESENT", true];
		_trig_14 setTriggerArea [50, 50, 0, false];
		_trig_14 setTriggerStatements ["this && !no_base_2b", "no_base_2b = true; publicvariable ""no_base_2b""", ""];

		_trig_15 = createTrigger["EmptyDetector", getMarkerPos _Base_2];
		_trig_15 setTriggerType "NONE";
		_trig_15 setTriggerActivation [_enemy_side_2, "NOT PRESENT", true];
		_trig_15 setTriggerArea [50, 50, 0, false];
		_trig_15 setTriggerStatements ["this && no_base_2b", "no_base_2b = false; publicvariable ""no_base_2b""", ""];
	};

	if (_Base_3_respawn == 0) then 
	{ 
		_trig_16 = createTrigger["EmptyDetector", getMarkerPos _Base_3];
		_trig_16 setTriggerType "NONE";
		_trig_16 setTriggerActivation [_enemy_side_2, "PRESENT", true];
		_trig_16 setTriggerArea [50, 50, 0, false];
		_trig_16 setTriggerStatements ["this && !no_base_3b", "no_base_3b = true; publicvariable ""no_base_3b""", ""];

		_trig_17 = createTrigger["EmptyDetector", getMarkerPos _Base_3];
		_trig_17 setTriggerType "NONE";
		_trig_17 setTriggerActivation [_enemy_side_2, "NOT PRESENT", true];
		_trig_17 setTriggerArea [50, 50, 0, false];
		_trig_17 setTriggerStatements ["this && no_base_3b", "no_base_3b = false; publicvariable ""no_base_3b""", ""];
	};
	
	if (_Base_4_respawn == 0) then 
	{ 
		_trig_18 = createTrigger["EmptyDetector", getMarkerPos _Base_4];
		_trig_18 setTriggerType "NONE";
		_trig_18 setTriggerActivation [_enemy_side_2, "PRESENT", true];
		_trig_18 setTriggerArea [50, 50, 0, false];
		_trig_18 setTriggerStatements ["this && !no_base_4b", "no_base_4b = true; publicvariable ""no_base_4b""", ""];

		_trig_19 = createTrigger["EmptyDetector", getMarkerPos _Base_4];
		_trig_19 setTriggerType "NONE";
		_trig_19 setTriggerActivation [_enemy_side_2, "NOT PRESENT", true];
		_trig_19 setTriggerArea [50, 50, 0, false];
		_trig_19 setTriggerStatements ["this && no_base_4b", "no_base_4b = false; publicvariable ""no_base_4b""", ""];
	};
};


sleep 5;

//create mobile spawn triggers if msp deployed
if (_Base_1_respawn == 0 && _mobile_spawn == 1 && ((getMarkerPos _Base_1) distance (getMarkerPos _mobile_base_start) > 20)) then
{
	if (_no_enemy_sides == 1 || _no_enemy_sides == 2) then 
	{ 
		r_ms_trig_1 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		r_ms_trig_1 setTriggerType "NONE";
		r_ms_trig_1 setTriggerActivation [_enemy_side_1, "PRESENT", true];
		r_ms_trig_1 setTriggerArea [50, 50, 0, false];
		r_ms_trig_1 setTriggerStatements ["this && !no_base_1", "no_base_1 = true; publicVariable 'no_base_1'",""];

		r_ms_trig_2 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		r_ms_trig_2 setTriggerType "NONE";
		r_ms_trig_2 setTriggerActivation [_enemy_side_1, "NOT PRESENT", true];
		r_ms_trig_2 setTriggerArea [50, 50, 0, false];
		r_ms_trig_2 setTriggerStatements ["this && no_base_1", "no_base_1 = false; publicVariable 'no_base_1'",""];
	};

	if (_no_enemy_sides == 2) then 
	{ 
		r_ms_trig_3 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		r_ms_trig_3 setTriggerType "NONE";
		r_ms_trig_3 setTriggerActivation [_enemy_side_2, "PRESENT", true];
		r_ms_trig_3 setTriggerArea [50, 50, 0, false];
		r_ms_trig_3 setTriggerStatements ["this && !no_base_1b", "no_base_1b = true; publicVariable 'no_base_1b'", ""];

		r_ms_trig_4 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
		r_ms_trig_4 setTriggerType "NONE";
		r_ms_trig_4 setTriggerActivation [_enemy_side_2, "NOT PRESENT", true];
		r_ms_trig_4 setTriggerArea [50, 50, 0, false];
		r_ms_trig_4 setTriggerStatements ["this && no_base_1b", "no_base_1b = false; publicVariable 'no_base_1b'", ""];
	};
};

if (true) exitWith {};
