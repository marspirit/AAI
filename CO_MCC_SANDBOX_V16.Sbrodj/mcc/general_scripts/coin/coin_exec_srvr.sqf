private ["_pos", "_coinRadius", "_caller", "_coinVehicleType", "_coinFunds", "_dummyGroup", "_dummyLogic", "_dummy",
 "_fortification", "_buildings", "_Vehicles", "_Armors", "_Aircrafts","_Static_Weapons","_items","_Vehicles_EP","_Armors_EP", "_ammo_box"];
_pos = _this select 0;
_coinRadius = _this select 1;
_caller = _this select 2;
_coinVehicleType = _this select 3;
_coinFunds = _this select 4;

_dummyGroup = creategroup civilian; 
_dummyLogic = _dummyGroup createUnit ["Logic", getpos _caller, [], 0, "FORM"];
waituntil {alive _dummyLogic};
_dummyLogic synchronizeObjectsAdd [_caller];
switch (_coinVehicleType) do //Now lets see what are we spawning?
	{
	case 0: //West  
		{
			_dummy = "LAV25_HQ_unfolded" createvehicle _pos;
			"RESPAWN_WEST" setMarkerPos _pos;
			mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
			westCoinFunds = _coinFunds;
			publicVariable "westCoinFunds";
			_dummyLogic setvariable ["BIS_COIN_funds","westCoinFunds"];
		};
	
	case 1: //East  
		{
			_dummy = "BTR90_HQ_unfolded" createvehicle _pos;
			"RESPAWN_EAST" setMarkerPos _pos;
			mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
			eastCoinFunds = _coinFunds;
			publicVariable "eastCoinFunds";
			_dummyLogic setvariable ["BIS_COIN_funds","eastCoinFunds"];
		};
	
	case 2: //Resistance  
		{
			_dummy = "BRDM2_HQ_Gue_unfolded" createvehicle _pos;
			"RESPAWN_GUERRILA" setMarkerPos _pos;
			mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
			resistanceCoinFunds = _coinFunds;
			publicVariable "resistanceCoinFunds";
			_dummyLogic setvariable ["BIS_COIN_funds","resistanceCoinFunds"];
		};
	};

//-------------------------------------------------------------------------------------------------Edit here for changing the spawn vehicles---------------------------------------------------------------------------------------------------------------------------------------------
//_variable = [_coinVehicleType,_dummyLogic] execvm "mcc\general_scripts\coin\coin_init_class.sqf";

//_fortification
_fortification = [];
_fortification = _fortification + [["Fort_EnvelopeSmall","Fortification",20]];
_fortification = _fortification + [["Fort_RazorWire","Fortification",20]];
_fortification = _fortification + [["Hhedgehog_concreteBig","Fortification",50]];
_fortification = _fortification + [["Land_fort_bagfence_corner","Fortification",30]];
_fortification = _fortification + [["Land_fort_bagfence_long","Fortification",30]];
_fortification = _fortification + [["Land_fort_bagfence_round","Fortification",50]];
_fortification = _fortification + [["Land_fort_rampart","Fortification",50]];
_fortification = _fortification + [["Land_fort_artillery_nest","Fortification",50]];
_fortification = _fortification + [["Land_Fort_Watchtower","Fortification",250]];
_fortification = _fortification + [["Land_fortified_nest_big","Fortification",300]];
_fortification = _fortification + [["Land_fortified_nest_small","Fortification",150]];
_fortification = _fortification + [["WarfareBCamp","Fortification",300]];
_fortification = _fortification + [["WarfareBDepot","Fortification",500]];
_fortification = _fortification + [["Land_HBarrier3","Fortification",50]];
_fortification = _fortification + [["Land_HBarrier5","Fortification",80]];
_fortification = _fortification + [["Land_HBarrier_large","Fortification",100]];

