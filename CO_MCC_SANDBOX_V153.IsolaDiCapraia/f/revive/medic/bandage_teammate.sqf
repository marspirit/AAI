/*
  BANDAGE TEAMATE SCRIPT

  Causes the unit to execute the medic animation when the revive action is chosen

  © JUNE 2009 - norrin
***********************************************************************************************************************
begin bandage_teammate.sqf
*/

_array 		= _this select 3;
_name 		= _array select 0;
_wounded 	= _array select 1;

//Uneccesary actions removed & drop body added 
_name removeAction NORRN_bandageBuddyAction;

_wounded setVehicleInit "this playMove 'AmovPpneMstpSnonWnonDnon_healed'"; 
processInitCommands;
_name playMove "AinvPknlMstpSlayWrflDnon_medic";

_var = _name getVariable "Norrn_bandages";
_name setVariable ["Norrn_bandages", (_var - 1), true]; 
_med_supplies = format ["Medpacks Remaining: %1\nBandages  Remaining: %2", (_name getVariable "Norrn_medpacks"), (_name getVariable "Norrn_bandages")];
hint _med_supplies;

// Set variables
_wounded setVariable ["NORRN_bleedDamage", (getDammage _wounded), true];
_wounded setVariable ["NORRN_Bleed", false, true];
_wounded setVariable ["NORRN_stopBleed", true, true];
sleep 8;
if (true) exitWith {};