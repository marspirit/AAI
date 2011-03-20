//Made by Shay_Gman (c) 09.10
private ["_pos", "_spawnName", "_spawnFaction","_unitspawned","_iedMarkerName","_groupDir","_nearObjects","_ied","_wp","_dummyAmbush"]; 
disableSerialization;

_pos = _this select 0; 
_spawnName = _this select 1; 
_spawnFaction = _this select 2;
_iedMarkerName = _this select 3 select 0;
_groupDir = _this select 4;
_pointB = _this select 5;
_nearObjects = [];

if (_spawnFaction=="GUE") then
	{_unitspawned=[_pos, resistance, (call compile _spawnName)] call BIS_fnc_spawnGroup;};										
if (_spawnFaction=="WEST") then
	{_unitspawned=[_pos, west, (call compile _spawnName)] call BIS_fnc_spawnGroup;};																				
if (_spawnFaction=="EAST") then
	{_unitspawned=[_pos, east, (call compile _spawnName)] call BIS_fnc_spawnGroup;};										
if (_spawnFaction=="CIV") then
	{_unitspawned=[_pos, civilian, (call compile _spawnName)] call BIS_fnc_spawnGroup;};

_unitspawned setFormDir _groupDir;
sleep 10;
_unitspawned setFormation "LINE";
_unitspawned setBehaviour "STEALTH";	
_unitspawned setSpeedMode "FULL";	
_unitspawned setCombatMode "GREEN";

_dummyAmbush = "ACE_Target_CInf" createVehicle _pos;
_dummyAmbush setvariable ["iedTrigered", false, true]; 

sleep 10;
{		
	[_x,"DOWN"] spawn MON_setUnitPos;			
}foreach units _unitspawned;	

waituntil {_dummyAmbush getvariable "iedTrigered"};
_unitspawned setBehaviour "AWARE";
_unitspawned setCombatMode "RED";
_wp = _unitspawned addWaypoint [_pointB, 0];
{		
	[_x,"MIDDLE"] spawn MON_setUnitPos;			
}foreach units _unitspawned;

[-2, {deletemarkerlocal format ["%1", _this];}, _iedMarkerName] call CBA_fnc_globalExecute;	//delete IED marker 
deletevehicle _dummyAmbush;
