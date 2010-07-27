if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hint "click on map where you want to put the artillery site"; 
		
		onMapSingleClick " 	hint ""artillery site inbound.""; 
							[""arty_site"", [_pos, artysite, artyindex]] call CBA_fnc_globalEvent;
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
		
	}	
		else { player globalchat "Access Denied"};
	};