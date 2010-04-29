/*
 PUT DOWN BODY SCRIPT

 Allows players to drop unconscious bodies

 JUNE 2009 - norrin
*****************************************************************************************************************************
Start putDown_body.sqf
*/

_dragee		= _this select 3; 
_unit 		= player;

player removeAction NORRN_putDownAction; 
//NORRN_remove_drag = true;  
r_carry_sqf = false;

detach _unit;
detach _dragee;

_dragee setVehicleInit "this switchMove r_unc_animation";
_unit setVehicleInit   "this switchMove ''";
processInitCommands;
//NORRN_Dragged_body = objNull;

sleep 8;

if (true) exitWith {};
//010509