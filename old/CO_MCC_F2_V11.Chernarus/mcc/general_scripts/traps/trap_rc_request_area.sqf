if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hint "click on map where you want to put traps"; 
		
		onMapSingleClick " 	hint ""trap placed.""; 
							_pos execVm ""mcc\general_scripts\traps\put_rc_trap_area.sqf"";
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
			
	}	
		else { player globalchat "Access Denied"};
	};	
	



	


