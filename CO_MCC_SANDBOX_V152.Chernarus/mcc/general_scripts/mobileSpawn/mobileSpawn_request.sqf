#define MOBILESPAWN_CARS 7030 
#define MOBILESPAWN_TANKS 7031
#define MOBILESPAWN_HELIS 7032
#define MOBILESPAWN_SIDE 7033

private ["_type", "_pos"];

_type = _this select 0;
_pos = getpos player; 

switch (_type) do
	{
		case 0:	//Cars
		{ 
			mobileSpawnVehicle = (U_GEN_CAR select (lbCurSel MOBILESPAWN_CARS)) select 1;
		};
		
		case 1:	//Tanks
		{ 
			mobileSpawnVehicle = (U_GEN_TANK select (lbCurSel MOBILESPAWN_TANKS)) select 1;
		};
		
		case 2:	//Helis
		{ 
			mobileSpawnVehicle = (U_GEN_HELICOPTER select (lbCurSel MOBILESPAWN_HELIS)) select 1;
		};
	};
	
mobileSpawnSide = lbCurSel MOBILESPAWN_SIDE;	
hint "click on map where you want to place mobile spawn vehicle"; 
onMapSingleClick " 	hint ""Vehicle created.""; 
					[""mobileSpawn"", [_pos, mobileSpawnVehicle, mobileSpawnSide]] call CBA_fnc_globalEvent;
					onMapSingleClick """";
					mcc_safe = mcc_safe + FORMAT ['
							[""mobileSpawn"", [%1, ""%2"", %3]] call CBA_fnc_globalEvent;'
							,_pos
							,mobileSpawnVehicle
							,mobileSpawnSide
							];";
		
