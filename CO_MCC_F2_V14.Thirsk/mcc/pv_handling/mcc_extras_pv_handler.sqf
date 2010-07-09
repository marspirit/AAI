#include "\x\cba\addons\main\script_macros_common.hpp"

trap_rc_single = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_rc_trap.sqf";
trap_rc_area = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_rc_trap_area.sqf";
trap_cw_single = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_cw.sqf";
trap_cw_area = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_cw_area.sqf";
trap_single = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_trap.sqf";
trap_area = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_trap_area.sqf";
sb_bomber = compile preProcessFileLineNumbers "mcc\general_scripts\traps\put_suicidebomber.sqf";
hostage_req = compile preProcessFileLineNumbers "mcc\general_scripts\hostages\create_hostage.sqf";
arty_site = compile preProcessFileLineNumbers "mcc\general_scripts\arty_site\create_arty_site.sqf";
sf_para = compile preProcessFileLineNumbers "mcc\general_scripts\paradrop\parastart.sqf";
["sf_para", {[(_this select 0)] spawn sf_para}] call CBA_fnc_addEventHandler; 

if (isServer) then
{
	["trap_rc_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] spawn trap_rc_single}] call CBA_fnc_addEventHandler;
	["trap_rc_area", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7)] spawn trap_rc_area}] call CBA_fnc_addEventHandler;
	["trap_cw_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6),(_this select 7)] spawn trap_cw_single}] call CBA_fnc_addEventHandler;
	["trap_cw_area", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6),(_this select 7) ] spawn trap_cw_area}] call CBA_fnc_addEventHandler;
	["trap_single", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6),(_this select 7)] spawn trap_single}] call CBA_fnc_addEventHandler;
	["trap_area", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6),(_this select 7) ] spawn trap_area}] call CBA_fnc_addEventHandler;
	["sb_bomber", {[(_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6),(_this select 7) ] spawn sb_bomber}] call CBA_fnc_addEventHandler;
	["hostage_req", {[(_this select 0), (_this select 1)] spawn hostage_req}] call CBA_fnc_addEventHandler;
	["arty_site", {[(_this select 0), (_this select 1), (_this select 2)] spawn arty_site}] call CBA_fnc_addEventHandler;
	
};