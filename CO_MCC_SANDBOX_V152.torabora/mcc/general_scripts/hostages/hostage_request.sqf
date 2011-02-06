#define SUPPORT_HOSTAGES 5502
private ["_type"];
_type = _this select 0;

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
		{	
		hostage = [(U_GEN_SOLDIER select (lbCurSel SUPPORT_HOSTAGES)) select 1];
		if (_type==0) then	//Case 2D
			{
			hint "click on map where you want to put hostage"; 
			if (mcc_capture_state) then
				{
					onMapSingleClick " 	hint ""hostage captured.""; 
										mcc_capture_var=mcc_capture_var + FORMAT ['
										[""hostage_req"", [[%1 select 0, %1 select 1, 0], %2, %3]] call CBA_fnc_globalEvent;'								 
										,_pos
										, hostage
										, random 360
										 ];
										onMapSingleClick """";";
				}	else
					{
						onMapSingleClick " 	hint ""hostage inbound.""; 
										[""hostage_req"", [[_pos select 0, _pos select 1, 0], hostage, random 360]] call CBA_fnc_globalEvent;
										mcc_safe=mcc_safe + FORMAT ['
										[""hostage_req"", [[%1 select 0, %1 select 1, 0], %2, %3]] call CBA_fnc_globalEvent;
										sleep 1;'								 
										,_pos
										, hostage
										, random 360
										 ];
										onMapSingleClick """";";
					};
			} else	//Case 3D
			{
			hint "click on map"; 
			onMapSingleClick "_nul=[hostage select 0,_pos] call MCC_3D_PLACER;closeDialog 0;onMapSingleClick """";";	
			MCC3DRuning = true;
			while {MCC3DRuning} do
				{
				MCC3DgotValue = false; 
				while {!MCC3DgotValue && MCC3DRuning} do {sleep 0.2};
				if (MCC3DRuning) then 
					{
					if (mcc_capture_state) then
						{
						 mcc_capture_var = mcc_capture_var + FORMAT ["['hostage_req', [%1, %2, %3]] call CBA_fnc_globalEvent;"
											,MCC3DValue select 0
											,hostage
											,MCC3DValue select 1
											];
						}	else
							{
							 mcc_safe = mcc_safe + FORMAT ["['hostage_req', [%1, %2, %3]] call CBA_fnc_globalEvent;sleep 1;"								 
										,MCC3DValue select 0
										,hostage
										,MCC3DValue select 1
										];	
							["hostage_req", [MCC3DValue select 0,hostage, MCC3DValue select 1]] call CBA_fnc_globalEvent;
							};
					};
				sleep 0.1;
				};
			};
	}
	else { player globalchat "Access Denied"};
	};