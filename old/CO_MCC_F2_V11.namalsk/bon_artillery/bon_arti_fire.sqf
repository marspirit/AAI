//by Bon_Inf*

if(not isServer) exitWith{};

private ['_lasertarget'];

_requestor = _this;
_side = side _requestor;

_cannons_to_fire = _requestor getVariable "requesting_cannons";
_cannons_available = _cannons_to_fire;

{//foreach _cannons_to_fire
	_available = Server getVariable format["Arti_%2_Cannon%1_available",_x,_side];
	if(_available) then{
		_cannonsetup = _requestor getVariable format["Arti_%2_Cannon%1",_x,_side];
		Server setVariable [format["Arti_%2_Cannon%1_available",_x,_side],false,true];

		[_x,_cannonsetup,_requestor] spawn {
			_cannon = _this select 0;
			_splashpos = (_this select 1) select 0;
			_firedelay = (_this select 1) select 1;
			_artitype = (_this select 1) select 2;
			_nrshells = (_this select 1) select 3;
			_spread = (_this select 1) select 4;

			_requestor = _this select 2;
			_side = side _requestor;
			_requestor setVariable [format["Arti_%2_Cannon%1",_cannon,_side],nil,true];
			_requestor setVariable [format["Arti_%2_Cannon%1summary",_cannon,_side],nil,true];

			_shellsleft = Server getVariable format["Arti_%1_shellsleft",_side];
			Server setVariable [format["Arti_%1_shellsleft",_side],_shellsleft - _nrshells, true];

			sleep (15 + (random 5) + _firedelay);

			for "_i" from 1 to _nrshells do {

				_lasertarget = _requestor call arti_func_getLaser;
				if(_spread < 0 && isNull _lasertarget) exitWith{};
				if(_spread < 0) then{_splashpos = getPos _lasertarget};

				_bomb = _artitype createVehicle [(_splashpos select 0) + _spread - random (2*_spread),(_splashpos select 1) + _spread - random (2*_spread),100];
				_bomb spawn {
					_bomb = _this;
					_soundsource = "HeliHEmpty" createVehicle position _bomb;
					WaitUntil{(position _bomb select 2)<30};
					_soundsource setPos position _bomb;
					_soundsource setVehicleInit format["this say 'bon_Shell_In_v0%1'",[1,2,3,4,5,6,7] select round random 6];
					processInitCommands;
					sleep 5;
					deleteVehicle _soundsource;
				};

				if(_artitype == "G_40mm_HE") then{ // DPICM
					[_bomb,_artitype,getPos _bomb] spawn {
						_bmb = _this select 0;
						_artype = _this select 1;
						_pos = _this select 2;
						WaitUntil{isNull _bmb};
						for "_j" from 1 to round random 5 do {
							_clusterb = _artype createVehicle [(_pos select 0) + 5 - random 10,(_pos select 1) + 5 - random 10,20];
							sleep (0.5 + random 1);
						};
					};
				};
				sleep (7.5 + random 10);
			};

			sleep (30 * _nrshells);
			Server SetVariable [format["Arti_%2_Cannon%1_available",_cannon,_side],true,true];
		};
	}
	else {_cannons_available = _cannons_available - [_x]};
} foreach _cannons_to_fire;

for "_i" from 1 to HW_Arti_CannonNumber do {
	if(not (_i in _cannons_to_fire)) then{
		_requestor setVariable [format["Arti_%2_Cannon%1",_i,_side],nil,true];
		_requestor setVariable [format["Arti_%2_Cannon%1summary",_i,_side],nil,true];
	};
};


if(true) exitWith{
	_requestor setVariable ["requesting_cannons",nil,true];
	Server setVariable [format["Arti_%1_requestor",_side],ObjNull,true];
};