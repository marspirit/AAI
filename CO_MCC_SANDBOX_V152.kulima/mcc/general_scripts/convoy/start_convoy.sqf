if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{
		if (mcc_capture_state) then
		{
			mcc_capture_var=mcc_capture_var + FORMAT ["
								[""start_convoy"", [[%1, %2 , %3, %4], %5 select 0]] call CBA_fnc_globalEvent;"								 
								,point2
								,point3
								,point4
								,point5
								,vip];
			Hint "Action captured";
		} else {
			hint "Convoy is moving";
			["start_convoy",[[point2,point3,point4,point5],vip select 0]] call CBA_fnc_globalEvent;
			};
	}	
		else { player globalchat "Access Denied"};
	};