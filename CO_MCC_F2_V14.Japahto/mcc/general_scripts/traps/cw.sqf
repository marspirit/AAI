
//if(!isServer) exitWith{};

private ["_suspect","_side","_size","_rad","_time","_dtec","_trg","_targ","_eod","_wait","_wait2","_armed","_near","_nrsd","_detect","_tmo","_count","_sel","_luck","_pos","_tim","_engi"];
_suspect  = _this select 0;
_side = if (count _this > 1) then {_this select 1} else {west};
_rad  = if (count _this > 2) then {_this select 2} else {30};
_time = if (count _this > 3) then {_this select 3} else {20};
_suspect setvariable ["armed",true,true];


//_suspect setcaptive true;


// Edit the targeted vehicles to include only the class types that you included in your mission (for better performance)                                      
_targ = switch (_side) do {
	case west: {
		["Car","SoldierWB"]
	};

	case east: {
		["Car","Ins_Soldier","RUS_Soldier","MVD_Soldier"]
	};
	case resistance: {
		["Car","GUE_Soldier"]
	};
	default {
		["Car"]
	};
};

// =============================Chase script by Shay_Gman=================
                   

_check=true;
while {alive _suspect && _check} do 
	{  
	sleep 1;
	_close = (getPos _suspect) nearObjects 100;
	if(_side countSide _close > 0) then 
		{
		_t=600;
		while {(alive _suspect) && (_check) && (_t > 0)} do
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
					while {alive _suspect && _check} do
						{
						sleep 2;
						_rand = random 10;
							
						if (((_suspect distance _enemy ) <=_rad) &&  (alive _enemy) && (_rand < 4)) then
							{
							_cap = _suspect getvariable "armed";
							_suspect setbehaviour "COMBAT"; 
							if (_cap && alive _suspect) then
								{
									if (!(_suspect hasweapon "Makarov"))
									then
									{
									{_suspect addmagazine
 "8Rnd_9x18_Makarov"} foreach [1,2,3];
									_suspect addweapon "Makarov";
									_suspect selectweapon "Makarov";
									//_suspect setbehaviour "AWARE";
									_suspect say ["pig",5];
									};
								waitUntil{unitReady _suspect};
								sleep 1;
								_suspect dotarget  _enemy;
								waitUntil{unitReady _suspect};
								_suspect dofire  _enemy;
								_check =false;
								};
							};
						}
					};
				} forEach _targ;
				};
			_t=_t-1;
			};
		};
	
	};
if (!alive _suspect) then {_suspect removeaction 0;};
if (damage _suspect < 0.5) then
	{
	_null = [_suspect,iedside,40,10] execVM "mcc\general_scripts\traps\cw.sqf";
	};
if (true) exitWith {};