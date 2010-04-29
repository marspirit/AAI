if !mcc_isloading then 
	{
			hint "click on map where you want to drop paratroops"; 
		
		onMapSingleClick " 	menutrigger setpos _pos;
							onMapSingleClick """";
							hint ""para drop location updated."";
							_pos execvm ""mcc\general_scripts\paratroops\paratroops.sqf"";
							true";
			
	};

