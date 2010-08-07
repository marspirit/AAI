private ["_size", "_faction", "_loc", "_dummy", "_dir"];

_size = _this select 0; 	//big or small heli
_faction = _this select 1; 	//faction of the caller
_loc = getmarkerpos "pos4"; 

deletegroup evac_group;		//delete any previous Evac groups, choper or pilots
deletevehicle evac;
deletevehicle evac_p;


_faction =  tolower _faction;
if (_size==0) then {		//let's deside which heli we'll going to spawn
	switch (_faction) do
	{
   		case "usmc":
		{evac_h_type = "UH1Y";evac_p_type="USMC_Soldier_Pilot";evac_group = creategroup west;};
		case "ru":
		{ evac_h_type = "Mi24_P";evac_p_type="RU_Soldier_Pilot";evac_group = creategroup east;};
		case "gue":
		{ evac_h_type = "UH1H_TK_GUE_EP1";evac_p_type="GUE_Soldier_Pilot";evac_group = creategroup resistance;};
		case "bis_us":
		{ evac_h_type = "UH1Y";evac_p_type="US_Soldier_Pilot_EP1";evac_group = creategroup west;};  
		case "bis_tk":
		{ evac_h_type = "UH1H_TK_EP1";evac_p_type="TK_Soldier_Pilot_EP1";evac_group = creategroup east;};
		case "bis_tk_gue":
		{ evac_h_type = "UH1H_TK_GUE_EP1";evac_p_type="TK_GUE_Soldier_AR_EP1";evac_group = creategroup resistance;}; 
	};};

if (_size==1) then {
	switch (_faction) do
	{
   		case "usmc":
		{ evac_h_type = "MH60S";evac_p_type="USMC_Soldier_Pilot";evac_group = creategroup west;};
		case "ru":
		{ evac_h_type = "Mi17_medevac_RU";evac_p_type="RU_Soldier_Pilot";evac_group = creategroup east;};
		case "gue":
		{ evac_h_type = "Mi17_Civilian";evac_p_type="GUE_Soldier_Pilot";evac_group = creategroup resistance;};
		case "bis_us":
		{ evac_h_type = "UH60M_EP1";evac_p_type="US_Soldier_Pilot_EP1";evac_group = creategroup west;};  
		case "bis_tk":
		{ evac_h_type = "Mi17_TK_EP1";evac_p_type="TK_Soldier_Pilot_EP1";evac_group = creategroup east;};
		case "bis_tk_gue":
		{ evac_h_type = "Mi17_Civilian";evac_p_type="TK_GUE_Soldier_AR_EP1";evac_group = creategroup resistance;}; 
	};};

	evac = evac_h_type createVehicle [_loc select 0, _loc select 1, (_loc select 2) + 116]; //spawn heli
	evac setposasl [_loc select 0, _loc select 1, 17];
	if (((getdir deck) + 180) > 360) then {_dir = (getdir deck + 180)- 360;} else {_dir = getdir deck + 180};
	evac setdir _dir;
	
	evac_p = evac_group createUnit [evac_p_type, _loc, [], 0, "NONE"];		//spawn pilot
	evac_p assignAsDriver evac;
	evac_p moveindriver evac;
	