// F2A2 - ShackTactical Assign Gear Script
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private [
"_side","_rifle","_rifleGL","_rifleTL","_MG","_pistol","_riflemag","_rifleGLmag",
"_GLMag","_MGmag","_grenade","_at","_atmag",
"_smokewhite","_smokegreen","_smokered","_smokegrenade",
"_pistol","_pistolmag",
"_medicrifle","_medicmag","_snrifle","_snmag","_sprifle","_spmag","_mediumMG","_mediumMGmag", "_heavyMG", "_heavyMGtripod", "_heavyMGmag",
"_mediumAT","_mediumATmag1","_mediumATmag2","_heavyAT","_heavyATmag1","_heavyATmag2","_rucksack","_medicrucksack",
"_bandage", "_morphine", "_epinephrine",
"_oldrifle","_oldmag",
"_ruckmags","_ruckweapons",
"_bandage","_morphine","_epinephrine","_sfrifle","_sfrifleGL","_sfriflemag","_sfsnrifle","_sfsnmag","_sfmg","_sfmgmag","_sfpistol","_sfpistolmag", "_dmrifle", "_dmriflemag", "_aa", "_aamag", "_radio","_medkit"];

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
_side = tolower format ["%1", side _unit];  
if (isnil ("_side")) then {call compile format ["_side = '%1'",(side _unit)];};
_side =  tolower _side;
if (!(_side == "west") and !(_side == "east") and !(_side == "guer") and !(_side == "civ") ) exitwith {player globalchat format ["DEBUG (f\common\@ShackTac_assignGear.sqf): Unit %1 faction %2 is not correct. Make sure the script is initialized correctly.",_unit,_side];};

// ====================================================================================

// DEFINE GLOBAL EQUIPMENT
// The following blocks of code define equipment that is universal (medical equipment)

_bandage = "ACE_Bandage";
_morphine = "ACE_Morphine";
_epinephrine = "ACE_Epinephrine";
_medkit = "ACE_Medkit";

// ====================================================================================

// DEFINE FACTION EQUIPMENT
// The following blocks of code define the equipment for each faction.

