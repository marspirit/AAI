//by Bon_Inf*

if(not isServer) exitWith{};

_requestor = _this;

_cannons_to_fire = _requestor getVariable "requesting_cannons";
_cannons_available = _cannons_to_fire;


{
	_available = Server getVariable format["Cannon%1_available",_x];
	if(_available) then{
		_cannonsetup = _requestor getVariable format["Cannon%1",_x];
		Server setVariable [format["Cannon%1_available",_x],false,true];

		[_x,_cannonsetup,_requestor] spawn {
			_cannon = _this select 0;
			_splashpos = (_this select 1) select 0;
			_firedelay = (_this select 1) select 1;
			_artitype = (_this select 1) select 2;
			_nrshells = (_this select 1) select 3;
			_spread = (_this select 1) select 4;

			_requestor = _this select 2;
			_requestor setVariable [format["Cannon%1",_cannon],nil,true];
			_requestor setVariable [format["Cannon%1summary",_cannon],nil,true];

			_shellsleft = Server getVariable "arty_shellsleft";
			Server setVariable ["arty_shellsleft",_shellsleft - _nrshells, true];

			sleep (5 + (random 5) + _firedelay);

			for "_i" from 1 to _nrshells do {

				_arti_type = _artitype;
				if(_arti_type == "ARTI_MIX") then{_arti_type = ["Sh_120_HE","Sh_120_SABOT"] select (_i mod 2)};

				_bomb = _arti_type createVehicle [(_splashpos select 0) + _spread - random (2*_spread),(_splashpos select 1) + _spread - random (2*_spread),100];

				if(_artitype == "G_40mm_HE") then{ // DPICM
					[_bomb,_arti_type,getPos _bomb] spawn {
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
				sleep (5 + random 5);
			};

			sleep 60 * _nrshells;
			Server SetVariable [format["Cannon%1_available",_cannon],true,true];
		};
	}
	else {_cannons_available = _cannons_available - [_x]};
} foreach _cannons_to_fire;

for "_i" from 1 to HW_Arti_CannonNumber do {
	if(not (_i in _cannons_to_fire)) then{
		_requestor setVariable [format["Cannon%1",_i],nil,true];
		_requestor setVariable [format["Cannon%1summary",_i],nil,true];
	};
};


if(true) exitWith{
	_requestor setVariable ["requesting_cannons",nil,true];
	Server setVariable ["arty_requestor",ObjNull,true];
};