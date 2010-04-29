if !mcc_isloading then 
	{
		
_x = lhdtype createVehicle [lhdpos select 0, lhdpos select 1, (lhdpos select 2) + 116]; 
_x setposasl [lhdpos select 0, lhdpos select 1, 17];
_x setdir dirlhd;
processInitCommands;
			
	};	