switch (_coinVehicleType) do //Buildings
	{
		case 0: //West  
		{
			_buildings = [];
			_buildings = _buildings + [["USMC_WarfareBAircraftFactory","Buildings",5000]];
			_buildings = _buildings + [["USMC_WarfareBAntiAirRadar","Buildings",1000]];
			_buildings = _buildings + [["USMC_WarfareBArtilleryRadar","Buildings",1000]];
			_buildings = _buildings + [["USMC_WarfareBBarracks","Buildings",200]];
			_buildings = _buildings + [["USMC_WarfareBFieldhHospital","Buildings",300]];
			_buildings = _buildings + [["USMC_WarfareBHeavyFactory","Buildings",3000]];
			_buildings = _buildings + [["USMC_WarfareBLightFactory","Buildings",500]];
			_buildings = _buildings + [["USMC_WarfareBVehicleServicePoint","Buildings",300]];
		};
		
		case 1: //East  
		{
			_buildings = [];
			_buildings = _buildings + [["RU_WarfareBAircraftFactory","Buildings",5000]];
			_buildings = _buildings + [["RU_WarfareBAntiAirRadar","Buildings",1000]];
			_buildings = _buildings + [["RU_WarfareBArtilleryRadar","Buildings",1000]];
			_buildings = _buildings + [["RU_WarfareBBarracks","Buildings",200]];
			_buildings = _buildings + [["RU_WarfareBFieldhHospital","Buildings",300]];
			_buildings = _buildings + [["RU_WarfareBHeavyFactory","Buildings",3000]];
			_buildings = _buildings + [["RU_WarfareBLightFactory","Buildings",500]];
			_buildings = _buildings + [["RU_WarfareBVehicleServicePoint","Buildings",300]];
		};
		
		case 2: //GUER  
		{
			_buildings = [];
			_buildings = _buildings + [["GUE_WarfareBAircraftFactory","Buildings",5000]];
			_buildings = _buildings + [["GUE_WarfareBAntiAirRadar","Buildings",1000]];
			_buildings = _buildings + [["GUE_WarfareBArtilleryRadar","Buildings",1000]];
			_buildings = _buildings + [["Gue_WarfareBBarracks","Buildings",200]];
			_buildings = _buildings + [["GUE_WarfareBFieldhHospital","Buildings",300]];
			_buildings = _buildings + [["Gue_WarfareBHeavyFactory","Buildings",3000]];
			_buildings = _buildings + [["Gue_WarfareBLightFactory","Buildings",500]];
			_buildings = _buildings + [["GUE_WarfareBVehicleServicePoint","Buildings",300]];
		};
	};

switch (_coinVehicleType) do //_Vehicles
	{
		case 0: //West  
		{
			_Vehicles = [];
			_Vehicles = _Vehicles + [["HMMWV","Vehicles",250]];
			_Vehicles = _Vehicles + [["HMMWV_Ambulance","Vehicles",300]];
			_Vehicles = _Vehicles + [["HMMWV_Armored","Vehicles",400]];
			_Vehicles = _Vehicles + [["HMMWV_Avenger","Vehicles",800]];
			_Vehicles = _Vehicles + [["HMMWV_M2","Vehicles",400]];
			_Vehicles = _Vehicles + [["HMMWV_MK19","Vehicles",500]];
			_Vehicles = _Vehicles + [["HMMWV_TOW","Vehicles",500]];
			_Vehicles = _Vehicles + [["M1030","Vehicles",100]];
			_Vehicles = _Vehicles + [["MTVR","Vehicles",350]];
			_Vehicles = _Vehicles + [["MtvrReammo","Vehicles",400]];
			_Vehicles = _Vehicles + [["MtvrRefuel","Vehicles",400]];
			_Vehicles = _Vehicles + [["MtvrRepair","Vehicles",400]];
		};
		
		case 1: //East  
		{
			_Vehicles = [];
			_Vehicles = _Vehicles + [["GAZ_Vodnik","Vehicles",500]];
			_Vehicles = _Vehicles + [["GAZ_Vodnik_HMG","Vehicles",800]];
			_Vehicles = _Vehicles + [["GAZ_Vodnik_MedEvac","Vehicles",300]];
			_Vehicles = _Vehicles + [["GRAD_RU","Vehicles",1200]];
			_Vehicles = _Vehicles + [["Kamaz","Vehicles",300]];
			_Vehicles = _Vehicles + [["KamazOpen","Vehicles",300]];
			_Vehicles = _Vehicles + [["KamazReammo","Vehicles",400]];
			_Vehicles = _Vehicles + [["KamazRefuel","Vehicles",400]];
			_Vehicles = _Vehicles + [["KamazRepair","Vehicles",400]];
			_Vehicles = _Vehicles + [["UAZ_AGS30_RU","Vehicles",500]];
			_Vehicles = _Vehicles + [["UAZ_RU","Vehicles",250]];
			_Vehicles = _Vehicles + [["UAZ_SPG9_INS","Vehicles",500]];
		};
			
		
		case 2: //GUER  
		{
			_Vehicles = [];
			_Vehicles = _Vehicles + [["Offroad_DSHKM_Gue","Vehicles",350]];
			_Vehicles = _Vehicles + [["Offroad_SPG9_Gue","Vehicles",450]];
			_Vehicles = _Vehicles + [["Pickup_PK_GUE","Vehicles",300]];
			_Vehicles = _Vehicles + [["TT650_Gue","Vehicles",100]];
			_Vehicles = _Vehicles + [["Ural_ZU23_Gue","Vehicles",700]];
			_Vehicles = _Vehicles + [["V3S_Gue","Vehicles",300]];
		};
	};

