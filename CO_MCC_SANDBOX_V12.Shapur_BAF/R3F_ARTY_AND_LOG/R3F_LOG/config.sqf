/**
 * English and French comments
 * Commentaires anglais et français
 * 
 * This file contains the configuration variables of the logistic system.
 * Fichier contenant les variables de configuration du système de logistique.
 * 
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * Note importante : Tous les noms de classes dérivant de celles utilisées dans les variables de configuration seront aussi valables.
 * 
 * Usefull links / Liens utiles :
 * - http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles
 * - http://www.armatechsquad.com/ArmA2Class/
 */


/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 * Liste des noms de classes des véhicules terrestres pouvant remorquer des objets remorquables.
 */
R3F_LOG_CFG_remorqueurs =
[
	"HMMWV_Base",
	"TowingTractor",
	"tractor",
	"Kamaz_Base",
	"MTVR",
	"GRAD_Base",
	"Ural_Base",
	"Ural_ZU23_Base",
	"V3S_Civ",
	"UAZ_Base",
	"BRDM2_Base",
	"BTR90_Base",
	"GAZ_Vodnik_HMG",
	"LAV25_Base",
	"ATV_Base_EP1",
	"MLRS"
];

/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables =
[
	"StaticCannon",
	"RubberBoat"
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des véhicules aériens pouvant héliporter des objets héliportables.
 */
R3F_LOG_CFG_heliporteurs =
[
	"Mi17_base",
	"Mi171Sh_Base_EP1",
	"Mi24_Base",
	"UH1Y",
	"UH1H_base",
	"UH60_Base",
	"UH60M_US_base_EP1",
	"MV22",
	"AH6_Base_EP1 ",
	"CH47_base_EP1"
	
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets héliportables.
 */
R3F_LOG_CFG_objets_heliportables =
[
	"StaticCannon",
	"Car",
	"Ship",
	"ReammoBox",
	
	"Land_Misc_Cargo1Ao",
	"Land_Misc_Cargo1B",
	"Land_Misc_Cargo1Bo",
	"Land_Misc_Cargo1C",
	"Land_Misc_Cargo1D",
	"Land_Misc_Cargo1E",
	"Land_Misc_Cargo1F",
	"Land_Misc_Cargo1G",
	"Base_WarfareBContructionSite",
	"Misc_cargo_cont_net1",
	"Misc_cargo_cont_net2",
	"Misc_cargo_cont_net3",
	"Misc_cargo_cont_small",
	"Misc_cargo_cont_small2",
	"Misc_cargo_cont_tiny"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USSpecialWeaponsBox "weights" 5 units.
 * 
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le référentiel arbitraire utilisé est : une caisse de munition de type USSpecialWeaponsBox "pèse" 5 unités.
 * 
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 * 
 * Note : la priorité d'une déclaration de capacité sur une autre correspond à leur ordre dans les tableaux.
 *   Par exemple : la classe "Truck" appartient à la classe "Car" (voir http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   Si "Truck" est déclaré avec une capacité de 140 avant "Car". Et que "Car" est déclaré après "Truck" avec une capacité de 40,
 *   Alors toutes les sous-classes appartenant à "Truck" auront une capacité de 140. Et toutes les sous-classes appartenant
 *   à "Car", exceptées celles de "Truck", auront une capacité de 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des véhicules (terrestres ou aériens) pouvant transporter des objets transportables.
 * Le deuxième élément des tableaux est la capacité de chargement (en relation avec le coût de capacité des objets).
 */
R3F_LOG_CFG_transporteurs =
[
	["hilux1_civil_1_open", 10],
	["HMMWV_Base", 12],
	["Ikarus", 40],
	["Lada_base", 6],
	["SkodaBase", 6],
	["TowingTractor", 5],
	["tractor", 2],
	["Motorcycle", 1],
	["KamazRefuel", 5],
	["Kamaz_Base", 40],
	["MtvrRefuel", 5],
	["MTVR", 40],
	["GRAD_Base", 2],
	["UralRefuel_Base", 5],
	["Ural_Base", 40],
	["Ural_ZU23_Base", 40],
	["V3S_Civ", 25],
	["UAZ_Base", 10],
	["VWGolf", 6],
	["BRDM2_Base", 25],
	["BTR90_Base", 25],
	["GAZ_Vodnik_HMG", 25],
	["LAV25_Base", 25],
	["AAV", 10],
	["BMP2_Base", 8],
	["BMP3", 8],
	["ATV_Base_EP1", 2],
	["HMMWV_M1151_M2_DES_Base_EP1", 12],
	["LandRover_Base", 10],
	["hilux1_civil_3_open_EP1", 10],
	["Ikarus_base", 40],
	["LandRover_CZ_EP1", 8],
	["S1203_TK_CIV_EP1", 10],
	["SUV_Base_EP1", 10],
	["UAZ_Unarmed_Base ", 10],
	["V3S_Base_EP1", 25],
	["Volha_TK_CIV_Base_EP1", 6],
	["LandRover_MG_Base_EP1", 8],
	["LandRover_SPG9_Base_EP1", 8],
	["MAZ_543_SCUD_Base_EP1", 25],
	["UAZ_AGS30_Base", 10],
	["Pickup_PK_base", 8],
	["Offroad_DSHKM_base", 8],
	["Offroad_SPG9_base", 8],
	["ACE_Truck5t_Base", 40],
	["ACE_Truck5tMG_Base", 40],
	["ACE_Truck5tMGOpen_Base", 40],
	["ACE_Truck5tOpen_Base", 40],
	["HMMWV", 12],
	["HMMWV_M2", 12],
	["HMMWV_TOW", 12],
	["HMMWV_MK19", 12],
	["ACE_HMMWV_GMV", 12],
	["BMP2_HQ_Base", 8],
	["BRDM2_ATGM_Base", 25],
	["M113_Base", 25],
	["BTR40_MG_base_EP1", 12],
	["BTR40_base_EP1", 12],
	["M113_UN_EP1", 25],
	["M1126_ICV_BASE_EP1", 20],
	["StrykerBase_EP1", 20],
	["M1126_ICV_mk19_EP1", 20],
	["M1126_ICV_M2_EP1", 20],
	["M2A2_Base", 20],
	["M2A2_EP1", 20],
	
	
	["Mi17_base", 50],
	["Mi24_Base", 40],
	["UH1Y", 15],
	["ACE_MH6", 5],
	["UH60_Base", 25],
	["C130J", 150],
	["MV22", 90],
	["Mi17_base", 50],
	["Mi171Sh_Base_EP1", 50],
	["UH1H_base", 15],
	["AH6_Base_EP1", 5],
	["UH60M_US_base_EP1", 25],
	["CH47_base_EP1", 60],
	["An2_Base_EP1", 30],
		
	["RHIB", 12],
	["RubberBoat", 5],
	["Fishing_Boat", 18],
	["Smallboat_1", 6],
	
	["Land_Misc_Cargo1Ao", 50],
	["Land_Misc_Cargo1B", 50],
	["Land_Misc_Cargo1Bo", 50],
	["Land_Misc_Cargo1C", 50],
	["Land_Misc_Cargo1D", 50],
	["Land_Misc_Cargo1E", 50],
	["Land_Misc_Cargo1F", 50],
	["Land_Misc_Cargo1G", 50],
	["Base_WarfareBContructionSite", 50],
	["Misc_cargo_cont_net1", 9],
	["Misc_cargo_cont_net2", 18],
	["Misc_cargo_cont_net3", 30],
	["Misc_cargo_cont_small", 20],
	["Misc_cargo_cont_small2", 16],
	["Misc_cargo_cont_tiny", 12]
];

/**
 * List of class names of transportables objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxième élément des tableaux est le coût de capacité (en relation avec la capacité des véhicules).
 */
R3F_LOG_CFG_objets_transportables =
[
	["SatPhone", 6], // Needed for the R3F_ARTY module (arty HQ) (nécessaire pour le module R3F_ARTY (PC d'arti))
	["StaticAAWeapon", 7],
	["StaticATWeapon", 5],
	["StaticGrenadeLauncher", 3],
	["StaticMGWeapon", 3],
	["StaticMortar", 3],
	["StaticSEARCHLight", 2],
	
	["Motorcycle", 8],
	["Truck", 140],
	["Car", 80],
	
	["RubberBoat", 22],
	
	["FlagCarrierSmall", 0.1],
	
	["Land_BagFenceCorner", 1],
	["RoadBarrier_light", 1],
	["FlagCarrierCore", 0.2],
	["Hedgehog", 1],
	["Land_fortified_nest_small", 5],
	
	["Land_HBarrier1", 1],
	["Land_HBarrier3", 3],
	["Land_HBarrier5", 5],
	["Base_WarfareBBarrier5x", 5],
	
	["Land_Misc_Cargo1Ao", 55],
	["Land_Misc_Cargo1B", 55],
	["Land_Misc_Cargo1Bo", 55],
	["Land_Misc_Cargo1C", 55],
	["Land_Misc_Cargo1D", 55],
	["Land_Misc_Cargo1E", 55],
	["Land_Misc_Cargo1F", 55],
	["Land_Misc_Cargo1G", 55],
	["Base_WarfareBContructionSite", 55],
	["Misc_cargo_cont_net1", 13],
	["Misc_cargo_cont_net2", 23],
	["Misc_cargo_cont_net3", 35],
	["Misc_cargo_cont_small", 25],
	["Misc_cargo_cont_small2", 20],
	["Misc_cargo_cont_tiny", 15],
	
	["ACamp", 1.5],
	["BASE_WarfareBFieldhHospital", 8],
	["Camp", 8],
	["CampEast", 8],
	["MASH", 8],
	
	["SpecialWeaponsBox", 3],
	["GuerillaCacheBox", 2],
	["LocalBasicWeaponsBox", 4],
	["LocalBasicAmmunitionBox", 2],
	["RULaunchersBox", 3],
	["RUOrdnanceBox", 3],
	["RUBasicWeaponsBox", 5],
	["RUSpecialWeaponsBox", 6],
	["RUVehicleBox", 16],
	["RUBasicAmmunitionBox", 2],
	["USLaunchersBox", 3],
	["USOrdnanceBox", 3],
	["USBasicWeaponsBox", 5],
	["USSpecialWeaponsBox", 6],
	["USVehicleBox", 16],
	["USBasicAmmunitionBox", 2],
	
	["TargetE", 1],
	["TargetEpopUp", 1],
	["TargetPopUpTarget", 1],
	
	["FoldChair", 0.5],
	["FoldTable", 0.5],
	["Barrels", 6],
	["Wooden_barrels", 6],
	["BarrelBase", 2],
	["Fuel_can", 1],
	["Notice_board", 0.5],
	["Pallets_comlumn", 2],
	["Unwrapped_sleeping_bag", 2],
	["Wheel_barrow", 2],
	["RoadCone", 0.2],
	["Sign_1L_Border", 0.2],
	["Sign_Danger", 0.2],
	["Suitcase", 0.2],
	["SmallTable", 0.2]
];


/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveables by player.
 * Liste des noms de classes des objets transportables par le joueur.
 */
R3F_LOG_CFG_objets_deplacables =
[
	"SatPhone", // Needed for the R3F_ARTY module (arty HQ) (nécessaire pour le module R3F_ARTY (PC d'arti))
	"StaticWeapon",
	
	"RubberBoat",
	
	"FlagCarrierSmall",
	
	"Land_BagFenceCorner",
	"RoadBarrier_light",
	"FlagCarrierCore",
	"Hedgehog",
	"Land_fortified_nest_small",
	
	"Land_HBarrier1",
	"Land_HBarrier3",
	"Land_HBarrier5",
	"Base_WarfareBBarrier5x",
	
	"Camp_base",
	"ReammoBox",
	
	"TargetE",
	"TargetEpopUp",
	"TargetPopUpTarget",
	
	"FoldChair",
	"FoldTable",
	"BarrelBase",
	"Fuel_can",
	"Notice_board",
	"Pallets_comlumn",
	"Unwrapped_sleeping_bag",
	"Wheel_barrow",
	"RoadCone",
	"Sign_1L_Border",
	"Sign_Danger",
	"Suitcase",
	"SmallTable"
];