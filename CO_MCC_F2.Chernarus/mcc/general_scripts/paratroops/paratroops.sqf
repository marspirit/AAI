//Initialize
private ["_away","_p_mcc_zone_markername","_helopilot","_helocargo","_pos","_a","_helitype","_heli_pilot","_heli_soldier1","_heli_soldier2","_heli_soldier3","_heli_soldier4","_heli_soldier5","_heli_soldier6","_pilot","_gunner1","_gunner2","_cargo0","_cargo1","_cargo2","_cargo3","_cargo4","_cargo5","_spawn"];
_pos 					= _this select 0;
_a 						= _this select 1;
_b 						= _this select 2;
_p_mcc_zone_markername  = _this select 3;  
_p_mcc_zone_behavior	= _this select 4;
_p_mcc_awareness		= _this select 5;


//_spawn = getpos _helo;  //the spawn marker name
_spawn = [(_pos select 0)+2500,_pos select 1,_pos select 2];
_away  = [(_pos select 0)-2500,_pos select 1,_pos select 2];
switch (_a) do {
		case 1:
			{
			_helopilot = creategroup west; 
			_helocargo = creategroup west;
			_helitype = if (_b==2) then {"C130J"} else {"UH1Y"};
			_heli_pilot = "USMC_Soldier_Pilot";
			_heli_soldier1 = "FR_Commander";
			_heli_soldier2 = "FR_Assault_R";
			_heli_soldier3 = "FR_Assault_GL";
			_heli_soldier4 = "USMC_Soldier_AR";
			_heli_soldier5 = "USMC_Soldier_LAT";
			_heli_soldier6 = "USMC_Soldier_Medic";
			
			};
			
		case 2:
			{
			_helopilot = creategroup east; 
			_helocargo = creategroup east;
			_helitype = if (_b==2) then {"C130J"} else {"Mi24_P"};
			_heli_pilot = "RU_Soldier_Pilot";
			_heli_soldier1 = "RUS_Commander";
			_heli_soldier2 = "RUS_Soldier1";
			_heli_soldier3 = "RUS_Soldier_GL";
			_heli_soldier4 = "MVD_Soldier_MG";
			_heli_soldier5 = "RUS_Soldier_GL";
			_heli_soldier6 = "RUS_Soldier_Sab";
			
			};
				
		case 3:
			{
			_helopilot = creategroup resistance; 
			_helocargo = creategroup resistance;
			_helitype = if (_b==2) then {"C130J"} else {"Mi17_Civilian"};
			_heli_pilot = "GUE_Soldier_Pilot";
			_heli_soldier1 = "GUE_Commander";
			_heli_soldier2 = "GUE_Soldier_1";
			_heli_soldier3 = "GUE_Soldier_AT";
			_heli_soldier4 = "GUE_Soldier_AR";
			_heli_soldier5 = "GUE_Soldier_GL";
			_heli_soldier6 = "GUE_Soldier_Sab";
			};
		default
			{
			_helopilot = creategroup west; 
			_helocargo = creategroup west;
			_helitype = "MH60S";
			_heli_pilot = "USMC_Soldier_Pilot";
			_heli_soldier1 = "FR_Commander";
			_heli_soldier2 = "FR_Assault_R";
			_heli_soldier3 = "FR_Assault_GL";
			};
		};

//Spawn _heloand Crew
_helo= createVehicle [_helitype, _spawn, [], 0, "FLY"];

_pilot = _helopilot createUnit [_heli_pilot, _spawn, [], 0, "NONE"];
_pilot assignAsDriver _helo;
_pilot moveindriver _helo;

_gunner1 = _helopilot createUnit [_heli_pilot, _spawn, [], 0, "NONE"];
_gunner1 assignAsGunner _helo;
_gunner1 MoveInTurret [_helo,[0]];

_gunner2 = _helopilot createUnit [_heli_pilot, _spawn, [], 0, "NONE"];
_gunner2 assignAsGunner _helo;
_gunner2 MoveInTurret [_helo,[1]];

_cargo0 = _helocargo createUnit [_heli_soldier1, _spawn, [], 0, "NONE"];
_cargo0 assignAsCargo _helo;
_cargo0 MoveInCargo [_helo,0];

_cargo1 = _helocargo createUnit [_heli_soldier2, _spawn, [], 0, "NONE"];
_cargo1 assignAsCargo _helo;
_cargo1 MoveInCargo [_helo,1];

_cargo2 = _helocargo createUnit [_heli_soldier3, _spawn, [], 0, "NONE"];
_cargo2 assignAsCargo _helo;
_cargo2 MoveInCargo [_helo,2];

_cargo3 = _helocargo createUnit [_heli_soldier4, _spawn, [], 0, "NONE"];
_cargo3 assignAsCargo _helo;
_cargo3 MoveInCargo [_helo,3];

_cargo4 = _helocargo createUnit [_heli_soldier5, _spawn, [], 0, "NONE"];
_cargo4 assignAsCargo _helo;
_cargo4 MoveInCargo [_helo,4];

_cargo5 = _helocargo createUnit [_heli_soldier6, _spawn, [], 0, "NONE"];
_cargo5 assignAsCargo _helo;
_cargo5 MoveInCargo [_helo,5];
if (_b==2) then 
	{
	_cargo6 = _helocargo createUnit [_heli_soldier2, _spawn, [], 0, "NONE"];
	_cargo6 assignAsCargo _helo;
	_cargo6 MoveInCargo [_helo,6];

	_cargo7 = _helocargo createUnit [_heli_soldier2, _spawn, [], 0, "NONE"];
	_cargo7 assignAsCargo _helo;
	_cargo7 MoveInCargo [_helo,7];

	_cargo8 = _helocargo createUnit [_heli_soldier2, _spawn, [], 0, "NONE"];
	_cargo8 assignAsCargo _helo;
	_cargo8 MoveInCargo [_helo,8];

	_cargo9 = _helocargo createUnit [_heli_soldier2, _spawn, [], 0, "NONE"];
	_cargo9 assignAsCargo _helo;
	_cargo9 MoveInCargo [_helo,9];

	_cargo10 = _helocargo createUnit [_heli_soldier2, _spawn, [], 0, "NONE"];
	_cargo10 assignAsCargo _helo;
	_cargo10 MoveInCargo [_helo,10];
	};





//Set flyinheight here
_helo setBehaviour "CARELESS";
_helo flyInHeight 200;


//Set waypoint

_helopilot move _pos;

waitUntil {(_helo distance _pos) < 500};

[_helocargo,_helo] exec "mcc\general_scripts\paratroops\jump.sqs";


nul = [leader (_helocargo), _p_mcc_zone_markername,_p_mcc_zone_behavior,_p_mcc_awareness,"SHOWMARKER","spawned" ] spawn mcc_ups;

_helopilot move _away;
_pilot domove _away;
waituntil {(_helo distance _away) < 200};
deletevehicle _pilot;
deletevehicle _copilot;
deletevehicle _gunner1;
deletevehicle _gunner2;
deletevehicle _helo;

