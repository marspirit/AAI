#define MODULES_ANIMAL 7015 
#define MODULES_ALICE 7016 
#define MODULES_ALICE2 7017 
#define MODULES_SILVIE 7018 

private ["_type", "_pos"];
_type = _this select 0;
_pos = getpos player; 

switch (_type) do
	{
	   case 0:	//Gita (Town Generator)
	   { 
			hint "click on map where you want to place the town"; 
			onMapSingleClick " 	hint ""marker created.""; 
								[0,_pos] execVM 'mcc\general_scripts\gita\generate_execute.sqf';
								onMapSingleClick """";";	
		};
		
	   case 1:	//Animals 
	    { 
			_module = "BIS_animals_Logic";
			["modules", [_pos, _module]] call CBA_fnc_globalEvent;
			ctrlEnable [MODULES_ANIMAL,false];
			animalModule = true; 
			mcc_safe = mcc_safe + FORMAT ["
								[""modules"", [%1, ""%2""]] call CBA_fnc_globalEvent;
								animalModule = true; "
								,_pos
								,_module
								];
		};
		
		case 2:	//ALICE
	   { 
			_module = "AliceManager";
			["modules", [_pos, _module]] call CBA_fnc_globalEvent;
			ctrlEnable [MODULES_ALICE,false];
			aliceModule = true; 
			mcc_safe = mcc_safe + FORMAT ["
								[""modules"", [%1, ""%2""]] call CBA_fnc_globalEvent;
								aliceModule = true; "
								,_pos
								,_module
								];
	   };
		
		case 3:	//ALICE Arab
	   { 
			_module = "Alice2Manager";
			["modules", [_pos, _module]] call CBA_fnc_globalEvent;
			ctrlEnable [MODULES_ALICE2,false];
			aliceModule2 = true; 
			mcc_safe = mcc_safe + FORMAT ["
								[""modules"", [%1, ""%2""]] call CBA_fnc_globalEvent;
								aliceModule2 = true; "
								,_pos
								,_module
								];
	   };
	
	    case 4:	//SILVIE
	   { 
			_module = "SilvieManager";
			["modules", [_pos, _module]] call CBA_fnc_globalEvent;
			ctrlEnable [MODULES_SILVIE,false];
			silvieModule = true; 
			mcc_safe = mcc_safe + FORMAT ["
								[""modules"", [%1, ""%2""]] call CBA_fnc_globalEvent;
								silvieModule = true; "
								,_pos
								,_module
								];
	   };
	   
	    case 5:	//Battlefield
	   { 
			hint "click on map where you want to generate the battlefield"; 
			onMapSingleClick " 	hint ""Battlefield generated""; 
								[1,_pos] execVM 'mcc\general_scripts\gita\generate_execute.sqf';
								onMapSingleClick """";";	
	   };
	 };
	 


