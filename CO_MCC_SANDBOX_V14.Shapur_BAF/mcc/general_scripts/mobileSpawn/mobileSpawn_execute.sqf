private ["_dummy", "_pos", "_spawnVehicle", "_spawnSide"];

_pos = _this select 0;
_spawnVehicle = _this select 1;
_spawnSide = _this select 2;

FNC_MOBILE_RESPAWN = {
						private ["_dummy", "_respawnMarker", "_respawnStart"];
						_dummy = _this select 0;
						_respawnMarker = _this select 1;
						_respawnStart = _this select 2;
						
						while {(Alive _dummy)} do
							{
								_respawnMarker setMarkerPos getPos _dummy;
								sleep 1;
							};
						_respawnMarker setMarkerPos _respawnStart;
					};
					
_dummy = _spawnVehicle createvehicle _pos;

switch (_spawnSide) do
	{
		case 0:	//West
		{ 
			 [_dummy, "RESPAWN_WEST", MCC_START_WEST] spawn FNC_MOBILE_RESPAWN;
		};
		
		case 1:	//East
		{ 
			 [_dummy, "RESPAWN_EAST", MCC_START_EAST] spawn FNC_MOBILE_RESPAWN;
		};
		
		case 2:	//Resistance
		{ 
			 [_dummy, "RESPAWN_GUERRILA", MCC_START_GUER] spawn MCC_START_GUER;
		};
	};