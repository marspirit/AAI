private ["_ied","_side","_size","_targ","_count","_pos", "_enemy","_sbspeed","_sound","_armed","_behaviour"];
_ied  = _this select 0;
_side = _this select 1;
_ied setvariable ["armed",true,true];
_sound=1; //choose 0 for no sounds
_targ = ["Car","Tank","Man"];
_sbspeed = ["LIMITED","NORMAL","FULL"];
_behaviour = ["CARELESS","SAFE","AWARE","STEALTH"];
_armed = true;

// =============================Chase script by Shay_Gman=================
                   

_check=true;
_l = 1;
_ied setBehaviour  (_behaviour select (round (random 4)));
while {alive _ied && _check} do 
	{  
	sleep 1;
	_close = (getPos _ied) nearObjects 150;
	if(_side countSide _close > 0) then 
		{
		_t=600;
		while {(alive _ied) && (_check) && (_t > 0)} do
			{
			sleep 2;
			_closeunit = [];
			{if(side _x == _side) then {_closeunit = _closeunit + [_x]}} forEach _close;
			_count=count _closeunit;
			for [{_x=0},{_x<_count},{_x=_x+1}] do
				{
				_enemy = _closeunit select _x;
				{if(_enemy isKindOf _x && _check) then
					{
					sleep 1;
					if (random 10 < 2) then {_ied setSpeedMode (_sbspeed select (round (random 3)));
					_ied setBehaviour  (_behaviour select (round (random 4)));};
					_ied domove (getpos _enemy);
					sleep random 10;
					if ((_ied distance _enemy) < 60) then {
							_ied setspeedmode "FULL";
							_ied setBehaviour "AWARE";
							_ied setunitpos "UP";
							_ied disableAI "TARGET";
							_ied disableAI "AUTOTARGET";
							_ied setskill 0.1;
							(group _ied) setCombatMode "RED";
							(group _ied) allowFleeing 0;
							while {alive _ied} do{
								_l= _l +1;
								sleep 1;
								_ied domove (getpos _enemy);
								if (_sound == 1) then {[[_ied], ["suicide",15]] call CBA_fnc_globalSay;_sound = 0;};
								if ((_ied distance _enemy) <=30) exitwith { _check= false;};
								};
							};
					}
				} forEach _targ;
				};
			_t=_t-1;
			};
		};
	
	};
_cap = _ied getvariable "armed";

if (_cap && _armed) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	"Sh_85_HE" createVehicle _pos;
	_armed=false;
	};

if (!alive _ied && _armed && _cap) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	"Sh_85_HE" createVehicle _pos;
	_ied setdammage 1;
	};


if (true) exitWith {};