disableSerialization;


_eib_marker = createMarkerLocal ["traps",_this];
_eib_marker setMarkerShapeLocal "RECTANGLE";
_eib_marker setMarkerSizeLocal [trapsx, trapsy];
_eib_marker setMarkerDirLocal 0;
_eib_marker setMarkerColorLocal "ColorBlue";
_eib_marker setMarkertext "traps";
			
	
_pos= getMarkerPos "traps";

  for [{_i=0},{_i<trapsnumber},{_i=_i+1}] do {
	_count = count trapkind;
	_random= trapkind select (random (_count-1));
	_x = _random createVehicle _pos;
	_x setposatl [(_Pos select 0) + ((random trapsx)-(random trapsx)) ,(_Pos select 1) + ((random trapsy)-(random trapsy)),_Pos select 2];
	_x setVehicleInit "this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]";
publicvariable "disarm";
	_x setdir (random 360);
	_x = [_x,iedside,trapvolume,trapdistance,10] execVM 			"mcc\general_scripts\traps\IED.sqf";
   sleep 0.5;
   };

processInitCommands;
sleep 1;
deletemarker "traps";



	
