// unLoad_act.sqf
// JUNE 2009 - norrin

private ["_args","_dragger","_vcl","_wounded"];

_args		= _this select 3;
_name 		= _args select 0;
_vcl 		= _args select 1;
_crewVcl	= _args select 2;

_name removeAction NORRN_pullOutAction;

for [{ _loop = 0 },{ _loop < count _crewVcl },{ _loop = _loop + 1}] do
{
	_unit = _crewVcl select _loop; 

	if (_unit getVariable "NORRN_AIunconscious") then
	{
		unassignVehicle _unit;
		sleep 0.05;
		_unit action ["EJECT", _vcl];
		sleep 1;
		_unit setVehicleInit "this switchMove r_unc_animation";
		processInitCommands;
		_unit setVariable ["NORRN_unit_dragged", false, true];
	};
	sleep 0.1;
};

if (true) exitWith {};