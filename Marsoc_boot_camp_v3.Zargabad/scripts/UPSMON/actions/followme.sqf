 done
	KRON_UPS_INIT=1;	
};

// ---------------------------------------------------------------------------------------------------------
processInitCommands;

//Executes de main process of server
[] SPAWN MON_MAIN_server;

diag_log "--------------------------------";
diag_log (format["UPSMON started"]);
if(true) exitWith {}; // =========================================================================================================
//  Script for adding the action of follow player.
//  Version: 1.0 
//  Author: Monsada (smirall@hotmail.com)
// ---------------------------------------------------------------------------------------------------------
private ["_side","_soldiers"];
_side = _this select 0;

_soldiers = switch (_side) do {
  case west: {KRON_AllWest};
  case east: {KRON_AllEast};
  case resistance: {KRON_AllRes};
};

{
	if ( leader _x == _x ) then {
		_x addaction ["Order your men to follow me", "scripts\actions\followme.sqf", [], 1, false];
	} else {
		_x addaction ["Follow me", "scripts\actions\followme.sqf", [], 1, false];
	};
}foreach _soldiers;	
 
if (true) exitWith {};
// =========================================================================================================
//  Script for action follow me when surrended,  adds the soldier to player squad in a random choice.
//  Version: 1.0 
//  Author: Monsada (smirall@hotmail.com)
// ---------------------------------------------------------------------------------------------------------
private ["_obj","_caller","_id","_objtype","_rnd","_join","_direction"];
_npc = _this select 0;
_caller = _this select 1;
_id 	= _this select 2;

_rnd = 0;
_join=true;
_npc switchmove "";	

_direction = ((getpos _caller select 0) - (getpos _npc select 0)) atan2 ((getpos _caller select 1) - (getpos _npc select 1));

//If positive values are needed then use:
if(_direction < 0) then {_direction = _direction + 360}; 
_npc setdir _direction;
_npc dowatch _caller;
_npc setSpeedMode "LIMITED";
_npc domove position _caller;	

	
sleep 0.5;

_rnd = random 100;
_npc setmimic "Sad";

if (_rnd <= 30 ) then {
	_npc globalchat "Ok";
};

if (_rnd > 30  && _rnd <= 50) then {
	_npc globalchat "Yes";	
};


if (_rnd > 50  && _rnd <= 100) then {
	_join=false;	
	_rnd = random 100;	
	
	if (_rnd < 20) then {
		_npc setmimic "angry";
		_npc switchmove "CtsPercMstpSnonWnonDnon_idle31rejpaniVnose";	
		_npc globalchat