_tpos=_this;
_count = count trapkind;
_random= trapkind select (random (_count-1));
_x = _random createVehicle _tpos;
_x setVehicleInit "disarm = this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]; _ied = [_x,iedside,trapvolume,trapdistance,10] execVM ""mcc\general_scripts\traps\IED.sqf"";";
processInitCommands;
publicvariable "disarm";
_x setposatl _tpos;
_x setdir (random 360);

