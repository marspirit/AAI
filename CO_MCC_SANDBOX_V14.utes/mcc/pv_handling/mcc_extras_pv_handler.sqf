#include "\x\cba\addons\main\script_macros_common.hpp"

trap_rc_single = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_rc_trap.sqf";
trap_rc_area = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_rc_trap_area.sqf";
trap_cw_single = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_cw.sqf";
trap_cw_area = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_cw_area.sqf";
trap_single = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_trap.sqf";
trap_area = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_trap_area.sqf";
sb_bomber = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_suicidebomber.sqf";
sb_bomber_area = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_suicidebomber_area.sqf";
hostage_req = compile preProcessFileLineNumbers "mcc\general_scripts\hostages\create_hostage.sqf";
sf_para = compile preProcessFileLineNumbers "mcc\general_scripts\paradrop\parastart.sqf";
place_convoy = compile preProcessFileLineNumbers "mcc\general_scripts\convoy\place_convoy.sqf";
start_convoy = compile preProcessFileLineNumbers "mcc\general_scripts\convoy\convoyDefend_init.sqf";
["sf_para", {[(_this select 0)] spawn sf_para}] call CBA_fnc_addEventHandler; 
uav = compile preProcessFileLineNumbers "mcc\general_scripts\uav\create_uav_site.sqf";
["briefing", {[(_this select 0), (_this select 1)] execvm "mcc\pop_menu\briefing_add.sqf";}] call CBA_fnc_addEventHandler;
["marker", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] execvm "mcc\pop_menu\markers_add.sqf";}] call CBA_fnc_addEventHandler;
["music_trigger",{[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] execvm "mcc\general_scripts\jukebox\jukebox_execute.sqf";}] call CBA_fnc_addEventHandler;
["tasks", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] execvm "mcc\pop_menu\tasks_add.sqf";}] call CBA_fnc_addEventHandler;


if (isServer) then
{
	["trap_rc_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5)] spawn trap_rc_single}] call CBA_fnc_addEventHandler;
	["trap_rc_area", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] spawn trap_rc_area}] call CBA_fnc_addEventHandler;
	["trap_cw_single", {[(_this select 0), (_this select 1), (_this select 2)] spawn trap_cw_single}] call CBA_fnc_addEventHandler;
	["trap_cw_area", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5)] spawn trap_cw_area}] call CBA_fnc_addEventHandler;
	["trap_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5)] spawn trap_single}] call CBA_fnc_addEventHandler;
	["trap_area", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6),(_this select 7) ] spawn trap_area}] call CBA_fnc_addEventHandler;
	["sb_bomber", {[(_this select 0), (_this select 1), (_this select 2)] spawn sb_bomber}] call CBA_fnc_addEventHandler;
	["sb_bomber_area", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5)] spawn sb_bomber_area}] call CBA_fnc_addEventHandler;
	["hostage_req", {[(_this select 0), (_this select 1)] spawn hostage_req}] call CBA_fnc_addEventHandler;
	["place_convoy", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3) , (_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8), (_this select 9), (_this select 10), (_this select 11), (_this select 12)] spawn place_convoy}] call CBA_fnc_addEventHandler;
	["start_convoy", {[(_this select 0), (_this select 1)] execvm "mcc\general_scripts\convoy\convoyDefend_init.sqf";}] call CBA_fnc_addEventHandler;
	["uav", {[(_this select 0), (_this select 1), (_this select 2)] spawn uav}] call CBA_fnc_addEventHandler;
	["evac_spawn", {[(_this select 0), (_this select 1)] execvm "mcc\general_scripts\evac\spawn_heli.sqf";}] call CBA_fnc_addEventHandler;
	["evac_delete", {[(_this select 0)] execvm "mcc\general_scripts\evac\delete_heli_server.sqf";}] call CBA_fnc_addEventHandler;
	["evac_move", {[(_this select 0), (_this select 1),(_this select 2)] execvm "mcc\general_scripts\evac\mando_heliroute_arma.sqf";}] call CBA_fnc_addEventHandler;
	["evac_relocate", {[(_this select 0)] execvm "mcc\general_scripts\evac\evac_relocate.sqf";}] call CBA_fnc_addEventHandler;
	["airDrop", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4)] execvm "mcc\general_scripts\cas\cas_execute.sqf";}] call CBA_fnc_addEventHandler;
	["artillery", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] execvm "mcc\general_scripts\artillery\artillery_fire.sqf";}] call CBA_fnc_addEventHandler;
	["trigger_generated",{[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8)] execvm "mcc\general_scripts\triggers\triggers_execute.sqf";}] call CBA_fnc_addEventHandler;
};