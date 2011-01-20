disableSerialization;

_pos = _this select 0; 
_hostage = _this select 1 select 0; 

_group = creategroup civilian; 
_dummy = _hostage createunit [_pos, _group,"_null = this addaction [""Secure Hostage"",'mcc\general_scripts\hostages\hostage.sqf'];
removeAllWeapons this ;this switchmove ""AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"";this allowFleeing 0 ; this setcaptive true;"];
if (true) exitWith {};