// F2A2 - ShackTactical Assign Gear Script
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private [
"_faction","_rifle","_rifleGL","_rifleTL","_MG","_pistol","_riflemag",
"_GLMag","_MGmag","_grenade","_at","_atmag",
"_smokewhite","_smokegreen","_smokered","_smokegrenade",
"_pistol","_pistolmag",
"_medicrifle","_medicmag","_snrifle","_snmag","_sprifle","_spmag","_mediumMG","_mediumMGmag", "_heavyMG", "_heavyMGtripod", "_heavyMGmag",
"_mediumAT","_mediumATmag1","_mediumATmag2","_heavyAT","_heavyATmag1","_heavyATmag2","_rucksack","_medicrucksack",
"_bandage", "_morphine", "_epinephrine",
"_oldrifle","_oldmag",
"_ruckmags","_ruckweapons",
"_bandage","_morphine","_epinephrine","_sfrifle","_sfrifleGL","_sfriflemag","_sfsnrifle","_sfsnmag","_sfmg","_sfmgmag","_sfpistol","_sfpistolmag", "_dmrifle", "_dmriflemag"];

// ====================================================================================

// ERROR CHECKING
// If the script has been called without both required paramaters being passed, it 
// exits immediately.

sleep .1;

if (isNull (_this select 1)) exitwith {};
if (!local (_this select 1)) exitwith {};

// ====================================================================================

// GET UNIT FACTION
// The second variable passed to the script identifies the unit, from which we can
// then get the faction. More error checking is included here.

_typeofUnit = toLower (_this select 0);
_unit = _this select 1;
_faction = toLower (faction _unit);

if (isnil ("_faction")) then {call compile format ["_faction = '%1'",(faction _unit)];};
_faction =  tolower _faction;
if (!(_faction == "bis_tk") and !(_faction == "bis_us") and !(_faction == "bis_tk_gue") and !(_faction == "ins") and !(_faction == "cdf") and !(_faction == "ace_gru")) exitwith {player globalchat format ["DEBUG (f\common\@ShackTac_assignGear.sqf): Unit %1 faction %2 is not correct. Make sure the script is initialized correctly.",_unit,_faction];};

// ====================================================================================

// DEFINE GLOBAL EQUIPMENT
// The following blocks of code define equipment that is universal (medical equipment)

_bandage = "ACE_Bandage";
_morphine = "ACE_Morphine";
_epinephrine = "ACE_Epinephrine";

// ====================================================================================

// DEFINE FACTION EQUIPMENT
// The following blocks of code define the equipment for each faction.

