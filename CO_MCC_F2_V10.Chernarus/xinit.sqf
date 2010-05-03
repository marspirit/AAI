// Disable Respawn & Organise start en death location 
nul=[] execVM "mcc\general_scripts\mcc_player_disableRespawn.sqf";

// Initialize and load the pop up menu
nul=[] execVM "mcc\pop_menu\mcc_init_menu.sqf";

// Make action menu items available
[["> Teleport to TEAM", "mcc\general_scripts\mcc_SpawnToPosition.sqf", [], 0, false, false, 'teamSwitch']] call CBA_fnc_addPlayerAction;

#define POSITION [-9999, -9999, 0.5]
/* VK- Testing without SIX
if (isServer) then
{
	// Get inline with 6thsense action menu
	[] spawn
	{
		waitUntil {!(isNil "six_sys_menu")};
		six_sys_menu setVariable ["config_group", true, true];		
		six_sys_menu setVariable ["config_weapons", true, true];
		six_sys_menu setVariable ["config_teamstatus", true, true];
	};
	[] spawn
	{
		// Create airport where they will respawn later on
		six_sys_bc_safezone = "WarfareBAirport" createVehicle POSITION;
		publicVariable "six_sys_bc_safezone";
		sleep 1;
		six_sys_bc_safezone setPos POSITION;
	};
};
*/

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
mcc_spawnbehavior       = "NORMAL";	
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