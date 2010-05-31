disableSerialization;

_eib_marker = createMarkerLocal ["traps",_this];
_eib_marker setMarkerShapeLocal "ELLIPSE";
_eib_marker setMarkerSizeLocal [1, 1];
_eib_marker setMarkerDirLocal 0;
_eib_marker setMarkerColorLocal "ColorRed";
_eib_marker setMarkertext "traps";
			
	
_pos= getMarkerPos "traps";
_count = count trapkind;
_random= trapkind select (random (_count-1));
_x = _random createVehicle _pos;
_x setposatl _pos;
_x setVehicleInit "this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]";
publicvariable "disarm";
_x setdir (random 360);
_x = [_x,iedside,trapvolume,trapdistance,10] execVM "mcc\general_scripts\traps\IED.sqf";

processInitCommands;

deletemarker "traps";

