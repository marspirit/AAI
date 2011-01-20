if (mcc_missionmaker == (name player)) then 
	{
	[] spawn ION_RTE_pStartRTE;
	//nul=[player] execvm  "\ION_RTE\StartRTE_MP.sqf";
	} 
	else { player globalchat "Access Denied"};
	


