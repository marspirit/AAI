ies = KRON_AllWest;
	KRON_UPS_West_enemies = KRON_AllEast;
	
	if (east in KRON_UPS_Res_enemy ) then {	
		KRON_UPS_East_enemies = KRON_UPS_East_enemies+KRON_AllRes;
		KRON_UPS_Guer_enemies = KRON_AllEast;
	} else {
		KRON_UPS_East_friends = KRON_UPS_East_friends+KRON_AllRes;
		KRON_UPS_Guer_friends = KRON_AllEast;
	}; 
		
	if (west in KRON_UPS_Res_enemy ) then {
		KRON_UPS_West_enemies = KRON_UPS_West_enemies+KRON_AllRes;
		KRON_UPS_Guer_enemies = KRON_UPS_Guer_enemies+KRON_AllWest;
	} else {
		KRON_UPS_West_friends = KRON_UPS_West_friends+KRON_AllRes;
		KRON_UPS_Guer_friends = KRON_UPS_Guer_friends+KRON_AllWest;
	};

	KRON_UPS_West_Total = count KRON_AllWest;		
	KRON_UPS_East_Total = count KRON_AllEast;
	KRON_UPS_Guer_Total = count KRON_AllRes;		
	
	//Initialization