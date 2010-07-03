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
	_group = creategroup civilian;
	_random= trapkind select (random (_count-1));
	_rpos = [(_pos select 0) + ((random trapsx)-(random trapsx)) ,(_pos select 1) + ((random trapsy)-(random trapsy)),_pos select 2];
	_sb = _random createunit [_rpos, _group,"removeallweapons this; _null = [this,iedside,15,10] execVM ""mcc\general_scripts\traps\cw.sqf"";this addaction [""Neutralize Suspect"",""mcc\general_scripts\traps\neutralize.sqf""]"];
	publicvariable "disarm";
	_sb setposatl _pos;
	_sb addrating -10000;
	_group setBehaviour "AWARE";
	_group setformdir random 360;
	sleep 0.5;
   };

processInitCommands;
sleep 1;
deletemarker "traps";



	
