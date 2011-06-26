//Silencer script made by Shay_gman (c) 09.10
private ["_caller", "_weapon", "_mag", "_sdmag", "_magazines", "_weapons", "_items", "_stance", "_weaponnew","_success", "_isPistol"];

If (!(isPlayer _caller) || !(local player)) exitWith{};
_caller = _this select 0;	//Who activate the script
_weapon = currentWeapon _caller;
_isPistol = false;

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
		
		case "bizon":
		{
		_mag = "64Rnd_9x19_Bizon";
		_sdmag = "64Rnd_9x19_SD_Bizon";
		_weaponnew = "bizon_silenced";
		};
		
		case "bizon_silenced":
		{
		_mag = "64Rnd_9x19_Bizon";
		_sdmag = "64Rnd_9x19_SD_Bizon";
		_weaponnew = "bizon";
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
		
		case "ACE_AKS74P":
		{
		_mag = "30Rnd_545x39_AK";
		_sdmag = "30Rnd_545x39_AKSD";
		_weaponnew = "ACE_AKS74_UN";
		};

		case "ACE_AKS74_UN":
		{
		_mag = "30Rnd_545x39_AK";
		_sdmag = "30Rnd_545x39_AKSD";
		_weaponnew = "ACE_AKS74P";
		};
		
		case "ACE_AKMS":
		{
		_mag = "30Rnd_762x39_AK47";
		_sdmag = "ACE_30Rnd_762x39_S_AK47";
		_weaponnew = "ACE_AKMS_SD";
		};

		case "ACE_AKMS_SD":
		{
		_mag = "30Rnd_762x39_AK47";
		_sdmag = "ACE_30Rnd_762x39_S_AK47";
		_weaponnew = "ACE_AKMS";
		};
		
		case "ACE_Mk12mod1":
		{
		_mag = "30Rnd_556x45_Stanag";
		_sdmag = "30Rnd_556x45_StanagSD";
		_weaponnew = "ACE_Mk12mod1_SD";
		};

		case "ACE_Mk12mod1_SD":
		{
		_mag = "30Rnd_556x45_Stanag";
		_sdmag = "30Rnd_556x45_StanagSD";
		_weaponnew = "ACE_Mk12mod1";
		};
		
		case "ACE_MP5A5":
		{
		_mag = "30Rnd_9x19_MP5";
		_sdmag = "30Rnd_9x19_MP5SD";
		_weaponnew = "ACE_MP5SD";
		};

		case "ACE_MP5SD":
		{
		_mag = "30Rnd_9x19_MP5";
		_sdmag = "30Rnd_9x19_MP5SD";
		_weaponnew = "ACE_MP5A5";
		};
		
		case "AKS_74_U":
		{
		_mag = "30Rnd_545x39_AK";
		_sdmag = "30Rnd_545x39_AKSD";
		_weaponnew = "AKS_74_UN_kobra";
		};

		case "AKS_74_UN_kobra":
		{
		_mag = "30Rnd_545x39_AK";
		_sdmag = "30Rnd_545x39_AKSD";
		_weaponnew = "AKS_74_U";
		};
		
		case "G36C_camo":
		{
		_mag = " 30Rnd_556x45_G36";
		_sdmag = "30Rnd_556x45_G36SD";
		_weaponnew = "G36_C_SD_camo";
		};

		case "G36_C_SD_camo":
		{
		_mag = " 30Rnd_556x45_G36";
		_sdmag = "30Rnd_556x45_G36SD";
		_weaponnew = "G36C_camo";
		};
		
		case "SCAR_H_CQC_CCO":
		{
		_mag = "20Rnd_762x51_B_SCAR";
		_sdmag = "20Rnd_762x51_B_SCAR";
		_weaponnew = "SCAR_H_CQC_CCO_SD";
		};

		case "SCAR_H_CQC_CCO_SD":
		{
		_mag = "20Rnd_762x51_B_SCAR";
		_sdmag = "20Rnd_762x51_B_SCAR";
		_weaponnew = "SCAR_H_CQC_CCO";
		};
		
		case "SCAR_H_LNG_Sniper":
		{
		_mag = "20Rnd_762x51_B_SCAR";
		_sdmag = "20Rnd_762x51_B_SCAR";
		_weaponnew = "SCAR_H_LNG_Sniper_SD";
		};

		case "SCAR_H_LNG_Sniper_SD":
		{
		_mag = "20Rnd_762x51_B_SCAR";
		_sdmag = "20Rnd_762x51_B_SCAR";
		_weaponnew = "SCAR_H_LNG_Sniper";
		};
		
		case "ACE_UMP45_AIM":
		{
		_mag = "ACE_25Rnd_1143x23_B_UMP45";
		_sdmag = "ACE_25Rnd_1143x23_S_UMP45";
		_weaponnew = "ACE_UMP45_AIM_SD";
		};
		
		case "ACE_UMP45_AIM_SD":
		{
		_mag = "ACE_25Rnd_1143x23_B_UMP45";
		_sdmag = "ACE_25Rnd_1143x23_S_UMP45";
		_weaponnew = "ACE_UMP45_AIM";
		};
		//========================= Pistols ======================================
		
		case "ACE_APS":	//ACE Makrov
		{
		_mag = "ACE_20Rnd_9x18_APS";
		_sdmag = "ACE_20Rnd_9x18_APSB";
		_weaponnew = "ACE_APSB";
		_isPistol = true;
		};
		
		case "ACE_APSB":
		{
		_mag = "ACE_20Rnd_9x18_APS";
		_sdmag = "ACE_20Rnd_9x18_APSB";
		_weaponnew = "ACE_APS";
		_isPistol = true;
		};
		
		case "ACE_USP":	//ACE USP Tactical
		{
		_mag = "ACE_12Rnd_45ACP_USP";
		_sdmag = "ACE_12Rnd_45ACP_USPSD";
		_weaponnew = "ACE_USPSD";
		_isPistol = true;
		};
		
		case "ACE_USPSD":	
		{
		_mag = "ACE_12Rnd_45ACP_USP";
		_sdmag = "ACE_12Rnd_45ACP_USPSD";
		_weaponnew = "ACE_USP";
		_isPistol = true;
		};
		
		case "M9":	//M9
		{
		_mag = "15Rnd_9x19_M9";
		_sdmag = "15Rnd_9x19_M9SD";
		_weaponnew = "M9SD";
		_isPistol = true;
		};
		
		case "M9SD":	
		{
		_mag = "15Rnd_9x19_M9";
		_sdmag = "15Rnd_9x19_M9SD";
		_weaponnew = "M9";
		_isPistol = true;
		};
		
		case "Makarov":	//Makrov
		{
		_mag = "8Rnd_9x18_Makarov";
		_sdmag = "8Rnd_9x18_MakarovSD";
		_weaponnew = "MakarovSD";
		_isPistol = true;
		};
		
		case "MakarovSD":
		{
		_mag = "8Rnd_9x18_Makarov";
		_sdmag = "8Rnd_9x18_MakarovSD";
		_weaponnew = "Makarov";
		_isPistol = true;
		};
		
		case "UZI_EP1":		//Uzi
		{
		_mag = "30Rnd_9x19_UZI";
		_sdmag = "30Rnd_9x19_UZI_SD";
		_weaponnew = "UZI_SD_EP1";
		_isPistol = true;
		};
		
		case "UZI_SD_EP1":	
		{
		_mag = "30Rnd_9x19_UZI";
		_sdmag = "30Rnd_9x19_UZI_SD";
		_weaponnew = "UZI_EP1";
		_isPistol = true;
		};
		
		default					// If no supressed version found for this weapon
		{
		hint "No silencer found for this Weapon";
		_success = false;
		};
	
	};
	if (_success) then
		{
		_stance = _caller call CBA_fnc_getUnitAnim select 0;
		switch (_stance) do {
						case "stand":
						{
						if (_isPistol) then {_caller playMove "PistolMagazineReloadStand"} else	{_caller playMove "WeaponMagazineReloadStand"};
						};
						case "kneel":
						{
						if (_isPistol) then {_caller playMove "PistolMagazineReloadKneel"} else	{_caller playMove "WeaponMagazineReloadKneel"};
						};
						case "prone":
						{
						if (_isPistol) then {_caller playMove "PistolMagazineReloadProne"} else	{_caller playMove "WeaponMagazineReloadProne"};
						};
						default
						{
						_caller playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
						};
						};
		sleep 1.5;
		_caller removeweapon _weapon;
		_caller addweapon _weaponnew;
		_weapons = (weapons _caller) - (items _caller);	// save weapons
		_items = items _caller;		// save items
		_magazines = magazines _caller;	// save mags
		removeAllWeapons _caller;				//remove all weapons
		{_caller addWeapon _x} forEach _weapons; //add weapons
		{_caller addWeapon _x} forEach _items; 	//add items
		{switch (_x) do {
					case _mag:
					{
					_caller addMagazine _sdmag; //replace regular mags with SD
					};
					case _sdmag:
					{
					_caller addMagazine _mag;  //replace SD mags with regulars
					};
					default
					{
					_caller addMagazine _x;   // add saved mags
					};
					};} forEach _magazines;
		reload _caller;
		_caller selectWeapon _weaponnew; // Select the primaryWeapon	
		_muzzles = getArray(configFile>>"cfgWeapons" >> _weaponnew >> "muzzles"); // Fix for weapons with grenade launcher
		_caller selectWeapon (_muzzles select 0);
		reload _caller;
		sleep 3; 
		reload _caller;
		};
		

