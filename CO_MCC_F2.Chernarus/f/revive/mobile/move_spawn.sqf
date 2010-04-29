/*
MOVE SPAWN POINT SCRIPT

© norrin, JULY 2009
***********************************************************************************************************************************
move_spawn.sqf
*/

if (!isServer) exitWith {};

ScopeName "r_move_spawn";

_vcl 				= _this select 0;
_mobile_type		= _this select 1;
_c 					= 0;

_Base_1				= NORRN_revive_array select 13;
_Base_respawn		= NORRN_revive_array select 36; 

_no_enemy_sides 	= NORRN_revive_array select 22;
_enemy_side_1 		= NORRN_revive_array select 23;
_enemy_side_2 		= NORRN_revive_array select 24;
_mobile_base_start	= NORRN_revive_array select 52;

_Base_1_respawn		= _Base_respawn select 0;

no_base_1 			= false;
no_base_1b 			= false;

_unit				= "";
_unit 				= format ["%1",_vcl];

sleep 5;

if (_mobile_type == 1) then
{
	if (isnull NORRN_mobile_man) then 
	{
		waitUntil {!isnull NORRN_mobile_man}; 
		_unit = format ["%1",NORRN_mobile_man];
		_vcl = call compile format ["%1", _unit];
	};
};

while {true} do
{	
	if (_mobile_type == 0) then
	{
		if (alive _vcl && NORRN_camo_net && _c == 0) then 
		{ 
			_pos_vcl = getPos _vcl;
			_dir_vcl = getDir _vcl;
		
			//move mobile respawn marker
			_Base_1 setMarkerPos [(_pos_vcl select 0) + 4, (_pos_vcl select 1) + 4, (_pos_vcl select 2) + 4];
			_Base_1 setMarkerText _Base_1;
			_Base_1 setMarkerColor "ColorBlue";
			_Base_1 setMarkerType "Flag1";
			_Base_1 setMarkerSize [0.4, 0.4];
		

			sleep 1;

			if (_no_enemy_sides == 1 && _Base_1_respawn == 0 || _no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 	
				r_ms_trig_1 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_1 setTriggerType "NONE";
				r_ms_trig_1 setTriggerActivation [_enemy_side_1, "PRESENT", true];
				r_ms_trig_1 setTriggerArea [50, 50, 0, false];
				r_ms_trig_1 setTriggerStatements ["this && !no_base_1", "no_base_1 = true; publicVariable 'no_base_1'",""];
			
				sleep 0.1;
			
				r_ms_trig_2 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_2 setTriggerType "NONE";
				r_ms_trig_2 setTriggerActivation [_enemy_side_1, "NOT PRESENT", true];
				r_ms_trig_2 setTriggerArea [50, 50, 0, false];
				r_ms_trig_2 setTriggerStatements ["this && no_base_1", "no_base_1 = false; publicVariable 'no_base_1'",""];
			};
		
			sleep 0.1;
		
			if (_no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 
				r_ms_trig_3 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_3 setTriggerType "NONE";
				r_ms_trig_3 setTriggerActivation [_enemy_side_2, "PRESENT", true];
				r_ms_trig_3 setTriggerArea [50, 50, 0, false];
				r_ms_trig_3 setTriggerStatements ["this && !no_base_1b", "no_base_1b = true; publicVariable 'no_base_1b'", ""];

				sleep 0.1;

				r_ms_trig_4 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_4 setTriggerType "NONE";
				r_ms_trig_4 setTriggerActivation [_enemy_side_2, "NOT PRESENT", true];
				r_ms_trig_4 setTriggerArea [50, 50, 0, false];
				r_ms_trig_4 setTriggerStatements ["this && no_base_1b", "no_base_1b = false; publicVariable 'no_base_1b'", ""];
			};
			_c = 1;
		};
	
		if (alive _vcl && !NORRN_camo_net && _c == 1 || !alive _vcl) then
		{
			_Base_1 setMarkerPos getMarkerPos _mobile_base_start;
			_Base_1 setMarkerText "";
			_Base_1 setMarkerType "Empty";
		
			sleep 1;
		
			if (_no_enemy_sides == 1 && _Base_1_respawn == 0 || _no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 
				if (!isnull r_ms_trig_1) then {deleteVehicle r_ms_trig_1};
				sleep 0.2;
				if (!isnull r_ms_trig_2) then {deleteVehicle r_ms_trig_2};
				sleep 0.2;
			};
		
			if (_no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 
				if (!isnull r_ms_trig_3) then {deleteVehicle r_ms_trig_3};
				sleep 0.2;
				if (!isnull r_ms_trig_4) then {deleteVehicle r_ms_trig_4};
				sleep 0.2;
			};
		
			//reset enemy spawn variables
			no_base_1 = false;
			no_base_1b = false;
			publicVariable "no_base_1";
			publicVariable "no_base_1b";
		
			sleep 1;
			_c = 0;
			if (!alive _vcl) then {breakout "r_move_spawn"};
		};
	
		sleep 2;
	};
	if (_mobile_type == 1) then
	{
		//if (isnull NORRN_mobile_man) then {waitUntil {!isnull NORRN_mobile_man}; _vcl = NORRN_mobile_man};	
				
		if (NORRN_camo_net && _c == 0) then 
		{ 
			_pos_vcl = getPos _vcl;
			_dir_vcl = getDir _vcl;
		
			//move mobile respawn marker
			_Base_1 setMarkerPos [(_pos_vcl select 0) + 4, (_pos_vcl select 1) + 4, (_pos_vcl select 2) + 4];
			_Base_1 setMarkerText _Base_1;
			_Base_1 setMarkerColor "ColorBlue";
			_Base_1 setMarkerType "Flag1";
			_Base_1 setMarkerSize [0.4, 0.4];

			sleep 1;

			if (_no_enemy_sides == 1 && _Base_1_respawn == 0 || _no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 	
				r_ms_trig_1 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_1 setTriggerType "NONE";
				r_ms_trig_1 setTriggerActivation [_enemy_side_1, "PRESENT", true];
				r_ms_trig_1 setTriggerArea [50, 50, 0, false];
				r_ms_trig_1 setTriggerStatements ["this && !no_base_1", "no_base_1 = true; publicVariable 'no_base_1'",""];
			
				sleep 0.1;
			
				r_ms_trig_2 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_2 setTriggerType "NONE";
				r_ms_trig_2 setTriggerActivation [_enemy_side_1, "NOT PRESENT", true];
				r_ms_trig_2 setTriggerArea [50, 50, 0, false];
				r_ms_trig_2 setTriggerStatements ["this && no_base_1", "no_base_1 = false; publicVariable 'no_base_1'",""];
			};
		
			sleep 0.1;
		
			if (_no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 
				r_ms_trig_3 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_3 setTriggerType "NONE";
				r_ms_trig_3 setTriggerActivation [_enemy_side_2, "PRESENT", true];
				r_ms_trig_3 setTriggerArea [50, 50, 0, false];
				r_ms_trig_3 setTriggerStatements ["this && !no_base_1b", "no_base_1b = true; publicVariable 'no_base_1b'", ""];

				sleep 0.1;

				r_ms_trig_4 = createTrigger["EmptyDetector", getMarkerPos _Base_1];
				r_ms_trig_4 setTriggerType "NONE";
				r_ms_trig_4 setTriggerActivation [_enemy_side_2, "NOT PRESENT", true];
				r_ms_trig_4 setTriggerArea [50, 50, 0, false];
				r_ms_trig_4 setTriggerStatements ["this && no_base_1b", "no_base_1b = false; publicVariable 'no_base_1b'", ""];
			};
			_c = 1;
		};
	
		if (!NORRN_camo_net && _c == 1) then
		{
			_Base_1 setMarkerPos getMarkerPos _mobile_base_start;
			_Base_1 setMarkerText "";
			_Base_1 setMarkerType "Empty";
		
			sleep 1;
		
			if (_no_enemy_sides == 1 && _Base_1_respawn == 0 || _no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 
				if (!isnull r_ms_trig_1) then {deleteVehicle r_ms_trig_1};
				sleep 0.2;
				if (!isnull r_ms_trig_2) then {deleteVehicle r_ms_trig_2};
				sleep 0.2;
			};
		
			if (_no_enemy_sides == 2 && _Base_1_respawn == 0) then 
			{ 
				if (!isnull r_ms_trig_3) then {deleteVehicle r_ms_trig_3};
				sleep 0.2;
				if (!isnull r_ms_trig_4) then {deleteVehicle r_ms_trig_4};
				sleep 0.2;
			};
		
			//reset enemy spawn variables
			no_base_1 = false;
			no_base_1b = false;
			publicVariable "no_base_1";
			publicVariable "no_base_1b";
		
			sleep 1;
			_c = 0;
		};
		/*
		if (vehicle _vcl != _vcl) then
		{	
			waitUntil {vehicle _vcl == _vcl};
		};
		*/
		if (!isplayer _vcl) then 
		{	
			waitUntil {!isnull NORRN_mobile_man}; 
			_vcl = NORRN_mobile_man;
		};
		
		if (!alive _vcl && isplayer _vcl)then
		{	
			waitUntil{alive (call compile format ["%1", _unit])};
			_vcl = call compile format ["%1", _unit];
		};
	
		sleep 2;
	};
};
//15/07/09

	
	