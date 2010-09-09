#define SUPPORT_HOSTAGES 5502

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		hostage = (U_GEN_SOLDIER select (lbCurSel SUPPORT_HOSTAGES)) select 1;
		
		hint "click on map where you want to put hostage"; 
		
		onMapSingleClick " 	hint ""hostage inbound.""; 
							[""hostage_req"", [_pos, hostage]] call CBA_fnc_globalEvent;
							mcc_safe=mcc_safe + FORMAT ['
						  _pos=%1;
						  hostage=''%2'';
						 [""hostage_req"", [_pos, hostage]] call CBA_fnc_globalEvent;
						   sleep 1;'								 
						  ,_pos
						  , hostage
						   ];
							onMapSingleClick """";";
		
	}	
		else { player globalchat "Access Denied"};
	};