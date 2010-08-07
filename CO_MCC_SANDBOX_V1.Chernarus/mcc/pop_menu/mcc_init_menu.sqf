// init common functions on behalf of menu
nul=[] execVM "mcc\pop_menu\mcc_CommonFunctions.sqf";
nul=[] execVM "mcc\pop_menu\mcc_CommonDialogFunctions.sqf";
nul=[] execVM "config_lhd_units.sqf"; //load LHD vehicles

// init popup menu functions to fill up the menu
mcc_make_array_grps 		= compile preProcessFileLineNumbers "mcc\pop_menu\mcc_make_array_grps.sqf";
mcc_make_array_comp 		= compile preProcessFileLineNumbers "mcc\pop_menu\mcc_make_array_comp.sqf";
mcc_factions                = compile preProcessFileLineNumbers "mcc\pop_menu\mcc_factions.sqf";
mcc_faction_choice			= compile preProcessFileLineNumbers "mcc\pop_menu\mcc_faction_choice.sqf";
mcc_make_array_units		= compile preProcessFileLineNumbers "mcc\pop_menu\mcc_make_array_units.sqf";


dummy =[] call mcc_factions;

// Load the different units into the arrays above
U_GEN_SHIP 			= [];
U_GEN_AIRPLANE		= [];
U_GEN_HELICOPTER 	= [];
U_GEN_TANK 			= [];
U_GEN_MOTORCYCLE	= [];
U_GEN_CAR			= [];
U_GEN_SOLDIER    	= [];


// Load DOC -> Dynamic Object Compositions
USMC_DOC1	     		= ["USMC",0] call mcc_make_array_comp;
USMC_DOC2	     		= ["USMC",20] call mcc_make_array_comp;
USMC_DOC3	     		= ["USMC",40] call mcc_make_array_comp;
USMC_DOC4	     		= ["USMC",60] call mcc_make_array_comp;
USMC_DOC5	     		= ["USMC",80] call mcc_make_array_comp;
USMC_DOC6	     		= ["USMC",100] call mcc_make_array_comp;
RU_DOC  	     		= ["RU",0]   call mcc_make_array_comp;
INS_DOC	     	     	= ["INS",0]  call mcc_make_array_comp;
CDF_DOC	     	     	= ["CDF",0]  call mcc_make_array_comp;
GUE_DOC	     	     	= ["GUE",0]  call mcc_make_array_comp;

// Add to the action menu
[['> Mission generator', 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf', [], 0, false, false, 'teamSwitch' ]] call CBA_fnc_addPlayerAction;