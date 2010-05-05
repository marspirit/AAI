// respawn.sqf 
// © JULY 2009 - norrin 

_unit 						= _this select 0;
_respawn_position			= NORRN_revive_array select 28;
_respawn_at_base_addWeapons	= NORRN_revive_array select 11;
_respawn_at_base_magazines 	= NORRN_revive_array select 34;
_respawn_at_base_weapons 	= NORRN_revive_array select 35;
_respawnAtBaseWait			= NORRN_revive_array select 68;

_no_respawn_points 			= NORRN_revive_array select 12;
_Base_1 					= NORRN_revive_array select 13;
_Base_2 					= NORRN_revive_array select 14;
_Base_3 					= NORRN_revive_array select 15;
_Base_4 					= NORRN_revive_array select 16;	

_mobile_spawn				= NORRN_revive_array select 51; 

waitUntil{call compile format["!isNull %1",_unit]};
_name 	= call compile format["%1",_unit];
_unconscious_body = objNull;
_pos = [];

sleep 2;

_base_weps = [];
_base_mags = [];
if (_respawn_at_base_addWeapons == 1 && count _respawn_at_base_magazines == 0 && count _respawn_at_base_weapons == 0) then
{
	_base_weps = weapons _name;
	_base_mags = magazines _name;	
};
hint "No revive";
while {true} do
{	
	
	waitUntil {local (call compile format["%1",_unit])};
	_name = call compile format["%1",_unit];
	waitUntil {!alive _name || !local _name};
	
	if (local _name) then
	{	
		if (_name == player) then {titletext["","BLACK FADED", 5]};
		_pos = getPos _name;
		_weps = weapons _name;
		_mags = magazines _name;	
		waitUntil{alive call compile format["%1",_unit]};
		_name 	= call compile format["%1",_unit];
		
		// Give player weapon and mag loadout they had prior to dying
		removeAllWeapons _name;
		{_name removeMagazine _x} forEach magazines _name;
		removeAllItems _name;
		{_name addMagazine _x} forEach _mags;
		{_name addWeapon _x} forEach _weps;
		_name selectWeapon (primaryWeapon _name);
		
		if (_respawn_position == 2 &&  isplayer _name || _respawn_position == 3 &&  isplayer _name) then
		{
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
			if (_no_respawn_points == 1) then {_dialog_5 = createDialog "respawn_button_1map"};
			if (_no_respawn_points == 2) then {_dialog_5 = createDialog "respawn_button_2map"};
			if (_no_respawn_points == 3) then {_dialog_5 = createDialog "respawn_button_3map"};
			if (_no_respawn_points == 4) then {_dialog_5 = createDialog "respawn_button_4map"};
			if (_no_respawn_points > 0) then {ctrlSetText [1, _Base_1]};
			if (_no_respawn_points > 1) then {ctrlSetText [2, _Base_2]};
			if (_no_respawn_points > 2) then {ctrlSetText [3, _Base_3]};
			if (_no_respawn_points > 3) then {ctrlSetText [4, _Base_4]};
		};
		
		if (_respawn_position == 1) then {_respawn_at_base = [_name, _pos] call Norrn_RespawnPos1};
		// Unit respawns at chosen location if player
		if (_respawn_position == 2 &&  isplayer _name || _respawn_position == 3 &&  isplayer _name) then {_respawn_at_base = [_unconscious_body] call Norrn_RespawnPos2};								
		// Unit respawns closest to leader if not player
		if (_respawn_position == 2 && !isplayer _name || _respawn_position == 3 && !isplayer _name) then {_respawn_at_base = [_name, _pos] call Norrn_RespawnPos2AI};
		
		if ((_respawnAtBaseWait select 1) != 0) then 
		{	
			_timer	= (_respawnAtBaseWait select 1);
			_name disableAI "anim";
			_c = 1;
			_name setCaptive true;
			while {_timer >= 0} do
			{
				if (_c >= 1 ) then
				{	
					if (_name == player) then
					{
						_timer_message = format ["You will respawn in %1 seconds", _timer];
						titletext [_timer_message,"BLACK FADED", 0.3];
					};
					_timer = _timer - 1;
					_c = 0;
				};
				sleep 0.05;
				_c = _c + 0.05;
			};
			_name setCaptive false;
			_name enableAI "anim";
		};
					
		// Add respawn at base weapons if this option is being used
		if (_respawn_at_base_addWeapons == 1) then
		{	
			// Added code for respawning at base with original mission load-out - 260409
			if (count _respawn_at_base_magazines == 0 && count _respawn_at_base_weapons == 0) then
			{
				removeAllWeapons _name;
				{_name removeMagazine _x} forEach magazines _name;
				removeAllItems _name;				
				{_name addMagazine _x} forEach _base_mags;
				{_name addWeapon _x} forEach _base_weps;
				_name selectweapon primaryweapon _name;
			} else {
				removeAllWeapons _name;
				{_name removeMagazine _x} forEach magazines _name;
				removeAllItems _name;								
				{_name addMagazine _x} forEach _respawn_at_base_magazines;
				{_name addWeapon _x} forEach _respawn_at_base_weapons;
				_name selectweapon primaryweapon _name;
			};
		};
	};
	sleep 1;
}; 