//******************************************************************************************
//==========================================================================================
//=   	 	Change the init acording to the F2 Framweork WIKI thay you can find at:
//=		 		http://www.ferstaberinde.com/f2/en/index.php?title=Main_Page
//=
//=							Shay-Gman - MARSOC
//==========================================================================================
//******************************************************************************************


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




//******************************************************************************************
//==========================================================================================
//=		 				DO NOT EDIT BENEATH THIS LINE
//=		 
//=							Shay-Gman - MARSOC
//==========================================================================================
//******************************************************************************************


//define stuff for popup menu
zones_numbers = [["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],["11",11],["12",12],["13",13],["14",14],["15",15],["16",16],["17",17],["18",18],["19",19],["20",20]];
zones_x = [["10",10],["25",25],["50",50],["100",100],["200",200],["300",300],["400",400],["500",500],["600",600],["700",700],["800",800],["900",900],["1000",1000]];
zones_y = [["10",10],["25",25],["50",50],["100",100],["200",200],["300",300],["400",400],["500",500],["600",600],["700",700],["800",800],["900",900],["1000",1000]];
unit_array_ready=true; 
faction_choice=true; 
faction_index = 0; 
zone_index = 0; 
zoneX_index = 0; 
zoneY_index = 0; 

spawn_empty =[["Inhabit",true],["Empty",false]];
spawn_behavior = [["Agressive", "MOVE"],["Defensive","NOFOLLOW"],["Passive", "NOMOVE"],["Fortify","FORTIFY"],["Ambush","AMBUSH"]];
spawn_awereness = [["Default", "default"],["Aware","Aware"],["Combat", "Combat"],["stealth","stealth"],["Careless","Careless"]];
spawn_track = [["Off", false],["On",true]];
empty_index = 0;
behavior_index = 0;
awereness_index = 0;
track_index = 0;

enable_west=true;
enable_east=true;
enable_gue=true;
enable_respawn = true; 

months_array = [["January", 1],["February",2],["March", 3],["April",4],["May",5],["June", 6],["July",7],["August", 8],["September",9],["October",10],["November",11],["December",12]];
hours_array = [["00:00",0],["01:00",1],["02:00",2],["03:00",3],["04:00",4],["05:00",5],["06:00",6],["07:00",7],["08:00",8],["09:00",9],["10:00",10],["11:00",11],["12:00",12],["13:00",13],["14:00",14],["15:00",15],["16:00",16],["17:00",17],["18:00",18],["19:00",19],["20:00",20],["21:00",21],["22:00",22],["23:00",23]];
weather_array = [["Clear",[0, 0, 0]], ["Clouded",[0.5, 0.5, 0.5]],["Rainy",[0.7, 0.5, 0.1]],["Storm",[1, 0.5, 1]]];
moths_index=0;
hours_index=0;
weather_index=0;

grass_array = [["No grass",50],["Meduim grass",25], ["High grass",12.5]];
view_array = [500,1000,1500,2000,2500,3000,3500,4000,4500,5000,6000,7000,8000,9000,10000];

// Disable Respawn & Organise start en death location 
nul=[] execVM "mcc\general_scripts\mcc_player_disableRespawn.sqf";

// Initialize and load the pop up menu
nul=[] execVM "mcc\pop_menu\mcc_init_menu.sqf";

// Make action menu items available
[["> Teleport to TEAM", "mcc\general_scripts\mcc_SpawnToPosition.sqf", [], 0, false, false, 'teamSwitch']] call CBA_fnc_addPlayerAction;

mcc_spawntype   		= "";
mcc_classtype   		= "";
mcc_isnewzone   		= false;
mcc_spawnwithcrew 		= true;
mcc_spawnname     		= "";
mcc_spawnfaction  		= "";
mcc_spawndisplayname    = "";
mcc_zoneinform    		= "NOTHING";
mcc_zone_number			= 1; 		
mcc_zone_markername 	= "1"; 	
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
nul=[] execVM "mcc\pv_handling\mcc_extras_pv_handler.sqf";

//===============================R3F Arty & Log ====================================
#include "R3F_ARTY_AND_LOG\init.sqf"
//=========================month change==========================
month = 3; 

//=========================Evac script=============================
fly_in_hight= 300;

//==========================Bon Artillery ===================
waitUntil { !(isnil ("f_param_arty"))  };
HW_arti_number_shells_per_hour = f_param_arty; // Number rounds per hour
[] execVM "bon_artillery\bon_arti_init.sqf";
//===============================Arrestinggear by Tusken Raider=====================

call {[] execVM "mcc\general_scripts\arrestinggear\Arrestinggear.sqf";};

//==============================MCC Artillery init===============================
shelltype="ARTY_Sh_105_HE"; //type of ammo
shellspread=25;				//spread of arty's rounds
nshell=3;					//number of arty's rounds
artysite = ["SatPhone", "HMMWV", "UAZ_CDF", "UAZ_RU", "UAZ_INS", "hilux1_civil_2_covered"];
artyindex = 1;
//==============================MCC traps init===================================
trapsx=10;	
trapsy=10;
trapdistance=4;
trapsnumber=5;
iedside=west;
trapvolume="at";
//=============================<MCC convoy ==================================
isvip=0;  
//=============================UAV site======================================
uav_type = ["MQ9PredatorB_US_EP1", "AH6X_EP1", "Pchela1T"];
uavindex = 1;