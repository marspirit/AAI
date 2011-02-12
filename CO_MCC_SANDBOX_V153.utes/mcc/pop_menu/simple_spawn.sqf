private ["_pos", "_dir","_class","_type","_faction","_unitspawned","_dummy","_notEmpty"];
_pos 	 = _this select 0;
_dir 	 = _this select 1;
_class	 = _this select 2;
_type	 = _this select 3;
_faction = _this select 4;
_notEmpty	 = _this select 5;

switch (_type) do		//Which type do we want
		{
		   case "MAN":	
			{
			if (_faction=="GUE") then {_unitspawned = createGroup resistance;};
			if (_faction=="WEST") then {_unitspawned = createGroup west;};							
			if (_faction=="EAST") then {_unitspawned = createGroup east;};
			if (_faction=="CIV") then {_unitspawned = createGroup civilian;};	
			_dummy = _unitspawned createUnit [_class, _pos, [], 0, "NONE"];
			_dummy setpos _pos;
			_dummy setpos _pos;
			_unitspawned setFormDir _dir;
			};
			
			case "VEHICLE":	
			{
				if (_notEmpty) then
					{
						if (_faction=="GUE") then  {_dummy 		=	[_pos, _dir, _class, resistance] call BIS_fnc_spawnVehicle;};										
						if (_faction=="WEST") then { _dummy 	=	[_pos, _dir, _class, WEST] call BIS_fnc_spawnVehicle;};
						if (_faction=="EAST") then { _dummy 	=	[_pos, _dir, _class, EAST] call BIS_fnc_spawnVehicle;};										
						if (_faction=="CIV") then { _dummy	 	=	[_pos, _dir, _class, civilian] call BIS_fnc_spawnVehicle;};
					} else
					{
						_dummy = _class createvehicle _pos;
						_dummy setpos _pos;
						_dummy setpos _pos;
						_dummy setdir _dir;
					};
			};
			
			case "AMMO":	
			{
				_dummy = _class createvehicle _pos;
				_dummy setpos _pos;
				_dummy setpos _pos;
				_dummy setdir _dir;
			};
			
			case "FIRE":	
			{
				_dummy = "ACE_Target_CInf" createvehicle _pos;
				_dummy setpos _pos;
				_dummy setpos _pos;
				switch (_class) do		//what's burning baby?
					{
					   case "USBasicAmmunitionBox":	
						{
						[-2, {[_this,1.,time,false,false] spawn BIS_Effects_Burn}, _dummy] call CBA_fnc_globalExecute;
						};
						
						case "USLaunchersBox":	
						{
						[-2, {[_this,5,time,false,false] spawn BIS_Effects_Burn}, _dummy] call CBA_fnc_globalExecute;
						};
						
						case "USOrdnanceBox":	
						{
						[-2, {[_this,10,time,false,false] spawn BIS_Effects_Burn}, _dummy] call CBA_fnc_globalExecute;
						};
					};
			};
		};