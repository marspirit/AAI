/*
 DROP BODY SCRIPT

 Allows players to drop unconscious bodies

 JUNE 2009 - norrin
*****************************************************************************************************************************
Start drop_body.sqf
*/

_dragee	= _this select 3; 

player removeAction NORRN_dropAction; 
NORRN_remove_drag = true;  
r_drag_sqf = false;
_unit = player;

detach _unit;
detach _dragee;

_dragee setVehicleInit "this switchMove r_unc_animation";
_unit setVehicleInit   "this switchMove ''";
processInitCommands;
NORRN_Dragged_body = objNull;
_dragee setVariable ["NORRN_unit_dragged", false, true]; 
sleep 8;

if (true) exitWith {};
//210609