switch (_faction) do
{

// ====================================================================================

// EQUIPMENT: RUSSIAN
// The block of code below identifies equipment for the Russian faction.

   case "bis_tk":
   {
   _rifle = "AK_107_kobra";
   _rifleGL = "AK_107_GL_kobra";
   _rifleTL = "AK_107_GL_kobra";
   _medicrifle = "ACE_AK105_Kobra";
   _medicmag = "30Rnd_545x39_AK";
   _MG = "ACE_RPK74M";
   _riflemag = "30Rnd_545x39_AK";
   _GLmag = "1Rnd_HE_GP25";
   _MGmag = "ACE_45Rnd_545x39_B_AK";
   _grenade = "HandGrenade_East";
   _at = "ACE_RPG22";
   _atmag = "ACE_RPG22";
   
   _snrifle = "SVD_CAMO";
   _snmag = "10Rnd_762x54_SVD";
   _sprifle = "ACE_AK105_PSO";
   _spmag = "30Rnd_545x39_AK";
   
   _dmrifle = "AK_107_pso";
   _dmriflemag = "30Rnd_545x39_AK";
   
   _mediumMG = "PK";
   _mediumMGmag = "100Rnd_762x54_PK";
   
   _sfrifle = "ACE_oc14";
   _sfrifleGL = "ACE_oc14gl";
   _sfriflemag = "ACE_20Rnd_9x39_B_OC14";
   _sfsnrifle = "ACE_Val_PSO";
   _sfsnmag = "20Rnd_9x39_SP5_VSS";
   _sfmg = "PK";
   _sfmgmag = "100Rnd_762x54_PK";
   _sfpistol = "MakarovSD";
   _sfpistolmag = "8Rnd_9x18_MakarovSD";
   
   _heavyMG = "ACE_KORDProxy";
   _heavyMGtripod = "ACE_6T7TripodProxy";
   _heavyMGmag = "ACE_KORD_CSWDM";
   
   _mediumAT = "ACE_RPG29";
   _mediumATmag1 = "ACE_RPG29_PG29";
   _mediumATmag2 = "ACE_RPG29_TBG29";
   
   _heavyAT = "MetisLauncher";
   _heavyATmag1 = "AT13";
   _heavyATmag2 = "AT13";
   
   _smokewhite = "1Rnd_SMOKE_GP25";
   _smokegreen = "1Rnd_SMOKEGREEN_GP25";
   _smokered = "1Rnd_SMOKERED_GP25";
   _smokegrenade = "ACE_RDGM";
   
   _pistol = "Makarov";
   _pistolmag = "8Rnd_9x18_Makarov";
   
   _rucksack = "ACE_Rucksack_MOLLE_Wood";
   _medicrucksack = "ACE_Rucksack_EAST_Medic";
   
   _oldrifle = "AK_47_M";
   _oldmag = "30Rnd_762x39_AK47";
   };

 // ====================================================================================
// EQUIPMENT: RUSSIAN SPETZ
// The block of code below identifies equipment for the Russian faction.
   case "ace_gru":
   {
   _rifle = "AK_107_kobra";
   _rifleGL = "AK_107_GL_kobra";
   _rifleTL = "AK_107_GL_kobra";
   _medicrifle = "ACE_AK105_Kobra";
   _medicmag = "30Rnd_545x39_AK";
   _MG = "ACE_RPK74M";
   _riflemag = "30Rnd_545x39_AK";
   _GLmag = "1Rnd_HE_GP25";
   _MGmag = "ACE_45Rnd_545x39_B_AK";
   _grenade = "HandGrenade_East";
   _at = "ACE_RPG22";
   _atmag = "ACE_RPG22";
   
   _snrifle = "SVD_CAMO";
   _snmag = "10Rnd_762x54_SVD";
   _sprifle = "ACE_AK105_PSO";
   _spmag = "30Rnd_545x39_AK";
   
   _dmrifle = "AK_107_pso";
   _dmriflemag = "30Rnd_545x39_AK";
   
   _mediumMG = "PK";
   _mediumMGmag = "100Rnd_762x54_PK";
   
   _sfrifle = "ACE_oc14";
   _sfrifleGL = "ACE_oc14gl";
   _sfriflemag = "ACE_20Rnd_9x39_B_OC14";
   _sfsnrifle = "ACE_Val_PSO";
   _sfsnmag = "20Rnd_9x39_SP5_VSS";
   _sfmg = "PK";
   _sfmgmag = "100Rnd_762x54_PK";
   _sfpistol = "MakarovSD";
   _sfpistolmag = "8Rnd_9x18_MakarovSD";
   
   _heavyMG = "ACE_KORDProxy";
   _heavyMGtripod = "ACE_6T7TripodProxy";
   _heavyMGmag = "ACE_KORD_CSWDM";
   
   _mediumAT = "ACE_RPG29";
   _mediumATmag1 = "ACE_RPG29_PG29";
   _mediumATmag2 = "ACE_RPG29_TBG29";
   
   _heavyAT = "MetisLauncher";
   _heavyATmag1 = "AT13";
   _heavyATmag2 = "AT13";
   
   _smokewhite = "1Rnd_SMOKE_GP25";
   _smokegreen = "1Rnd_SMOKEGREEN_GP25";
   _smokered = "1Rnd_SMOKERED_GP25";
   _smokegrenade = "ACE_RDGM";
   
   _pistol = "Makarov";
   _pistolmag = "8Rnd_9x18_Makarov";
   
   _rucksack = "ACE_Rucksack_MOLLE_Wood";
   _medicrucksack = "ACE_Rucksack_EAST_Medic";
   
   _oldrifle = "AK_47_M";
   _oldmag = "30Rnd_762x39_AK47";
   };
// ====================================================================================

// EQUIPMENT: USMC
// The block of code below identifies equipment for the USMC faction.

   case "bis_us":
   {
   _rifle = "ACE_SOC_M4A1_Aim";
   _rifleGL = "ACE_SOC_M4A1_GL_AIMPOINT";
//   _rifleGL = "ACE_SOC_M4A1_GL_Aim";
   _rifleTL = "ACE_SOC_M4A1_GL_AIMPOINT";
   _medicrifle = "ACE_SOC_M4A1_Aim";
   _medicmag = "30Rnd_556x45_Stanag";
   _MG = "M249";
   _riflemag = "30Rnd_556x45_Stanag";
   _GLmag = "1Rnd_HE_M203";
   _MGmag = "200Rnd_556x45_M249";
   _grenade = "HandGrenade_West";
   _at = "ACE_M136_CSRS";
   _atmag = "ACE_M136_CSRS";
   
   _sfrifle = "ACE_SOC_M4A1_Aim";
   _sfrifleGL = "ACE_M4A1_AIM_GL";
   _sfriflemag = "30Rnd_556x45_Stanag";
   _sfsnrifle = "M4SPR";
   _sfsnmag = "30Rnd_556x45_Stanag";
   _sfmg = "ACE_M249Para";
   _sfmgmag = "200Rnd_556x45_M249";
   _sfpistol = "M9SD";
   _sfpistolmag = "15Rnd_9x19_M9SD";
      
   _snrifle = "M40A3";
   _snmag = "5Rnd_762x51_M24";
   _sprifle = "m16a4_acg";
   _spmag = "30Rnd_556x45_Stanag";
   
   _dmrifle = "m16a4_acg";
   _dmriflemag = "30Rnd_556x45_Stanag";
   
   _mediumMG = "M240";
   _mediumMGmag = "100Rnd_762x51_M240";
   
   _heavyMG = "ACE_M2HBProxy";
   _heavyMGtripod = "ACE_M3TripodProxy";
   _heavyMGmag = "ACE_M2_CSWDM";
   
   _mediumAT = "SMAW";
   _mediumATmag1 = "SMAW_HEAA";
   _mediumATmag2 = "SMAW_HEDP";
   
   _heavyAT = "Javelin";
   _heavyATmag1 = "Javelin";
   _heavyATmag2 = "Javelin";
   
   _smokewhite = "1Rnd_Smoke_M203";
   _smokegreen = "1Rnd_SmokeGreen_M203";
   _smokered = "1Rnd_SmokeRed_M203";
   _smokegrenade = "SmokeShell";
   
   _pistol = "M9";
   _pistolmag = "15Rnd_9x19_M9";
   
   _rucksack = "ACE_VTAC_RUSH72_ACU";
   _medicrucksack = "ACE_Rucksack_MOLLE_ACU_Medic";

   _oldrifle = "ACE_M16A4_Iron";
   _oldmag = "20Rnd_556x45_Stanag";
   };

// ====================================================================================

// EQUIPMENT: NAPA
// The block of code below identifies equipment for the NAPA faction.

   case "bis_tk_gue":
   {
   _rifle = "AK_74";
   _rifleGL = "AK_74_GL";
   _rifleTL = "AK_74_GL";
   _medicrifle = "AKS_74_U";
   _medicmag = "30Rnd_545x39_AK";
   _MG = "RPK_74";
   _riflemag = "30Rnd_545x39_AK";
   _GLmag = "1Rnd_HE_GP25";
   _MGmag = "75Rnd_545x39_RPK";
   _grenade = "HandGrenade_East";
   _at = "RPG18";
   _atmag = "RPG18";

   _snrifle = "Huntingrifle";
   _snmag = "5x_22_LR_17_HMR";
   _sprifle = "ACE_AK105_PSO";
   _spmag = "30Rnd_545x39_AK";
   
   _dmrifle = "AK_107_pso";
   _dmriflemag = "30Rnd_545x39_AK";

   _mediumMG = "PK";
   _mediumMGmag = "100Rnd_762x54_PK";
   
   _heavyMG = "ACE_DSHKMProxy";
   _heavyMGtripod = "ACE_DSHKMTripodProxy";
   _heavyMGmag = "ACE_DSHKM_CSWDM";

   _mediumAT = "RPG7V";
   _mediumATmag1 = "PG7V";
   _mediumATmag2 = "PG7VR";

   _heavyAT = "ACE_RPG29";
   _heavyATmag1 = "ACE_RPG29_PG29";
   _heavyATmag2 = "ACE_RPG29_TBG29";

   _smokewhite = "1Rnd_SMOKE_GP25";
   _smokegreen = "1Rnd_SMOKEGREEN_GP25";
   _smokered = "1Rnd_SMOKERED_GP25";
   _smokegrenade = "ACE_RDG2";

   _pistol = "Makarov";
   _pistolmag = "8Rnd_9x18_Makarov";
   
   _rucksack = "ACE_BackPack";
   _medicrucksack = "ACE_BackPack";

   _oldrifle = "ACE_SKS";
   _oldmag = "ACE_10Rnd_762x39_B_SKS";
   };

// ====================================================================================

// EQUIPMENT: CDF
// The block of code below identifies equipment for the CDF faction.

   case "cdf":
   {
   _rifle = "ACE_AK103";
   _rifleGL = "ACE_AK103_GL";
   _rifleTL = "ACE_AK103_GL";
   _medicrifle = "ACE_AKS74P";
   _medicmag = "30Rnd_545x39_AK";
   _MG = "RPK_74";
   _riflemag = "ACE_30Rnd_762x39_T_AK47";
   _GLmag = "1Rnd_HE_GP25";
   _MGmag = "75Rnd_545x39_RPK";
   _grenade = "HandGrenade_East";
   _at = "RPG18";
   _atmag = "RPG18";

   _snrifle = "SVD_CAMO";
   _snmag = "10Rnd_762x54_SVD";
   _sprifle = "ACE_AK105_PSO";
   _spmag = "30Rnd_545x39_AK";
   
   _dmrifle = "AK_107_pso";
   _dmriflemag = "30Rnd_545x39_AK";

   _mediumMG = "PK";
   _mediumMGmag = "100Rnd_762x54_PK";
   
   _heavyMG = "ACE_DSHKMProxy";
   _heavyMGtripod = "ACE_DSHKMTripodProxy";
   _heavyMGmag = "ACE_DSHKM_CSWDM";

   _mediumAT = "RPG7V";
   _mediumATmag1 = "PG7V";
   _mediumATmag2 = "PG7VR";

   _heavyAT = "ACE_RPG29";
   _heavyATmag1 = "ACE_RPG29_PG29";
   _heavyATmag2 = "ACE_RPG29_TBG29";

   _smokewhite = "1Rnd_SMOKE_GP25";
   _smokegreen = "1Rnd_SMOKEGREEN_GP25";
   _smokered = "1Rnd_SMOKERED_GP25";
   _smokegrenade = "ACE_RDG2";

   _pistol = "ACE_TT";
   _pistolmag = "ACE_8Rnd_762x25_B_Tokarev";
   
   _rucksack = "ACE_Rucksack_MOLLE_Green";
   _medicrucksack = "ACE_Rucksack_MOLLE_Green_Medic";

   _oldrifle = "AK_47_M";
   _oldmag = "30Rnd_762x39_AK47";
   };

// ====================================================================================

// EQUIPMENT: CHDKZ
// The block of code below identifies equipment for the ChDKZ faction.

   case "ins":
   {
   _rifle = "ACE_AK74M";
   _rifleGL = "ACE_AK74M_GL";
   _rifleTL = "ACE_AK74M_GL";
   _medicrifle = "ACE_AKS74P";
   _medicmag = "30Rnd_545x39_AK";
   _MG = "RPK_74";
   _riflemag = "30Rnd_545x39_AK";
   _GLmag = "1Rnd_HE_GP25";
   _MGmag = "75Rnd_545x39_RPK";
   _grenade = "HandGrenade_East";
   _at = "RPG18";
   _atmag = "RPG18";
   
   _snrifle = "SVD";
   _snmag = "10Rnd_762x54_SVD";
   _sprifle = "ACE_AK105_PSO";
   _spmag = "30Rnd_545x39_AK";
   
   _dmrifle = "AK_107_pso";
   _dmriflemag = "30Rnd_545x39_AK";
      
   _mediumMG = "PK";
   _mediumMGmag = "100Rnd_762x54_PK";
   
   _heavyMG = "ACE_DSHKMProxy";
   _heavyMGtripod = "ACE_DSHKMTripodProxy";
   _heavyMGmag = "ACE_DSHKM_CSWDM";
   
   _mediumAT = "RPG7V";
   _mediumATmag1 = "PG7V";
   _mediumATmag2 = "PG7VR";
   
   _heavyAT = "ACE_RPG29";
   _heavyATmag1 = "ACE_RPG29_PG29";
   _heavyATmag2 = "ACE_RPG29_TBG29";
   
   _smokewhite = "1Rnd_SMOKE_GP25";
   _smokegreen = "1Rnd_SMOKEGREEN_GP25";
   _smokered = "1Rnd_SMOKERED_GP25";
   _smokegrenade = "ACE_RDG2";
   
   _pistol = "ACE_TT";
   _pistolmag = "ACE_8Rnd_762x25_B_Tokarev";
   
   _rucksack = "ACE_BackPack";
   _medicrucksack = "ACE_BackPack";

   _oldrifle = "ACE_SKS";
   _oldmag = "ACE_10Rnd_762x39_B_SKS";
   };

};

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable).

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: PLATOON COMMANDER

   case "pltco":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _pistolmag} foreach [1,2,3,4,5,6];
      _unit addweapon _rifle;
      _unit addweapon _pistol;
      _unit addweapon "NVGoggles";   
      _unit addweapon "Binocular";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon "ACE_P159_RD90";
	   
	  [_unit,_riflemag,3] spawn f_addMagToRuck;
            
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: PLATOON SGT.

   case "pltsgt":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _GLmag} foreach [1,2,3,4];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _smokegreen} foreach [1];
      {_unit addmagazine _smokered} foreach [1];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      _unit addweapon _rifleGL;
      _unit addweapon "NVGoggles";   
      _unit addweapon "Binocular";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;
      
      [_unit,_riflemag,6] spawn f_addMagToRuck;
      [_unit,_smokewhite,2] spawn f_addMagToRuck;
      [_unit,_smokered,1] spawn f_addMagToRuck;
      [_unit,_smokegreen,1] spawn f_addMagToRuck;
      [_unit,_smokegrenade,2] spawn f_addMagToRuck;
      [_unit,_grenade,1] spawn f_addMagToRuck;       
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: PLATOON HQ SECTION RIFLEMAN

   case "pltr":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _pistolmag} foreach [1,2,3,4,5,6];
      _unit addweapon _rifle;
      _unit addweapon _pistol;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;

      [_unit,_riflemag,6] spawn f_addMagToRuck;
      [_unit,_grenade,1] spawn f_addMagToRuck;
      [_unit,_smokegrenade,2] spawn f_addMagToRuck;
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: PLATOON MEDIC

   case "pltm":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _grenade} foreach [1];
      _unit addweapon _medicrifle;
      _unit addweapon "NVGoggles";   
      {_unit addmagazine _smokegrenade;} foreach [1,2,3,4,5];
      {_unit addmagazine _bandage;} foreach [1,2];
      {_unit addmagazine _morphine;} foreach [1,2,3];
      {_unit addmagazine _epinephrine;} foreach [1,2,3];
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _medicrucksack;

      [_unit,_medicmag,4] spawn f_addMagToRuck;
      [_unit,_smokegrenade,2] spawn f_addMagToRuck; 
      [_unit,_bandage,10] spawn f_addMagToRuck; 
      [_unit,_morphine,27] spawn f_addMagToRuck; 
      [_unit,_epinephrine,17] spawn f_addMagToRuck; 
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: SQUAD LEADER

   case "sl":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _GLmag} foreach [1,2,3,4];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade;} foreach [1,2];
      _unit addmagazine _smokered;
      _unit addmagazine _smokegreen;
      _unit addweapon _rifleGL;
      _unit addweapon "NVGoggles";   
      _unit addweapon "Binocular";
      _unit addweapon "ACE_Map_Tools";
      
       _unit addweapon "ACE_P159_RD90";
	   	        
      [_unit,_riflemag,2] spawn f_addMagToRuck;
      [_unit,_smokered,2] spawn f_addMagToRuck;
      [_unit,_smokegreen,2] spawn f_addMagToRuck;
            
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: MEDIC

   case "m":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _grenade} foreach [1];
      _unit addweapon _medicrifle;
      _unit addweapon "NVGoggles";   
      {_unit addmagazine _smokegrenade;} foreach [1,2,3,4,5];
      {_unit addmagazine _bandage;} foreach [1,2];
      {_unit addmagazine _morphine;} foreach [1,2,3];
      {_unit addmagazine _epinephrine;} foreach [1,2,3];
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _medicrucksack;

      [_unit,_medicmag,4] spawn f_addMagToRuck;
      [_unit,_smokegrenade,2] spawn f_addMagToRuck; 
      [_unit,_bandage,10] spawn f_addMagToRuck; 
      [_unit,_morphine,27] spawn f_addMagToRuck; 
      [_unit,_epinephrine,17] spawn f_addMagToRuck; 
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: FIRE TEAM LEADER

   case "ftl":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _GLmag} foreach [1,2,3,4,5];
      {_unit addmagazine _smokewhite} foreach [1];
      {_unit addmagazine _Grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade;} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _rifleTL;
      _unit addweapon "NVGoggles";   
      _unit addweapon "Binocular";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;

      [_unit,_riflemag,6] spawn f_addMagToRuck;
      [_unit,_GLmag,7] spawn f_addMagToRuck;
      [_unit,_smokewhite,2] spawn f_addMagToRuck;
      [_unit,_smokered,1] spawn f_addMagToRuck;
      [_unit,_smokegreen,1] spawn f_addMagToRuck;
      [_unit,_smokegrenade,1] spawn f_addMagToRuck;
      [_unit,_grenade,1] spawn f_addMagToRuck; 
            
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: AUTOMATIC RIFLEMAN
// The loadouts differ slightly for each faction.

   case "ar":
   {
      switch (_faction) do
      {
   	case "bis_tk":
   	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _MGmag;} foreach [1,2,3,4,5,6,7,8];
	      _unit addweapon _MG;
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _bandage} foreach [1,2];
	      _unit addweapon _pistol;
              {_unit addmagazine _grenade} foreach [1,2];
              {_unit addmagazine _smokegrenade;} foreach [1,2];
	      _unit addweapon "NVGoggles";
    	      _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;

	      [_unit,_MGmag,2] spawn f_addMagToRuck;	      
	      
	      _unit selectweapon primaryweapon _unit;
	};
	case "bis_us":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _MGmag;} foreach [1,2,3,4];
	      _unit addweapon _MG;
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _bandage} foreach [1,2];
	      _unit addweapon _pistol;
              {_unit addmagazine _grenade} foreach [1,2];
              {_unit addmagazine _smokegrenade;} foreach [1,2];
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;

	      [_unit,_MGmag,1] spawn f_addMagToRuck;	      

	      _unit selectweapon primaryweapon _unit;
	};
	case "bis_tk_gue":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _MGmag;} foreach [1,2,3,4,5,6,7,8];
	      _unit addweapon _MG;
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _bandage} foreach [1,2];
	      _unit addweapon _pistol;
              {_unit addmagazine _grenade} foreach [1,2];
              {_unit addmagazine _smokegrenade;} foreach [1,2];
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;

	      [_unit,_MGmag,2] spawn f_addMagToRuck;
	      
	      _unit selectweapon primaryweapon _unit;
	};
	case "ins":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _MGmag;} foreach [1,2,3,4,5,6,7,8];
	      _unit addweapon _MG;
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _bandage} foreach [1,2];
	      _unit addweapon _pistol;
              {_unit addmagazine _grenade} foreach [1,2];
              {_unit addmagazine _smokegrenade;} foreach [1,2];
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;
	      
	      [_unit,_MGmag,2] spawn f_addMagToRuck;

	      _unit selectweapon primaryweapon _unit;
	};
	case "cdf":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _MGmag;} foreach [1,2,3,4,5,6,7,8];
	      _unit addweapon _MG;
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _bandage} foreach [1,2];
	      _unit addweapon _pistol;
              {_unit addmagazine _grenade} foreach [1,2];
              {_unit addmagazine _smokegrenade;} foreach [1,2];
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;

	      [_unit,_MGmag,2] spawn f_addMagToRuck;
	      
	      _unit selectweapon primaryweapon _unit;
	};
      };
   };

