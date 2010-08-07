#define START_EAST 3201

if !mcc_isloading then 
	{
		hint "click on map where you want EAST start location"; 
		
		onMapSingleClick "	
							MCC_START_EAST  = _pos;
							publicVariable ""MCC_START_EAST"";
							mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_EAST setpos %1;
														""							  
														,_pos						
														];
							hint ""Start EAST location updated.""
						";
		 ctrlEnable [START_EAST,false];
		 enable_east=false; 
	};

	


