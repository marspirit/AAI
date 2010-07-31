if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{		
	["evac_delete", [evac_d]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};	

