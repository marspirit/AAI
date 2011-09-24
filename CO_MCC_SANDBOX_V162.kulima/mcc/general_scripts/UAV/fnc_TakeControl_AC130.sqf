 disableSerialization;
private ["_caller","_var","_object","_dummyTarget"];
_object = _this select 0;
_caller = _this select 1;
_var = (_this select 3) select 0; 


 [_var,LDL_AC130_Adjustments select 0] call LDL_ac130_att_setup;