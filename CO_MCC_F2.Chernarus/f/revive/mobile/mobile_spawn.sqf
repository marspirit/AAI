/*
MOBILE SPAWN ACTION SCRIPT

Gives the driver the option to create a respawn base with ammo at position of vehicle

© norrin, JUNE 2009
***********************************************************************************************************************************
mobile_spawn.sqf
*/

_vcl 			= _this select 0;
_unit			= _this select 1;
NORRN_camo_reset 	= false; 
_c 			= 0;

sleep 3;
if (NORRN_camo_net) then {_c = 1};

if (player == _vcl) then
{	
	if (!local player) exitWith{};
	while {true} do
	{
		if (!alive player) then 
		{	
			waitUntil {alive player};
		};
		_pos = getPos player;

		if (speed player == 0 && _c == 0 && !NORRN_camo_net && !(surfaceIsWater (getPos player))) then 
		{
			NORRN_l_spawn_act = player addAction ["Deploy Mobile Respawn Point", "f\revive\mobile\deploy_camo_man.sqf", [_vcl], 10, false, true, ""];
			_c = 1;
 		};
 	
 		if (speed player == 0 && _c == 1 && NORRN_camo_net && player distance norrn_mob_mash <= 7) then 
 		{
			NORRN_l_remove_spawn_act = player addAction ["Stow Mobile Respawn Point", "f\revive\mobile\stow_camo_man.sqf", [_vcl], 10, false, true, ""];
			_c = 2;
		};
		if (speed player != 0 && _c == 1 && !NORRN_camo_net || _c == 1 && surfaceIsWater (getPos player)) then 
		{
			player removeAction NORRN_l_spawn_act;
			if (!NORRN_camo_net) then {_c = 0} else {_c = 1};	
		};
		if (speed player != 0 && _c == 2 && NORRN_camo_net || _c == 2 && NORRN_camo_net && player distance norrn_mob_mash > 7) then 
		{
			player removeAction NORRN_l_remove_spawn_act;
			_c = 1;	
		};
		if (NORRN_camo_reset) then 
		{
			NORRN_camo_reset = false;
			publicVariable "NORRN_camo_reset"; 
			_c = 0; 
		};

		sleep 1;
	};
}else{
	while {alive _vcl} do
	{	
		if (!local _vcl || _unit != driver _vcl|| !isplayer (driver _vcl)) exitWith {};
		
		if (_unit != driver _vcl) exitWith 
		{
			_vcl removeAction NORRN_l_spawn_act;
			_vcl removeAction NORRN_l_remove_spawn_act;	
		};
		_pos = getPos _vcl;

		if (speed _vcl == 0 && _c == 0 && !NORRN_camo_net && !isEngineOn _vcl) then 
		{
			NORRN_l_spawn_act = _vcl addAction ["Deploy Mobile Respawn Point", "f\revive\mobile\deploy_camo.sqf", [_vcl], 10, true, true, ""];
				_c = _c + 1;
 		};
 	
 		if (speed _vcl == 0 && _c == 1 && NORRN_camo_net) then 
 		{
			NORRN_l_remove_spawn_act = _vcl addAction ["Stow Mobile Respawn Point", "f\revive\mobile\stow_camo.sqf", [_vcl], 10, true, true, ""];
			_c = 2;
		};
	
		if (speed _vcl != 0 || isEngineOn _vcl) then 
		{
			_vcl removeAction NORRN_l_spawn_act;
			_vcl removeAction NORRN_l_remove_spawn_act;
			_c = 0;
		};
	
		if (NORRN_camo_reset) then 
		{
			NORRN_camo_reset = false; 
			publicVariable "NORRN_camo_reset";
			_c = 0; 
		};
		sleep 1;
	};
};

if (true) exitWith {}; 