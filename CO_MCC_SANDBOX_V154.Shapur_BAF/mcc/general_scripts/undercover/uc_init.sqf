private ["_unit", "_type","_null"];

_unit =  _this select 0; 

while {!alive _unit} do {sleep 1};

removeallweapons _unit;
_unit setcaptive true; 
{_unit addmagazine "ACE_Bandage"} foreach [1,2]; 

_unit setvariable ["uc_gunMags",6, true];
_unit setvariable ["uc_smoke",1, true];
_unit setvariable ["uc_frag",2, true];

waitUntil {!(isnil ("f_param_undercover"))};
if (f_param_undercover == 0) then 
	{
	[_unit, east] execVM "mcc\general_scripts\undercover\nearTargets.sqf";
	} else
		{
		[_unit, west] execVM "mcc\general_scripts\undercover\nearTargets.sqf";
		};
_null = _unit addaction ["Draw Weapon", "mcc\general_scripts\undercover\fnc_handle_gun.sqf",0];
 

