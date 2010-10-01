private ["_pos","_trapsx","_trapsy","_trapdistance","_trapsnumber","_iedside",
"_trapvolume","_trapkind","_safeTrapKind","_eib_marker","_dummy","_random","_fakeIed"];
_pos = _this select 0; 
_trapsx = _this select 1; 
_trapsy = _this select 2; 
_trapdistance = _this select 3; 
_trapsnumber = _this select 4; 
_iedside = _this select 5; 
_trapvolume = _this select 6; 
_trapkind = _this select 7;
_safeTrapKind = [];
	  
_eib_marker = createMarkerLocal ["traps",_pos];
_eib_marker setMarkerShapeLocal "RECTANGLE";
_eib_marker setMarkerSizeLocal [_trapsx, _trapsy];
_eib_marker setMarkerDirLocal 0;
_eib_marker setMarkerColorLocal "ColorBlue";
_eib_marker setMarkertext "traps";
			
	
_pos= getMarkerPos "traps";

  for [{_i=0},{_i<_trapsnumber},{_i=_i+1}] do {
	_random= (_trapkind select (random (count _trapkind-1))) select 1;
	if (_trapvolume == "ied_small" ) then //case conseal IEDs
	{
		_fakeIed = _random createVehicle _pos;
		_fakeIed setposatl [(_pos select 0) + ((random _trapsx)-(random _trapsx)) ,(_pos select 1) + ((random _trapsy)-(random _trapsy)),_pos select 2];
		_fakeIed setdir (random 360);
		_dummy = "ACE_Target_CInf" createVehicle _pos;
		_dummy setposatl getposatl _fakeIed;
		[_fakeIed, _dummy] spawn
			{
			private ["_fakeIedS", "_dummyS"];
			_fakeIedS = _this select 0;
			_dummyS = _this select 1;
			waituntil {!alive _dummyS};
			deletevehicle _fakeIedS;
			};
	} else 		//case object
	{
		_dummy = _random createVehicle _pos;
		_dummy setposatl [(_pos select 0) + ((random _trapsx)-(random _trapsx)) ,(_pos select 1) + ((random _trapsy)-(random _trapsy)),_pos select 2];
		_dummy setdir (random 360);
	};
	_dummy setVehicleInit "this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]";
	publicvariable "disarm";
	_dummy = [_dummy,_iedside,_trapvolume,_trapdistance,10] execVM "mcc\general_scripts\traps\IED.sqf";
	_safeTrapKind set [count _safeTrapKind, [_random,_random]];
   sleep 0.5;
   };
   
mcc_safe=mcc_safe + FORMAT ["
						  _pos=%1;
						  _trapsx = %2;
						  _trapsy = %3;
						  _trapdistance=%4;
						  _trapsnumber=%5;
						  _iedside=%6;
						  _trapvolume='%7';
						  _safeTrapKind=%8;
						  [""trap_area"", [_pos, _trapsx, _trapsy, _trapdistance, _trapsnumber, _iedside, _trapvolume, _safeTrapKind]] call CBA_fnc_globalEvent;
						   sleep 1;
						  "								 
						  , _pos
						  , _trapsx
						  , _trapsy
						  , _trapdistance
						  , _trapsnumber
						  , _iedside
						  , _trapvolume
						  , _safeTrapKind
						  ];
processInitCommands;
sleep 1;
deletemarker "traps";



	
