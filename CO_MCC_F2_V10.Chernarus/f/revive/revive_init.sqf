/*
  REVIVE_INIT SCRIPT

© JULY 2009 - norrin
******************************************************************************************************************************
Start revive_init.sqf
*/

_JIP_spawn_dialog 			= NORRN_revive_array select 2;
_no_respawn_points 			= NORRN_revive_array select 12;
_Base_1 					= NORRN_revive_array select 13;
_Base_2 					= NORRN_revive_array select 14;
_Base_3 					= NORRN_revive_array select 15;
_Base_4 					= NORRN_revive_array select 16;
_time_b4_JIP_spawn_dialog  	= NORRN_revive_array select 17;
_max_respawns				= NORRN_revive_array select 38;
_mobile_spawn 				= NORRN_revive_array select 51;

//run script that creates all triggers required for the revive script	
[] execVM "f\revive\trigger_mkr.sqf";

sleep 0.1;

//Variables required for onConnect script and triggers
no_base_1 = false;
no_base_2 = false;
no_base_3 = false;
no_base_4 = false;

no_base_1b = false;
no_base_2b = false;
no_base_3b = false;
no_base_4b = false;
if (_max_respawns == 2000) exitWith {};
onConnect = true;
//PublicVariable "onConnect"; not needed, we are local here, trigger will fire anyway

sleep 5;

if (!isNull player && _JIP_spawn_dialog == 1 && time > _time_b4_JIP_spawn_dialog && animationState player != "AmovPpneMstpSnonWnonDnon_healed") then
{	
	// forceMap true;
	// if (local player) then {hint "Press escape to close respawn dialog"};
	titleText ["Choose spawn point or press escape to close dialog and start at current position","PLAIN", 0.5]; 
	
	if (_mobile_spawn == 1) then 
	{
		if (NORRN_camo_net) then
		{	
			_no_respawn_points =		NORRN_revive_array select 12;
			_Base_1 = 				NORRN_revive_array select 13;
			_Base_2 = 				NORRN_revive_array select 14;
			_Base_3 = 				NORRN_revive_array select 15;
			_Base_4 = 				NORRN_revive_array select 16;		
		}else{
			_no_respawn_points =		NORRN_revive_array select 12;
			_no_respawn_points = 		_no_respawn_points - 1;
			_Base_1 = 				NORRN_revive_array select 14;
			_Base_2 = 				NORRN_revive_array select 15;
			_Base_3 = 				NORRN_revive_array select 16;	
		};
	};
	
	switch (_no_respawn_points) do {
		case 1: {_dialog_1 = createDialog "respawn_button_1b";ctrlSetText [1, _Base_1];};
		case 2: {_dialog_1 = createDialog "respawn_button_2b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];};
		case 3: {_dialog_1 = createDialog "respawn_button_3b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];};
		case 4: {_dialog_1 = createDialog "respawn_button_4b";ctrlSetText [1, _Base_1];ctrlSetText [2, _Base_2];ctrlSetText [3, _Base_3];ctrlSetText [4, _Base_4];};
	};
};

if (true) exitWith {};