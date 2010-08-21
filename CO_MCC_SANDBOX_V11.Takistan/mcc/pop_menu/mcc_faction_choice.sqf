faction_choice=true; 



// Load all possible groups from the config into the menu array format in arrays above
GEN_MECHANIZED 		= [mcc_sidename,mcc_faction,"Mechanized","LAND"] call mcc_make_array_grps;
GEN_MOTORIZED  		= [mcc_sidename,mcc_faction,"Motorized","LAND"]  call mcc_make_array_grps;
GEN_AIR        		= [mcc_sidename,mcc_faction,"Air","AIR"]         call mcc_make_array_grps;
GEN_ARMOR      		= [mcc_sidename,mcc_faction,"Armored","LAND"]    call mcc_make_array_grps;
GEN_INFANTRY   		= [mcc_sidename,mcc_faction,"Infantry","LAND"]   call mcc_make_array_grps;



// Create the units
// Load the different units into the arrays above
U_GEN_SHIP 			= [];
U_GEN_AIRPLANE		= [];
U_GEN_HELICOPTER 	= [];
U_GEN_TANK 			= [];
U_GEN_MOTORCYCLE	= [];
U_GEN_CAR			= [];
U_GEN_SOLDIER    	= [];

nul=[] execVM "mcc\pop_menu\mcc_make_array_units.sqf";

// Load DOC -> Dynamic Object Compositions

GEN_DOC1 = [];
GEN_DOC1	     		= [mcc_faction,0]  call mcc_make_array_comp;

//DUMMY					= [] call mcc_make_array_units;

closeDialog PUM3_IDD_PopupMenuDialog;

nul=[
  ["ActionParams", 
    [
      ["Unit", _this select 0],
      ["Caller", _this select 1],
      ["ID", _this select 2],
      ["Params", _this select 3]
    ]
  ] 
] execVM "mcc\pop_menu\mcc_CreatePopupMenu.sqf";
