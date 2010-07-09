if (mcc_missionmaker == (name player)) then 
	{
	nul=[player] execvm  "\ION_RTE\StartRTE_MP.sqf";
	} 
	else { player globalchat "Access Denied"};
	


