// F2 - Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f\common\f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitfaction"];

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction

_unitfaction = toLower (faction player);

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Player faction: %1",_unitfaction];
	};

// ====================================================================================


// BRIEFING: USMC
// The following block of code executes only if the player is in a USMC slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "BIS_US") exitwith {

#include "f\common\f_briefing_usmc.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CDF
// The following block of code executes only if the player is in a CDF slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "CDF") exitwith {

#include "f\common\f_briefing_cdf.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: RUSSIAN
// The following block of code executes only if the player is in a Russian slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "BIS_TK") exitwith {

#include "f\common\f_briefing_ru.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CHDKZ
// The following block of code executes only if the player is in a ChDKZ slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "INS") exitwith {

#include "f\common\f_briefing_ins.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: NAPA
// The following block of code executes only if the player is in a NAPA slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "BIS_TK_GUE") exitwith {

#include "f\common\f_briefing_gue.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CIVILIAN (CHERNARUS)
// The following block of code executes only if the player is in a civilian slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "CIV") exitwith {

#include "f\common\f_briefing_civ.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CIVILIAN (RUSSIA)
// The following block of code executes only if the player is in a civilian slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "CIV_RU") exitwith {

#include "f\common\f_briefing_civ_ru.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================
// BRIEFING: ACE_GRU (RUSSIA)
// The following block of code executes only if the player is in a civilian slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "ACE_GRU") exitwith {

#include "f\common\f_briefing_ace_gru.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (briefing.sqf): Faction %1 is not defined.",_unitfaction];