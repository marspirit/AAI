if (mcc_missionmaker == (name player)) then 
	{
	hint "click on map where you want to open RTE"; 
		
		onMapSingleClick " 	_dum = _pos spawn { [] call ION_RTE_pStartRTE; sleep 3; [_this, 0] call ION_RTE_pMoveTo};
							onMapSingleClick """";
							";
	} 
	else { player globalchat "Access Denied"};
	


