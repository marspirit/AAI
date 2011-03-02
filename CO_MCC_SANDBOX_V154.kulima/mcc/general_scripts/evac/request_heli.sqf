#define HELI_TYPE 6100
private ["_heliType","_faction"];

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{
	hint "Evac spawned";
	_faction = faction player; 
	_heliType = (U_GEN_HELICOPTER select (lbCurSel HELI_TYPE)) select 1; 
	["evac_spawn", [_heliType, _faction]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};	

