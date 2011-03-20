private ["_pos", "_hostage", "_dir", "_group", "_dummy"];
_pos = _this select 0; 
_hostage = _this select 1 select 0; 
_dir = _this select 2; 

_group = creategroup civilian; 
_dummy = _group createunit [_hostage, _pos,[],0,"NONE"];
_dummy setpos _pos;
_dummy setpos _pos;
_dummy addaction ["Secure Hostage","mcc\general_scripts\hostages\hostage.sqf"];
removeAllWeapons _dummy;
_group setFormDir _dir;
_dummy allowFleeing 0;
_dummy setcaptive true;
sleep 4;
_dummy switchmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
if (true) exitWith {};
