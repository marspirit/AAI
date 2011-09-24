if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hint "click on map where you want to relocate the Evac choper"; 
		
		onMapSingleClick " 	hint ""Evac relocated.""; 
							[""evac_relocate"", [_pos]] call CBA_fnc_globalEvent;
							mcc_safe=mcc_safe + FORMAT ['
								[""evac_relocate"",[%1]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								];
							onMapSingleClick """";
							";
	}	
		else { player globalchat "Access Denied"};
	};	

