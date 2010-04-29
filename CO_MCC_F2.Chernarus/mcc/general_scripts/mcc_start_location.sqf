
if !mcc_isloading then 
	{
		hint "click on map where you want your start location"; 
		
		onMapSingleClick "	menutrigger setpos _pos;
							MCC_START_WEST setpos _pos;
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_WEST setpos %1;
														""							  
														,_pos						
														];
							hint ""Start WEST location updated.""
						";
	};

	


