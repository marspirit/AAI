/*

MISSION END SCRIPT

Ends mission when all units are unconscious

© JUNE 2009 - norrin   
  	
************************************************************************************************************************************
mission_end.sqf
*/
private ["_units", "_no_conscious"]; 

_names_units 			= _this select 0;
_no_conscious 			= 0;

sleep 20;

while {true} do
{	
	_units = [];
	{call compile format ["_units = _units + [%1]", _x]}forEach _names_units;
	_no_conscious = 0;
	{if (isplayer _x && !(_x getVariable "NORRN_unconscious")) then {_no_conscious = 1}}forEach _units;
	//hint format ["%1", _no_conscious];
	if (_no_conscious == 0) exitWith
	{
		mission_Over = true;
		publicVariable "mission_Over";
	};
	sleep 5;
};

if (true) exitWith {};
