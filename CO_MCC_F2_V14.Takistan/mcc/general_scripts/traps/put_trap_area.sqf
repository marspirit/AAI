disableSerialization;

_pos = _this select 0; 
_trapsx = _this select 1; 
_trapsy = _this select 2; 
_trapdistance = _this select 3; 
_trapsnumber = _this select 4; 
_iedside = _this select 5; 
_trapvolume = _this select 6; 
_trapkind = _this select 7;

_eib_marker = createMarkerLocal ["traps",_pos];
_eib_marker setMarkerShapeLocal "RECTANGLE";
_eib_marker setMarkerSizeLocal [_trapsx, _trapsy];
_eib_marker setMarkerDirLocal 0;
_eib_marker setMarkerColorLocal "ColorBlue";
_eib_marker setMarkertext "traps";
			
	
_pos= getMarkerPos "traps";

  for [{_i=0},{_i<_trapsnumber},{_i=_i+1}] do {
	_count = count _trapkind;
	_random= _trapkind select (random (_count-1));
	_x = _random createVehicle _pos;
	_x setposatl [(_pos select 0) + ((random _trapsx)-(random _trapsx)) ,(_pos select 1) + ((random _trapsy)-(random _trapsy)),_pos select 2];
	_x setVehicleInit "this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]";
publicvariable "disarm";
	_x setdir (random 360);
	_x = [_x,_iedside,_trapvolume,_trapdistance,10] execVM 			"mcc\general_scripts\traps\IED.sqf";
   sleep 0.5;
   };

processInitCommands;
sleep 1;
deletemarker "traps";



	
