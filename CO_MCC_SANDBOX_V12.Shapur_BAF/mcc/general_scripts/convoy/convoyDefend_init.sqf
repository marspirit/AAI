
private ["_markerArray", "_isvip", "_car1", "_car2","_car4","_car3", "_car5", "_convoyArray", "_marker", "_activewp", "_wp", "_count","_noleader", "_cargoNum",
"_fillSlots", "_pos", "_locGr", "_cargo", "_spawned" ];
_markerArray = _this select 0;
_isvip = _this select 1; 
_car1 = car1 select 0;
_car2 = car2 select 0;
_car4 = car4 select 0;
_car5 = car5 select 0;

if (_isvip=="0") then {_car3=car3 select 0} else {_car3=car3};
_convoyArray = [_car1, _car2, _car3 , _car4, _car5];

{_cargoNum = _x emptyPositions "cargo"; //populate convoy before kick off
	if (_cargoNum > 0) then
		{
		 _fillSlots = round (random _cargoNum);
		 _pos = getpos _x;
		 _locGr =  _pos findEmptyPosition [10, 100];
		 sleep .2;
		 if (_locGr select 0 > 0)then {
		 _cargo = [_locGr, side _x , _fillSlots,[],[],[],[],[_fillSlots,.5], _dir] call BIS_fnc_spawnGroup;
		 sleep .2;
		 _spawned = _x;
		{_x moveInCargo _spawned;} forEach units _cargo;}}} foreach _convoyArray;
					
					
					
_count= 1;
_noleader = _convoyArray - [_car1];
{[_convoyArray, _count, false]execVm "mcc\general_scripts\convoy\convoy_control.sqf"; _count = _count + 1} forEach _noleader;
{for "_i" from 0 to ((count _markerArray) -1) do {
			_activewp = (_markerArray select _i);
			_wp = (group _x) addWaypoint [ _activewp, 0];
			[(group _x),_i] setWaypointType "MOVE";
			[(group _x),_i] setWaypointCompletionRadius 30;
			[(group _x),_i] setwaypointCombatMode "BLUE";
			[(group _x),_i] setWaypointFormation "FILE";
			[(group _x),_i] setWaypointBehaviour "SAFE";
			};} foreach _convoyArray;