// ====================================================================================

// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
// The loadouts differ slightly for each faction.

   case "aar":
   {
      switch (_faction) do
      {
      	case "bis_tk":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _MGmag;} foreach [1,2];
	      {_unit addmagazine _bandage} foreach [1,2];
	      {_unit addmagazine _grenade} foreach [1,2];
	      {_unit addmagazine _smokegrenade} foreach [1,2];
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      _unit addweapon _rifle;
	      _unit addweapon _pistol;
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;
	      
	      [_unit,_riflemag,4] spawn f_addMagToRuck;
	      [_unit,_MGmag,6] spawn f_addMagToRuck;
	      [_unit,_smokegrenade,1] spawn f_addMagToRuck;
	      [_unit,_grenade,1] spawn f_addMagToRuck;
      
	      _unit selectweapon primaryweapon _unit;
      	};
      	case "bis_us":
   	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _MGmag;} foreach [1,2];
	      {_unit addmagazine _bandage} foreach [1,2];
              _unit addmagazine _grenade;
              _unit addmagazine _smokegrenade;
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      _unit addweapon _rifle;
	      _unit addweapon _pistol;
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;

	      [_unit,_riflemag,4] spawn f_addMagToRuck;
	      [_unit,_MGmag,3] spawn f_addMagToRuck;
	      [_unit,_smokegrenade,1] spawn f_addMagToRuck;
	      [_unit,_grenade,1] spawn f_addMagToRuck;
	      
	      _unit selectweapon primaryweapon _unit;
      	};
      	case "bis_tk_gue":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _MGmag;} foreach [1,2];
	      {_unit addmagazine _bandage} foreach [1,2];
	      {_unit addmagazine _grenade} foreach [1,2];
	      {_unit addmagazine _smokegrenade} foreach [1,2];
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      _unit addweapon _rifle;
	      _unit addweapon _pistol;
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;
	      
	      [_unit,_riflemag,4] spawn f_addMagToRuck;
	      [_unit,_MGmag,6] spawn f_addMagToRuck;
	      [_unit,_smokegrenade,1] spawn f_addMagToRuck;
	      [_unit,_grenade,1] spawn f_addMagToRuck;
      
	      _unit selectweapon primaryweapon _unit;
      	};
	case "ins":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _MGmag;} foreach [1,2];
	      {_unit addmagazine _bandage} foreach [1,2];
	      {_unit addmagazine _grenade} foreach [1,2];
	      {_unit addmagazine _smokegrenade} foreach [1,2];
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      _unit addweapon _rifle;
	      _unit addweapon _pistol;
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;
	      
	      [_unit,_riflemag,4] spawn f_addMagToRuck;
	      [_unit,_MGmag,6] spawn f_addMagToRuck;
	      [_unit,_smokegrenade,1] spawn f_addMagToRuck;
	      [_unit,_grenade,1] spawn f_addMagToRuck;
      
	      _unit selectweapon primaryweapon _unit;
      	};
	case "cdf":
	{
	      removeallweapons _unit;
		  removeBackpack _unit;
	      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
	      {_unit addmagazine _MGmag;} foreach [1,2];
	      {_unit addmagazine _bandage} foreach [1,2];
	      {_unit addmagazine _grenade} foreach [1,2];
	      {_unit addmagazine _smokegrenade} foreach [1,2];
	      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
	      _unit addweapon _rifle;
	      _unit addweapon _pistol;
	      _unit addweapon "NVGoggles";
              _unit addweapon "ACE_Map_Tools";
	      
	      _unit addweapon _rucksack;
	      
	      [_unit,_riflemag,4] spawn f_addMagToRuck;
	      [_unit,_MGmag,6] spawn f_addMagToRuck;
	      [_unit,_smokegrenade,1] spawn f_addMagToRuck;
	      [_unit,_grenade,1] spawn f_addMagToRuck;
      
	      _unit selectweapon primaryweapon _unit;
      	};
      };
   };

