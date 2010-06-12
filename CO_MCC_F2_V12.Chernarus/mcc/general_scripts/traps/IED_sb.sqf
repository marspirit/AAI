/* tcp_IED.sqf v04 executed from init of object that is the IED
Author: tcp <http://blackop.co.cc> for support
Used examples from Jeevz's Proximity IED, POTS SuicideBomber, Foxhound Random IED, Javhe/HOZ IED, SPON VBIED
To create a proximity IED/Suicide Bomber place in init line of any object where:
<this> is object reference/name
<west,east,guer,civ> is the activating side (1 only)
<"Small","Medium","Large","Huge","Massive"> is the magnitude of explosion
<10> is the radius/proximity for detonation 
<60> is the sleep delay when no onjects of target side are present (improves performance) *note* delaying trigger check and the proximity check creates a gap when IED might miss a target, but unlikely
<["M1151_M2","M1151G_M2"]> is an array of vehicle types that can detect IEDs (after they are active, see below) 3% chance of detection and 20% chance of detonation every half second starting 40 feet out
<trigger1> is a trigger reference/name that has to be activated before IED is considered active/planted
_iedh = [this,west,"Medium",15,60] execVM "tcp_IED.sqf";
_iedh = [this,west,"Medium",15,60,[],trigger1] execVM "tcp_IED.sqf";
_iedh = [this,west,"Medium",15,60,["HMMWV_Armored"],trigger1] execVM "tcp_IED.sqf";
_iedh = [this,west,"Medium",15,60,["M1151_M2","M1151G_M2"]] execVM "tcp_IED.sqf";
By default, IED only set off by Land Vehicles(_targ), can be disarmed by player on foot(_eod), or by shooting/destroying IED or Suicide bomber
10% chance IED disarming will fail, safer to try to destroy it from a distance, however, engineer has 100% success rate. For vehicles, 33% chance IED will not go off if speed under 10mph
Configure class types for target vehicles and EOD personnel below 
*/
//if(!isServer) exitWith{};

private ["_ied","_side","_size","_rad","_time","_dtec","_trg","_targ","_eod","_wait","_wait2","_armed","_near","_nrsd","_detect","_tmo","_count","_sel","_luck","_pos","_tim","_engi"];
_ied  = _this select 0;
_side = if (count _this > 1) then {_this select 1} else {west};
_size = if (count _this > 2) then {_this select 2} else {"Medium"};
_rad  = if (count _this > 3) then {_this select 3} else {15};
_time = if (count _this > 4) then {_this select 4} else {60};
_dtec = if (count _this > 5) then {_this select 5} else {[]};
_ied setvariable ["armed",true,true];
_sound=1; //choose 0 for no sounds

_ied disableai "TARGET";
_ied disableai "AUTOTARGET";
_ied setcaptive true;


// Edit the targeted vehicles to include only the class types that you included in your mission (for better performance)                                      
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
		["Car","Tank"]
	};
};

// The class types able to disarm the IEDs
_eod = switch (_side) do {
	case west: {
		["FR_GL","FR_Assault_GL"]
	};

	case east: {
		[]//"SoldierEB","Ins_Commander","MVD_Soldier_TL","RUS_Commander","RUS_Soldier_TL"]
	};
	case resistance: {
		[]//"GUE_Commander"]
	};
	default {
		[]
	};
};

// Engineer/Demo Expert class types that never fail disarming
_engi = switch (_side) do {
	case west: {
		["USMC_SoldierS_Engineer","FR_Sapper"]
	};

	case east: {
		[]//"Ins_Soldier_Sapper","Ins_Soldier_Sab"," RUS_Soldier_Sab"]
	};
	case resistance: {
		[]//"GUE_Soldier_Sab"]
	};
	default {
		[]
	};
};

if (!isnil "_trg") then {
	_wait=true;
	while {alive _ied && _wait} do {
		sleep _time;
		if(triggerActivated _trg) then {_wait=false;};
	};
};
// =============================Chase script by Shay_Gman=================
                   

_check=true;
while {alive _ied && _check} do 
	{  
	sleep 1;
	_close = (getPos _ied) nearObjects 100;
	if(_side countSide _close > 0) then 
		{
		_t=600;
		while {(alive _ied) && (_check) && (_t > 0)} do
			{
			sleep 1;
			_closeunit = [];
			{if(side _x == _side) then {_closeunit = _closeunit + [_x]}} forEach _close;
			_count=count _closeunit;
			for [{_x=0},{_x<_count},{_x=_x+1}] do
				{
				_enemy = _closeunit select _x;
				{if(_enemy isKindOf _x && _check) then
					{
					while {alive _ied} do
						{
						sleep 3;
						group _ied move [getpos _enemy select 0, getpos _enemy select 1];
						if ((_ied distance _enemy) <=_rad + 15 && _sound == 1) then {_ied say ["suicide",5]; _sound = 0;};			
						if ((_ied distance _enemy) <=_rad) exitwith { _check= false;};
						};
					}
				} forEach _targ;
				};
			_t=_t-1;
			};
		};
	
	};
	_cap = _ied getvariable "armed";
if (_cap) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	if (_size == "small") then {"GrenadeHand" createVehicle _pos;_ied setdammage 1};
	if (_size == "medium") then {"R_57mm_HE" createVehicle _pos;_ied setdammage 1};
	if (_size == "large") then {"M_TOW_AT" createVehicle _pos;_ied setdammage 1};
	if (_size == "huge") then {"Bo_GBU12_LGB" createVehicle _pos;_ied setdammage 1};
	if (_size == "at") then {"M_TOW_AT" createVehicle _pos;_ied setdammage 1};
};

if (!alive _ied && _cap) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	if (_size == "small") then {"GrenadeHand" createVehicle _pos;};
	if (_size == "medium") then {"R_57mm_HE" createVehicle _pos;};
	if (_size == "large") then {"M_TOW_AT" createVehicle _pos;};
	if (_size == "huge") then {"Bo_GBU12_LGB" createVehicle _pos;};
	if (_size == "at") then {"M_TOW_AT" createVehicle _pos;};
};
if (true) exitWith {};