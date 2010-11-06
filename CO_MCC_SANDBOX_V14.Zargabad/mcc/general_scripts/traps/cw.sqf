private ["_suspect","_side","_rad","_targ","_count","_pos","_tim","_weapon","_mag","_speed","_behaviour","_startPos"];
_suspect  = _this select 0;
_side = _this select 1;
_rad  = _this select 2;
_weapon = _this select 3;
_mag  = _this select 4;
_suspect setvariable ["armed",true,true];

_targ = ["Car","Man"];
_speed = ["LIMITED","NORMAL","FULL"];
_behaviour = ["CARELESS","SAFE","AWARE","STEALTH"];
_startPos = getPos _suspect;
// =============================Chase script by Shay_Gman=================
 _check=true;
_suspect setBehaviour  (_behaviour select (round (random 4)));
while {alive _suspect && _check} do 
	{  
	sleep 1;
	_close = (getPos _suspect) nearObjects 200;
	if(_side countSide _close > 0) then 
		{
		while {(alive _suspect) && (_check)} do
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
						_rand = random 10;
						_suspect setBehaviour  (_behaviour select (round (random 4)));
						if (_rand > 9.8 && ((_suspect distance _enemy)) >=50) then {
						_suspect setSpeedMode (_speed select (round (random 3)));
						_suspect domove [((_startPos select 0) + 50 - random 100),((_startPos select 1) + 50 - random 100),  _startPos select 2];
						};
						sleep 1;
						if (((_suspect distance _enemy ) <=_rad) &&  (alive _enemy) && (_rand < 3)) then
							{
							_cap = _suspect getvariable "armed";
							_suspect setbehaviour "COMBAT"; 
							if (_cap && alive _suspect) then
								{
									if (!(_suspect hasweapon _weapon)) then {
									{_suspect addmagazine _mag} foreach [1,2,3,4,5];
									_suspect addweapon _weapon;
									_suspect selectweapon _weapon;
									//_suspect setbehaviour "AWARE";
									[[_suspect], ["pig",5]] call CBA_fnc_globalSay;
									
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
			};
		};
	
	};
if (!alive _suspect) then {_suspect removeaction 0;};
if (alive _suspect && damage _suspect < 0.5) then
	{
	_null = [_suspect,iedside,25,_weapon,_mag] execVM "mcc\general_scripts\traps\cw.sqf";
	};
if (true) exitWith {};