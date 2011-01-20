// Load_wounded.sqf
// JULY 2009 - norrin

private ["_wounded","_vcl","_group"];

_wounded = _this select 0;
if (!local _wounded) exitWith {};

sleep 1;
_vcl = _wounded getVariable "NORRN_loadVcl";
_wounded setVariable ["NORRN_unit_dragged", true, true];

_wounded assignAsCargo _vcl; 
_wounded moveInCargo _vcl;
sleep 1;
_wounded setVehicleInit "this switchMove 'kia_hmmwv_driver';";
processInitCommands;

if (local _wounded) then 
{	
	waitUntil {!(_wounded getVariable "NORRN_unconscious")|| !alive _wounded || vehicle _wounded == _wounded || driver _vcl == _wounded || gunner _vcl == _wounded};
	
	if (driver _vcl == _wounded || gunner _vcl == _wounded) exitWith 
	{
		_wounded action ["EJECT", _vcl];
	};
	
	if (vehicle _wounded != _wounded && alive _wounded) then
	{	
		_wounded  playMove "BasicDriver";
	};
};
sleep 0.01;
if (true) exitWith {};

