// Norrn_RespawnPos1
// © JANUARY 2008 - norrin


_name 			= _this select 0;
_pos 			= _this select 1;
_mobile_spawn 	= Norrn_revive_array select 51;

_no_base_2  = no_base_2;
_no_base_2b = no_base_2b;
_no_base_3  = no_base_3;
_no_base_3b = no_base_3b;
_no_base_4  = no_base_4;
_no_base_4b = no_base_4b;					
			
if (_mobile_spawn == 1) then
{	
	if (NORRN_camo_net) then
	{
		_Base_1 = NORRN_revive_array select 13;
		_Base_2 = NORRN_revive_array select 14;
		_Base_3 = NORRN_revive_array select 15;
		_Base_4 = NORRN_revive_array select 16;
	}else{
		_Base_1 = NORRN_revive_array select 14;
		_Base_2 = NORRN_revive_array select 15;							
		_Base_3 = NORRN_revive_array select 16;
		_Base_4 = "";				
		_no_base_2  = no_base_3;
		_no_base_2b = no_base_3b;
		_no_base_3  = no_base_4;
		_no_base_3b = no_base_4b;
	};
};
if (local _name && isplayer _name) then {titleText ["Revive timer has been exceeded. Respawning at marker", "PLAIN", 0.3]};
sleep 2;
_base_1_distance =  _pos distance getMarkerPos _Base_1;
_base_2_distance =  _pos distance getMarkerPos _Base_2;
_base_3_distance =  _pos distance getMarkerPos _Base_3;
_base_4_distance =  _pos distance getMarkerPos _Base_4;
_base_distance = _base_1_distance;
_respawn_base = 1;
if (_base_distance > _base_2_distance && !_no_base_2 && !_no_base_2b) then {_base_distance = _base_2_distance; _respawn_base = 2;};
if (_base_distance > _base_3_distance && !_no_base_3 && !_no_base_3b) then {_base_distance = _base_3_distance; _respawn_base = 3;};
if (_base_distance > _base_4_distance && !_no_base_4 && !_no_base_4b) then {_base_distance = _base_4_distance; _respawn_base = 4;};
sleep 0.01;
[_respawn_base, _name] execVM "f\revive\respawn_at_base.sqf"; 
true;

//file created 080109