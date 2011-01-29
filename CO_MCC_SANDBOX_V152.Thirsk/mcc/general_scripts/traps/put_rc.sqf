//Made by Shay_Gman (c) 09.10
private ["_pos", "_trapkind", "_iedMarkerName", "_fakeIed", "_eib_marker","_iedDir"]; 
disableSerialization;

_pos = _this select 0; 
_trapkind = _this select 1; 
_iedMarkerName = _this select 2;
_iedDir = _this select 3;

_eib_marker = createMarkerlocal ["traps",_pos];
_pos= getMarkerPos "traps";

_fakeIed = _trapkind createVehicle _pos;
_fakeIed setposatl _pos;

_fakeIed setvariable ["iedTrigered", false, true]; 
_fakeIed setdir _iedDir;
_fakeIed setVehicleInit format ["this setVariable [""direction"", %1];", _iedDir];
[_fakeIed, _iedMarkerName] spawn
	{
	private ["_fakeIedS", "_iedMarkerNameS"];
	_fakeIedS = _this select 0;
	_iedMarkerNameS = _this select 1;
	waituntil {!alive _fakeIedS};
	[-2, {deletemarkerlocal format ["%1", _this];}, _iedMarkerNameS] call CBA_fnc_globalExecute;	//de;ete IED marker 
	_fakeIedS setvariable ["iedTrigered", true, true]; 
	};


processInitCommands;

sleep 0.01;
deletemarker "traps";