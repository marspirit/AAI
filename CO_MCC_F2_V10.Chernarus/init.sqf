//===============================R3F Arty & Log ====================================
#include "R3F_ARTY_AND_LOG\init.sqf"
// ====================================================================================


// ====================================================================================

// F2 - Process ParamsArray
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_processParamsArray = [] execVM "f\common\f_processParamsArray.sqf";

// ====================================================================================

// F2A2 - Configuration
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS SECTION

cfgACE_IsEnabled = isClass (configFile >> "CfgPatches" >> "ace_main");
f_addMagToRuck = compile preprocessFileLineNumbers "f\common\f_addMagToRuck.sqf";
f_addWepToRuck = compile preprocessFileLineNumbers "f\common\f_addWepToRuck.sqf";
ace_sys_tracking_markers_enabled = false;

// ====================================================================================

// F2 - Disable Saving and Auto Saving
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

enableSaving [false, false];

// ====================================================================================

// F2 - Respawn INIT
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

f_respawnINIT = player addEventHandler ["killed", {_this execVM "init_onPlayerRespawn.sqf"}];

// ====================================================================================

// F2 - Mission Maker Teleport
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_missionMakerTeleport = 0;
// [] execVM "f\common\f_missionMakerTeleport.sqf";

// ====================================================================================

// F2 - Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "briefing.sqf";

// ====================================================================================

// F2 - Mission Conditions Selector
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\f_setMissionConditions.sqf";

// ====================================================================================

// F2 - ShackTactical Group IDs
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\ShackTac_setGroupIDs.sqf";

// ====================================================================================

// F2 - ShackTactical Fireteam Member Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\ShackTac_setlocalFTMemberMarkers.sqf";

// ====================================================================================

// F2 - ShackTactical Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\ShackTac_setLocalGroupMarkers.sqf";

// ====================================================================================

// F2 - F2 Common Local Variables
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";

// ====================================================================================

// F2 - Multiplayer Ending Controller 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

f_endSelected = -1;
[] execVM "f\common\f_mpEndSetUp.sqf";

// ====================================================================================

// F2A2 - Kegetys Spectator Script (ACE2 Addon)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// RESTRICT VIEWABLE UNITS
// We use the array ace_sys_spector_ShownSides to restrict which sides will be visible 
// to spectating players:
	
ace_sys_spector_ShownSides = [west, east, resistance];

// if (side player == west) then {ace_sys_spector_ShownSides = [west];};
// if (side player == east) then {ace_sys_spector_ShownSides = [east];};
// if (side player == resistance) then {ace_sys_spector_ShownSides = [resistance];};
// if (side player == civilian) then {ace_sys_spector_ShownSides = [civilian];};

// ====================================================================================

// F2 - Disable BIS Conversations
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

player setVariable ["BIS_noCoreConversations", true];

// ====================================================================================

// F2 - Automatic Body Removal
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_removeBodyDelay = 180;
// f_doNotRemoveBodies = [];
// [] execVM "f\common\f_addRemoveBodyEH.sqf";

// ====================================================================================

// F2 - Automatic Body Removal (FIFO)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_abrFIFOlength = 30;
// f_abrDistance = 150;
// f_abrFIFOmaxLength = 50;
// f_doNotRemoveBodies = [];
// ["fifo"] execVM "f\common\f_addRemoveBodyEH.sqf";
// [] execVM "f\server\f_abrFIFO.sqf";

// ====================================================================================

// F2 - Dynamic View Distance 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_viewDistance_default = 1250;
// f_viewDistance_tank = 2000;
// f_viewDistance_rotaryWing = 2500;
// f_viewDistance_fixedWing = 5000;
// [] execVM "f\common\f_addSetViewDistanceEHs.sqf";

// ====================================================================================

// F2 - Authorised Crew Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// VehicleName addEventhandler ["GetIn", {[_this,[UnitName1,UnitName2]] execVM "f\common\f_isAuthorisedCrew.sqf"}];

// ====================================================================================

// F2 - Authorised Crew Type Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// VehicleName addEventhandler ["GetIn", {[_this,["UnitType1","UnitType2"]] execVM "f\common\f_isAuthorisedCrewType.sqf"}];

// ====================================================================================

