if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{		
	hint "Evac spawned";
	_faction = faction player; 
	["evac_spawn", [heli_size, _faction]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};	

