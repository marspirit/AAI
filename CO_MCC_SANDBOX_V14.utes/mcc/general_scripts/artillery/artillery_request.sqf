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
		if (mcc_capture_state) then
		{
		hint "click on map where you want to send artillery"; 
		onMapSingleClick " 	hint ""Artillery captured."";
							mcc_capture_var = FORMAT ['
							[""artillery"", [%1, ''%2'', %3, %4]] call CBA_fnc_globalEvent;'
							,_pos
							,shelltype
							,shellspread
							,nshell
							];
							mcc_capture_state = false;
							onMapSingleClick """";";	
		}	else
			{
			hint "click on map where you want to send artillery"; 
			onMapSingleClick " 	hint ""Artillery inbound."";
							['artillery', [_pos, shelltype, shellspread, nshell]] call CBA_fnc_globalEvent;
							onMapSingleClick """";";	
			};
	}	
		else { player globalchat "Access Denied"};
	};