// ====================================================================================

// LOADOUT: RIFLEMAN

   case "r":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
      _unit addweapon _rifle;
      _unit addweapon _pistol;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;

      [_unit,_riflemag,6] spawn f_addMagToRuck;
      [_unit,_grenade,1] spawn f_addMagToRuck;
      [_unit,_smokegrenade,1] spawn f_addMagToRuck; 
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: RIFLEMAN (AT)

   case "rat":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _atmag} foreach [1];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
      _unit addweapon _at;
      _unit addweapon _rifle;
      _unit addweapon _pistol;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
//      _unit addweapon _rucksack;
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: MEDIUM MG GUNNER

   case "mmgg":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _mediumMGmag} foreach [1,2,3,4,5];
      _unit addweapon _mediumMG;
      {_unit addmagazine _grenade} foreach [1,2,3];
      {_unit addmagazine _smokegrenade} foreach [1,2,3,4];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _pistol;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Earplugs";
      _unit addweapon "ACE_Map_Tools";
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: MEDIUM MG ASSISTANT GUNNER

   case "mmgag":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _mediumMGmag} foreach [1];
      {_unit addmagazine _grenade} foreach [1];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
      _unit addweapon _medicrifle;
      _unit addweapon _pistol;
      _unit addmagazine "ACE_Battery_Rangefinder";
      _unit addweapon "ACE_Rangefinder_OD";
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Earplugs";
      _unit addweapon "ACE_Map_Tools"; 

      
      _unit addweapon _rucksack;

      [_unit,_medicmag,4] spawn f_addMagToRuck;
      [_unit,_mediumMGmag,1] spawn f_addMagToRuck;
      [_unit,"ACE_Battery_Rangefinder",1] spawn f_addMagToRuck; 
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: MEDIUM MG AMMO MAN

   case "mmgam":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _mediumMGmag} foreach [1,2];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
      _unit addweapon _rifle;
      _unit addweapon _pistol;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Earplugs";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;
      
      [_unit,_riflemag,4] spawn f_addMagToRuck;
      [_unit,_mediumMGmag,4] spawn f_addMagToRuck;       
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: HEAVY MG GUNNER

   case "hmgg":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _medicrifle;
      _unit addweapon _heavyMG;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Earplugs";
      _unit addweapon "ACE_Map_Tools";
      
      // We add this special case for a more even weight distribution in KORD-based
      // HMG teams.
      if (_faction == "bis_tk") then
      {
        _unit addMagazine _heavyMGmag;
      };
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: HEAVY MG ASSISTANT GUNNER

   case "hmgag":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4,5];
      {_unit addmagazine _smokegrenade} foreach [1];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addmagazine "ACE_Battery_Rangefinder";
      _unit addweapon _medicrifle;
      _unit addWeapon _heavyMGtripod;
      _unit addweapon "ACE_Rangefinder_OD";
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Earplugs";
      _unit addweapon "ACE_Map_Tools";
      
      // M2 boxes are 200rnds and  KORD/DSHKM boxes are 100rnds
      // but the KORD tripod is much heavier than the DSHKM tripod
      // so we have to spread-load ammo in the KORD teams.
      switch (_faction) do
      {
        case "bis_tk": 
        {
            {_unit addMagazine _heavyMGmag} forEach [1,2];
        };
        case "bis_us": 
        {
            {_unit addMagazine _heavyMGmag} forEach [1];
        };
        default
        {
            {_unit addMagazine _heavyMGmag} forEach [1,2,3];
        };
      };
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: HEAVY MG AMMO MAN

   case "hmgam":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5];
      {_unit addmagazine _smokegrenade} foreach [1];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _rifle;      
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Earplugs";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;
      
      [_unit,_riflemag,5] spawn f_addMagToRuck;
      
      switch (_faction) do
      {
        case "bis_us": 
        {
            {_unit addMagazine _heavyMGmag} forEach [1];
            [_unit,_heavyMGmag,1] spawn f_addMagToRuck;
        };
        default
        {
            {_unit addMagazine _heavyMGmag} forEach [1];
            [_unit,_heavyMGmag,2] spawn f_addMagToRuck;
        };
      };

      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: MEDIUM AT GUNNER

   case "matg":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _mediumATmag1;} foreach [1,2];
      
      if (_faction == "bis_us") then
      {
        {_unit addMagazine "ACE_SMAW_Spotting"} forEach [1,2,3,4,5,6];
      };
    
      _unit addweapon _mediumAT;
      {_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _medicrifle;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
   };

