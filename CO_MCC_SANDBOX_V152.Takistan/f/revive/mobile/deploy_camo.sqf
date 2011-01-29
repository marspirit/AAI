/*
DEPLOY CAMO SCRIPT

© norrin, April 2008 
***********************************************************************************************************************************
deploy_camo.sqf
*/

_vcl 				= _this select 0;
_pos_vcl 			= getPos _vcl;
_dir_vcl 			= getDir _vcl;

switch (playerSide) do 
{
	case west: {"USBasicAmmunitionBox" createVehicle [_pos_vcl select 0, (_pos_vcl select 1) - 2, (_pos_vcl select 2) - 4];};
	case east: {"RUBasicAmmunitionBox" createVehicle [_pos_vcl select 0, (_pos_vcl select 1) - 2, (_pos_vcl select 2) - 4];};
	case resistance: {"GuerillaCacheBox" createVehicle [_pos_vcl select 0, (_pos_vcl select 1) - 2, (_pos_vcl select 2) - 4];};
};

_vcl setFuel 0;
_camo = "Land_CamoNetB_NATO" createVehicle _pos_vcl;
_camo setDir (_dir_vcl + 90);
_camo setPos [(_pos_vcl select 0) + (sqrt (4) * cos (155 - _dir_vcl)), (_pos_vcl select 1) + (sqrt (4) * sin (155 - _dir_vcl)) , 0];

NORRN_camo_net = true;
publicVariable "NORRN_camo_net";
_vcl removeAction NORRN_l_spawn_act;

if (true) exitWith {}; 

