
#include "script_component.hpp"
/*
	by Sickboy (sb_at_dev-heaven.net)
*/

if (isDedicated) exitWith {}; // not a player machine

private ["_safePos", "_startMarker", "_trainingMode", "_pos"];

waitUntil { alive player };
sleep 3;
if (format["%1",side player]== "WEST") then 
  { 
    
     waitUntil { !(isnil ("MCC_START_WEST"))  };
	_safePos = [(MCC_START_WEST),1,10,1,0,900,0] call BIS_fnc_findSafePos;
	
	player setPos _safepos;
	_startMarkerW = createMarkerLocal ["STARTLOCATIONW", (MCC_START_WEST)];
	_startMarkerW setMarkerShapeLocal "ICON";	
	_startMarkerW setMarkerTypeLocal  "START";
	_startMarkerW setMarkerColorLocal "ColorGreen";

	//create the respawn locations
	_respawnMarkerW = createMarkerLocal ["RESPAWN_WEST", (MCC_START_WEST)];
	_respawnMarkerW setMarkerShapeLocal "ICON";	
	_respawnMarkerW setMarkerTypeLocal  "FLAG";
	_respawnMarkerW setMarkerColorLocal "ColorRed";
  };
if (format["%1",side player]== "EAST") then 
  { 

    waitUntil { !(isnil ("MCC_START_EAST"))  };
	_safePos = [(MCC_START_EAST),1,10,1,0,900,0] call BIS_fnc_findSafePos;

	
	player setPos _safepos;
	_startMarkerE = createMarkerLocal ["STARTLOCATIONE", ( MCC_START_EAST)];
	_startMarkerE setMarkerShapeLocal "ICON";	
	_startMarkerE setMarkerTypeLocal  "START";
	_startMarkerE setMarkerColorLocal "ColorGreen";

	//create the respawn locations
	_respawnMarkerE = createMarkerLocal ["RESPAWN_EAST", ( MCC_START_EAST)];
	_respawnMarkerE setMarkerShapeLocal "ICON";	
	_respawnMarkerE setMarkerTypeLocal  "FLAG";
	_respawnMarkerE setMarkerColorLocal "ColorRed";
  };
if (format["%1",side player]== "GUER") then 
  { 
    
      waitUntil { !(isnil ("MCC_START_GUER"))  };
	_safePos = [(MCC_START_GUER),1,10,1,0,900,0] call BIS_fnc_findSafePos;
	
	player setPos _safepos;
	_startMarkerG = createMarkerLocal ["STARTLOCATIONG", (MCC_START_GUER)];
	_startMarkerG setMarkerShapeLocal "ICON";	
	_startMarkerG setMarkerTypeLocal  "START";
	_startMarkerG setMarkerColorLocal "ColorGreen";

	//create the respawn locations
	_respawnMarkerG = createMarkerLocal ["RESPAWN_GUERRILA", (MCC_START_GUER)];
	_respawnMarkerG setMarkerShapeLocal "ICON";	
	_respawnMarkerG setMarkerTypeLocal  "FLAG";
	_respawnMarkerG setMarkerColorLocal "ColorRed";
  };
// TODO: What about the base respawn markers? What happens when a unit inside the six_sys_bc_safezone that gets respawned? Should test.

// Basicly wait till mission start
 waitUntil { !(isnil ("MCC_TRAINING"))  };

while { true } do
{
    "RESPAWN_GUERRILA" setMarkerPosLocal [-9999, -9999, 0.5];
	"RESPAWN_EAST" setMarkerPosLocal [-9999, -9999, 0.5];
	"RESPAWN_WEST" setMarkerPosLocal [-9999, -9999, 0.5];
	waitUntil { !(alive player) };

    waitUntil { (alive player) && (player isKindOf "CAManBase") };

	
	sleep 1;
	titlecut ["You Died...","BLACK OUT", 3];

	player setCaptive true;
	[player] join ([civilian] call CBA_fnc_getSharedGroup);

	sleep 0.5;
	
	if !(isNil "six_sys_bc_safezone") then
	{
		_pos = getPos six_sys_bc_safezone;
		_pos set [2, (_pos select 2) + 0.35];
		player setPos _pos;
	};

	sleep 2;

    [player, player, "null"] execVM "f\common\f_spect\specta.sqf";

	if !(_trainingMode) exitWith {};
};