// F2 - Casualties Cap
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [[GroupName],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// ====================================================================================

// F2 - Casualties Cap (Advanced)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [[GroupName],100] execVM "f\server\f_casualtiesCapAdv.sqf";

// ====================================================================================

// F2 - AI Skill Selector (coop)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_isFriendlyBLU = 1;
// f_isFriendlyRES = 1;
// f_isFriendlyOPF = 0;
// f_isFriendlyCIV = 1;
// [] execVM "f\common\f_setAISkill.sqf";

// ====================================================================================

// F2 - AI Skill Selector (A&D)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_isFriendlyToBLU_RES = 1;
// f_isFriendlyToBLU_CIV = 1;
// [] execVM "f\common\f_setAISkillAD.sqf";

// ====================================================================================

// F2 - Construction Interface (COIN) Presets
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_COINstopped = false;
// [COINName,"UnitName",0,2500] execVM "f\common\f_COINpresets.sqf";

// ====================================================================================

// F2 - Norrin's Revive Respawn
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// server execVM "revive_init.sqf";

// ====================================================================================

// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [] execVM "f\common\f_recog\recog_init.sqf";

// ====================================================================================

// F2 - Group E&E Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [GroupName,ObjectName,100,1] execVM "f\server\f_groupEandECheck.sqf";

// ====================================================================================
// Disable Respawn & Organise start en death location 
nul=[] execVM "mcc\general_scripts\mcc_player_disableRespawn.sqf";

// Initialize and load the pop up menu
nul=[] execVM "mcc\pop_menu\mcc_init_menu.sqf";

// Make action menu items available
[["> Teleport to TEAM", "mcc\general_scripts\mcc_SpawnToPosition.sqf", [], 0, false, false, 'teamSwitch']] call CBA_fnc_addPlayerAction;




// broadcast public variables to all clients
//mcc_spawntype   		["VEHICLE","MAN","DOC","GROUP"]  		- What kind of shit is it we try to deliver as they all need seperate handle (car, soldier etc)
//mcc_classtype   		["AIR","LAND","WATER"]					- And on where is that stuff at its best. Example, boats dont like to be on land
//mcc_isnewzone   		[true,false]							- Are we making a new zone or are we working in yet made stuff
//mcc_spawnwithcrew 	[true,false]							- If we spawn a car do we want the default config file crew with it
//mcc_spawnname     	[CONFIGFILE VEHICLENAME]				- How is the spawn thing named in the config file as thats what we need to call spawn functions
//mcc_spawnfaction  	["GUE","USMC","RU","INS","CDF","CIV"]	- What faction does he belong to?
//mcc_zone_number 		[1 ...9999]								- What is the zone number we are working in?
//mcc_zone_inform       ["NOTHING","TRIGGER"]                   - If set on trigger all players will be informed when that zone is clear of spawned unit side
//mcc_zone_markername   [NAME OF MARKER]						- What is the name of the marker or in functional names the name of the zone (example "ONE")
//mcc_zone_markposition [POSITION OF MARKER _MARKER]			- Where the hell is that MARKER actualy
//mcc_zone_marker_X   	[x of marker]							- How wide is that zone (x-as)
//mcc_zone_marker_Y		[y of marker]							- How heigh is that zone (y-as)
//mcc_spawnbehavior     ["NORMAL","NOFOLLOW","NOMOVE"]			- If we throw out a unit then how should it behave there, defensive? Agressive? :P
//mcc_zone_pos          [ ARRAY of zone positions where nr in array determines zone position]
//mcc_zone_size			[ contains the size of the zone ]
mcc_spawntype   		= "";
mcc_classtype   		= "";
mcc_isnewzone   		= false;
mcc_spawnwithcrew 		= true;
mcc_spawnname     		= "";
mcc_spawnfaction  		= "";
mcc_spawndisplayname    = "";
mcc_zoneinform    		= "NOTHING";
mcc_zone_number			= 1; 		
mcc_zone_markername 	= "1_ONE"; 	
mcc_zone_markposition   = []; 	
mcc_markerposition      = [];	
mcc_zone_marker_X   	= 200;		
mcc_zone_marker_Y		= 200;		
mcc_spawnbehavior       = "MOVE";	
mcc_awareness			= "DEFAULT";
mcc_zone_pos  		= 	[];
mcc_zone_size 		= 	[];
mcc_grouptype			= "";
mcc_track_units			= false;
mcc_safe				= "";
mcc_load				= "";
mcc_isloading			= false;
mcc_request				= 0;
mcc_resetmissionmaker	= false;
mcc_missionmaker		= "";

// VK - Not sure where the other U_ variables are defined.
U_AMMO					= [];
U_ACE_AMMO				= [];


//Lets create our MCC subject in the diary
_index = player createDiarySubject ["MCCZones","MCC Zones"];


//Make sure about who is at war with who or it will be a very peacefull game 
_SideHQ_East   = createCenter east;
_SideHQ_Resist = createCenter resistance;
_SideHQ_west   = createCenter west;

// East hates all
east setFriend [west, 0];
east setfriend [resistance, 0];

// West hates all
west setFriend [east, 0];
west setfriend [resistance, 0];

// Resistance hates all
resistance setfriend [east, 0];
resistance setfriend [west, 0];

// Handler code for on the server for MP purpose
nul=[] execVM "mcc\pv_handling\mcc_pv_handler.sqf";

//==========================Bon Artillery - only if player have RD90===================
if(local player) then {
WaitUntil{not isNull player};
	arti_action = player addAction ["Call Artillery","bon_artillery\dialog\openMenu.sqf",["Arti_dlg"],-1,false,true,"","player hasWeapon 'ACE_P159_RD90'"];
};
HW_Arti_CannonNumber = 5;			// Number cannons
HW_number_artilleryshells_per_hour = f_param_arty; // Number rounds per hour
[] execVM "bon_artillery\bon_arti_init.sqf";
//===============================Arrestinggear by Tusken Raider=====================

call {[] execVM "mcc\general_scripts\arrestinggear\Arrestinggear.sqf";};

//==============================MCC Artillery init===============================
shelltype="ARTY_Sh_105_HE"; //type of ammo
shellspread=25;				//spread of arty's rounds
nshell=3;					//number of arty's rounds
//==============================MCC traps init===================================
trapsx=10;	
trapsy=10;
trapdistance=4;
trapsnumber=5;
iedside=west;
trapvolume="at";