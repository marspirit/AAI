// © JUNE 2009 - norrin

_medic_medpacks 		= NORRN_revive_array select 83;
_unit_medpacks 			= NORRN_revive_array select 84;				
_medic_bandages 		= NORRN_revive_array select 85;
_unit_bandages 			= NORRN_revive_array select 86;

_medic_1				= NORRN_revive_array select 76;
_medic_2				= NORRN_revive_array select 77;

NORRN_medic_sup = true;
player removeAction NORRN_medSuppliesAction;

//Define the number of medpacks
player setVariable ["NORRN_medpacks", _unit_medpacks, true];
if (player isKindOf _medic_1 || player isKindOf _medic_2) then {player setVariable ["NORRN_medpacks", _medic_medpacks, true]};

player setVariable ["NORRN_bandages", _unit_bandages, true];
if (player isKindOf _medic_1 || player isKindOf _medic_2) then {player setVariable ["NORRN_bandages", _medic_bandages, true]};

//Prompt player the no medpack and bandages remaining
_med_supplies = format ["Medpacks Remaining: %1\nBandages  Remaining: %2", (player getVariable "NORRN_medpacks"), (player getVariable "Norrn_bandages")];
hint _med_supplies;

if (true) exitWith {};