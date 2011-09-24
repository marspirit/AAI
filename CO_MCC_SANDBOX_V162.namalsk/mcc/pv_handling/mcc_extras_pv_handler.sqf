#include "\x\cba\addons\main\script_macros_common.hpp"
//==============================================================================XEH================================================================================================

//trap_single = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_trap.sqf";
hostage_req = compile preProcessFileLineNumbers "mcc\general_scripts\hostages\create_hostage.sqf";
sf_para = compile preProcessFileLineNumbers "mcc\general_scripts\paradrop\parastart.sqf";
place_convoy = compile preProcessFileLineNumbers "mcc\general_scripts\convoy\place_convoy.sqf";
uav = compile preProcessFileLineNumbers "mcc\general_scripts\uav\create_uav_site.sqf";
MCC_3D_PLACER = compile preProcessFileLineNumbers "mcc\pop_menu\3rd_placer.sqf";

["sf_para", {[(_this select 0)] spawn sf_para}] call CBA_fnc_addEventHandler; 
["briefing", {[(_this select 0), (_this select 1)] execvm "mcc\pop_menu\briefing_add.sqf";}] call CBA_fnc_addEventHandler;
["marker", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] execvm "mcc\pop_menu\markers_add.sqf";}] call CBA_fnc_addEventHandler;
["music_trigger",{[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] execvm "mcc\general_scripts\jukebox\jukebox_execute.sqf";}] call CBA_fnc_addEventHandler;
["tasks", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] execvm "mcc\pop_menu\tasks_add.sqf";}] call CBA_fnc_addEventHandler;
["highCommand", {[(_this select 0), (_this select 1)] execvm "mcc\general_scripts\HC\hc_server.sqf";}] call CBA_fnc_addEventHandler;
	
if (isServer) then
{
	["trap_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8), (_this select 9)] execvm  "mcc\general_scripts\traps\put_trap.sqf";}] call CBA_fnc_addEventHandler;
	["mine_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4)] execvm  "mcc\general_scripts\traps\put_mine.sqf";}] call CBA_fnc_addEventHandler;
	["RC_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] execvm  "mcc\general_scripts\traps\put_rc.sqf";}] call CBA_fnc_addEventHandler;
	["AC_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] execvm  "mcc\general_scripts\traps\put_ac.sqf";}] call CBA_fnc_addEventHandler;
	["SB_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5)] execvm  "mcc\general_scripts\traps\put_sb.sqf";}] call CBA_fnc_addEventHandler;
	["ambush_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5)] execvm  "mcc\general_scripts\traps\put_ambush.sqf";}] call CBA_fnc_addEventHandler;
	["ied_sync", {[(_this select 0), (_this select 1), (_this select 2)] execvm  "mcc\general_scripts\traps\ied_sync.sqf";}] call CBA_fnc_addEventHandler;
	["hostage_req", {[(_this select 0), (_this select 1), (_this select 2)] spawn hostage_req}] call CBA_fnc_addEventHandler;
	["place_convoy", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3) , (_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8), (_this select 9), (_this select 10), (_this select 11), (_this select 12)] spawn place_convoy}] call CBA_fnc_addEventHandler;
	["start_convoy", {[(_this select 0), (_this select 1)] execvm "mcc\general_scripts\convoy\start_convoy_execute.sqf";}] call CBA_fnc_addEventHandler;
	["uav", {[(_this select 0), (_this select 1), (_this select 2)] spawn uav}] call CBA_fnc_addEventHandler;
	["evac_spawn", {[(_this select 0), (_this select 1)] execvm "mcc\general_scripts\evac\spawn_heli.sqf";}] call CBA_fnc_addEventHandler;
	["evac_delete", {[(_this select 0)] execvm "mcc\general_scripts\evac\delete_heli_server.sqf";}] call CBA_fnc_addEventHandler;
	["evac_move", {[(_this select 0), (_this select 1),(_this select 2)] execvm "mcc\general_scripts\evac\mando_heliroute_arma.sqf";}] call CBA_fnc_addEventHandler;
	["evac_relocate", {[(_this select 0)] execvm "mcc\general_scripts\evac\evac_relocate.sqf";}] call CBA_fnc_addEventHandler;
	["airDrop", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4)] execvm "mcc\general_scripts\cas\cas_execute.sqf";}] call CBA_fnc_addEventHandler;
	["artillery", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] execvm "mcc\general_scripts\artillery\artillery_fire.sqf";}] call CBA_fnc_addEventHandler;
	["gita", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4)] execvm "mcc\general_scripts\gita\gita_server.sqf";}] call CBA_fnc_addEventHandler;
	["modules", {[(_this select 0), (_this select 1)] execvm "mcc\general_scripts\gita\modules_server.sqf";}] call CBA_fnc_addEventHandler;
	["battlefield", {[(_this select 0), (_this select 1)] execvm "mcc\general_scripts\gita\battlefield_server.sqf";}] call CBA_fnc_addEventHandler;
	["delete", {[(_this select 0), (_this select 1), (_this select 2)] execvm "mcc\general_scripts\delete\delete_exec.sqf";}] call CBA_fnc_addEventHandler;
	["coin", {[(_this select 0), (_this select 1), (_this select 2)] execvm "mcc\general_scripts\coin\coin_spawn.sqf";}] call CBA_fnc_addEventHandler;
	["simpleSpawn", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] execvm "mcc\pop_menu\simple_spawn.sqf";}] call CBA_fnc_addEventHandler;
	["boxGenerator", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] execvm "mcc\general_scripts\boxGen\box_spawn.sqf";}] call CBA_fnc_addEventHandler;
	["mobileSpawn", {[(_this select 0), (_this select 1), (_this select 2)] execvm "mcc\general_scripts\mobileSpawn\mobileSpawn_execute.sqf";}] call CBA_fnc_addEventHandler;
	["paradrop", {[(_this select 0), (_this select 1), (_this select 2)] execvm "mcc\general_scripts\unitManage\paradrop.sqf";}] call CBA_fnc_addEventHandler;
	["POPZ", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5)] execvm "mcc\general_scripts\popz\popz_exec.sqf";}] call CBA_fnc_addEventHandler;
};