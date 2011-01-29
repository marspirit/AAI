//Made by Shay_Gman (c) 09.10
private ["_pos", "_trapkind", "_trapvolume", "_IEDExplosionType", "_IEDDisarmTime", "_IEDJammable", "_IEDTriggerType", "_IEDAmbushGroup",
 "_trapdistance", "_iedside", "_iedMarkerName", "_fakeIed", "_dummy", "_eib_marker"]; 
disableSerialization;

_pos = _this select 0; 
_trapkind = _this select 1; 
_trapvolume = _this select 2; 
_IEDExplosionType = _this select 3; 
_IEDDisarmTime = _this select 4; 
_IEDJammable = _this select 5;
_IEDTriggerType = _this select 6;
_trapdistance = _this select 7;
_iedside = _this select 8;
_iedMarkerName = _this select 9;

_eib_marker = createMarkerlocal ["traps",_pos];
_pos= getMarkerPos "traps";

_fakeIed = _trapkind createVehicle _pos;
_fakeIed setposatl _pos;
_dummy = "ACE_Target_CInf" createVehicle _pos;
_dummy attachto [_fakeIed,[0,0,1]];
[_fakeIed, _dummy] spawn
	{
	private ["_fakeIedS", "_dummyS"];
	_fakeIedS = _this select 0;
	_dummyS = _this select 1;
	waituntil {!alive _fakeIedS};
	deletevehicle _dummy;
	};
_dummy setvariable ["fakeIed", _fakeIed ,true];
_dummy setvariable ["armed", true, true];
_dummy setvariable ["disarmTime", _IEDDisarmTime, true];
_dummy setvariable ["iedMarkerName", _iedMarkerName, true];
_dummy setvariable ["iedTrigered", false, true]; 

_dummy setVehicleInit "this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]";
_fakeIed setdir (random 360);

_ok = [_dummy,_trapvolume,_IEDExplosionType,_IEDJammable,_IEDTriggerType,_trapdistance,_iedside] execVM "mcc\general_scripts\traps\IED.sqf";

processInitCommands;

sleep 0.01;
deletemarker "traps";