// ====================================================================================

// LOADOUT: MEDIUM AT ASSISTANT GUNNER

   case "matag":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addmagazine _grenade;
      _unit addweapon _medicrifle;
      _unit addmagazine "ACE_Battery_Rangefinder";
      _unit addweapon "ACE_Rangefinder_OD";
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;
      
      [_unit,_medicmag,4] spawn f_addMagToRuck;
      [_unit,_mediumATmag1,1] spawn f_addMagToRuck; 
      [_unit,_mediumATmag2,1] spawn f_addMagToRuck;
      [_unit,"ACE_Battery_Rangefinder",1] spawn f_addMagToRuck; 
      
      _unit selectweapon primaryweapon _unit; 
   };

// ====================================================================================

// LOADOUT: MEDIUM AT AMMO MAN

   case "matam":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _rifle;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;
      
      [_unit,_riflemag,4] spawn f_addMagToRuck;
      [_unit,_mediumATmag1,1] spawn f_addMagToRuck; 
      [_unit,_mediumATmag2,1] spawn f_addMagToRuck; 
 
      _unit selectweapon primaryweapon _unit;
   };
   
// ====================================================================================

// LOADOUT: HEAVY AT GUNNER

   case "hatg":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _heavyATmag1;} foreach [1];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _heavyAT;
      _unit addweapon _medicrifle;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
   };

