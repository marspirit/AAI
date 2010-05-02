//by Bon_Inf*

arti_dlgUpdate = compile (preprocessFileLineNumbers "bon_artillery\bon_func_arti_dlgUpdate.sqf");


[] spawn {
	if(isServer) then{
		for "_i" from 1 to HW_Arti_CannonNumber do{
			Server setVariable [format["Cannon%1_available",_i],true,true];
		};
		Server setVariable ["arty_requestor",ObjNull,true];
		[] spawn {
			while{true} do {
				Server setVariable ["arty_shellsleft",HW_number_artilleryshells_per_hour,true];
				if(time>10) then{
					Server setVehicleInit "
						[WEST,'HQ'] sideChat format['Artillery operator: %1 Rounds available.',HW_number_artilleryshells_per_hour];
					"; processInitCommands;
				};
				sleep 3600;
			};
		};
	};
};


if(true) exitWith{};