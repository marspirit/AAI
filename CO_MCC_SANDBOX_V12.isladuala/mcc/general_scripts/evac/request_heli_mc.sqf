if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hint "click on map where you want to relocate the Evac choper"; 
		
		onMapSingleClick " 	hint ""Evac relocated.""; 
							[""evac_relocate"", [_pos]] call CBA_fnc_globalEvent;
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
	}	
		else { player globalchat "Access Denied"};
	};	