switch (_side) do
	{

	// ====================================================================================

	// EQUIPMENT: east
	// The block of code below identifies equipment for the east factions.

	   case "east":
		{
		   _rifle = "AK_107_pso";
		   _rifleGL = "AK_107_GL_kobra";
		   _rifleTL = "AK_107_GL_pso";
		   _rifleOP = "AK_107_pso";
		   _medicrifle = "ACE_AK105_PSO";
		   _medicmag = "30Rnd_545x39_AK";
		   _MG = "ACE_RPK74M_1P29";
		   _riflemag = "30Rnd_545x39_AK";
		   _rifleGLmag = "30Rnd_545x39_AK";
		   _GLmag = "1Rnd_HE_GP25";
		   _MGmag = "ACE_45Rnd_545x39_B_AK";
		   _grenade = "HandGrenade_East";
		   _at = "ACE_RPG22";
		   _atmag = "ACE_RPG22";
		   
		   _sfrifle = "AKS_74_U";
		   _sfrifleGL = "AK_74_GL_kobra";
		   _sfriflemag = "30Rnd_545x39_AK";
		   _sfsnrifle = "VSS_Vintorez";
		   _sfsnmag = "20Rnd_9x39_SP5_VSS";
		   _sfmg = "ACE_RPK74M";
		   _sfmgmag = "ACE_45Rnd_545x39_B_AK";
		   _sfpistol = "MakarovSD";
		   _sfpistolmag = "8Rnd_9x18_MakarovSD";
		   
		   _snrifle = "SVD_CAMO";
		   _snmag = "10Rnd_762x54_SVD";
		   _sprifle = "ACE_AK105_PSO";
		   _spmag = "30Rnd_545x39_AK";
		   
		   _dmrifle = "SVD";
		   _dmriflemag = "10Rnd_762x54_SVD";
		   
		   _mediumMG = "Pecheneg";
		   _mediumMGmag = "100Rnd_762x54_PK";
		   
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
		   
		   _radio = "ACE_PRC119_MAR";
		};

	// EQUIPMENT: west
	// The block of code below identifies equipment for the west faction.

	   case "west":
		{
		   _rifle = "ACE_SOC_M4A1_SHORTDOT";
		   _rifleGL = "ACE_SOC_M4A1_RCO_GL";
		   _rifleTL = "ACE_SOC_M4A1_RCO_GL";
		   _rifleOP = "ACE_SOC_M4A1_SHORTDOT";
		   _medicrifle = "ACE_SOC_M4A1_SHORTDOT";
		   _medicmag = "30Rnd_556x45_Stanag";
		   _MG = "M249_m145_EP1";
		   _riflemag = "30Rnd_556x45_Stanag";
		   _rifleGLmag = "30Rnd_556x45_Stanag";
		   _GLmag = "1Rnd_HE_M203";
		   _MGmag = "200Rnd_556x45_M249";
		   _grenade = "HandGrenade_West";
		   _at = "ACE_M136_CSRS";
		   _atmag = "ACE_M136_CSRS";
		   
		   _sfrifle = "ACE_SOC_M4A1_SHORTDOT";
		   _sfrifleGL = "ACE_SOC_M4A1_RCO_GL";
		   _sfriflemag = "30Rnd_556x45_Stanag";
		   _sfsnrifle = "SCAR_H_LNG_Sniper_SD";
		   _sfsnmag = "20rnd_762x51_SB_SCAR";
		   _sfmg = "M249_m145_EP1";
		   _sfmgmag = "200Rnd_556x45_M249";
		   _sfpistol = "M9SD";
		   _sfpistolmag = "15Rnd_9x19_M9SD";
		   
		   _snrifle = "M40A3";
		   _snmag = "5Rnd_762x51_M24";
		   _sprifle = "m16a4_acg";
		   _spmag = "30Rnd_556x45_Stanag";
		   
		   _dmrifle = "DMR";
		   _dmriflemag = "20Rnd_762x51_DMR";
		   
		   _mediumMG = "ACE_M240G_M145";
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
		
		   _oldrifle = "ACE_M16A4_Iron";
		   _oldmag = "20Rnd_556x45_Stanag";
		   
		   if ((faction _unit) == "BIS_US") then {
			_radio = "ACE_PRC119_ACU";
			_rucksack = "ACE_Rucksack_MOLLE_ACU";
			_medicrucksack = "ACE_Rucksack_MOLLE_ACU_Medic";
			} 
			else {
			_radio = "ACE_PRC119_MAR";
			_rucksack = "ACE_Rucksack_MOLLE_WMARPAT";
			_medicrucksack = "ACE_Rucksack_MOLLE_WMARPAT_Medic";
			};
		};

	// ====================================================================================

	// EQUIPMENT: resistance
	// The block of code below identifies equipment for the resistance factions.

	   case "guer":
		{
		   _rifle = "ACE_G3A3";
		   _rifleGL = "ACE_AKS74P_GL_PSO";
		   _rifleTL = "ACE_AKS74P_GL_PSO";
		   _medicrifle = "ACE_SKS";
		   _medicmag = "ACE_10Rnd_762x39_T_SKS";
		   _MG = "RPK_74";
		   _riflemag = "ACE_20Rnd_762x51_T_G3";
		   _rifleGLmag = "30Rnd_545x39_AK";
		   _GLmag = "1Rnd_HE_GP25";
		   _MGmag = "75Rnd_545x39_RPK";
		   _grenade = "HandGrenade_East";
		   _at = "RPG18";
		   _atmag = "RPG18";

		   _snrifle = "SVD";
		   _snmag = "10Rnd_762x54_SVD";
		   _sprifle = "ACE_AK105_PSO";
		   _spmag = "30Rnd_545x39_AK";
		   
		   _dmrifle = "Huntingrifle";
		   _dmriflemag = "5x_22_LR_17_HMR";

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
		   
		   _radio = "ACE_PRC119_MAR";
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};    
			  _unit addweapon "Binocular";
			  
			  
			  _unit addweapon _radio;
			   
			  [_unit,_riflemag,3] spawn f_addMagToRuck;
					
			  _unit selectweapon primaryweapon _unit;
		   };

		// ====================================================================================

		// LOADOUT: PLATOON SGT.

		   case "pltsgt":
		   {
			  removeallweapons _unit;
			  removeBackpack _unit;
			  {_unit addmagazine _rifleGLmag} foreach [1,2,3,4,5,6,7,8];
			  {_unit addmagazine _GLmag} foreach [1,2,3,4];
			  {_unit addmagazine _bandage} foreach [1,2];
			  {_unit addmagazine _smokegreen} foreach [1];
			  {_unit addmagazine _smokered} foreach [1];
			  {_unit addmagazine _grenade} foreach [1,2];
			  {_unit addmagazine _smokegrenade} foreach [1,2];
			  _unit addweapon _rifleGL;
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};    
			  _unit addweapon "Binocular";
			  
			  
			  _unit addweapon _rucksack;
			  
			  [_unit,_rifleGLmag,6] spawn f_addMagToRuck;
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
			  
			  if (_side != "guer") then {_unit addweapon _rucksack;

			  [_unit,_riflemag,6] spawn f_addMagToRuck;
			  [_unit,_grenade,1] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,2] spawn f_addMagToRuck;};
			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};    
			  {_unit addmagazine _smokegrenade;} foreach [1,2,3,4,5];
			  {_unit addmagazine _bandage;} foreach [1,2];
			  {_unit addmagazine _morphine;} foreach [1,2,3];
			  {_unit addmagazine _epinephrine;} foreach [1,2,3];
			  
			  
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
			  if (_side == "gue") then {_unit addweapon "M79_EP1";_success = [_unit, "M79_EP1"] call ACE_fnc_PutWeaponOnBack;};
			  {_unit addmagazine _rifleGLmag} foreach [1,2,3,4,5,6,7,8];
			  {_unit addmagazine _GLmag} foreach [1,2,3,4];
			  {_unit addmagazine _bandage} foreach [1,2];
			  {_unit addmagazine _grenade} foreach [1,2];
			  {_unit addmagazine _smokegrenade;} foreach [1,2];
			  _unit addmagazine _smokered;
			  _unit addmagazine _smokegreen;
			  _unit addweapon _rifleGL;
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};    
			  _unit addweapon "Binocular";
			  
			  
			  
			  _unit addweapon _radio;
						
			  [_unit,_rifleGLmag,2] spawn f_addMagToRuck;
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};    
			  {_unit addmagazine _smokegrenade;} foreach [1,2,3,4,5];
			  {_unit addmagazine _bandage;} foreach [1,2];
			  {_unit addmagazine _morphine;} foreach [1,2,3];
			  {_unit addmagazine _epinephrine;} foreach [1,2,3];
			  {_unit addmagazine _medkit;} foreach [1,2];
			  
			  
			  _unit addweapon _medicrucksack;

			  [_unit,_medicmag,4] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,2] spawn f_addMagToRuck; 
			  [_unit,_bandage,10] spawn f_addMagToRuck; 
			  [_unit,_morphine,27] spawn f_addMagToRuck; 
			  [_unit,_epinephrine,17] spawn f_addMagToRuck; 
			  [_unit,_medkit,2] spawn f_addMagToRuck;
			  
			  _unit selectweapon primaryweapon _unit;
		   };

		// ====================================================================================

		// LOADOUT: FIRE TEAM LEADER

		   case "ftl":
		   {
			  removeallweapons _unit;
			  removeBackpack _unit;
			  if (_side == "gue") then {_unit addweapon "M79_EP1";_success = [_unit, "M79_EP1"] call ACE_fnc_PutWeaponOnBack;};
			  {_unit addmagazine _rifleGLmag} foreach [1,2,3,4,5,6,7,8];
			  {_unit addmagazine _GLmag} foreach [1,2,3,4,5];
			  {_unit addmagazine _smokewhite} foreach [1];
			  {_unit addmagazine _Grenade} foreach [1,2];
			  {_unit addmagazine _smokegrenade;} foreach [1,2];
			  {_unit addmagazine _bandage} foreach [1,2];
			  _unit addweapon _rifleTL;
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};   
			  _unit addweapon "Binocular";
			  
			  
			  if (_side != "guer") then {_unit addweapon _rucksack;

			  [_unit,_rifleGLmag,6] spawn f_addMagToRuck;
			  [_unit,_GLmag,7] spawn f_addMagToRuck;
			  [_unit,_smokewhite,2] spawn f_addMagToRuck;
			  [_unit,_smokered,1] spawn f_addMagToRuck;
			  [_unit,_smokegreen,1] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,1] spawn f_addMagToRuck;
			  [_unit,_grenade,1] spawn f_addMagToRuck; };
						
			  _unit selectweapon primaryweapon _unit;
		   };

		// ====================================================================================

		// LOADOUT: AUTOMATIC RIFLEMAN
		// The loadouts differ slightly for each faction.

		   case "ar":
		   {
			  switch (_side) do
				{
					case "east":
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
						
						_unit addweapon "ACE_Earplugs";

						_unit addweapon _rucksack;

						[_unit,_MGmag,2] spawn f_addMagToRuck;	      

						_unit selectweapon primaryweapon _unit;
					};
					case "west":
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
						
						_unit addweapon "ACE_Earplugs";

						_unit addweapon _rucksack;

						[_unit,_MGmag,1] spawn f_addMagToRuck;	      

						_unit selectweapon primaryweapon _unit;
					};
					case "guer":
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
						
						_unit addweapon "ACE_Earplugs";

						_unit selectweapon primaryweapon _unit;
					};
				};
		   };

		// ====================================================================================

		// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
		// The loadouts differ slightly for each faction.

		   case "aar":
			{
			  switch (_side) do
				{
					case "east":
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
						

						_unit addweapon _rucksack;

						[_unit,_riflemag,4] spawn f_addMagToRuck;
						[_unit,_MGmag,6] spawn f_addMagToRuck;
						[_unit,_smokegrenade,1] spawn f_addMagToRuck;
						[_unit,_grenade,1] spawn f_addMagToRuck;

						_unit selectweapon primaryweapon _unit;
					};
					case "west":
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
						

						_unit addweapon _rucksack;

						[_unit,_riflemag,4] spawn f_addMagToRuck;
						[_unit,_MGmag,3] spawn f_addMagToRuck;
						[_unit,_smokegrenade,1] spawn f_addMagToRuck;
						[_unit,_grenade,1] spawn f_addMagToRuck;

						_unit selectweapon primaryweapon _unit;
					};
					case "guer":
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
			  
			  if (_side != "guer") then {_unit addweapon _rucksack;

			  [_unit,_riflemag,6] spawn f_addMagToRuck;
			  [_unit,_grenade,1] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,1] spawn f_addMagToRuck; };
			  
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
			  _unit addweapon _rucksack;
			  _success = [_unit, _rucksack] call ACE_fnc_PutWeaponOnBack;
			  _unit addweapon _at;
			  _unit addweapon _rifle;
			  _unit addweapon _pistol;
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
			  
			  [_unit,_riflemag,6] spawn f_addMagToRuck;
			  [_unit,_grenade,1] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,1] spawn f_addMagToRuck;
			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  _unit addweapon "ACE_Earplugs";
			  
			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  _unit addweapon "ACE_Earplugs";
			   

			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  _unit addweapon "ACE_Earplugs";
			  
			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  _unit addweapon "ACE_Earplugs";
			  
			  
			  // We add this special case for a more even weight distribution in KORD-based
			  // HMG teams.
			  if (_side == "east") then
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  _unit addweapon "ACE_Earplugs";
			  
			  
			  // M2 boxes are 200rnds and  KORD/DSHKM boxes are 100rnds
			  // but the KORD tripod is much heavier than the DSHKM tripod
			  // so we have to spread-load ammo in the KORD teams.
			  switch (_side) do
			  {
				case "east": 
				{
					{_unit addMagazine _heavyMGmag} forEach [1,2];
				};
				case "west": 
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  _unit addweapon "ACE_Earplugs";
			  
			  
			  _unit addweapon _rucksack;
			  
			  [_unit,_riflemag,5] spawn f_addMagToRuck;
			  
			  switch (_side) do
			  {
				case "west": 
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
				
			  _unit addweapon _mediumAT;
			  {_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
			  {_unit addmagazine _smokegrenade} foreach [1,2];
			  {_unit addmagazine _bandage} foreach [1,2];
			  _unit addweapon _medicrifle;
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
			  
			  _unit addweapon _rucksack;
			  
			  [_unit,_medicmag,4] spawn f_addMagToRuck;
			  [_unit,_mediumATmag1,2] spawn f_addMagToRuck; 
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
			  
			  _unit addweapon _rucksack;
			  
			  [_unit,_riflemag,4] spawn f_addMagToRuck;
			  [_unit,_mediumATmag1,2] spawn f_addMagToRuck; 
		 
			  _unit selectweapon primaryweapon _unit;
		   };
		   
		// ====================================================================================

		// LOADOUT: HEAVY AT GUNNER

		   case "hatg":
			{   
				switch (_side) do
				{
					case "east":
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
						
					};
					case "west":
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
						
					};
					case "guer":
					{
						removeallweapons _unit;
						removeBackpack _unit;
						{_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
						{_unit addmagazine _smokegrenade} foreach [1,2];
						{_unit addmagazine _heavyATmag1;} foreach [1,2];
						{_unit addmagazine _bandage} foreach [1,2];
						_unit addweapon _heavyAT;
						_unit addweapon _medicrifle;
						
					};
				};
			};

		// ====================================================================================

		// LOADOUT: HEAVY AT ASSISTANT GUNNER

		   case "hatag":
			{
				switch (_side) do
				{
					case "east":
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
						
			  
						_unit addweapon _rucksack;
				
						[_unit,_medicmag,5] spawn f_addMagToRuck;
						[_unit,"ACE_Battery_Rangefinder",1] spawn f_addMagToRuck;
			  
						_unit selectweapon primaryweapon _unit;
					};
					case "west":
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
						
			  
						_unit addweapon _rucksack;
				
						[_unit,_medicmag,5] spawn f_addMagToRuck;
						[_unit,"ACE_Battery_Rangefinder",1] spawn f_addMagToRuck;
			  
						_unit selectweapon primaryweapon _unit;
					};
					case "guer":
					{
						removeallweapons _unit;
						removeBackpack _unit;
						{_unit addmagazine _medicmag} foreach [1,2,3,4];
						{_unit addmagazine _heavyATmag1;} foreach [1,2,3];
						{_unit addmagazine _bandage} foreach [1,2];
						_unit addmagazine _smokegrenade;
						_unit addweapon _medicrifle;
						_unit addmagazine "ACE_Battery_Rangefinder";
						_unit addweapon "ACE_Rangefinder_OD";
						_unit addweapon "NVGoggles"; 
						
			  
						_unit addweapon _rucksack;
				
						[_unit,_medicmag,5] spawn f_addMagToRuck;
						[_unit,"ACE_Battery_Rangefinder",1] spawn f_addMagToRuck;
			  
						_unit selectweapon primaryweapon _unit;
					};
				};
			};

		// ====================================================================================

		// LOADOUT: HEAVY AT AMMO MAN

		   case "hatam":   
			{
				switch (_side) do
				{
					case "east":
					{
						removeallweapons _unit;
						removeBackpack _unit;
						{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
						{_unit addmagazine _heavyATmag1;} foreach [1];
						{_unit addmagazine _bandage} foreach [1,2];
						_unit addmagazine _smokegrenade;
						_unit addweapon _rifle;
						_unit addweapon "NVGoggles"; 
						
			  
						_unit addweapon _rucksack;
			  
						[_unit,_riflemag,5] spawn f_addMagToRuck; 
			  
						_unit selectweapon primaryweapon _unit;
					};
					case "west":
					{
						removeallweapons _unit;
						removeBackpack _unit;
						{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
						{_unit addmagazine _heavyATmag1;} foreach [1];
						{_unit addmagazine _bandage} foreach [1,2];
						_unit addmagazine _smokegrenade;
						_unit addweapon _rifle;
						_unit addweapon "NVGoggles"; 
						
			  
						_unit addweapon _rucksack;
			  
						[_unit,_riflemag,5] spawn f_addMagToRuck; 
			  
						_unit selectweapon primaryweapon _unit;
					};
					case "guer":
					{
						removeallweapons _unit;
						removeBackpack _unit;
						{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
						{_unit addmagazine _heavyATmag1;} foreach [1,2,3];
						{_unit addmagazine _bandage} foreach [1,2];
						_unit addmagazine _smokegrenade;
						_unit addweapon _rifle;
						
			  
						_unit addweapon _rucksack;
			  
						[_unit,_riflemag,5] spawn f_addMagToRuck; 
			  
						_unit selectweapon primaryweapon _unit;
					};
				};
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  
			  _unit addweapon "ACE_Spottingscope";
			  if (!(_unit hasWeapon "ACE_Kestrel4500")) then
			  {
				_unit addweapon "ACE_Kestrel4500";
			  };
			  
			  _unit addweapon _radio;
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
			  if (_side == "east") then 
				{
				 _unit addweapon "bizon";
				 _success = [_unit, "bizon"] call ACE_fnc_PutWeaponOnBack;
				};
			  _unit addweapon _sfrifleGL;
			  _unit addweapon "NVGoggles";    
			  _unit addweapon "Binocular";
			  
			  _unit addweapon "ACE_GlassesBalaklava";
			  
			  if (!(_unit hasWeapon "ItemGPS")) then
			  {
				_unit addweapon "ItemGPS";
			  };
			  		  
			  if (_side != "guer") then {_unit addweapon _rucksack;
			  if (_side == "east") then { [_unit,"64Rnd_9x19_Bizon",4] spawn f_addMagToRuck;};			 
			  [_unit,_sfriflemag,4] spawn f_addMagToRuck;
			  [_unit,_GLmag,7] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,2] spawn f_addMagToRuck;
			  [_unit,_smokered,1] spawn f_addMagToRuck;
			  [_unit,_smokegreen,1] spawn f_addMagToRuck;
			  [_unit,_grenade,2] spawn f_addMagToRuck;
			  [_unit,"IR_Strobe_Marker",1] spawn f_addMagToRuck;
					
			  _unit selectweapon primaryweapon _unit;};
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
			  
			  _unit addweapon "Laserdesignator";
			  
			  if (!(_unit hasWeapon "ItemGPS")) then
			  {
				_unit addweapon "ItemGPS";
			  };
						  
			  _unit addweapon _radio;
			   
			  [_unit,_sfriflemag,2] spawn f_addMagToRuck;
			  [_unit,"Laserbatteries",1] spawn f_addMagToRuck;
			  [_unit,"IR_Strobe_Marker",1] spawn f_addMagToRuck;
							  
			  _unit selectweapon primaryweapon _unit;
		   };

		// ====================================================================================
		// LOADOUT: SF MG

		   
		   case "sfhg":
			{
			  switch (_side) do
				{
					case "east":
					{
						removeallweapons _unit;
						removeBackpack _unit;
						{_unit addmagazine _sfmgmag;} foreach [1,2,3,4,5,6,7,8];
						_unit addweapon _sfmg;
						{_unit addmagazine _sfpistolmag;} foreach [1,2,3,4,5,6];
						{_unit addmagazine _bandage} foreach [1,2];
						_unit addweapon _sfpistol;
						{_unit addmagazine _grenade} foreach [1,2];
						{_unit addmagazine _smokegrenade;} foreach [1,2];
						_unit addweapon "NVGoggles"; 
						
						_unit addweapon "ACE_GlassesBalaklava";
						_unit addweapon "ACE_Earplugs";
						_unit addweapon "Binocular";
						
						if (!(_unit hasWeapon "ItemGPS")) then
						  {
							_unit addweapon "ItemGPS";
						  };
						  
						_unit addweapon _rucksack;

						[_unit,_sfmgmag,4] spawn f_addMagToRuck;	
						[_unit,"IR_Strobe_Marker",1] spawn f_addMagToRuck;
						_unit selectweapon primaryweapon _unit;
					};
					case "west":
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
						
						_unit addweapon "ACE_GlassesBalaklava";
						_unit addweapon "ACE_Earplugs";
						_unit addweapon "Binocular";
						
						if (!(_unit hasWeapon "ItemGPS")) then
						  {
							_unit addweapon "ItemGPS";
						  };
						  
						_unit addweapon _rucksack;

						[_unit,_sfmgmag,2] spawn f_addMagToRuck;	
						[_unit,"IR_Strobe_Marker",1] spawn f_addMagToRuck;
						_unit selectweapon primaryweapon _unit;
					};
				
					case "guer":
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
						
						_unit addweapon "ACE_GlassesBalaklava";
						_unit addweapon "ACE_Earplugs";
						_unit addweapon "Binocular";
						if (!(_unit hasWeapon "ItemGPS")) then
						  {
							_unit addweapon "ItemGPS";
						  };
					};
				};
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
			  
			  _unit addweapon "Binocular";
			  
			  if (!(_unit hasWeapon "ItemGPS")) then
				  {
					_unit addweapon "ItemGPS";
				  };
					
			  _unit addweapon _rucksack;

			  [_unit,_sfsnmag,6] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,2] spawn f_addMagToRuck;
			  [_unit,_grenade,2] spawn f_addMagToRuck;
			  [_unit,"IR_Strobe_Marker",1] spawn f_addMagToRuck;
						  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};    
			  _unit addweapon "ACE_GlassesBalaklava";
			  
			  _unit addweapon "Binocular";
			  
			   if (!(_unit hasWeapon "ItemGPS")) then
				  {
					_unit addweapon "ItemGPS";
				  };
					
			  _unit addweapon _rucksack;

			  [_unit,_sfriflemag,6] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,2] spawn f_addMagToRuck;
			  [_unit,_grenade,2] spawn f_addMagToRuck;
			  [_unit,"IR_Strobe_Marker",1] spawn f_addMagToRuck;
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
			  
			  if (_side != "guer") then {_unit addweapon "NVGoggles"}; 
			  _unit addweapon "ACE_GlassesBalaklava";
			  
			  _unit addweapon "Binocular";
			  {_unit addmagazine _medkit;} foreach [1,2];
			  
			   if (!(_unit hasWeapon "ItemGPS")) then
				  {
					_unit addweapon "ItemGPS";
				  };
				  
			  _unit addweapon _medicrucksack;

			  [_unit,_sfriflemag,10] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,2] spawn f_addMagToRuck; 
			  [_unit,_bandage,15] spawn f_addMagToRuck; 
			  [_unit,_morphine,25] spawn f_addMagToRuck; 
			  [_unit,_epinephrine,15] spawn f_addMagToRuck; 
			  [_unit,"IR_Strobe_Marker",1] spawn f_addMagToRuck;
			  [_unit,_medkit,2] spawn f_addMagToRuck;
			  
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
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};    
			  
					
						   
			  _unit selectweapon primaryweapon _unit;
		   };
		// ====================================================================================

		// LOADOUT: AA GUNNER

		   case "aag":
		   {
			  removeallweapons _unit;
			  {_unit addmagazine _medicmag} foreach [1,2,3,4,5];
			  _unit addmagazine _smokegrenade;
			  {_unit addmagazine _aamag} foreach [1];
			  {_unit addmagazine _bandage} foreach [1,2];
			  _unit addweapon _aa;
			  _unit addweapon _medicrifle;
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};
			  
		   };
		// ====================================================================================

		// LOADOUT: AA  ASSISTANT GUNNER

		   case "aaa":
			{
			  removeallweapons _unit;
			  {_unit addmagazine _riflemag} foreach [1,2,3,4,5];
			  {_unit addmagazine _aamag;} foreach [1];
			  {_unit addmagazine _bandage} foreach [1,2];
			  _unit addmagazine _smokegrenade;
			  _unit addweapon _rifle;
			  _unit addmagazine "ACE_Battery_Rangefinder";
			  _unit addweapon "Binocular_Vector";
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};
			  
			  
			  _unit addweapon _rucksack;
				
			  [_unit,_aamag,1] spawn f_addMagToRuck;
			  
			  _unit selectweapon primaryweapon _unit; 
			};
		// ====================================================================================

		// LOADOUT: ARTILLERY  GUNNER

		   case "arg":
			{
			  removeallweapons _unit;
			  {_unit addmagazine _medicmag} foreach [1,2,3,4,5,6];
			  {_unit addmagazine _smokegrenade;} foreach [1];
			  {_unit addmagazine _bandage} foreach [1,2];
			  {_unit addmagazine "ACE_M224_HE_CSWDM"} foreach [1,2,3,4,5];
			  _unit addweapon _medicrifle;
			  _unit addweapon "ACE_Earplugs";
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};
			  
			  
			  _unit addweapon "ACE_M224Proxy";
				
			  /*[_unit,_medicmag,5] spawn f_addMagToRuck;
			  [_unit,_smokegrenade,2] spawn f_addMagToRuck;*/
					
			  _unit selectweapon primaryweapon _unit; 
			};

		// ====================================================================================

		// LOADOUT: ARTILLERY ASSISTANT GUNNER

		   case "ara":
			{
			  removeallweapons _unit;
			  {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
			  {_unit addmagazine _smokegrenade;} foreach [1];
			  {_unit addmagazine _bandage} foreach [1,2];
			  {_unit addmagazine "ACE_M224_HE_CSWDM"} foreach [1,2,3,4,5];
			  _unit addweapon _rifle;
			  _unit addmagazine "ACE_Battery_Rangefinder";
			  _unit addweapon "Binocular_Vector";
			  if (_side != "guer") then {_unit addweapon "NVGoggles"};
			  
			  _unit addweapon "ACE_Earplugs";
			  
			  _unit addweapon "ACE_M224TripodProxy";
				
			  _unit selectweapon primaryweapon _unit; 
			};

		// ====================================================================================

		// LOADOUT: ARTILLERY AMMOMAN

		   case "aram":
			{
			  removeallweapons _unit;
			  {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7];
			  {_unit addmagazine _smokegrenade;} foreach [1,2];
			  {_unit addmagazine _bandage} foreach [1,2];
			  {_unit addmagazine _Grenade;} foreach [1,2];
			  _unit addweapon _rifle;
			if (_side != "guer") then {_unit addweapon "NVGoggles"};
			  _unit addweapon "ACE_Earplugs";
			  _unit addmagazine "ACE_Battery_Rangefinder";
			  _unit addweapon "Binocular_Vector";
			  
			  _unit addweapon _rucksack;
				
			  [_unit,"ACE_M224_HE_CSWDM",6] spawn f_addMagToRuck;
			  [_unit,"ACE_M224WP_CSWDM",6] spawn f_addMagToRuck;
					
			  _unit selectweapon primaryweapon _unit; 
			};
		// ====================================================================================

		// LOADOUT: Engineer

		   case "en":
			{
			  removeallweapons _unit;
			  {_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7];
			  {_unit addmagazine "PipeBomb"} foreach [1];
			   _unit addmagazine _smokegrenade;
			   _unit addmagazine _grenade;
			  {_unit addmagazine "ACE_C4_M";} foreach [1];
			  {_unit addmagazine "ACE_M2SLAM_M"} foreach [1];
			  {_unit addmagazine _bandage} foreach [1,2];
			  _unit addweapon "ACE_Wirecutter";
			  _success = [_unit, "ACE_Wirecutter"] call ACE_fnc_PutWeaponOnBack;
			  _unit addweapon _rifle;
			  _unit addweapon "NVGoggles";   
			  
					
			  _unit addweapon _rucksack;

			  [_unit,_smokegrenade,2] spawn f_addMagToRuck;
			  [_unit,"ACE_C4_M",2] spawn f_addMagToRuck;
			  [_unit,"ACE_M2SLAM_M",2] spawn f_addMagToRuck;
			  [_unit,_riflemag,4] spawn f_addMagToRuck;
			  [_unit,"PipeBomb",1] spawn f_addMagToRuck;
			  
							  
			  _unit selectweapon primaryweapon _unit;
			};

		// ERROR CHECKING
		// If the unit type could not be successfully detected the script exits with an error.
		   default
		   {
				if (true) exitwith {player globalchat format ["DEBUG (f\common\@ShackTac_assignGear.sqf): Unit = %1. Gear template %2 does not exist.",_unit,_typeofunit]};
		   };
	};