// ====================================================================================

// LOADOUT: HEAVY AT ASSISTANT GUNNER

   case "hatag":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _medicmag} foreach [1,2,3,4];
      {_unit addmagazine _heavyATmag1;} foreach [1];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addmagazine _smokegrenade;
      _unit addweapon _medicrifle;
      _unit addmagazine "ACE_Battery_Rangefinder";
      _unit addweapon "ACE_Rangefinder_OD";
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;
        
      [_unit,_medicmag,5] spawn f_addMagToRuck;
      [_unit,"ACE_Battery_Rangefinder",1] spawn f_addMagToRuck;
      
      _unit selectweapon primaryweapon _unit; 
   };

// ====================================================================================

// LOADOUT: HEAVY AT AMMO MAN

   case "hatam":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _riflemag} foreach [1,2,3,4,5];
      {_unit addmagazine _heavyATmag2;} foreach [1];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addmagazine _smokegrenade;
      _unit addweapon _rifle;
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _rucksack;
      
      [_unit,_riflemag,5] spawn f_addMagToRuck; 
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: SNIPER

   case "sn":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _snmag} foreach [1,2,3,4,5,7,8,9];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _grenade} foreach [1];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
      _unit addweapon _pistol;
      _unit addweapon _snrifle;
      _unit addweapon "Binocular";
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      
//      _unit addweapon _rucksack;
     
      _unit selectweapon primaryweapon _unit; 
   };

