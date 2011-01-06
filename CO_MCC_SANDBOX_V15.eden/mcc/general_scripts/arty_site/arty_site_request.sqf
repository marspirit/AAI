#define SUPPORT_ARTYSITE 5503

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
		artyindex = (artySiteArray select (lbCurSel SUPPORT_ARTYSITE)) select 1;
		hint "click on map where you want to put the artillery site"; 
		
		onMapSingleClick " 	hint ""artillery site inbound.""; 
							[""arty_site"", [_pos, artysite, artyindex]] call CBA_fnc_globalEvent;
								mcc_safe=mcc_safe + FORMAT ['
								_pos=%1;
								artysite=%2;
								artyindex=%3;
								[""arty_site"", [_pos, artysite, artyindex]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								,artysite
								,artyindex
						   ];
							onMapSingleClick """";";
		
	}	
		else { player globalchat "Access Denied"};
	};