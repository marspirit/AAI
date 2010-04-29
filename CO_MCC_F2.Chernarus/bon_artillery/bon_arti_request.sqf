//by Bon_Inf*

_requestor = _this;

// initiate fire mission
[WEST,"HQ"] sideChat "Coordinates received. Standby.";
_requestor setVehicleInit "this execVM 'bon_artillery\bon_arti_fire.sqf';"; processInitCommands;

CloseDialog 0;
arty_LastData = nil;

if(true) exitWith{};