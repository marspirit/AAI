private ["_plane", "_pos", "_sam_hot_area", "_targetlist", "_targeth", "_targetf", "_cas_name", "_pilotGroup", "_spwankind", "_targetPos1", "_targetPos2", "_targetPos3"];

_cas_name = _this select 0;
_targeth =  _this select 1;
_spawnkind = _this select 2;
_targetf = _this select 3;

//hint format ["Target damage check A: %1", (damage _targeteh)];
//sleep 0.1;

if ( _spawnkind == "Gun-run short" ) then
{
	//server globalChat format ["%1 Clearing target area in 30", _cas_name];
	sleep 30;
	}
	else
	{
	//server globalChat format ["%1 Clearing target area in 90", _cas_name];
	sleep 90;
};

if (!(IsNil "_targeth")) then {_targeth setdamage 1};

//allow time for strafe_cas_target.sqf script to catch up
sleep 5;

if (IsNil "_targeth") then {_targeth = objNull};
deleteVehicle _targeth;
if (IsNil "_targetf") then {_targetf = objNull};
deleteVehicle _targetf;

//server globalChat format ["DEBUG Clear_cas_target script end"];
