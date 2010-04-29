/*

 DRAG BODY SCRIPT

 Allows players to drag unconscious bodies 

 AUGUST 2009 - norrin
*****************************************************************************************************************************
Start drag.sqf
*/

private ["_unit","_dragee","_pos","_dir"];
_dragee				= _this select 3;
_can_be_revived 	= NORRN_revive_array select 20;
_can_be_revived_2 	= NORRN_revive_array select 21;
_unit  				= player;

//hint format ["%1", _dragee];

if (isNull _dragee) exitWith {}; 

//player assumes dragging posture
_dragee setVariable ["NORRN_unit_dragged", true, true]; 
_unit playMove "acinpknlmstpsraswrfldnon";
sleep 2;

//unconscious unit assumes dragging posture
_dragee setVehicleInit "this switchmove 'ainjppnemstpsnonwrfldb_still';";		
processInitCommands;

//attach unconscious unit
_dragee attachto [_unit,[0.1, 1.01, 0]];
sleep 0.02;
_dragee setVehicleInit "this setDir 180;";
processInitCommands;
r_drag_sqf 	= true;

//Uneccesary actions removed & drop body added 
player removeAction Norrn_dragAction;
player removeAction Norrn_reviveAction;
NORRN_dropAction = player addAction ["Drop body", "f\revive\drop_body.sqf",_dragee, 0, false, true];
sleep 1;

while {r_drag_sqf} do
{	
	//_anim_name = animationstate _unit; 
	//if (!alive _dragee || _anim_name != "acinpknlmstpsraswrfldnon" && _anim_name != "acinpknlmwlksraswrfldb" || !(_dragee getVariable "NORRN_unconscious")) exitWith
	if (!alive _dragee ||!(_dragee getVariable "NORRN_AIunconscious")) exitWith
	{ 
		player removeAction NORRN_dropAction;
		detach _dragee; 
		_unit setVehicleInit   "this switchMove ''";
		processInitCommands;
		sleep 1;
		r_drag_sqf = false;
	};	 

	//check that dragged unit still exists
	if (!alive _unit) exitWith 
	{	
		player removeAction NORRN_dropAction;
		detach _unit;
		_unit switchMove "";
		sleep 1;
		r_drag_sqf = false;
	};	 	
	sleep 0.1;
};
if (alive _dragee && (_dragee getVariable "NORRN_AIunconscious")) then {_dragee setVehicleinit "this switchMove 'ainjppnemstpsnonwrfldnon'"; processInitCommands;};
if (true) exitWith {};
//170809
