private ["_pos", "_coinVehicle", "_coinFunds", "_dummy", "_dummy","_Funds"];

_pos = _this select 0;
_coinVehicle = _this select 1;
_coinFunds = _this select 2;

if (_coinFunds==0) then {_Funds=500} else
	{
	if (_coinFunds<=10) then {_Funds=_coinFunds*1000} else
		{_Funds=(_coinFunds-9)*10000};
	};
	
switch (_coinVehicle) do //Now lets see what are we spawning?
	{
	case 0: //West  
		{
			_dummy = "LAV25_HQ" createvehicle _pos;
			[-2, {hint format ["West side has been granted with %1$", _this]}, _Funds] call CBA_fnc_globalExecute;
		};
	
	case 1: //East  
		{
			_dummy = "BTR90_HQ" createvehicle _pos;
			[-2, {hint format ["East side has been granted with %1$", _this]}, _Funds] call CBA_fnc_globalExecute;
		};
	
	case 2: //Resistance  
		{
			_dummy = "BRDM2_HQ_Gue" createvehicle _pos;
			[-2, {hint format ["Guer side has been granted with %1$", _this]}, _Funds] call CBA_fnc_globalExecute;
		};
	};

_dummy setVehicleInit format ["this addAction [""Deploy HQ"", ""mcc\general_scripts\coin\coin_exec.sqf"", [%1, %2]]",_coinVehicle,_coinFunds];
processinitcommands;