// ====================================================================================

// LOADOUT: SPOTTER

   case "sp":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _spmag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _snmag} foreach [1,2,3];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4,5,6];
      _unit addweapon _pistol;
      _unit addweapon _sprifle;
      _unit addmagazine "ACE_Battery_Rangefinder";
      _unit addweapon "ACE_Rangefinder_OD";
      _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
      _unit addweapon "ACE_Spottingscope";
      if (!(_unit hasWeapon "ACE_Kestrel4500")) then
      {
        _unit addweapon "ACE_Kestrel4500";
      };
      
	  _unit addweapon "ACE_P159_RD90";
      _unit selectweapon primaryweapon _unit; 
   };

// ====================================================================================

// LOADOUT: MILITIAMAN

   case "mil":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _oldmag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _smokegrenade} foreach [1,2];
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _pistolmag} foreach [1,2,3,4,5,6];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _oldrifle;
      _unit addweapon _pistol;
      _unit addweapon "ACE_Map_Tools";
      
//      _unit addweapon _rucksack;
            
      _unit selectweapon primaryweapon _unit; 
   };

// ====================================================================================

// LOADOUT: SF TEAM LEADER

   case "sfl":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _sfriflemag} foreach [1,2,3,4,5,6,7,8];
      {_unit addmagazine _GLmag} foreach [1,2,3,4,5];
      {_unit addmagazine _smokewhite} foreach [1];
      {_unit addmagazine _Grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade;} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
      _unit addweapon _sfrifleGL;
      _unit addweapon "NVGoggles";   
      _unit addweapon "Binocular";
      _unit addweapon "ACE_Map_Tools";
	  _unit addweapon "ACE_GlassesBalaklava";
	
      
      _unit addweapon _rucksack;
	 
      [_unit,_sfriflemag,10] spawn f_addMagToRuck;
      [_unit,_GLmag,7] spawn f_addMagToRuck;
      [_unit,_smokegrenade,2] spawn f_addMagToRuck;
      [_unit,_smokered,1] spawn f_addMagToRuck;
      [_unit,_smokegreen,1] spawn f_addMagToRuck;
      [_unit,_grenade,2] spawn f_addMagToRuck;
	  [_unit,"ACE_IRStrobe",1] spawn f_addMagToRuck;
            
      _unit selectweapon primaryweapon _unit;
   };
// ====================================================================================

// LOADOUT: SF Radioman

   case "sfg":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
	  {_unit addmagazine _sfriflemag} foreach [1,2,3,4,5,6,7];
      {_unit addmagazine _Grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade;} foreach [1,2];
      {_unit addmagazine _bandage} foreach [1,2];
	  {_unit addmagazine "Laserbatteries"} foreach [1];
	  _unit addweapon "ACE_M72A2";
	  _success = [_unit, "ACE_M72A2"] call ACE_fnc_PutWeaponOnBack;
      _unit addweapon _sfrifle;
      _unit addweapon "NVGoggles";   
	  _unit addweapon "ACE_GlassesBalaklava";
	  _unit addweapon "ACE_Map_Tools";
	  _unit addweapon "Laserdesignator";
	              
      _unit addweapon "ACE_P159_RD90";
	   
	  [_unit,_sfriflemag,2] spawn f_addMagToRuck;
	  [_unit,"Laserbatteries",1] spawn f_addMagToRuck;
	  [_unit,"ACE_IRStrobe",1] spawn f_addMagToRuck;
	  	              
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================
// LOADOUT: SF MG

   case "sfhg":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
	  {_unit addmagazine _sfmgmag;} foreach [1,2,3,4];
	  _unit addweapon _sfmg;
	  {_unit addmagazine _sfpistolmag;} foreach [1,2,3,4,5,6];
	  {_unit addmagazine _bandage} foreach [1,2];
	  _unit addweapon _sfpistol;
      {_unit addmagazine _grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade;} foreach [1,2];
	  _unit addweapon "NVGoggles";
      _unit addweapon "ACE_Map_Tools";
	  _unit addweapon "ACE_GlassesBalaklava";
	  _unit addweapon "ACE_Earplugs";
	  	      
	  _unit addweapon _rucksack;

	  [_unit,_sfmgmag,2] spawn f_addMagToRuck;	
	  [_unit,"ACE_IRStrobe",1] spawn f_addMagToRuck;
      _unit selectweapon primaryweapon _unit;
   };


