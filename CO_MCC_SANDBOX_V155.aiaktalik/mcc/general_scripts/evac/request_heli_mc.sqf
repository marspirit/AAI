if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hint "click on map where you want to relocate the Evac choper"; 
		
		onMapSingleClick " 	hint ""Evac relocated.""; 
							[""evac_relocate"", [_pos]] call CBA_fnc_globalEvent;
							onMapSingleClick """";
							";
	}	
		else { player globalchat "Access Denied"};
	};	

