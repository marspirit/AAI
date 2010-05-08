/*
  ARMA2 REVIVE SCRIPT - AI enabled or disabled

  © SEPTEMBER 2009 - norrin (norrin@iinet.net.au)

  Version:  0.3e ArmA2	
*******************************************************************************************************
  See release notes for details on contributors and instructions for incorporating revive scripts into your  own missions
************************************************************************************
 Start revive_init.sqf
*/
// =====================================================================================================================
// DO NOT MODIFY THIS CODE
// =====================================================================================================================
// sickboy's code modified by _xeno
T_INIT 	= false;
T_Server 	= false; 
T_Client 	= false; 
T_JIP 	= false;

T_MP = (if (playersNumber east + playersNumber west + playersNumber resistance + playersNumber civilian > 0) then {true} else {false});

if (isServer) then 
{
	T_Server = true;
	if (!isNull player) then {T_Client = true};
	T_INIT = true;
} else {
	T_Client = true;
	if (isNull player) then 
	{
		T_JIP = true;
		[] spawn {waitUntil {!isNull player};T_INIT = true};
	} else {
		T_INIT = true;
	};
};
waitUntil {T_INIT};
// =====================================================================================================================
// THE FOLLOWING CODE CAN BE MODIFIED
// =====================================================================================================================
// GENERAL REVIVE OPTIONS  (Off = 0, On = 1)
_mission_end_function 			= 0;				//array no.0  - mission ends when all players are unconscious
_call_out_function 				= 1;				//array no.6  - whether a unit calls out while unconscious
_water_dialog 					= 1;				//array no.45 - whether a dialog appears when a unit dies in water so that it can auto wash ashore 
_unconscious_drag 				= 1;				//array no.39 - whether a unit can drag the bodies of unconscious players 
_load_wounded					= 1;				//array no.61 - allows you to load unconscious units on vehicles
_altUnc_animation 				= 0;				//array no.54 - use alternate revive animation
_JIP_spawn_dialog 				= 0;				//array no.2  - whether a dialog appears when a player JIP so that he can be transported to a spawn point near the action 
_time_b4_JIP_spawn_dialog 		= 10000;			//array no.17 - time before the respawn dialog appears for JIP players 
_perpetual_server				= 0;				//array no.62 - NOT IMPLEMENTED
// ==================================================================
// LIST OF PLAYABLE UNITS
NORRN_player_units = ["alpha_1","alpha_2"];
// ==================================================================
// WELCOME SCREEN
//titleText ["Joining the Revive Test Mission\n\n(Make sure you check the mission notes for details on how the scripts work\nand the revive_readMe in the attached pdf file for the full notes on implementing \nthe scripts in your own missions and the options available)", "BLACK FADED", 0.6]; 	// This next line can be commented out or removed if it interferes with intro movies  
// ==================================================================
// REVIVE OPTIONS
_max_respawns 					= (paramsArray select 3);			//array no.38 - Number of lives per unit
_JIP_respawns					= [2,30];			//array no.63 - 0 - off or the number of lives players receive when they join in progress , JIP time after the mission starts 
_revive_timer 					= 1;	 			//array no.7  - Whether you want to limit the amount of timer a player has while unconscious
_revive_time_limit 				= 300;				//array no.27 - Amount of time a player remains unconscious before respawning or dying
_revive_damage 					= 0;				//array no.37 - Unit's level of damage following revive
_unconscious_markers 			= 1;				//array no. 4 - Whether a marker appears on the game map at the location of the unconscious unit
_caseVAC						= [1, ["MASH","HMMWV_Base"]];	//array no.64 - Allows units to be taken to a hospital etc to be revived
_mediVAC						= [];				//array no.65 - NOT IMPLEMENTED
_chance_ofDeath					= [0,0];			//array no.66 - Two parameters in the array the first switches off/on (0/1) chance of death when shot, increases dues to hit location and number of times revived and the second parameter switches on/off the decreasing respawn timer based on how many times you have been revived, if using set respawn-time to at least 300 seconds.
_dualTimer						= 0;				//array no.67 - NOT IMPLEMENTED - normal units can only revive for eg 30 seconds whereas medics can heal players up to 120 secs - array - [0/1 - off/on, revive timer for normal unit, timer for medic] 
_deadSpectator_cam 				= 1;				//array no.92 - leave as 0 - whether a unit can spectate other friendly units when it has run out of lives
// ==================================================================
// RESPAWN OPTIONS
_no_respawn_points 				= 1;				//array no.12 - no of respawn points (Max number 4)  
_Base_1 						= "base";			//array no.13 - spawn position names  
_Base_2 						= "";				//array no.14
_Base_3 						= "";				//array no.15
_Base_4 						= "";				//array no.16 
_Base_free_respawn 				= [1,1,0,0];		//array no.36 - select whether to allow respawning at spawn points even if enemy troops are present (options OFF = 0, ON = 1) 
_respawn_at_base_addWeapons 	= 1;				//array no.11 - unit respawns with weapons it commenced the mission with  
_respawn_at_base_magazines 		= [];				//array no.34 - If using the respawn_at_base_addWeapons option then place the magazine and weapon 
_respawn_at_base_weapons 		= [];				//array no.35   types in the following arrays, if left blank respawns with weapons from mission start
_respawn_position 				= 2;				//array no.28 - 0 - respawn at base_1; 1 -  the closest enemy free respawn point; 2 - players choice; and 3 -  dies
_respawnAtBaseWait				= [0,0];			//array no.68 - Two parameters: 1st if = 1 makes players that respawn at base wait for (parameter 2) seconds before being able to see surroundings   
_objectiveBasedRP				= []; 				//array no.69 - NOT IMPLEMENTED
// Mobile Spawn Settings
_mobile_spawn 					= 0;				//array no.51 - set to 1 if you want to use mobile spawn	
_mobile_base_start 				= "";				//array no.52
_mobile_base2_start 			= "";				//array no.70 - NOT IMPLEMENTED
_mobile_type 					= 1;				//array no.60 - set as 0 - for vehicle and 1 for man
_mobile_man 					= objNull;  		//array no.53 - place name of unit here or if not used make sure set as objNull
_mobile_man2					= objNull;			//array no.71 - NOT IMPLEMENTED
// ==================================================================
// UNITS THAT CAN REVIVE/UNITS THAT CAN BE REVIVED
_can_revive 					= "soldierWB";		//array no.18 
_can_revive_2 					= "";				//array no.19
_can_revive_3					= "";				//array no.72 - NOT IMPLEMENTED
_can_revive_4					= "";				//array no.73 - NOT IMPLEMENTED
_can_be_revived 				= "soldierWB";		//array no.20  
_can_be_revived_2 				= "";				//array no.21 
_can_be_revived_3				= "";				//array no.74 - NOT IMPLEMENTED 
_can_be_revived_4 				= "";				//array no.75 - NOT IMPLEMENTED
_medic_1						= "USMC_Soldier_Medic";	//array no.76 - Used in conjunction with medpacks and bleeding	
_medic_2						= "";				//array no.77 - Used in conjunction with medpacks and bleeding
_medic_3						= "";				//array no.78 - NOT IMPLEMENTED	
_medic_4						= "";				//array no.79 - NOT IMPLEMENTED	
//========================================================
// MEDPACK AND BLEEDING OPTIONS
_medpacks						= 0;				//array no.80 - Whether you want to give the units a limited number of revive kits 0/1 - no/yes
_stabilisation					= 0;				//array no.81 - NOT IMPLEMENTED
_bleeding 						= 1;				//array no.82 - Make units bleed and require bandages
_medic_medpacks 				= 5;				//array no.83 - No of medpacks for units specified in the _medic variables - they are required for reviving units		
_unit_medpacks 					= 3;				//array no.84 - No of medpacks for units specified in the _can_revive variables - they are required for reviving units			
_medic_bandages 				= 5;				//array no.85 - Bandages stop bleeding		
_unit_bandages 					= 3;				//array no.86 - 
_medic_stable					= 0;				//array no.100 - NOT IMPLEMENTED
_unit_stable					= 0;				//array no.101 - NOT IMPLEMENTED
_stabTime_tillDeath				= 0;				//array no.87 - NOT IMPLEMENTED //Time until death following revive without stabilisation
// ==================================================================
// ENEMY SIDE TO PLAYABLE UNITS
_no_enemy_sides 				= 1;				//array no.22 - No of Enemy sides (0, 1 or 2). 
_enemy_side_1 					= "EAST";			//array no.23 - Enemy sides can be "EAST", "WEST", "GUER" etc  
_enemy_side_2 					= "";				//array no.24 
_enemy_side_3 					= "";				//array no.88 - NOT IMPLEMENTED
_enemy_side_4 					= "";				//array no.89 - NOT IMPLEMENTED
// ==================================================================
// FRIENDLY SIDE TO PLAYABLE UNITS
_allied_side_1 					= "WEST";			//array no.42 - Friendly sides can be "EAST", "WEST","RESISTANCE" etc.  
_allied_side_2 					= "WEST";			//array no.43 - If all players are from the same side make sure you set the same side for both variables eg "WEST", "WEST"
_allied_side_3 					= "";				//array no.90 - NOT IMPLEMENTED
_allied_side_4 					= "";				//array no.91 - NOT IMPLEMENTED
// ==================================================================
// UNCONSCIOUS CAMERA OPTIONS
_follow_cam 					= 1;				//array no.5  - option to allow viewing of friendly units while unconscious
_follow_cam_distance			= 250;				//array no.32 - the range that unconscious players can spectate friendly units
_follow_cam_team	   			= 0;				//array no.44 - set to 1 if you wish unconscious players only to spectate players within NORRN_player_units array
_top_view_height 	   			= 70;				//array no.55 - allows you to set the top down camera height 
_visible_timer 					= 1;				//array no.41 - view a cound-down timer while unconscious
_unconscious_music 				= 0;				//array no.46 - music must appear as unc_theme in music.hpp
// ==================================================================
// RESPAWN DIALOG OPTIONS
_nearest_teammate_dialog 		= 0;				//array no.3  - whether a respawn dialog appears when there are no players within this distance  
_all_dead_dialog 				= 0;				//array no.1  - whether a respawn dialog appears when all players are unconscious (_all_dead_player = 1)  
_respawn_button_timer 			= 0;				//array no.25 - Time until respawn button appears (0 = approx. 12 seconds), NB: Set to a high number like 100000 seconds if you do not want
_distance_to_friend 			= 250;				//array no.26 - If the closest friendly unit is further than this distance away trigger respawn dialog 
_all_dead_player 				= 0;				//array no.56
_all_dead_distance 				= 10000;			//array no.57 - whether a respawn dialog appears when all players within a specified distance are unconscious (_all_dead_player = 1)
// ==================================================================
// Bonus life for aiding team mates function
_reward_function 				= 1; 				//array no.96 - specify whether a unit receives bonus lives for reviving other players
_revives_required 				= 1;				//array no.97 - Number of revives required before recieving a bonus life
// ==================================================================
// Team kill function
_team_kill_function 			= 1;    			//array no.98 - specify whether a unit loses a life for killing team mates
_no_team_kills 					= 1;				//array no.99 - Number of teamkills before punishment
// ==================================================================
// CONFIGURABLE OPTIONS FOR HEAL YOURSELF FUNCTION
_heal_yourself 					= 1;				//array no.8  - whether a unit can heal damage to itself
_no_of_heals 					= 1;				//array no.29 - Number of heals that each player gets during a mission  
_lower_bound_heal 				= 0.1;				//array no.30 - The damage level range between which the heal action becomes available 
_upper_bound_heal 				= 0.8;				//array no.31
// ==================================================================
// AI REVIVE BEHAVIOUR OPTIONS
_goto_revive 					= 0;				//array no. 9  - closest AI automatically moves to revive a downed team mate
_AI_smoke 						= 1;				//array no. 40 - if available reviving AI throws smoke on downed AI position
_AI_aware 						= 0;				//array no. 49 - AI will clear an enemy units it is aware of before auto reviving
_AI_cover 						= 1;				//array no. 50 - second AI unit moves with AI reviver to give cover
_AI_dismount 					= 0;				//array no. 58 - toggles ability of reviving AI units to dismount vehicles (1 = dismount)
_call_for_AI_help 				= 1;				//array no. 59 - allows AI units to call for help 
_goto_revive_distance 			= 500;				//array no. 33 - distance AI units will move to revive a downed team mate
// ==================================================================
// OPTIONS FOR PLAYER'S DEAD BODIES AND EQUIPMENT - Additional revive functions with many thanks to alef (0 - off, 1 - on except for _bury_timeout)
_drop_weapons 					= 1; 				//array no.93  - should the respawned player drop his weapons where he died?
_cadaver 						= 0; 				//array no.94 - should the respawned player's body remain there?
_bury_timeout 					= 12;				//array no.95 - if drop weapons OR player body, how long before the body is buried?
													// 0=maximum (1200s) , n=seconds up to 1200s (hard coded)
