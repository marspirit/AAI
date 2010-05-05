/*

RESPAWN COUNTER SCRIPT

© JANUARY 2008 - norrin (norrins_nook@iprimus.com.au) 
*****************************************************
respawn_counter.sqf
*/

if(!isServer) exitWith {};

//Initialise variables for respawn counter
if (time < 2) then
{
	{call compile format ["%1_revives = 0; publicvariable ""%1_revives""", _x]} forEach NORRN_player_units;
	{call compile format ["revive_%1 = 0; publicvariable 'revive_%1' ", _x]} forEach NORRN_player_units;
	{call compile format ["%1_killer = 0; publicVariable '%1_killer'", _x]} forEach NORRN_player_units;
	
};