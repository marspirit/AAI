//==== put silencer on  weapons=================

//who activate?
private ["_unit", "_weapon", "_mag", "_sdmag", "_magazines", "_weapons", "_items", "_stance", "_weaponnew","_success"];
If (!(isPlayer _unit) || !(local player)) exitWith{};
_unit = _this select 1;
_weapon = primaryWeapon _unit;
_success = true;
switch (_weapon) do 
	{
	case "M4A1_HWS_GL_camo":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "M4A1_HWS_GL_SD_Camo";
	};
	
	case "M4A1_HWS_GL_SD_Camo":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "M4A1_HWS_GL_camo";
	};
	
	case "ACE_M110":
	{
	_mag = "ACE_20Rnd_762x51_SB_M110";
	_sdmag = "ACE_20Rnd_762x51_S_M110";
	_weaponnew = "ACE_M110_SD";
	};
	
	case "ACE_M110_SD":
	{
	_mag = "ACE_20Rnd_762x51_SB_M110";
	_sdmag = "ACE_20Rnd_762x51_S_M110";
	_weaponnew = "ACE_M110";
	};
	
	case "M4A1_Aim_camo":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "M4A1_AIM_SD_camo";
	};
	
	case "M4A1_AIM_SD_camo":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "M4A1_Aim_camo";
	};
	
	case "G36K":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "G36_C_SD_eotech";
	};
	
	case "G36_C_SD_eotech":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "G36K";
	};
	
	case "MP5A5":
	{
	_mag = "30Rnd_9x19_MP5";
	_sdmag = "30Rnd_9x19_MP5S";
	_weaponnew = "MP5SD";
	};
		
	case "MP5SD":
	{
	_mag = "30Rnd_9x19_MP5";
	_sdmag = "30Rnd_9x19_MP5S";
	_weaponnew = "MP5A5";
	};
	
	case "Bizon":
	{
	_mag = "64Rnd_9x19_Bizon";
	_sdmag = "64Rnd_9x19_SD_Bizon";
	_weaponnew = "bizon_silenced";
	};
	
	case "bizon_silenced":
	{
	_mag = "64Rnd_9x19_Bizon";
	_sdmag = "64Rnd_9x19_SD_Bizon";
	_weaponnew = "Bizon";
	};
	
	case "ACE_M4A1_GL":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4A1_GL_SD";
	};
	
	case "ACE_M4A1_GL_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4A1_GL";
	};
	
	case "ACE_M4A1_ACOG":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4A1_ACOG_SD";
	};
	
	case "ACE_M4A1_ACOG_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4A1_ACOG";
	};
	
	case "M4A1_AIM":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4A1_AIM_SD";
	};
	
	case "ACE_M4A1_AIM_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "M4A1_AIM";
	};
	
	case "ACE_SOC_M4A1_Aim":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_SOC_M4A1_AIM_SD";
	};
	
	case "ACE_SOC_M4A1_AIM_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_SOC_M4A1_Aim";
	};
	
	case "ACE_SOC_M4A1_SHORTDOT":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_SOC_M4A1_SHORTDOT_SD";
	};
	
	case "ACE_SOC_M4A1_SHORTDOT_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_SOC_M4A1_SHORTDOT";
	};
	
	case "M4SPR":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4SPR_SD";
	};
	
	case "ACE_M4SPR_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "M4SPR";
	};
	
	case "ACE_TAC50":
	{
	_mag = "ACE_5Rnd_127x99_B_TAC50";
	_sdmag = "ACE_5Rnd_127x99_S_TAC50";
	_weaponnew = "ACE_TAC50_SD";
	};
	
	case "ACE_TAC50_SD":
	{
	_mag = "ACE_5Rnd_127x99_B_TAC50";
	_sdmag = "ACE_5Rnd_127x99_S_TAC50";
	_weaponnew = "ACE_TAC50";
	};
	
	case "ACE_HK416_D10":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_HK416_D10_SD";
	};
		
	case "ACE_HK416_D10_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_HK416_D10";
	};
	
	case "ACE_HK416_D10_COMPM3":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_HK416_D10_COMPM3_SD";
	};
	
	case "ACE_HK416_D10_COMPM3_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_HK416_D10_COMPM3";
	};
	
	case "ACE_HK416_D14":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_HK416_D14_SD";
	};
		
	case "ACE_HK416_D14_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_HK416_D14";
	};
	
	case "QBZ95":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "QBZ95_SD";
	};
	
	case "QBZ95_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "QBZ95";
	};
	
	case "ACE_oc14":
	{
	_mag = "ACE_20Rnd_9x39_B_OC14";
	_sdmag = "ACE_20Rnd_9x39_S_OC14";
	_weaponnew = "ACE_oc14sd";
	};
	
	case "ACE_oc14sd":
	{
	_mag = "ACE_20Rnd_9x39_B_OC14";
	_sdmag = "ACE_20Rnd_9x39_S_OC14";
	_weaponnew = "ACE_oc14";
	};
	
	case "ACE_oc14sp":
	{
	_mag = "ACE_20Rnd_9x39_B_OC14";
	_sdmag = "ACE_20Rnd_9x39_S_OC14";
	_weaponnew = "ACE_oc14sdsp";
	};
	
	case "ACE_oc14sdsp":
	{
	_mag = "ACE_20Rnd_9x39_B_OC14";
	_sdmag = "ACE_20Rnd_9x39_S_OC14";
	_weaponnew = "ACE_oc14sp";
	};
	
	case "ACE_gr1":
	{
	_mag = "30Rnd_762x39_AK47";
	_sdmag = "ACE_30Rnd_762x39_SD_AK47";
	_weaponnew = "ACE_gr1sd";
	};
	
	case "ACE_gr1sd":
	{
	_mag = "30Rnd_762x39_AK47";
	_sdmag = "ACE_30Rnd_762x39_SD_AK47";
	_weaponnew = "ACE_gr1";
	};
	
	case "ACE_gr1sdsp":
	{
	_mag = "30Rnd_762x39_AK47";
	_sdmag = "ACE_30Rnd_762x39_SD_AK47";
	_weaponnew = "ACE_gr1sp";
	};
	
	case "ACE_gr1sp":
	{
	_mag = "30Rnd_762x39_AK47";
	_sdmag = "ACE_30Rnd_762x39_SD_AK47";
	_weaponnew = "ACE_gr1sdsp";
	};
	
	case "ACE_M4A1_AIM_GL":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4A1_AIM_GL_SD";
	};

	case "ACE_M4A1_AIM_GL_SD":
	{
	_mag = "30Rnd_556x45_Stanag";
	_sdmag = "30Rnd_556x45_StanagSD";
	_weaponnew = "ACE_M4A1_AIM_GL";
	};
	
	case "AKS_74_U":
	{
	_mag = "30Rnd_545x39_AK";
	_sdmag = "30Rnd_545x39_AKSD";
	_weaponnew = "ACE_AKS74_UN";
	};
	
	case "ACE_AKS74_UN":
	{
	_mag = "30Rnd_545x39_AK";
	_sdmag = "30Rnd_545x39_AKSD";
	_weaponnew = "AKS_74_U";
	};
	
	case "AK_74_GL_kobra":
	{
	_mag = "30Rnd_545x39_AK";
	_sdmag = "30Rnd_545x39_AKSD";
	_weaponnew = "AKS_74_UN_kobra";
	};
	
	case "AKS_74_UN_kobra":
	{
	_mag = "30Rnd_545x39_AK";
	_sdmag = "30Rnd_545x39_AKSD";
	_weaponnew = "AK_74_GL_kobra";
	};
	
	case "SCAR_H_LNG_Sniper":
	{
	_mag = "20rnd_762x51_B_SCAR";
	_sdmag = "20rnd_762x51_SB_SCAR";
	_weaponnew = "SCAR_H_LNG_Sniper_SD";
	};	
	
	case "SCAR_H_LNG_Sniper_SD":
	{
	_mag = "20rnd_762x51_B_SCAR";
	_sdmag = "20rnd_762x51_SB_SCAR";
	_weaponnew = "SCAR_H_LNG_Sniper";
	};	
	
	default					// If no supressed version found for this weapon
	{
	hint "No silencer found for this Weapon";
	_success = false;
	};
	};
	if (_success) then
		{
		_stance = _unit call CBA_fnc_getUnitAnim select 0;
		switch (_stance) do {
						case "stand":
						{
						_unit playMove "WeaponMagazineReloadStand";
						};
						case "kneel":
						{
						_unit playMove "WeaponMagazineReloadKneel";
						};
						case "prone":
						{
						_unit playMove "WeaponMagazineReloadProne";
						};
						default
						{
						_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
						};
						};
		sleep 1.5;
		_unit removeweapon _weapon;
		_unit addweapon _weaponnew;
		/*
		_weapons = (weapons _unit) - (items _unit);	// save weapons
		_items = items _unit;		// save items
		_magazines = magazines _unit;	// save mags
		removeAllWeapons _unit;				//remove all weapons
		{_unit addWeapon _x} forEach _weapons; //add weapons
		{_unit addWeapon _x} forEach _items; 	//add items
		{switch (_x) do {
					case _mag:
					{
					_unit addMagazine _sdmag; //replace regular mags with SD
					};
					case _sdmag:
					{
					_unit addMagazine _mag;  //replace SD mags with regulars
					};
					default
					{
					_unit addMagazine _x;   // add saved mags
					};
					};} forEach _magazines;
		_unit selectWeapon _weaponnew; // Select the primaryWeapon	
		_muzzles = getArray(configFile>>"cfgWeapons" >> _weaponnew >> "muzzles"); // Fix for weapons with grenade launcher
		_unit selectWeapon (_muzzles select 0);
		*/
		};
		

