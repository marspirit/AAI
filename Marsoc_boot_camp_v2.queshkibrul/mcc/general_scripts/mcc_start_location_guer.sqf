
if !mcc_isloading then 
	{
		hint "click on map where you want Indepence start location"; 
		
		onMapSingleClick "	
							
    						MCC_START_GUER  = _pos;
							publicVariable ""MCC_START_GUER"";

							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_GUER setpos %1;
														""							  
														,_pos						
														];
							hint ""Start GUER location updated.""
						";
	};

	


