if (isNull(Player)) exitWith {};
if (player iskindof "FR_Base" || player iskindof "RUS_Soldier_Base"|| player iskindof "US_Delta_Force_EP1") then
	{
	player setposasl [(mPos select 0), (mPos select 1), 2501];
	waituntil {(position player select 2) > 1};
	player addweapon "ACE_ParachutePack";
	player execVM "x\ace\addons\sys_eject\jumpout_cord.sqf";
	};