// ====================================================================================

// LOADOUT: SF Marksman

   case "sfm":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _sfsnmag} foreach [1,2,3,4,5,6,7];
      {_unit addmagazine _Grenade} foreach [1,2];
      {_unit addmagazine _smokegrenade;} foreach [1,2];
      {_unit addmagazine _sfpistolmag;} foreach [1,2,3,4,5,6];
	  {_unit addmagazine _bandage} foreach [1,2];
	  _unit addweapon _sfpistol;
      _unit addweapon _sfsnrifle;
      _unit addweapon "NVGoggles";   
	  _unit addweapon "ACE_GlassesBalaklava";
	  _unit addweapon "ACE_Map_Tools";
            
      _unit addweapon _rucksack;

      [_unit,_sfsnmag,6] spawn f_addMagToRuck;
	  [_unit,_smokegrenade,2] spawn f_addMagToRuck;
      [_unit,_grenade,2] spawn f_addMagToRuck;
	  [_unit,"ACE_IRStrobe",1] spawn f_addMagToRuck;
	              
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================

// LOADOUT: SF Sabatour

   case "sfs":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _sfriflemag} foreach [1,2,3,4,5,6];
      {_unit addmagazine "PipeBomb"} foreach [1];
      {_unit addmagazine _smokegrenade;} foreach [1,2];
	  {_unit addmagazine "ACE_C4_M";} foreach [1];
	  {_unit addmagazine "ACE_M2SLAM_M";} foreach [1];
	  {_unit addmagazine _grenade;} foreach [1];
      {_unit addmagazine _bandage} foreach [1,2];
	  _unit addweapon "ACE_Wirecutter";
	  _success = [_unit, "ACE_Wirecutter"] call ACE_fnc_PutWeaponOnBack;
	  _unit addweapon _sfrifle;
      _unit addweapon "NVGoggles";   
	  _unit addweapon "ACE_GlassesBalaklava";
	  _unit addweapon "ACE_Map_Tools";
            
      _unit addweapon _rucksack;

      [_unit,_sfriflemag,6] spawn f_addMagToRuck;
      [_unit,_smokegrenade,2] spawn f_addMagToRuck;
      [_unit,_grenade,2] spawn f_addMagToRuck;
	  [_unit,"ACE_IRStrobe",1] spawn f_addMagToRuck;
	  [_unit,"ACE_C4_M",4] spawn f_addMagToRuck;
	  [_unit,"ACE_M2SLAM_M",4] spawn f_addMagToRuck;
      
	  	              
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================


// LOADOUT: MEDIC

   case "sfc":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _sfriflemag} foreach [1,2,3,4,5,6,7];
      {_unit addmagazine _grenade} foreach [1];
      _unit addweapon _sfrifle;
      {_unit addmagazine _smokegrenade;} foreach [1,2,3,4];
      {_unit addmagazine _bandage;} foreach [1,2];
      {_unit addmagazine _morphine;} foreach [1,2,3];
      {_unit addmagazine _epinephrine;} foreach [1,2,3];
      _unit addweapon "ACE_Map_Tools";
	  _unit addweapon "NVGoggles";
	  _unit addweapon "ACE_GlassesBalaklava";
	  _unit addweapon "ACE_Map_Tools";
      
      _unit addweapon _medicrucksack;

      [_unit,_sfriflemag,10] spawn f_addMagToRuck;
      [_unit,_smokegrenade,2] spawn f_addMagToRuck; 
      [_unit,_bandage,15] spawn f_addMagToRuck; 
      [_unit,_morphine,25] spawn f_addMagToRuck; 
      [_unit,_epinephrine,15] spawn f_addMagToRuck; 
	  [_unit,"ACE_IRStrobe",1] spawn f_addMagToRuck;
      
      _unit selectweapon primaryweapon _unit;
   };

// ====================================================================================


// LOADOUT: Designated Marksman

   case "dm":
   {
      removeallweapons _unit;
	  removeBackpack _unit;
      {_unit addmagazine _dmriflemag} foreach [1,2,3,4,5,6,7];
      {_unit addmagazine _Grenade} foreach [1];
      {_unit addmagazine _smokegrenade;} foreach [1,2,3];
      {_unit addmagazine _pistolmag;} foreach [1,2,3,4];
	  {_unit addmagazine _bandage} foreach [1,2,3];
	  {_unit addmagazine _morphine;} foreach [1];
	  _unit addweapon _pistol;
      _unit addweapon _dmrifle;
      _unit addweapon "NVGoggles";   
	  _unit addweapon "ACE_Map_Tools";
            
                   
      _unit selectweapon primaryweapon _unit;
   };

// ERROR CHECKING
// If the unit type could not be successfully detected the script exits with an error.

   default
   {
   if (true) exitwith {player globalchat format ["DEBUG (f\common\@ShackTac_assignGear.sqf): Unit = %1. Gear template %2 does not exist.",_unit,_typeofunit]};
   };
};
