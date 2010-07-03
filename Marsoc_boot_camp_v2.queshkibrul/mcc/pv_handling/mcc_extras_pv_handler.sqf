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

["chat_c360", {hint format ["C360 range \n Your time:%1:%2%3:%4%5 \nNumber of hits:%6 \nTotal target spawned:%7 \nDifficulty: %8 \nRating: %9", (_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8)]}] call CBA_fnc_addEventHandler;
["chat_cqb", {hint format ["CQB range \n Your time:%1:%2%3:%4%5 \nTargets Spqwned \nHostages:%6 Enemies:%7 \nTargets hit \nHostages:%8 Enemies:%9", (_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8)]}] call CBA_fnc_addEventHandler;
["chat_binf", {hint format ["Basic infantry course \nFirst time:%1:%2%3:%4%5 \nSecond time:%6:%7%8:%9%10", (_this select 0), (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8), (_this select 9)]}] call CBA_fnc_addEventHandler;
["say", {(_this select 0) say ["beep",10]}] call CBA_fnc_addEventHandler;
		
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
	["c360_e", {(_this select 0) execvm"boot_camp\c360_easy.sqf" }] call CBA_fnc_addEventHandler;
	["c360_m", {(_this select 0) execvm "boot_camp\c360_meduim.sqf" }] call CBA_fnc_addEventHandler;
	["c360_h", {(_this select 0) execvm "boot_camp\c360_hard.sqf" }] call CBA_fnc_addEventHandler;
	
};