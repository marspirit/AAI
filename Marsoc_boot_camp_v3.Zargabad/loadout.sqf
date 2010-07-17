player playmove "AmovPercMstpSrasWrflDnon_gear";
switch (_this select 3) do {
	case "Grenadier": {
		dooplayerweap = ["ACE_Map_Tools", "ACE_GlassesLHD_glasses", "ACE_Earplugs", "M16A4_ACG_GL", "Binocular", "NVGoggles", "ACE_M136_CSRS", "ACE_HuntIR_monitor"];
		dooplayerammo = ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "SmokeShellGreen", "SmokeShellGreen"];
		dooplayerruckweap = [];
		dooplayerruckammo = [["ACE_Bandage", 3], ["ACE_Morphine", 2], ["ACE_Knicklicht_G", 1], ["1Rnd_HE_M203", 15], ["1Rnd_SmokeGreen_M203", 5], ["ACE_HuntIR_M203", 3], ["ACE_VS17Panel_M", 4]];
		dooplayerweapback = "ACE_Rucksack_MOLLE_ACU";
	};
	case "SAW": {
		dooplayerweap = ["ACE_Map_Tools", "ACE_GlassesLHD_glasses", "ACE_Earplugs", "ACE_M249Para_M145", "Binocular", "NVGoggles", "ACE_M136_CSRS"];
		dooplayerammo = ["ACE_200Rnd_556x45_T_M249", "ACE_200Rnd_556x45_T_M249", "ACE_200Rnd_556x45_T_M249", "ACE_200Rnd_556x45_T_M249", "SmokeShellGreen", "SmokeShellGreen"];
		dooplayerruckweap = [];
		dooplayerruckammo = [["ACE_Bandage", 3], ["ACE_Morphine", 2], ["ACE_Knicklicht_G", 1]];
		dooplayerweapback = "ACE_Rucksack_MOLLE_ACU";
	};
	case "AT": {
		dooplayerweap = ["ACE_Map_Tools", "ACE_GlassesLHD_glasses", "ACE_Earplugs", "ACE_M4A1_ACOG", "Binocular", "NVGoggles", "SMAW"];
		dooplayerammo = ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "SMAW_HEAA", "SMAW_HEAA", "ACE_SMAW_Spotting", "ACE_SMAW_Spotting", "SmokeShellGreen", "SmokeShellGreen"];
		dooplayerruckweap = [];
		dooplayerruckammo = [["ACE_Bandage", 3], ["ACE_Morphine", 2], ["ACE_Knicklicht_G", 1]];
		dooplayerweapback = "ACE_Rucksack_MOLLE_ACU";
	};
	case "Medic": {
		dooplayerweap = ["ACE_Map_Tools", "ACE_GlassesLHD_glasses", "ACE_Earplugs", "m16a4_acg", "Binocular", "NVGoggles", "ACE_Rucksack_MOLLE_ACU_Medic"];
		dooplayerammo = ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "ACE_Bandage", "ACE_Bandage", "ACE_Bandage", "ACE_Bandage", "ACE_Morphine", "ACE_Morphine", "ACE_Morphine", "ACE_Morphine", "SmokeShellGreen", "SmokeShellGreen", "SmokeShellGreen", "SmokeShellGreen", "SmokeShellGreen"];
		dooplayerruckweap = [];
		dooplayerruckammo = [["ACE_Bandage", 20], ["ACE_Morphine", 40], ["ACE_Epinephrine", 20], ["ACE_Knicklicht_G", 3], ["30Rnd_556x45_Stanag", 6], ["ACE_200Rnd_556x45_T_M249", 2]];
		dooplayerweapback = "";
	};
	case "DMR": {
		dooplayerweap = ["ACE_Map_Tools", "ACE_GlassesLHD_glasses", "ACE_Earplugs", "DMR", "ACE_USP", "Laserdesignator", "NVGoggles", "ACE_M136_CSRS"];
		dooplayerammo = ["20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "ACE_12Rnd_45ACP_USP", "ACE_12Rnd_45ACP_USP", "ACE_12Rnd_45ACP_USP", "ACE_12Rnd_45ACP_USP", "SmokeShellGreen", "SmokeShellGreen", "Laserbatteries"];
		dooplayerruckweap = [];
		dooplayerruckammo = [["ACE_Bandage", 3], ["ACE_Morphine", 2], ["ACE_Knicklicht_G", 1], ["ACE_VS17Panel_M", 4]];
		dooplayerweapback = "ACE_Rucksack_MOLLE_ACU";
	};
};
removeallweapons player;
{player addmagazine _x} foreach dooplayerammo;
{if not (player hasweapon _x) then {player addweapon _x}} foreach dooplayerweap;
if dooace then {
	player setvariable ["ACE_RuckWepContents", dooplayerruckweap];
	player setvariable ["ACE_RuckMagContents", dooplayerruckammo];
	player setvariable ["ACE_weapononback", dooplayerweapback];
};
if not (player hasweapon "ItemGPS") then {player addweapon "ItemGPS"};
_muz = getarray (configfile >> "CfgWeapons" >> primaryweapon player >> "muzzles");
if (count _muz > 0) then {
	if (_muz select 0 == "this") then {
		player selectweapon primaryweapon player;
	} else {
		player selectweapon (_muz select 0);
	};
} else {
	player selectweapon primaryweapon player;
};
