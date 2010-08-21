#define SUPPORT_UAV 5504

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		uavindex = (uavSiteArray select (lbCurSel SUPPORT_UAV)) select 1;
		
		hint "click on map where you want to put the UAV vehicle"; 
		
		onMapSingleClick " 	hint ""Vehicle inbound.""; 
							[""uav"", [_pos, uav_type, uavindex]] call CBA_fnc_globalEvent;
							mcc_safe=mcc_safe + FORMAT ['
								_pos=%1;
								uav_type=%2;
								uavindex=%3;
								[""uav"", [_pos, uav_type, uavindex]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								,uav_type
								,uavindex];
							onMapSingleClick """";";
		
	}	
		else { player globalchat "Access Denied"};
	};