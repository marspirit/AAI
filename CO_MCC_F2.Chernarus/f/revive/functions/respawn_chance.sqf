// respawn_chance.sqf
// © JUNE 2009 - norrin

_body 		= _this select 0;
_respawns 	= _this select 1;

switch (_body getVariable "NORRN_body_part") do 
{	
	case "":			{_respawn_chance = 500};
	case "hands": 		{_respawn_chance = 200};
	case "legs":  		{_respawn_chance = 70};
	case "body":  		{_respawn_chance = 50};
	case "head_hit":	{_respawn_chance = 20};
};
if (_respawns == 2) then {_respawn_chance = (_respawn_chance/2)};
if (_respawns == 3) then {_respawn_chance = (_respawn_chance/3)};
if (_respawns == 4) then {_respawn_chance = (_respawn_chance/4)};
if (_respawns == 5) then {_respawn_chance = (_respawn_chance/5)};

_respawn_chance