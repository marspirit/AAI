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
_sb = _random createunit [_pos, _group,"_null = [this,_iedside,_trapvolume,10,10,_group] execVM ""mcc\general_scripts\traps\IED_sb.sqf"""];
_sb setposatl pos;
_sb setBehaviour "CARELESS";
_sb setCombatMode "BLUE";
_sb setSpeedMode "FULL";
_sb setunitpos "UP";
_sb addrating -1;
