private ["_pos", "_dummyLogic","_vehicles","_armors","_aircraft","_static","_vehiclesEP","_armorsEP","_fort","_buildings","_ammo","_string"];

_dummyLogic = _this select 0 select 0;
_pos = getpos _dummyLogic;

_fort = "Fortification";
_buildings = "Buildings";
_vehicles = "Missing: Light Factory"; 
_vehiclesEP = "Missing: Light Factory"; 
_armors = "Missing: Heavy Factory"; 
_armorsEP = "Missing: Heavy Factory"; 
_aircraft = "Missing: Aircraf Factory"; 
_static = "Missing: Barracks"; 
_ammo = "Missing: Service Point"; 

if (count (_pos nearObjects ["USMC_WarfareBLightFactory", 500])>= 1) then {_vehicles ="Vehicles"};	//Light Factory
if (count (_pos nearObjects ["RU_WarfareBLightFactory", 500])>= 1) then {_vehicles ="Vehicles"};
if (count (_pos nearObjects ["Gue_WarfareBLightFactory", 500])>= 1) then {_vehicles ="Vehicles"};
if (count (_pos nearObjects ["USMC_WarfareBLightFactory", 500])>= 1) then {_vehiclesEP ="Vehicles_EP"};	//Light Factory EP
if (count (_pos nearObjects ["RU_WarfareBLightFactory", 500])>= 1) then {_vehiclesEP ="Vehicles_EP"};
if (count (_pos nearObjects ["Gue_WarfareBLightFactory", 500])>= 1) then {_vehiclesEP ="Vehicles_EP"};

if (count (_pos nearObjects ["USMC_WarfareBHeavyFactory", 500])>= 1) then {_armors ="Armors"};	//Heavy Factory EP
if (count (_pos nearObjects ["RU_WarfareBHeavyFactory", 500])>= 1) then {_armors ="Armors"};
if (count (_pos nearObjects ["Gue_WarfareBHeavyFactory", 500])>= 1) then {_armors ="Armors"};
if (count (_pos nearObjects ["USMC_WarfareBHeavyFactory", 500])>= 1) then {_armorsEP ="Armors_EP"};	//Heavy Factory EP
if (count (_pos nearObjects ["RU_WarfareBHeavyFactory", 500])>= 1) then {_armorsEP ="Armors_EP"};
if (count (_pos nearObjects ["Gue_WarfareBHeavyFactory", 500])>= 1) then {_armorsEP ="Armors_EP"};

if (count (_pos nearObjects ["USMC_WarfareBAircraftFactory", 500])>= 1) then {_aircraft ="Aircrafts"};	//Aircraf Factory
if (count (_pos nearObjects ["RU_WarfareBAircraftFactory", 500])>= 1) then {_aircraft ="Aircrafts"};
if (count (_pos nearObjects ["GUE_WarfareBAircraftFactory", 500])>= 1) then {_aircraft ="Aircrafts"};

if (count (_pos nearObjects ["USMC_WarfareBBarracks", 500])>= 1) then {_static ="Static_Weapons"};	//Barracks
if (count (_pos nearObjects ["RU_WarfareBBarracks", 500])>= 1) then {_static ="Static_Weapons"};
if (count (_pos nearObjects ["Gue_WarfareBBarracks", 500])>= 1) then {_static ="Static_Weapons"};

if (count (_pos nearObjects ["USMC_WarfareBVehicleServicePoint", 500])>= 1) then {_ammo ="Ammo_Boxes"};	//Barracks
if (count (_pos nearObjects ["RU_WarfareBVehicleServicePoint", 500])>= 1) then {_ammo ="Ammo_Boxes"};
if (count (_pos nearObjects ["GUE_WarfareBVehicleServicePoint", 500])>= 1) then {_ammo ="Ammo_Boxes"};


_string = [_fort,_buildings,_vehicles,_vehiclesEP,_armors,_armorsEP,_aircraft,_static,_ammo];
_dummyLogic setvariable ["BIS_COIN_categories",_string];
