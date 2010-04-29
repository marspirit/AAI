
if !mcc_isloading then 
	{
		hint "click on map where you want WEST start location"; 
		
		onMapSingleClick "	
		                    MCC_START_WEST  = _pos;
							publicVariable ""MCC_START_WEST"";
							mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_WEST setpos %1;
														""							  
														,_pos						
														];
							hint ""Start WEST location updated.""
						";
	};

	


