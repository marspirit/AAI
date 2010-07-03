if (isEngineOn(vehicle player)) exitWith{};
hint "Taxing";
sleep 1;
(vehicle player) setPosASL (getPosASL startfly); (vehicle player) setDir 90;