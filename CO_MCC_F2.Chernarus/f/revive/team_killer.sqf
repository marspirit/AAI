/*

TEAM KILL PUNISHMENT SCRIPT

This script automatically decreases the revive count of players that team kill 

© JUNE 2009 - norrin 
*************************************************************************************************************************************
team_killer.sqf
*/
_killed 			= _this select 0;
_killer 			= _this select 1;
_ally_side_1 		= NORRN_revive_array select 42;
_ally_side_2 		= NORRN_revive_array select 43;

_ally_side_1 		= call compile format ["%1", _ally_side_1];
_ally_side_2 		= call compile format ["%1", _ally_side_2];

if (_killer != _killed && side _killer == _ally_side_1 || _killer != _killed && side _killer == _ally_side_2) then
{	
	_var = _killer getVariable "NORRN_teamkill_punish";
	_killer setVariable ["NORRN_teamkill_punish", (_var + 1), true];
};
if (true) exitWith {};