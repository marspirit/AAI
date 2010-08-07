// Norrn_RespawnPos2Player
// © JULY 2009 - norrin

_unconscious_body 		= _this select 0;
_unconscious_markers 	= Norrn_revive_array select 4;

NORRN_spawn_chosen = false;
titleText ["\n\n\n\n\n\n\n\n\n\nRevive timer has been exceeded. Choose a marker for respawn", "PLAIN", 10];
NORRN_r_time_expire = true;
if (!isNull _unconscious_body) then
{ 
	_unconscious_body setVehicleInit "this switchMove 'Deadstate';";
	processInitCommands;
};
if (_unconscious_markers == 1) then {deleteMarker format["%1 is down", player]};
waitUntil {NORRN_spawn_chosen};
true;	

//file modified 230709