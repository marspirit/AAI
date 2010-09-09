#define SUPPORT_PARATROOPS 5501
#define SUPPORT_HOSTAGES 5502
#define SUPPORT_UAV 5503
#define SUPPORT_ARTY_TYPE 5504
#define SUPPORT_ARTY_SPREAD 5505
#define SUPPORT_ARTY_NUMBER 5506

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