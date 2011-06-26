private ["_type"];
_type = _this select 0;

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
    switch (_type) do
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
	
	if (mcc_capture_state) then
		{
		mcc_capture_var = mcc_capture_var + FORMAT ['
							["evac_delete", [%1]] call CBA_fnc_globalEvent;'
							,_type
							];
		} else
			{
			["evac_delete", [_type]] call CBA_fnc_globalEvent;
			};
	}	
		else { player globalchat "Access Denied"};
	};	

