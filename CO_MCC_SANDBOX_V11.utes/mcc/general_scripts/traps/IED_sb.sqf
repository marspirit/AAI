private ["_ied","_side","_size","_rad","_targ","_count","_pos", "_enemy"];
_ied  = _this select 0;
_side = _this select 1;
_ied setvariable ["armed",true,true];
_sound=1; //choose 0 for no sounds
_targ = ["Car","Tank","Man"];
_rad = 10;

// =============================Chase script by Shay_Gman=================
                   

_check=true;
_l = 1;
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
					_ied setspeedmode "FULL";
					_ied setBehaviour "AWARE";
					_ied setunitpos "UP";
					_ied disableAI "TARGET";
					_ied disableAI "AUTOTARGET";
					_ied setskill 0.1;
					(group _ied) setCombatMode "RED";
					(group _ied) allowFleeing 0;
					while {alive _ied} do
						{
						_l= _l +1;
						sleep 1;
						_ied domove (getpos _enemy);
						if ((_ied distance _enemy) <=_rad + 10 && _sound == 1) then {_ied say ["suicide",15]; _sound = 0;};			
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
	"R_57mm_HE" createVehicle _pos;
	_ied setdammage 1;
	};

if (!alive _ied && _cap) then {
	_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];
	"R_57mm_HE" createVehicle _pos;
	_ied setdammage 1;
	};
if (true) exitWith {};