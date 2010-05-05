/*

Go BACK SCRIPT

© JULY 2008 - norrin (norrins_nook@iprimus.com.au) 
****************************************************************************
go_back.sqf
*/
disableserialization;

_no_respawn_points 		= NORRN_revive_array select 12;
_Base_1 				= NORRN_revive_array select 13;
_Base_2 				= NORRN_revive_array select 14;
_Base_3 				= NORRN_revive_array select 15;
_Base_4 				= NORRN_revive_array select 16;
_mobile_spawn 			= NORRN_revive_array select 51;

if (_mobile_spawn == 1) then 
{
	if (NORRN_camo_net) then
	{	
		_no_respawn_points =	NORRN_revive_array select 12;
		_Base_1 = 				NORRN_revive_array select 13;
		_Base_2 = 				NORRN_revive_array select 14;
		_Base_3 = 				NORRN_revive_array select 15;
		_Base_4 = 				NORRN_revive_array select 16;		
	}else{
		_no_respawn_points =	NORRN_revive_array select 12;
		_no_respawn_points = 	_no_respawn_points - 1;
		_Base_1 = 				NORRN_revive_array select 14;
		_Base_2 = 				NORRN_revive_array select 15;
		_Base_3 = 				NORRN_revive_array select 16;	
	};
};

closedialog 0;
switch (_no_respawn_points) do {
	case 1: {_dialog_1 = createDialog "respawn_button_1map"};
	case 2: {_dialog_1 = createDialog "respawn_button_2map"};
	case 3: {_dialog_1 = createDialog "respawn_button_3map"};
	case 4: {_dialog_1 = createDialog "respawn_button_4map"};
};
if (_no_respawn_points > 0) then {ctrlSetText [1, _Base_1]};
if (_no_respawn_points > 1) then {ctrlSetText [2, _Base_2]};
if (_no_respawn_points > 2) then {ctrlSetText [3, _Base_3]};
if (_no_respawn_points > 3) then {ctrlSetText [4, _Base_4]};

if (true) exitWith {};