if !mcc_isloading then 
	{
	

		hint "click on map where you want to put the artillery site"; 
		
		onMapSingleClick " 	hint ""artillery site inbound.""; 
							_pos execVm ""mcc\general_scripts\arty_site\create_arty_site.sqf"";
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
		
	};	
