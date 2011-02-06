#define SUPPORT_UAV 5503
private ["_type"];
_type = _this select 0;

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	uavindex = (uavSiteArray select (lbCurSel SUPPORT_UAV)) select 1;
	if (_type==0) then	//Case 2D
		{
		hint "click on map where you want to put the UAV vehicle"; 
		if (mcc_capture_state) then
		{
			onMapSingleClick " 	hint ""UAV/ULB Captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""uav"", [%1, %2, %3]] call CBA_fnc_globalEvent;'								 
								,_pos
								,uav_type
								,uavindex
								];
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
									,uavindex
									];
									onMapSingleClick """";";
			};
		} else
		{	//Case 3D
		switch (uavindex) do //Now lets see what are we spawning?
			{
				case 0: //west  static UAV
					{
					uavBuildingType = "US_WarfareBUAVterminal_Base_EP1";
					};
				
				case 1: //West static ULB
					{
					uavBuildingType = "US_WarfareBUAVterminal_Base_EP1";
					};
				
				case 2: //East static UAV
					{
					uavBuildingType = "TK_GUE_WarfareBUAVterminal_Base_EP1";
					};
				
				case 3: //west  mobile UAV
					{
					uavBuildingType = "HMMWV_Terminal_EP1";
					};
				
				case 4: //ApacheAH64
					{
					uavBuildingType = "AH64D_EP1";
					};
				
				case 5: //East mobile UAV
					{
					uavBuildingType = "V3S_Salvage_TK_GUE_EP1";
					};
				
				case 6: //West Backpack UAV spawn crate
					{
					uavBuildingType = "USBasicAmmunitionBox";
					};
					
				case 7: //West Backpack action triggered Server Side
					{
					};
				
				case 8: //West Backpack ULB spawn crate
					{
					uavBuildingType = "USBasicAmmunitionBox";
					};
					
				case 9: //West Backpack action triggered Server Side
					{
					};
				
				case 10: //East Backpack UAV spawn crate
					{
					uavBuildingType = "USBasicAmmunitionBox";
					};
			};
		hint "click on map"; 
		onMapSingleClick "_nul=[uavBuildingType ,_pos] call MCC_3D_PLACER;closeDialog 0;onMapSingleClick """";";	
		MCC3DRuning = true;
		while {MCC3DRuning} do
			{
			MCC3DgotValue = false; 
			while {!MCC3DgotValue && MCC3DRuning} do {sleep 0.2};
			if (MCC3DRuning) then 
				{
				if (mcc_capture_state) then
					{
					 mcc_capture_var = mcc_capture_var + FORMAT ["['uav', [%1, %2, %3]] call CBA_fnc_globalEvent;"
										,MCC3DValue select 0
										,uav_type
										,uavindex
										];
					}	else
						{
						 mcc_safe = mcc_safe + FORMAT ["['uav', [%1, %2, %3]] call CBA_fnc_globalEvent;sleep 1;"								 
									,MCC3DValue select 0
									,uav_type
									,uavindex
									];	
						["uav", [MCC3DValue select 0,uav_type,uavindex]] call CBA_fnc_globalEvent;
						};
				};
			sleep 0.1;
			};
		};
	}
		else { player globalchat "Access Denied"};
	};