disableSerialization;
private ["_vehicle1","_vehicle2","_vehicle3","_vehicle4","_vehicle5","_pos1","_pos2","_pos3","_pos4",
"_pos5","_faction","_vipclass","_vipcar","_x1","_y1","_x2","_y2","_escort","_driver","_cargo1","_dummy","_cargoNum","_x"];

_vehicle1 = _this select 0; 		//get params
_vehicle2 = _this select 1; 
_vehicle3 = _this select 2;
_vehicle4 = _this select 3;
_vehicle5 = _this select 4;

_pos1 = _this select 5;
_pos2 = _this select 6;
_pos3 = _this select 7;
_pos4 = _this select 8;
_pos5 = _this select 9;

_faction = _this select 10;
_vipclass = _this select 11;
_vipcar = _this select 12;

_x1 = _pos1 select 0;
_y1 = _pos1 select 1;
_x2 = _pos2 select 0;
_y2 = _pos2 select 1;

_angle = (_x2 - _x1) atan2 (_y2 - _y1);			//define convoy heading
if (_angle < 0) then { _angle = 360 + _angle; };

if (_faction=="GUE" || _faction=="GUE" || _faction=="BIS_TK_GUE"|| _faction=="BIS_UN" || _faction=="PMC_BAF") then {
	car1 = [[(_pos1 select 0),(_pos1 select 1)] , _angle, _vehicle1, resistance] call BIS_fnc_spawnVehicle;
	car2 = [(car1 select 0) modelToWorld [0,-25,0] , getdir (car1 select 0), _vehicle2, resistance] call BIS_fnc_spawnVehicle;
	
	if (_vipclass=="0") then 	{ 
		car3 = [(car1 select 0) modelToWorld [0,-50,0]  , getdir (car1 select 0), _vehicle3, resistance] call BIS_fnc_spawnVehicle;
		}
		else {
		car3 = _vipcar createvehicle ((car1 select 0) modelToWorld [0,-50,0]);
		car3 setdir (getdir (car1 select 0)); 
		_escort = creategroup resistance;
		_driver = _escort createUnit ["GUE_Soldier_1", _pos1, [], 0, "CORPORAL"];
		_driver assignAsDriver car3;
		_driver moveindriver car3;
		_cargoNum = car3 emptyPositions "cargo";
		for [{_x=1},{_x<_cargoNum},{_x=_x+1}] do {
				_cargo1 = _escort createUnit ["GUE_Soldier_1", _pos1, [], 0, "CORPORAL"];
				_cargo1 assignAsCargo car3;
				_cargo1 MoveInCargo car3;
				};
		_dummy = _vipclass createunit [_pos1, _escort," this setcaptive true; this assignAsCargo car3;this MoveInCargo car3;_null = this addaction [""Secure Hostage"",'mcc\general_scripts\hostages\hostage.sqf'];
removeAllWeapons this ;this allowFleeing 0 ;"];
			};
		
	car4 = [(car1 select 0) modelToWorld [0,-75,0] , getdir (car1 select 0), _vehicle4, resistance] call BIS_fnc_spawnVehicle;
	car5 = [(car1 select 0) modelToWorld [0,-100,0]  , getdir (car1 select 0), _vehicle5, resistance] call BIS_fnc_spawnVehicle;
	};

if (_faction=="CDF" || _faction=="USMC" || _faction=="BIS_US" || _faction=="BIS_CZ"  || _faction=="BIS_GER" || _faction=="BIS_BAF") then {
	car1 = [[(_pos1 select 0),(_pos1 select 1)] , _angle, _vehicle1, west] call BIS_fnc_spawnVehicle;
	car2 = [(car1 select 0) modelToWorld [0,-25,0] , getdir (car1 select 0), _vehicle2, west] call BIS_fnc_spawnVehicle;
	
	if (_vipclass=="0") then {
		car3 = [(car1 select 0) modelToWorld [0,-50,0]  , getdir (car1 select 0), _vehicle3, west] call BIS_fnc_spawnVehicle
			}
		else { 
		car3 = _vipcar createvehicle ((car1 select 0) modelToWorld [0,-50,0]);
		car3 setdir (getdir (car1 select 0)); 
		_escort = creategroup west;
		_driver = _escort createUnit ["US_Delta_Force_Medic_EP1", _pos1, [], 0, "CORPORAL"];
		_driver assignAsDriver car3;
		_driver moveindriver car3;
		_cargoNum = car3 emptyPositions "cargo";
		for [{_x=1},{_x<_cargoNum},{_x=_x+1}] do {
				_cargo1 = _escort createUnit ["US_Delta_Force_EP1", _pos1, [], 0, "CORPORAL"];
				_cargo1 assignAsCargo car3;
				_cargo1 MoveInCargo car3;
				};
		_dummy = _vipclass createunit [_pos1, _escort," this setcaptive true; this assignAsCargo car3;this MoveInCargo car3;_null = this addaction [""Secure Hostage"",'mcc\general_scripts\hostages\hostage.sqf'];
removeAllWeapons this ;this allowFleeing 0 ;"];
			};
		
	car4 = [(car1 select 0) modelToWorld [0,-75,0] , getdir (car1 select 0), _vehicle4, west] call BIS_fnc_spawnVehicle;
	car5 = [(car1 select 0) modelToWorld [0,-100,0]  , getdir (car1 select 0), _vehicle5, west] call BIS_fnc_spawnVehicle;
	};


if (_faction=="RU" || _faction=="INS" || _faction=="BIS_TK" || _faction=="BIS_TK_INS" ) then {
	car1 = [[(_pos1 select 0),(_pos1 select 1)] , _angle, _vehicle1, east] call BIS_fnc_spawnVehicle;
	car2 = [(car1 select 0) modelToWorld [0,-25,0] , getdir (car1 select 0), _vehicle2, east] call BIS_fnc_spawnVehicle;
	
	if (_vipclass=="0") then	{
		car3 = [(car1 select 0) modelToWorld [0,-50,0]  , getdir (car1 select 0), _vehicle3, east] call BIS_fnc_spawnVehicle;
		}
		else { 
		car3 = _vipcar createvehicle ((car1 select 0) modelToWorld [0,-50,0]);
		car3 setdir (getdir (car1 select 0)); 
		_escort = creategroup east;
		_driver = _escort createUnit ["MVD_Soldier_TL", _pos1, [], 0, "CORPORAL"];
		_driver assignAsDriver car3;
		_driver moveindriver car3;
		_cargoNum = car3 emptyPositions "cargo";
		for [{_x=1},{_x<_cargoNum},{_x=_x+1}] do {
				_cargo1 = _escort createUnit ["MVD_Soldier", _pos1, [], 0, "CORPORAL"];
				_cargo1 assignAsCargo car3;
				_cargo1 MoveInCargo car3;
				};
		_dummy = _vipclass createunit [_pos1, _escort," this setcaptive true; this assignAsCargo car3;this MoveInCargo car3;_null = this addaction [""Secure Hostage"",'mcc\general_scripts\hostages\hostage.sqf'];
removeAllWeapons this ;this allowFleeing 0 ;"];
			};
		
	car4 = [(car1 select 0) modelToWorld [0,-75,0] , getdir (car1 select 0), _vehicle4, east] call BIS_fnc_spawnVehicle;
	car5 = [(car1 select 0) modelToWorld [0,-100,0]  , getdir (car1 select 0), _vehicle5, east] call BIS_fnc_spawnVehicle;
	};

	
if (_faction=="CIV" || _faction=="BIS_CIV_special" || _faction=="BIS_TK_CIV") then {
	car1 = [[(_pos1 select 0),(_pos1 select 1)] , _angle, _vehicle1, civilian] call BIS_fnc_spawnVehicle;
	car2 = [(car1 select 0) modelToWorld [0,-25,0] , getdir (car1 select 0), _vehicle2, civilian] call BIS_fnc_spawnVehicle;
	
	if (_vipclass=="0") then  {
		car3 = [(car1 select 0) modelToWorld [0,-50,0]  , getdir (car1 select 0), _vehicle3, civilian] call BIS_fnc_spawnVehicle;
		}
		else {
		car3 = _vipcar createvehicle ((car1 select 0) modelToWorld [0,-50,0]);
		car3 setdir (getdir (car1 select 0)); 
		_escort = creategroup civilian;
		_driver = _escort createUnit ["Profiteer4", _pos1, [], 0, "CORPORAL"];
		_driver assignAsDriver car3;
		_driver moveindriver car3;
		_cargoNum = car3 emptyPositions "cargo";
		for [{_x=1},{_x<_cargoNum},{_x=_x+1}] do {
				_cargo1 = _escort createUnit ["Profiteer2", _pos1, [], 0, "CORPORAL"];
				_cargo1 assignAsCargo car3;
				_cargo1 MoveInCargo car3;
				};
		_dummy = _vipclass createunit [_pos1, _escort," this setcaptive true; this assignAsCargo car3;this MoveInCargo car3;_null = this addaction [""Secure Hostage"",'mcc\general_scripts\hostages\hostage.sqf'];
removeAllWeapons this ;this allowFleeing 0 ;"];
			};
		
	car4 = [(car1 select 0) modelToWorld [0,-75,0] , getdir (car1 select 0), _vehicle4, civilian] call BIS_fnc_spawnVehicle;
	car5 = [(car1 select 0) modelToWorld [0,-100,0]  , getdir (car1 select 0), _vehicle5, civilian] call BIS_fnc_spawnVehicle;
	};

