if (isNull(Player)) exitWith {};
if (player iskindof "FR_Assault_GL" || player iskindof "FR_Commander" || player iskindof "FR_Cooper" || player iskindof "FR_Corpsman" || player iskindof "FR_Sapper" || player iskindof "FR_AC" || player iskindof "FR_Light" || player iskindof "FR_GL" || player iskindof "FR_AR" || player iskindof "FR_Marksman" || player iskindof "FR_Miles" || player iskindof "FR_OHara" || player iskindof "FR_Sykes" || player iskindof "FR_TL" || player iskindof "RUS_Commander" || player iskindof "RUS_Soldier1" || player iskindof "RUS_Soldier2" || player iskindof "RUS_Soldier3" || player iskindof "RUS_Soldier_GL" || player iskindof "RUS_Soldier_Marksman" || player iskindof "RUS_Soldier_Sab" || player iskindof "RUS_Soldier_TL") then
	{
	player setPos mPos;
	player setPos [(position player select 0), (position player select 1), 2500];
	player addweapon "ACE_ParachutePack";
	player execVM "x\ace\addons\sys_eject\jumpout_cord.sqf";
	};
