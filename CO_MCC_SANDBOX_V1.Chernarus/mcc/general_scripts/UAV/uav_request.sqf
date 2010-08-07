if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hint "click on map where you want to put the UAV vehicle"; 
		
		onMapSingleClick " 	hint ""Vehicle inbound.""; 
							[""uav"", [_pos, uav_type, uavindex]] call CBA_fnc_globalEvent;
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
		
	}	
		else { player globalchat "Access Denied"};
	};