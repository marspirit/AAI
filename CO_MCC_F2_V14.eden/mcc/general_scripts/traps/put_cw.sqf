disableSerialization;

_pos = _this select 0; 
_trapsx = _this select 1; 
_trapsy = _this select 2; 
_trapdistance = _this select 3; 
_trapsnumber = _this select 4; 
_iedside = _this select 5; 
_trapvolume = _this select 6; 
_trapkind = _this select 7;

_count = count _trapkind;
_random= _trapkind select (random (_count-1));
_group = creategroup civilian;
_sb = _random createunit [_pos, _group,"removeallweapons this; _null = [this,_iedside,10,10] execVM ""mcc\general_scripts\traps\cw.sqf"";this addaction [""Neutralize Suspect"",""mcc\general_scripts\traps\neutralize.sqf""]; this addrating -1; this allowfleeing 0;this setbehaviour ""CARELESS"";",1];
publicvariable "disarm";
_sb setposatl _pos;
_group setformdir random 360;
