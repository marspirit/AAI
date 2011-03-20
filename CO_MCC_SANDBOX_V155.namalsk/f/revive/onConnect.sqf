/*

ONCONNECT SCRIPT

This script gets the current unit status when a player joins the mission

© JULY 2009 - norrin
*************************************************************************************************************************************
onConnect.sqf
*/

_heal_yourself = NORRN_revive_array select 8;
_AI_disabled = getNumber(missionConfigFile >> "AIdisabled"); //missionConfigFile instead of className

if (!isNull player && !alive player) exitWith {titleText ["Unit selected is dead please press escape, return to the unit selection menu and choose the same or another playable unit", "BLACK FADED", 5]}; 		

//Need to keep "respawn" and "Boot_hill" markers at least 100 metres appart 
if (!isNull player && player distance getMarkerPos "Boot_Hill" < 50) exitWith {titleText ["Unit selected is dead please press escape, return to the unit selection menu and choose the same or another playable unit", "BLACK FADED", 10]};
if (!isNull player && player distance getMarkerPos "respawn_west" < 50 || 
	!isNull player && player distance getMarkerPos "respawn_east" < 50 || 
	!isNull player && player distance getMarkerPos "respawn_guerrila" < 50 || 
	!isNull player && player distance getMarkerPos "respawn_civilian" < 50) exitWith
{
	titleText ["Unit selected is unconscious please press escape, return to the unit selection menu and choose another playable unit", "BLACK FADED", 10]
};

//Start revive on server for each unit in NORRN_player_units  if AI is enabled 
if (isServer && !local player) then 
{	
	if (_AI_disabled == 0) then
	{
		{if (!isNull (call compile format ["%1", _x])) then {[_x, NORRN_player_units] execVM "f\revive\Revive_player.sqf"}}forEach NORRN_player_units;
	};	
};
	
//Initialise revive script for all units in players group if AI is enabled
{if (_AI_disabled == 0 && !isNull (call compile format ["%1", _x]) && (call compile format ["%1", _x]) in (units (group player))) then {[_x, NORRN_player_units] execVM "f\revive\Revive_player.sqf"}}forEach NORRN_player_units;

//Initialise revive script for players only if AI is disabled
if (_AI_disabled == 1) then {[player, NORRN_player_units] execVM "f\revive\Revive_player.sqf"};
	
//Initialise heal script for each player
if (_heal_yourself == 1 && !isNull player) then {[player] execVM "f\revive\heal_sqf\player_heal.sqf"};

"r_say" addPublicVariableEventHandler {
	((_this select 1) select 0) say (commentsBrian select ((_this select 1) select 1));
};
	
if (true) exitWith {},
