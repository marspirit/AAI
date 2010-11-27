disableSerialization;
private ["_caller","_type","_dummybox","_dummyTarget"];
_dummybox = _this select 0;
_caller = _this select 1;
_type = (_this select 3) select 0; 

deletevehicle _dummybox; 
_dummyTarget = "ACE_Target_CInf";
["uav", [_caller, _dummyTarget, _type]] call CBA_fnc_globalEvent;

Player sideChat "UAV has been Launched";  


	
