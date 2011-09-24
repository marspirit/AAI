private ["_unit", "_type","_null"];

_unit =  _this select 0; 
if (_unit == player) then 
	{
	while {!alive player} do {sleep 1};
	removeallweapons player;
	player setcaptive true; 
	{player addmagazine "ACE_Bandage"} foreach [1,2]; 

	player setvariable ["uc_gunMags",6, true];
	player setvariable ["uc_smoke",1, true];
	player setvariable ["uc_frag",2, true];

	waitUntil {!(isnil ("f_param_undercover"))};
	if (f_param_undercover == 0) then 
		{
		[player, east] execVM "mcc\general_scripts\undercover\nearTargets.sqf";
		} else
			{
			[player, west] execVM "mcc\general_scripts\undercover\nearTargets.sqf";
			};
	_null = player addaction ["Draw Weapon", "mcc\general_scripts\undercover\fnc_handle_gun.sqf",0,6,false,true,"","_target == _this"];

	player addEventHandler ["killed", {[_this select 0] execVM "mcc\general_scripts\undercover\uc_init.sqf"}];
	};
 

