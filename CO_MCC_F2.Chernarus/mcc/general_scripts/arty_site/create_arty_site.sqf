_pos= _this;
_dummy = "SatPhone" createvehicle _pos;
_dummy setposatl _pos;
_dummy setVehicleInit "nul = [this] execVM ""R3F_ARTY_AND_LOG\create_arty_quarter.sqf"";";
processInitCommands;
if (true) exitWith {};