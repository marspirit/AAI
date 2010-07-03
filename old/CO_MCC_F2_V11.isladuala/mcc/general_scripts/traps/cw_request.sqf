if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
			hint "click on map where you want to put the armed civilian"; 
		
		onMapSingleClick " 	hint ""Armed civilian placed.""; 
							_pos execVm ""mcc\general_scripts\traps\put_cw.sqf"";
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
			
	}	
		else { player globalchat "Access Denied"};
	};	




	


