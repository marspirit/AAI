// init_respawn.sqf 
// © JULY 2009 - norrin 

_heal_yourself = NORRN_revive_array select 8;

//Initialise revive script
{if (!isNull (call compile format ["%1", _x])) then {[_x, NORRN_player_units] execVM "f\revive\respawn\respawn.sqf"}}forEach NORRN_player_units;
	
//Initialise heal script for each player
if (_heal_yourself == 1 && !isNull player) then {[player] execVM "f\revive\heal_sqf\player_heal.sqf"};

if (true) exitWith {};