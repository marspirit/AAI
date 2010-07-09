if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
			hint "click on map where you want to put the Suicide Bomber"; 
		
		onMapSingleClick " 	hint ""Suicide Bomber placed.""; 
							[""sb_bomber"", [_pos, trapsx, trapsy, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
			
	}	
		else { player globalchat "Access Denied"};
	};	

