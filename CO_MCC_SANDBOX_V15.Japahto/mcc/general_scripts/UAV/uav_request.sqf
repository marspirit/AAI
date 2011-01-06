#define SUPPORT_UAV 5503

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		uavindex = (uavSiteArray select (lbCurSel SUPPORT_UAV)) select 1;
		hint "click on map where you want to put the UAV vehicle"; 
		if (mcc_capture_state) then
		{
			onMapSingleClick " 	hint ""UAV/ULB Captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""uav"", [%1, %2, %3]] call CBA_fnc_globalEvent;'								 
								,_pos
								,uav_type
								,uavindex];
								onMapSingleClick """";";
		} else 
			{
				onMapSingleClick " 	hint ""UAV/ULB Spawned.""; 
									[""uav"", [_pos, uav_type, uavindex]] call CBA_fnc_globalEvent;
									mcc_safe=mcc_safe + FORMAT ['
									[""uav"", [%1, %2, %3]] call CBA_fnc_globalEvent;
									sleep 1;'								 
									,_pos
									,uav_type
									,uavindex];
									onMapSingleClick """";";
			}
	}	
		else { player globalchat "Access Denied"};
	};