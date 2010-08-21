#define SUPPORT_ARTY_TYPE 5505
#define SUPPORT_ARTY_SPREAD 5506
#define SUPPORT_ARTY_NUMBER 5507

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{
		shelltype = (artilleryTypeArray select (lbCurSel SUPPORT_ARTY_TYPE)) select 1;
		shellspread = (artillerySpreadArray select (lbCurSel SUPPORT_ARTY_SPREAD)) select 1;
		nshell = artilleryNumberArray select (lbCurSel SUPPORT_ARTY_NUMBER);
		
		hint "click on map where you want to send artillery"; 
				
		onMapSingleClick " 	hint ""Artillery inbound."";
							_pos execVm ""mcc\general_scripts\artillery\artillery_fire.sqf"";
							onMapSingleClick """";";							
					
	}	
		else { player globalchat "Access Denied"};
	};