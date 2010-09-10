#define START_GUE 3202
if !mcc_isloading then 
	{
		hint "click on map where you want Indepence start location"; 
		
		onMapSingleClick "	
							MCC_START_GUER  = _pos;
							publicVariable ""MCC_START_GUER"";
							mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_GUER setpos %1;
														""							  
														,_pos						
														];
							hint ""Start GUER location updated.""
						";
		ctrlEnable [START_GUE,false];
		enable_gue=false; 
	};

	


