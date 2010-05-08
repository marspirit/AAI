/* 
Put this attributes at the init of the object you want to act as an IED:
<_ied>= the object name;
<_side>= the side that will activate the IED
<_size> = the size of the epxlosion ("small", "meduim", "large", "at")
<_rad> = the radius witch will detonate the IED
<_time> = delay in seconds where there is no target in proximity of the IED
*/
//if(!isServer) exitWith{};

private ["_ied","_side","_size","_rad","_time","_targ","_eod","_wait","_armed","_near","_nrsd","_detect","_tmo","_count","_sel","_luck","_pos","_tim","_engi"];
_ied  = _this select 0;
_side = if (count _this > 1) then {_this select 1} else {west};
_size = if (count _this > 2) then {_this select 2} else {"Medium"};
_rad  = if (count _this > 3) then {_this select 3} else {15};
_time = if (count _this > 4) then {_this select 4} else {60};
_ied setvariable ["armed",true,true];

// Target classes that will triger the IED                                    
_targ = switch (_side) do {
	case west: {
		["Car","Tank","SoldierWB"]
	};

	case east: {
		["Car","Tank","Ins_Soldier","RUS_Soldier","MVD_Soldier"]
	};
	case resistance: {
		["Car","Tank","GUE_Soldier"]
	};
	default {
		["Car","Tank","Man"]
	};
};

_armed=true;
_wait=true;
_tim=5;

while {alive _ied && _wait} do 
	{  
	sleep _tim;
	_tim=_time;
	_near = (getPos _ied) nearObjects 35;
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
				{if((_sel isKindOf _x) && ((_sel distance _ied) <= _rad) && ((speed _sel) > 2.5))exitWith {_wait=false;}} forEach _targ;
				};
			_tmo=_tmo-1;
			};
		};
	};
_ied removeaction disarm;
_cap = _ied getvariable "armed";
if (_cap && _armed) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	if (_size == "small") then {"GrenadeHand" createVehicle _pos;_ied setdammage 1};
	if (_size == "medium") then {"R_57mm_HE" createVehicle _pos;_ied setdammage 1};
	if (_size == "large") then {"Bo_GBU12_LGB" createVehicle _pos;_ied setdammage 1};
	if (_size == "at") then {"M_TOW_AT" createVehicle _pos;_ied setdammage 1};
};

if (!alive _ied && _armed && _cap) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	if (_size == "small") then {"GrenadeHand" createVehicle _pos;};
	if (_size == "medium") then {"R_57mm_HE" createVehicle _pos;};
	if (_size == "large") then {"Bo_GBU12_LGB" createVehicle _pos;};
	if (_size == "at") then {"M_TOW_AT" createVehicle _pos;};
};
if (true) exitWith {};