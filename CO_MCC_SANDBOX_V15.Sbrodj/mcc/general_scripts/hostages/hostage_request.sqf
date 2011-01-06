#define SUPPORT_HOSTAGES 5502

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
		{	
			hostage = [(U_GEN_SOLDIER select (lbCurSel SUPPORT_HOSTAGES)) select 1];
			hint "click on map where you want to put hostage"; 
			if (mcc_capture_state) then
			{
				onMapSingleClick " 	hint ""hostage captured.""; 
									mcc_capture_var=mcc_capture_var + FORMAT ['
									[""hostage_req"", [%1, %2]] call CBA_fnc_globalEvent;'								 
									,_pos
									, hostage
									 ];
									onMapSingleClick """";";
			}	else
				{
					onMapSingleClick " 	hint ""hostage inbound.""; 
									[""hostage_req"", [_pos, hostage]] call CBA_fnc_globalEvent;
									mcc_safe=mcc_safe + FORMAT ['
									[""hostage_req"", [%1, %2]] call CBA_fnc_globalEvent;
									sleep 1;'								 
									,_pos
									, hostage
									 ];
									onMapSingleClick """";";
				};
		}
		else { player globalchat "Access Denied"};
	};