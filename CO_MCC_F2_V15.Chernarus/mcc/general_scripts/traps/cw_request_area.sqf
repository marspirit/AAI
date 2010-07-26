if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hint "click on map where you want to put traps"; 
		
		onMapSingleClick " 	hint ""trap placed."";
							[""trap_cw_area"", [_pos, trapsx, trapsy, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
			
	}	
		else { player globalchat "Access Denied"};
	};	
