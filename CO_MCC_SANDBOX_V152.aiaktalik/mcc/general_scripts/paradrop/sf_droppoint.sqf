if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
			hint "click on map where you want your SF para drop location"; 
		
		onMapSingleClick " 	menutrigger setpos _pos;
							onMapSingleClick """";
							hint ""SF para drop location updated."";
							_pos execvm ""mcc\general_scripts\paradrop\paradrop.sqf"";
							true";
			
	}	
		else { player globalchat "Access Denied"};
	};	




	


