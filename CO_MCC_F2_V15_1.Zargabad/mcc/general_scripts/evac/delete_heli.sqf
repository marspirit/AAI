if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
    switch (evac_d) do
	{
   		case 0:
		{
		  hint "pilot deleted";
		}; 
		case 1:
		{
		hint "pilot respawned";
		};
		case 2:
		{ hint "Pilot & Chopper deleted";
		  };
		
	};

	["evac_delete", [evac_d]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};	

