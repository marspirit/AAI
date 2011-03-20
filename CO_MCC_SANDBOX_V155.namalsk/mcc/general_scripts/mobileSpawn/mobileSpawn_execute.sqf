private ["_dummy", "_pos", "_spawnVehicle", "_spawnSide"];

_pos = _this select 0;
_spawnVehicle = _this select 1;
_spawnSide = _this select 2;
	
_dummy = _spawnVehicle createvehicle _pos;

switch (_spawnSide) do
	{
		case 0:	//West
		{ 
			[-2, {_this spawn FNC_MOBILE_RESPAWN}, [_dummy, "RESPAWN_WEST", MCC_START_WEST]] call CBA_fnc_globalExecute;
		};
		
		case 1:	//East
		{ 
			[-2, {_this spawn FNC_MOBILE_RESPAWN}, [_dummy, "RESPAWN_EAST", MCC_START_EAST]] call CBA_fnc_globalExecute;
		};
		
		case 2:	//Resistance
		{ 
			[-2, {_this spawn FNC_MOBILE_RESPAWN}, [_dummy, "RESPAWN_GUERRILA", MCC_START_GUER]] call CBA_fnc_globalExecute;
		};
	};