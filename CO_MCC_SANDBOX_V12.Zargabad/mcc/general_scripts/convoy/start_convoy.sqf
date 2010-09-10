if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	//["start_convoy", [points, convoyv]] call CBA_fnc_globalEvent; 
	["start_convoy",[[point2,point3,point4,point5],vip]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};