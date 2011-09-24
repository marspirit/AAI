disableSerialization;
private ["_caller","_var","_object","_dummyTarget","_pos"];
_object = _this select 0;
_caller = _this select 1;
_var = (_this select 3) select 0; 

mapClick = false; 
hint "Map Click to set up new location"; 
onMapSingleClick " 	hint ""UAV/ULB Spawned.""; 
									mPos = _pos;
									mapClick = true;
									onMapSingleClick """";";
									
while {!mapClick} do {sleep 1};
_pos = [mPos select 0, mPos select 1, 1000];
group _var move _pos; //Set waypoint
group _var setBehaviour "CARELESS";
ac130Abort = true; 
while {(_var distance _pos) > 200} do {sleep 1};

[_var] spawn rotateAC130;