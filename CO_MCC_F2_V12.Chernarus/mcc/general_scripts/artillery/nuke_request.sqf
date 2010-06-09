if (player hasweapon "ACE_GlassesBlackSun") then 
{
if !mcc_isloading then 
	{
		
		hint "click on map where you want to drop Nuclear Bomb"; 
		
		onMapSingleClick " 	hint ""TAKE COVER.""; 
							onmapsingleclick """";
							_pos execVm ""mcc\general_scripts\artillery\nuke_fire.sqf""; true
							";
			
	};	
} else {hint "not mission maker"};	
