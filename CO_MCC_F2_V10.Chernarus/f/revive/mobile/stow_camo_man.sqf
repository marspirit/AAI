/*
STOW CAMO MAN SCRIPT

© norrin, AUGUST 2009
***********************************************************************************************************************************
stow_camo.sqf
*/

_vcl 				= _this select 0;
_pos_vcl 			= getPos _vcl;
_dir_vcl 			= getDir _vcl;

clearVehicleInit norrn_mob_mash;
deleteVehicle norrn_mob_mash;

NORRN_camo_net = false;
publicVariable "NORRN_camo_net";
NORRN_camo_reset = true;
publicVariable "NORRN_camo_reset";
_vcl removeAction NORRN_l_remove_spawn_act;

if (true) exitWith {}; 