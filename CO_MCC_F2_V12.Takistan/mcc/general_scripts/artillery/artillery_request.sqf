if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{
		hint "click on map where you want to send artillery"; 
				
		onMapSingleClick " 	hint ""Artillery inbound."";
							_pos execVm ""mcc\general_scripts\artillery\artillery_fire.sqf"";
onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';"							
					
	}	
		else { player globalchat "Access Denied"};
	};