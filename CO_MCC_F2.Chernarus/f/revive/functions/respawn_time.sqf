// respawn_time.sqf
// © JUNE 2009 - norrin

_body 				= _this select 0;
_respawns 			= _this select 1;
_revive_time_limit 	= Norrn_revive_array select 27;

switch (_body getVariable "NORRN_body_part") do 
{	
	case "":			{_revive_time_limit = _revive_time_limit};
	case "hands": 		{_revive_time_limit = _revive_time_limit};
	case "legs":  		{_revive_time_limit = (_revive_time_limit * 4)/5};
	case "body":  		{_revive_time_limit = (_revive_time_limit * 3)/5};
	case "head_hit":	{_revive_time_limit = (_revive_time_limit * 2)/5};
};
if (_respawns == 2) then {_revive_time_limit = (_revive_time_limit/2)};
if (_respawns == 3) then {_revive_time_limit = (_revive_time_limit/3)};
if (_respawns == 4) then {_revive_time_limit = (_revive_time_limit/4)};
if (_respawns == 5) then {_revive_time_limit = (_revive_time_limit/5)};

_revive_time_limit