mPos = _this select 0; 
if (isNull(Player)) exitWith {};
if (player iskindof "FR_Base" || player iskindof "RUS_Soldier_Base"|| player iskindof "US_Delta_Force_EP1" || player iskindof "US_Delta_Force_TL_EP1" || player iskindof "USMC_LHD_Crew_White") then
	{
	//player setposasl [(mPos select 0), (mPos select 1), 2501];
	player setdir 0;
	waituntil {(position player select 2) > 1};
	player addweapon "ACE_ParachutePack";
	player execVM "x\ace\addons\sys_eject\jumpout_cord.sqf";
	};
