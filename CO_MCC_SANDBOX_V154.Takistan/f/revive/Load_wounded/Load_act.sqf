// Load_act.sqf
// JULY 2009 - norrin

private ["_args","_dragger","_vcl","_wounded"];

_args		= _this select 3;
_dragger 	= _args select 0;
_vcl 		= _args select 1;
_wounded	= _args select 2;
r_drag_sqf 	= false;

_dragger removeAction NORRN_loadWoundedAction;
  
if ((_vcl emptyPositions "cargo") > 0) then
{	
	detach _wounded;
	_dragger setVehicleInit "this switchMove ''";
	_wounded setVariable ["NORRN_LoadVcl", _vcl, true];
	processInitCommands;
	sleep 1;
	_wounded setVehicleInit "nul = [this] execVM 'f\revive\load_wounded\load_wounded.sqf'";
	processInitCommands;
	player removeAction NORRN_dropAction;
}else{
	
	hint "No space left in vehicle";
};
NORRN_load_wounded_action = true;

if (true) exitWith {};