switch (_coinVehicleType) do //_Vehicles_EP
	{
		case 0: //West  
		{
			_Vehicles_EP = [];
			_Vehicles_EP = _Vehicles_EP + [["ATV_US_EP1","Vehicles_EP",200]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_Ambulance_DES_EP1","Vehicles_EP",300]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_Avenger_DES_EP1","Vehicles_EP",800]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_DES_EP1","Vehicles_EP",300]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_M1035_DES_EP1","Vehicles_EP",250]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_M1151_M2_DES_EP1","Vehicles_EP",500]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_M998A2_SOV_DES_EP1","Vehicles_EP",550]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_M998_crows_M2_DES_EP1","Vehicles_EP",800]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_M998_crows_MK19_DES_EP1","Vehicles_EP",900]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_MK19_DES_EP1","Vehicles_EP",500]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_TOW_DES_EP1","Vehicles_EP",500]];
			_Vehicles_EP = _Vehicles_EP + [["HMMWV_Terminal_EP1","Vehicles_EP",300]];
			_Vehicles_EP = _Vehicles_EP + [["M1030_US_DES_EP1","Vehicles_EP",100]];
			_Vehicles_EP = _Vehicles_EP + [["MTVR_DES_EP1","Vehicles_EP",350]];
			_Vehicles_EP = _Vehicles_EP + [["MtvrReammo_DES_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["MtvrRefuel_DES_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["MtvrRepair_DES_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["MtvrSalvage_DES_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["MtvrSupply_DES_EP1","Vehicles_EP",400]];
		};
		
		case 1: //East  
		{
			_Vehicles_EP = [];
			_Vehicles_EP = _Vehicles_EP + [["GRAD_TK_EP1","Vehicles_EP",1200]];
			_Vehicles_EP = _Vehicles_EP + [["LandRover_MG_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["LandRover_SPG9_TK_EP1","Vehicles_EP",500]];
			_Vehicles_EP = _Vehicles_EP + [["MAZ_543_SCUD_TK_EP1","Vehicles_EP",900]];
			_Vehicles_EP = _Vehicles_EP + [["BTR40_MG_TK_INS_EP1","Vehicles_EP",600]];
			_Vehicles_EP = _Vehicles_EP + [["BTR40_TK_INS_EP1","Vehicles_EP",500]];
			_Vehicles_EP = _Vehicles_EP + [["TT650_TK_EP1","Vehicles_EP",100]];
			_Vehicles_EP = _Vehicles_EP + [["UAZ_AGS30_TK_EP1","Vehicles_EP",500]];
			_Vehicles_EP = _Vehicles_EP + [["UAZ_MG_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["UAZ_Unarmed_TK_EP1","Vehicles_EP",300]];
			_Vehicles_EP = _Vehicles_EP + [["UralReammo_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["UralRefuel_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["UralRepair_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["UralSalvage_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["UralSupply_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["Ural_ZU23_TK_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_Open_TK_EP1","Vehicles_EP",350]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_TK_EP1","Vehicles_EP",350]];
		};
			
		
		case 2: //GUER  
		{
			_Vehicles_EP = [];
			_Vehicles_EP = _Vehicles_EP + [["BTR40_MG_TK_GUE_EP1","Vehicles_EP",600]];
			_Vehicles_EP = _Vehicles_EP + [["BTR40_TK_GUE_EP1","Vehicles_EP",500]];
			_Vehicles_EP = _Vehicles_EP + [["Offroad_DSHKM_TK_GUE_EP1","Vehicles_EP",350]];
			_Vehicles_EP = _Vehicles_EP + [["Offroad_SPG9_TK_GUE_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["Old_moto_TK_Civ_EP1","Vehicles_EP",70]];
			_Vehicles_EP = _Vehicles_EP + [["Pickup_PK_TK_GUE_EP1","Vehicles_EP",300]];
			_Vehicles_EP = _Vehicles_EP + [["Ural_ZU23_TK_GUE_EP1","Vehicles_EP",800]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_Reammo_TK_GUE_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_Refuel_TK_GUE_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_Repair_TK_GUE_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_Salvage_TK_GUE_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_Supply_TK_GUE_EP1","Vehicles_EP",400]];
			_Vehicles_EP = _Vehicles_EP + [["V3S_TK_GUE_EP1","Vehicles_EP",300]];
		};
	};

switch (_coinVehicleType) do //_Armors
	{
		case 0: //West  
		{
			_Armors = 
			[
				["AAV","Armors",1200],
				["LAV25","Armors",1200],
				["M1A1","Armors",4000],
				["M1A2_TUSK_MG","Armors",5000],
				["MLRS","Armors",2000]
			];
		};
		
		case 1: //East  
		{
			_Armors = 
			[
				["BRDM2_INS","Armors",1000],
				["BRDM2_ATGM_INS","Armors",1500],
				["BTR90","Armors",1500],
				["2S6M_Tunguska","Armors",2000],
				["BMP2_Ambul_INS","Armors",1000],
				["BMP2_INS","Armors",1500],
				["BMP3","Armors",2000],
				["T72_RU","Armors",3000],
				["T90","Armors",4000],
				["ZSU_INS","Armors",1200]
			];
		};
				
		case 2: //GUER  
		{
			_Armors = 
			[
				["BRDM2_Gue","Armors",1000],
				["BMP2_Gue","Armors",1500],
				["T34","Armors",2000],
				["T72_Gue","Armors",3000]
			];
		};
	};
	
switch (_coinVehicleType) do //Armors_EP
	{
		case 0: //West  
		{
			_Armors_EP = 
			[
				["M1126_ICV_M2_EP1","Armors_EP",1500],
				["M1126_ICV_mk19_EP1","Armors_EP",1500],
				["M1128_MGS_EP1","Armors_EP",1800],
				["M1129_MC_EP1","Armors_EP",1800],
				["M1130_CV_EP1","Armors_EP",1300],
				["M1133_MEV_EP1","Armors_EP",1200],
				["M1135_ATGMV_EP1","Armors_EP",1500],
				["M2A2_EP1","Armors_EP",2300],
				["M2A3_EP1","Armors_EP",2500],
				["M6_EP1","Armors_EP",2500],
				["M1A1_US_DES_EP1","Armors_EP",4000],
				["M1A2_US_TUSK_MG_EP1","Armors_EP",5000],
				["MLRS_DES_EP1","Armors_EP",2500]
			];
		};
		
		case 1: //East  
		{
			_Armors_EP = 
			[
				["BRDM2_ATGM_TK_EP1","Armors_EP",1100],
				["BRDM2_TK_EP1","Armors_EP",1000],
				["BTR60_TK_EP1","Armors_EP",1000],
				["BMP2_TK_EP1","Armors_EP",1500],
				["M113Ambul_TK_EP1","Armors_EP",800],
				["M113_TK_EP1","Armors_EP",800],
				["T34_TK_EP1","Armors_EP",2000],
				["T55_TK_EP1","Armors_EP",2500],
				["T72_TK_EP1","Armors_EP",3000],
				["ZSU_TK_EP1","Armors_EP",1200]
			];
		};
				
		case 2: //GUER  
		{
			_Armors_EP = 
			[
				["BRDM2_TK_GUE_EP1","Armors_EP",1000],
				["T34_TK_GUE_EP1","Armors_EP",2000],
				["T55_TK_GUE_EP1","Armors_EP",2500]
			];
		};
	};
	
switch (_coinVehicleType) do //Aircrafts
	{
		case 0: //West  
		{
			_Aircrafts = 
			[
				["A10","Aircrafts",35000],
				["AH1Z","Aircrafts",15000],
				["AH64D","Aircrafts",20000],
				["AH64D_coinVehicleTypewinders","Aircrafts",22000],
				["AV8B","Aircrafts",25000],
				["AV8B2","Aircrafts",25000],
				["F35B","Aircrafts",35000],
				["UH1Y","Aircrafts",2500],
				["MV22","Aircrafts",4000],
				["MH60S","Aircrafts",2500],
				["UH60M_MEV_EP1","Aircrafts",2500],
				["UH60M_EP1","Aircrafts",2500],
				["AH6J_EP1","Aircrafts",1000],
				["MH6J_EP1","Aircrafts",800],
				["CH_47F_EP1","Aircrafts",4000]
			];
		};
		
		case 1: //East  
		{
			_Aircrafts = 
			[
				["Ka52","Aircrafts", 20000],
				["Ka52Black","Aircrafts", 20000],
				["Mi17_medevac_RU","Aircrafts", 2500],
				["Mi17_rockets_RU","Aircrafts", 3500],
				["Mi24_P","Aircrafts", 15000],
				["Mi24_V","Aircrafts", 15000],
				["Su34","Aircrafts", 25000],
				["Su39","Aircrafts", 35000],
				["UH1H_TK_EP1","Aircrafts", 1500],
				["Su25_TK_EP1","Aircrafts", 15000],
				["Mi24_D_TK_EP1","Aircrafts", 15000],
				["Mi17_TK_EP1","Aircrafts", 2500],
				["L39_TK_EP1","Aircrafts", 10000]
			];
		};
			
		
		case 2: //GUER  
		{
			_Aircrafts = 
			[
				["Mi24_D","Aircrafts",15000],
				["Mi17_medevac_CDF","Aircrafts",2500],
				["Mi17_CDF","Aircrafts", 2500],
				["UH1H_TK_GUE_EP1","Aircrafts",1500]
			];
		};
	};

switch (_coinVehicleType) do //_Static_Weapons
	{
		case 0: //West  
		{
			_Static_Weapons = 
			[
				["SearchLight","Static_Weapons",50],
				["M119","Static_Weapons",1000],
				["M2HD_mini_TriPod","Static_Weapons",150],
				["M2StaticMG","Static_Weapons",150],
				["MK19_TriPod","Static_Weapons",250],
				["Stinger_Pod","Static_Weapons",400],
				["TOW_TriPod","Static_Weapons",400],
				["USMC_WarfareBMGNest_M240","Static_Weapons",200]
			];
		};
		
		case 1: //East  
		{
			_Static_Weapons = 
			[
				["SearchLight_RUS","Static_Weapons",50],
				["D30_RU","Static_Weapons",1000],
				["KORD","Static_Weapons",150],
				["DSHKM_Ins","Static_Weapons",150],
				["AGS_RU","Static_Weapons",250],
				["Igla_AA_pod_East","Static_Weapons",400],
				["Metis","Static_Weapons",400],
				["RU_WarfareBMGNest_PK","Static_Weapons",200]
			];
		};
			
		
		case 2: //GUER  
		{
			_Static_Weapons = 
			[
				["SearchLight_RUS","Static_Weapons",50],
				["D30_Ins","Static_Weapons",1000],
				["KORD","Static_Weapons",150],
				["DSHKM_Ins","Static_Weapons",150],
				["AGS_Ins","Static_Weapons",250],
				["Igla_AA_pod_East","Static_Weapons",400],
				["SPG9_Gue","Static_Weapons",300],
				["USMC_WarfareBMGNest_M240","Static_Weapons",200]
			];
		};
	};

switch (_coinVehicleType) do //_Static_Weapons
	{
		case 0: //West  
		{
			_ammo_box = 
			[
				["USBasicAmmunitionBox","Ammo_Boxes",250],
				["USBasicWeaponsBox","Ammo_Boxes",500],
				["USLaunchersBox","Ammo_Boxes",2000],
				["USOrdnanceBox","Ammo_Boxes",1000],
				["USSpecialWeaponsBox","Ammo_Boxes",1000],
				["USVehicleBox","Ammo_Boxes",1000]
			];
		};
		
		case 1: //East  
		{
			_ammo_box = 
			[
				["RUBasicAmmunitionBox","Ammo_Boxes",250],
				["RUBasicWeaponsBox","Ammo_Boxes",500],
				["RULaunchersBox","Ammo_Boxes",2000],
				["RUOrdnanceBox","Ammo_Boxes",1000],
				["RUSpecialWeaponsBox","Ammo_Boxes",1000],
				["RUVehicleBox","Ammo_Boxes",1000]
			];
		};
			
		
		case 2: //GUER  
		{
			_ammo_box = 
			[
				["LocalBasicAmmunitionBox","Ammo_Boxes",250],
				["LocalBasicWeaponsBox","Ammo_Boxes",500],
				["RULaunchersBox","Ammo_Boxes",2000],
				["GuerillaCacheBox","Ammo_Boxes",1000],
				["SpecialWeaponsBox","Ammo_Boxes",1000],
				["RUVehicleBox","Ammo_Boxes",1000]
			];
		};
	};	
coinItems = [];
coinItems = coinItems + _fortification;
coinItems = coinItems + _buildings;
coinItems = coinItems + _Vehicles;
coinItems = coinItems + _Vehicles_EP;
coinItems = coinItems + _Armors;
coinItems = coinItems + _Armors_EP;
coinItems = coinItems + _Aircrafts;
coinItems = coinItems + _Static_Weapons;
coinItems = coinItems + _ammo_box;
publicvariable "coinItems";

_dummyLogic setvariable ["BIS_COIN_items",coinItems];
_dummyLogic setvariable ["BIS_COIN_areasize",[_coinRadius,50]];
_dummyLogic setvariable ["BIS_COIN_onstart",{[_this] execvm "mcc\general_scripts\coin\coin_start.sqf"}];

[_dummyLogic] execVM "mcc\general_scripts\coin\BIS\coin.sqf";	//Fire it all
