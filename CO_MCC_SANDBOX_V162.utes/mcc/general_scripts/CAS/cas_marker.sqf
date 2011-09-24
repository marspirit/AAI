// F2A2 - ShackTactical Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

//#include "\f\common\f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_plane","_mkrType","_mkrText","_mkrColor","_ammount","_mkrName","_mkr","_grpName"];

// ====================================================================================

_plane = _this select 0;
_mkrType = _this select 1;
_mkrText = _this select 2;
_mkrColor = _this select 3;
_ammount = _this select 4;
_mkrName = format ["mkr_%1",_plane];

_mkr = createMarker [_mkrName,[(getPos _plane select 0),(getPos _plane select 1)]];
_mkr setMarkerShape "ICON";
_mkrName setMarkerType _mkrType;
_mkrName setMarkerColor _mkrColor;
_mkrName setMarkerSize [0.8, 0.8];
_mkrName setMarkerText _mkrText;

//_mkr = createMarkerLocal [_mkrName,[(getPos _plane select 0),(getPos _plane select 1)]];
//_mkr setMarkerShapeLocal "ICON";
//_mkrName setMarkerTypeLocal "B_AIR";
//_mkrName setMarkerColorLocal _mkrColor;
//_mkrName setMarkerSizeLocal [0.8, 0.8];
//_mkrName setMarkerTextLocal _mkrText;

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the group leader is alive) the marker 
// position is updated periodically. This only happens locally - so as not to burden 
// the server.

for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
{
	if (alive _plane) then 
	{
		_mkrName setMarkerPos [(getPos _plane select 0),(getPos _plane select 1)];
		sleep 1.2;
	}
	else 
	{
		deleteMarker _mkrName;
		if ( _mkrText == format ["Warthog %1",_ammount] ) then
		{
			GunRunBusy set [_ammount, 0];
			[playerSide,'HQ'] sideChat format ["%1 available for CAS support again", _mkrText];
		};
		_i = 20000;
		if (true) exitWith {};
	};
};

//hint "full stopped";