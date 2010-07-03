/*
DEPLOY CAMO MAN SCRIPT

© norrin, AUGUST 2009 
***********************************************************************************************************************************
deploy_camo.sqf
*/

_vcl 				= _this select 0;
_pos_vcl 			= getPos _vcl;
_dir_vcl 			= getDir _vcl;
norrn_mob_mash		= objNull;

norrn_mob_mash = "MASH" createVehicle _pos_vcl;
publicVariable "norrn_mob_mash";
norrn_mob_mash setDir (_dir_vcl + 90);
norrn_mob_mash setPos [(_pos_vcl select 0) + (sqrt (4) * cos (155 - _dir_vcl)), (_pos_vcl select 1) + (sqrt (4) * sin (155 - _dir_vcl)) , 0];
NORRN_camo_net = true;
publicVariable "NORRN_camo_net";
_vcl removeAction NORRN_l_spawn_act;

sleep 2;
norrn_mob_mash setVehicleInit "this setVehicleVarName 'norrn_mob_mash'";
processInitCommands;

_pos_vcl = getPos player;
_dir_vcl = getDir player;

		
if (true) exitWith {}; 

