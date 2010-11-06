//Made by Shay_Gman (c) 09.10
private ["_pos","_trapsx","_trapsy","_trapdistance","_trapsnumber","_iedside",
"_trapvolume","_trapkind","_safeTrapKind","_eib_marker","_dummy","_random","_fakeIed","_arraykind"];
_pos = _this select 0; 
_trapsx = _this select 1; 
_trapsy = _this select 2; 
_trapdistance = _this select 3; 
_trapsnumber = _this select 4; 
_iedside = _this select 5; 
_trapvolume = _this select 6; 
_arraykind = _this select 7 select 0;
_safeTrapKind = [];

_eib_marker = createMarkerLocal ["traps",_pos];
_eib_marker setMarkerShapeLocal "RECTANGLE";
_eib_marker setMarkerSizeLocal [_trapsx, _trapsy];
_eib_marker setMarkerDirLocal 0;
_eib_marker setMarkerColorLocal "ColorBlue";
_eib_marker setMarkertext "traps";
	
switch (_arraykind) do		//Which array of trap are we using?
	{
	   case 0:	//ied_small
	    {
		_trapkind = ied_small;
		};
		
	   case 1:	//ied_medium
	    {
		_trapkind = ied_medium;
		};
		
	   case 2:	//ied_large
	    {
		_trapkind = ied_large;
		};
		
	   case 3:	//U_AMMO
	    {
		_trapkind = U_AMMO;
		};
		
	   case 4:	//ied_wrecks
	    {
		_trapkind = ied_wrecks; 
		};
		
		case 5:	//U_GEN_CAR
	    {
		_trapkind = U_GEN_CAR; 
		};
		
		case 6:	//Mines
	    {
		_trapkind = [[_this select 7 select 1, _this select 7 select 1]]; 
		};
		
		case 7:	//Mines
	    {
		_trapkind = [[_this select 7 select 1, _this select 7 select 1]]; 
		};
					
		default					// Minefield
		{
		_trapkind =[_arraykind, _arraykind];
		};
		
	};
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

processInitCommands;
sleep 1;
deletemarker "traps";



	
