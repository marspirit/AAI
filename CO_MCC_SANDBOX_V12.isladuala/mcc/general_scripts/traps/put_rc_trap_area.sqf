disableSerialization;
private ["_eib_marker","_rcside","_roadlist","_pos","_roadnum","_road","_validpos","_rc","_Offset","_z","_tripwire_point_a","_tripwire_point_b","_x1","_x2","_y1","_y2","_pi","_angle","_midpoint","_distance","_trigger","_ied","_eib_marker2"];
_pos = _this select 0; 
_trapsx = _this select 1; 
_trapsy = _this select 2; 
_trapdistance = _this select 3; 
_trapsnumber = _this select 4; 
_iedside = _this select 5; 
_trapvolume = _this select 6; 
_trapkind = _this select 7;

mcc_safe=mcc_safe + FORMAT ["
						  _pos=%1;
						  _trapsx = %2;
						  _trapsy = %3;
						  _trapdistance=%4;
						  _trapsnumber=%5;
						  _iedside=%6;
						  _trapvolume='%7';
						  _trapkind='%8';
						  [""trap_rc_area"", [_pos, _trapsx, _trapsy, _trapdistance, _trapsnumber, _iedside, _trapvolume, _trapkind]] call CBA_fnc_globalEvent;
						   sleep 1;
						  "								 
						  , _pos
						  , _trapsx
						  , _trapsy
						  , _trapdistance
						  , _trapsnumber
						  , _iedside
						  , _trapvolume
						  , _trapkind
						  ];
						  
//markers for first GUI
_eib_marker = createMarkerLocal ["area",_pos];
_eib_marker setMarkerShapeLocal "ELLIPSE";
_eib_marker setMarkerSizeLocal [_trapsx, _trapsx];
_eib_marker setMarkerDirLocal 0;
_eib_marker setMarkerColorLocal "ColorRed";
sleep 0.1;		
	
_pos= getMarkerPos "area";

//define RC side
_rcside = switch (_iedside) do {
	case west: {
		"west"
	};

	case east: {
		"east"
	};
	case resistance: {
		"resistance"
	};
	default {
		"west"
	};
};
_roadlist = _pos nearRoads _trapsx;
if (count _roadlist>0) then 
		{
		for "_x" from 1 to _trapsnumber do
			{        
			 _roadnum = count _roadlist;
			 _road = _roadlist select round(random (_roadnum-1));
			 _roadlist = _roadlist - [_road];
			 _validpos=getpos _road;
			_rc = _trapkind createVehicle _validpos;
			_rc setVehicleInit "this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]";
			publicvariable "disarm";
			_rc setDir (direction _road)-90; //Set the IED facing the road
			_Offset = [0,-7,0]; //Put the IED on the right of the road
			_validpos = _rc modelToWorld _Offset;
			_validpos = _validpos findEmptyPosition [0.1,10]; //Make sure the IED is not in a wall on the road side           
			_rc setposatl _validpos;
			//===make a triger for tripwire contribute to ace claymore=========
			_z = [_rc] call CBA_fnc_realHeight;
			tripwire_point_a = [_validpos select 0, _validpos select 1, _z];
			tripwire_point_b = [(_validpos select 0) + ((sin direction _rc) * 20),(_validpos select 1) + ((cos direction _rc) * 20),_z];
			_x1 = tripwire_point_a select 0;
			_x2 = tripwire_point_b select 0;
			_y1 = tripwire_point_a select 1;
			_y2 = tripwire_point_b select 1;
			_pi = 3.14159265;
			_angle = (sin(_x2-_x1)*cos(_y2)) atan2 (cos(_y1)*sin(_y2)-sin(_y1)*cos(_y2)*cos(_x2-_x1));
			_midpoint = [((_x1 + _x2) / 2), ((_y1 + _y2) / 2), _z];
			_distance = sqrt((_x2 - _x1) ^ 2 + (_y2 - _y1) ^ 2);
			_distance = _distance * 0.5;
			if (_angle < 0) then { _angle = 360 + _angle; };
			_trigger = createTrigger ["EmptyDetector", _midpoint];
			_trigger setpos _midpoint;
			_trigger setTriggerArea [6, _distance, _angle, true];
			_trigger setTriggerActivation [_rcside, "PRESENT", false];
			_ied = [_rc,_iedside,_trapvolume,30,10,_trigger] execVM "mcc\general_scripts\traps\IED_rc.sqf";
			sleep 0.1;
			
			//markers for last GUI   
			_eib_marker2 = createMarkerLocal ["rc",_validpos];
			_eib_marker2 setMarkerShapeLocal "ELLIPSE";
			_eib_marker2 setMarkerSizeLocal [1, 1];
			_eib_marker2 setMarkerDirLocal 0;
			_eib_marker2 setMarkerColorLocal "ColorRed";
			sleep 0.1;			
			deletemarker "rc";
			};
		};

		deletemarker "area";

		processInitCommands;



