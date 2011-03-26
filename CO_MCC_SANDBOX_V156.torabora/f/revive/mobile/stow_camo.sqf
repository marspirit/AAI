/*
STOW CAMO SCRIPT

© norrin, April 2008
***********************************************************************************************************************************
stow_camo.sqf
*/

_vcl 				= _this select 0;
_pos_vcl 			= getPos _vcl;
_dir_vcl 			= getDir _vcl;

_ammo_crates = nearestObjects [_vcl, ["ReammoBox"], 10];
{deleteVehicle _x} forEach _ammo_crates;
_shed = nearestObject [_vcl, "Land_CamoNetB_NATO"];
deleteVehicle _shed;

//reset enemy spawn variables
no_base_1 = false;
no_base_1b = false;
publicVariable "no_base_1";
publicVariable "no_base_1b";

_vcl setFuel 1;
NORRN_camo_net = false;
publicVariable "NORRN_camo_net";
NORRN_camo_reset = true;
publicVariable "NORRN_camo_reset";
_vcl removeAction NORRN_l_remove_spawn_act;

if (true) exitWith {}; 