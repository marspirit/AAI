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
	mcc_safe=mcc_safe + FORMAT ["
								['evac_spawn', [%1 select 0, %2 select 0]] call CBA_fnc_globalEvent;
								"								 
								, [_heliType]
								, [_faction]
								];
	}	
		else { player globalchat "Access Denied"};
	};	