// ==================================================================
// USER CODE - eg. NORRNCustonexec1="execvm ""myscript.sqf"";hint ""myoutput"";"
NORRNCustomExec1				=""; 				// Exec1 occurs following being revived
NORRNCustomExec2				="";  				// Exec2 occurs when you team kill
NORRNCustomExec3				="";  				// Exec3 occurs when you spawn at base
NORRNCustomExec4				="";  				// Exec4 occurs when you try and spawn at base but it is still occupied
NORRNCustomExec5				="";  				// Must use variables: MAP_r_rejoin (false - first time, 
													// true - rejoining the server, and 
													// MAP_r_no_lives - number of lives if you rejoin server) 
// =====================================================================================================================
// DO NOT MODIFY THE FOLLOWING CODE
// =====================================================================================================================
NORRN_revive_array = [];
NORRN_revive_array = [_mission_end_function,_all_dead_dialog,_JIP_spawn_dialog,_nearest_teammate_dialog,_unconscious_markers,_follow_cam,_call_out_function,_revive_timer,
_heal_yourself,_goto_revive,_unconscious_invincibility,_respawn_at_base_addWeapons,_no_respawn_points,_Base_1,_Base_2,_Base_3,_Base_4,_time_b4_JIP_spawn_dialog,
_can_revive,_can_revive_2,_can_be_revived,_can_be_revived_2,_no_enemy_sides,_enemy_side_1,_enemy_side_2,_respawn_button_timer,_distance_to_friend,
_revive_time_limit,_respawn_position,_no_of_heals,_lower_bound_heal,_upper_bound_heal,_follow_cam_distance,_goto_revive_distance,_respawn_at_base_magazines,
_respawn_at_base_weapons, _Base_free_respawn, _revive_damage, _max_respawns, _unconscious_drag,_AI_smoke,_visible_timer,_allied_side_1,_allied_side_2,_follow_cam_team,
_water_dialog, _unconscious_music, _enemy_units_1, _enemy_units_2, _AI_aware,_AI_cover,_mobile_spawn,_mobile_base_start,_mobile_man,_altUnc_animation,_top_view_height,
_all_dead_player,_all_dead_distance,_AI_dismount,_call_for_AI_help,_mobile_type,_load_wounded,_perpetual_server,_JIP_respawns,_caseVAC,_mediVAC,_chance_ofDeath,_dualTimer,
_respawnAtBaseWait,_objectiveBasedRP,_mobile_base2_start,_mobile_man2,_can_revive_3,_can_revive_4,_can_be_revived_3,_can_be_revived_4,_medic_1,_medic_2,_medic_3,_medic_4,
_medpacks,_stabilisation,_bleeding,_medic_medpacks,_unit_medpacks,_medic_bandages,_unit_bandages,_stabTime_tillDeath,_enemy_side_3,_enemy_side_4,
_allied_side_3,_allied_side_4,_deadSpectator_cam,_drop_weapons,_cadaver,_bury_timeout,_reward_function,_revives_required,_team_kill_function,_no_team_kills,_medic_stable, _unit_stable];

// start related revive functions
[] execVM "f\revive\init_related_scripts.sqf";

if (true) exitWith {};	
//Last edited 17/08/09

//if (_name == player) then {[_name] execVM 'revive_sqf\rPrn.sqf'}


