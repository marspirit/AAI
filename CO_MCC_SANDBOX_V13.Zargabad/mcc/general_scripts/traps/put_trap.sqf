private ["_pos", "_trapdistance", "_trapsnumber", "_iedside", "_trapvolume", "_trapkind", "_dummy", "_ok", "_fakeIed"]; 
disableSerialization;

_pos = _this select 0; 
_trapdistance = _this select 1; 
_trapsnumber = _this select 2; 
_iedside = _this select 3; 
_trapvolume = _this select 4; 
_trapkind = _this select 5;

mcc_safe=mcc_safe + FORMAT ["
						  _pos=%1;
						  _trapdistance=%2;
						  _trapsnumber=%3;
						  _iedside=%4;
						  _trapvolume='%5';
						  _trapkind='%6';
						  [""trap_single"", [_pos, _trapdistance, _trapsnumber, _iedside, _trapvolume, _trapkind]] call CBA_fnc_globalEvent;
						   sleep 1;
						  "								 
						  ,_pos
						  , _trapdistance
						  , _trapsnumber
						  , _iedside
						  , _trapvolume
						  , _trapkind
						  ];
						  
_eib_marker = createMarker ["traps",_pos];
_eib_marker setMarkerShape "ELLIPSE";
_eib_marker setMarkerSize [1, 1];
_eib_marker setMarkerDir 0;
_eib_marker setMarkerColor "ColorRed";
_eib_marker setMarkertext "traps";
			
	
_pos= getMarkerPos "traps";
if (_trapvolume == "ied_medium" || _trapvolume == "ied_small" ) then //case conseal IEDs
	{
		_fakeIed = _trapkind createVehicle _pos;
		_fakeIed setposatl _pos;
		_dummy = "ACE_Target_CInf" createVehicle _pos;
		_dummy setposatl _pos;
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
		_dummy = _trapkind createVehicle _pos;
		_dummy setposatl _pos;
	};

_dummy setVehicleInit "this addaction [""Disarm explosive"",""mcc\general_scripts\traps\ied_disarm.sqf""]";
publicvariable "disarm";
_dummy setdir (random 360);
_ok = [_dummy,_iedside,_trapvolume,_trapdistance,10] execVM "mcc\general_scripts\traps\IED.sqf";

processInitCommands;

sleep 0.01;
deletemarker "traps";

