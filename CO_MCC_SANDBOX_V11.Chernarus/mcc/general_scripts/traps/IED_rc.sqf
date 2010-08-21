private ["_ied","_side","_size","_rad","_time","_targ","_wait","_near","_nrsd",
"_tmo","_count","_sel","_pos","_tim"];
_ied  = _this select 0;
_side = _this select 1;
_size = _this select 2;
_rad  = _this select 3;
_time = if (count _this > 4) then {_this select 4} else {60};
_trigger = _this select 5;
_ied setvariable ["armed",true,true];
_targ = ["Car","Tank","Man"];

_wait=true;
_tim=5;

while {alive _ied && _wait} do 
	{  
	sleep _tim;
	_tim=_time;
	_near = (getPos _ied) nearObjects 100;
	if(_side countSide _near > 0) then 
		{
		_tmo=600;
		while {(alive _ied) && (_tmo > 0) && (_wait)} do
			{
			sleep 1;
			_near = (getPos _ied) nearObjects (_rad);
			_nrsd = [];
			{if(side _x == _side) then {_nrsd = _nrsd + [_x]}} forEach _near;
			_count=count _nrsd;
			for [{_x=0},{_x<_count},{_x=_x+1}] do
				{
				_sel = _nrsd select _x;
				{if((_sel isKindOf _x) && ((_sel distance _ied) <= _rad) && ((speed _sel) > 2.5) && (triggerActivated _trigger)) exitWith {_wait=false;}} forEach _targ;
				};
			_tmo=_tmo-1;
			};
		};
	};
_ied removeaction disarm;
_cap = _ied getvariable "armed";
if (_cap) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	if (_size == "small") then {[_ied] execvm "mcc\general_scripts\traps\fnc_claymore_detonate.sqf"};
	if (_size == "medium") then {"GrenadeHand" createVehicle _pos;_ied setdammage 1; deletevehicle _ied};
	if (_size == "large") then {"Bo_GBU12_LGB" createVehicle _pos;_ied setdammage 1};
	if (_size == "at") then {[_ied] execvm "mcc\general_scripts\traps\fnc_slam_detonate_side.sqf"};
};

if (!alive _ied && _cap) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	if (_size == "small") then {"GrenadeHand" createVehicle _pos;};
	if (_size == "medium") then {"R_57mm_HE" createVehicle _pos;};
	if (_size == "large") then {"Bo_GBU12_LGB" createVehicle _pos;};
	if (_size == "at") then {"M_TOW_AT" createVehicle _pos;};
};
if (true) exitWith {};