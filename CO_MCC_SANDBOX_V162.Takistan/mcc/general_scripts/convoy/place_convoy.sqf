disableSerialization;
private ["_vehicle1","_vehicle2","_vehicle3","_vehicle4","_vehicle5","_pos1","_pos2","_pos3","_pos4","_escrot","_escrotDriver",
"_pos5","_faction","_vipclass","_vipcar","_x1","_y1","_x2","_y2","_group","_driver","_cargo1","_dummy","_cargoNum","_x"];

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

_side = _this select 10;
_vipclass = _this select 11;
_vipcar = _this select 12;

_x1 = _pos1 select 0;
_y1 = _pos1 select 1;
_x2 = _pos2 select 0;
_y2 = _pos2 select 1;

_angle = (_x2 - _x1) atan2 (_y2 - _y1);			//define convoy heading
if (_angle < 0) then { _angle = 360 + _angle; };

switch (toLower _side) do	{
	case "west": {_side =  west; _escrot = "FR_Assault_R"; _escrotDriver = "FR_Commander"};
	case "east": {_side =  east;  _escrot = "MVD_Soldier"; _escrotDriver = "RUS_Commander"};
	case "gue": {_side =  resistance;  _escrot = "GUE_Soldier_1"; _escrotDriver = "GUE_Soldier_CO"};
	case "civ": {_side =  civilian;  _escrot = "Policeman"; _escrotDriver = "Policeman"};
	};
			
car1 = [[(_pos1 select 0),(_pos1 select 1)] , _angle, _vehicle1, _side] call BIS_fnc_spawnVehicle;
car2 = [(car1 select 0) modelToWorld [0,-25,0] , getdir (car1 select 0), _vehicle2, _side] call BIS_fnc_spawnVehicle;

if (_vipclass=="0") then 	{ 
	car3 = [(car1 select 0) modelToWorld [0,-50,0]  , getdir (car1 select 0), _vehicle3, _side] call BIS_fnc_spawnVehicle;
	}
	else {
		car3 = _vipcar createvehicle ((car1 select 0) modelToWorld [0,-50,0]);
		car3 setdir (getdir (car1 select 0)); 
		_group = creategroup _side; 
		_driver = _group createUnit [_escrotDriver, _pos1, [], 0, "CORPORAL"];
		_driver assignAsDriver car3;
		_driver moveindriver car3;
		_cargoNum = car3 emptyPositions "cargo";
		for [{_x=1},{_x<_cargoNum-1},{_x=_x+1}] do {
				_cargo1 = _group createUnit [_escrot, _pos1, [], 0, "CORPORAL"];
				_cargo1 assignAsCargo car3;
				_cargo1 MoveInCargo car3;
				};
		_dummy = _vipclass createunit [_pos1, _group," this setcaptive true; this assignAsCargo car3;this MoveInCargo car3;_null = this addaction [""Secure Hostage"",'mcc\general_scripts\hostages\hostage.sqf'];
	removeAllWeapons this ;this allowFleeing 0 ;"];
	};
	
car4 = [(car1 select 0) modelToWorld [0,-75,0] , getdir (car1 select 0), _vehicle4, _side] call BIS_fnc_spawnVehicle;
car5 = [(car1 select 0) modelToWorld [0,-100,0]  , getdir (car1 select 0), _vehicle5, _side] call BIS_fnc_spawnVehicle;


