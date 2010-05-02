// F2A2 - ShackTactical Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grp","_mkrType","_mkrText","_mkrColor","_mkrName","_mkr"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_grp = _this select 0;
_mkrType = _this select 1;
_mkrText = _this select 2;
_mkrColor = _this select 3;
_mkrName = str format ["mkr_%1",_grp];

// ====================================================================================

// EXIT FOR EMPTY GROUPS (PART I)
// If the group is empty, this script exits.

if ((count (units _grp)) == 0) then
	{
	if (true) exitWith {};
	}
	else
	{

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.

		switch (_mkrType) do
		{
		
		// Add cases for mmg team gunner, mmat team gunner
		
// Platoon HQ
			case 0:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_HQ";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Squad Leader
			case 1:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_HQ";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Fireteam
			case 2:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_INF";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Medium MG
			case 3:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_INF";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Medium AT
			case 4:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_EMPTY";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Heavy AT
			case 5:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_EMPTY";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Sniper Team
			case 6:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_RECON";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Heavy MG
			case 7:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_EMPTY";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
		};

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the group leader is alive) the marker 
// position is updated periodically. This only happens locally - so as not to burden 
// the server.

		for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
		{
			if (alive leader _grp) then 
			{
			_mkrName setMarkerPosLocal [(getPos leader _grp select 0),(getPos leader _grp select 1)];
			};
			sleep 6;
		};

// ====================================================================================

// EXIT FOR EMPTY GROUPS (PART II)
// If the group is empty, this script exits.

	};

// ====================================================================================

if (true) exitWith {};

		
