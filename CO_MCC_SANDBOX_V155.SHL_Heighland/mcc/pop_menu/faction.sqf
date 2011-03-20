#define MCC_FACTION 3003

mcc_sidename = (U_FACTIONS select (lbCurSel MCC_FACTION)) select 1;
mcc_faction = (U_FACTIONS select (lbCurSel MCC_FACTION)) select 2;
faction_index = lbCurSel MCC_FACTION;
[] call mcc_faction_choice;



 
		