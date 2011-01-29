//by Bon_Inf*
#include "definitions.sqf"
disableSerialization;

ctrlSetText [BON_ARTY_XRAYEDIT, format["%1",round (getPos player select 0)]];
ctrlSetText [BON_ARTY_YANKEEEDIT, format["%1",round (getPos player select 1)]];

if(true) exitWith{};