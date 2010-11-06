disableSerialization;
_pos = _this select 0; 
_iedside = _this select 1; 
_trapkind = _this select 2;

_group = creategroup civilian;
_sb = _trapkind createunit [_pos, _group,"removeallweapons this; _null = [this,_iedside] execVM 'mcc\general_scripts\traps\IED_sb.sqf'",1];
_sb setposatl pos;


