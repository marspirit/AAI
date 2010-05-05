// Norrn_LivesRemain
// © JUNE 2009 - norrin

private["_name","_max_respawns","_no_respawns","_respawns_left","_no_left"];

_name 			= _this select 0;
_max_respawns 	= _this select 1;

_no_respawns = (_name getVariable "NORRN_lives_used") + 1;
_respawns_left = _max_respawns - _no_respawns;
_no_left = format ["Lives remaining: %1", _respawns_left];
if (_name == player) then {hint _no_left};
_name setVariable ["NORRN_lives_used", _no_respawns, true];

//file modified 030609