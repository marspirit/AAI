_pos= _this;
_group = creategroup civilian; 
_dummy = hostage createunit [_pos, _group,"_null = this addaction [""Secure Hostage"",'mcc\general_scripts\hostages\hostage.sqf'];
removeAllWeapons this ;this switchmove ""AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"" ;
this setcaptive true;"];
_dummy setposatl _pos;
if (true) exitWith {};