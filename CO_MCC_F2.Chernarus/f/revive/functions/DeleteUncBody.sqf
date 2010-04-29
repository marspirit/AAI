// Norrn_DeleteUncBody
// © JUNE 2009 - norrin

_unconscious_body = _this select 0;

detach _unconscious_body;
_unconscious_body removeAllEventHandlers "dammaged";
_unconscious_body removeAllEventHandlers "hit";
_unconscious_body setVariable ["NORRN_AIunconscious", false, true];
sleep 1.5;
clearVehicleInit _unconscious_body;
_unconscious_body setPos NORRN_respawn_mrkr;
deleteVehicle _unconscious_body;
_unconscious_body = objNull;
call compile format ["norrn_dead_%1 = objNull", _name];
if (_name == player) then {unconscious_body = objNull}; 

//file modified 120609
