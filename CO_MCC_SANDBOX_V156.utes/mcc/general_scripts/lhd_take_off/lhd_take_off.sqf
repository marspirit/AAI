if (isEngineOn(vehicle player)) exitWith{};
hint "Taxing";
sleep 1;
(vehicle player) setPosASL (getPosASL startfly); 
if (((getdir deck) +90) > 360) then {(vehicle player) setDir (getdir deck +90)- 360} else {(vehicle player) setDir getdir deck +90};
