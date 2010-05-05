/*

ISPLAYER SCRIPT

Checks to determine whether the unit isplayer and resets unconcious variable and deletes marker if player no longer present

© JULY 2009 - norrin  

************************************************************************************************************************************
isplayer.sqf
*/
if (!local player) exitWith {};

_names_units 		= _this select 0;
_revive_array 		= NORRN_revive_array;
_can_be_revived 	= _revive_array select 20;
_can_be_revived_2 	= _revive_array select 21;

_units = [];

sleep 5;

{call compile format ["if(!isNull %1) then {_units = _units + [%1]}", _x]} forEach _names_units;

while {true} do
{	
	//hint format ["%1", _units];
	{call compile format ["if(!isNull %1 && %1 in _units) then {}else {_units = _units + [%1]}", _x]}forEach _names_units; 
	{if (!alive _x) then 
	{	
		_mrkr = format ["%1 is down", _x];
		_units = _units - [_x];
		deleteMarker _mrkr;
				
	};}forEach _units;
	sleep 1;						
};
