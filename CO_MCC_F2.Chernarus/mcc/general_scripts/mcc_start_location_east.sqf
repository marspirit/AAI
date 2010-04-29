
if !mcc_isloading then 
	{
		hint "click on map where you want EAST start location"; 
		
		onMapSingleClick "	
							
                            MCC_START_EAST  = _pos;
							publicVariable ""MCC_START_EAST"";



						
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_EAST setpos %1;
														""							  
														,_pos						
														];
							hint ""Start EAST location updated.""
						";
	};

	


