private ["_heliType", "_faction", "_loc", "_dummy", "_dir"];

_heliType = _this select 0; 	//Type of heli
_faction = _this select 1; 	//faction of the caller
_loc = getmarkerpos "pos4"; 

deletegroup evac_group;		//delete any previous Evac groups, choper or pilots
deletevehicle evac;
deletevehicle evac_p;


_faction =  tolower _faction;
switch (_faction) do
{
	case "usmc":
	{evac_p_type="USMC_Soldier_Pilot";evac_group = creategroup west;};
	case "ru":
	{evac_p_type="RU_Soldier_Pilot";evac_group = creategroup east;};
	case "gue":
	{evac_p_type="GUE_Soldier_Pilot";evac_group = creategroup resistance;};
	case "bis_us":
	{evac_p_type="US_Soldier_Pilot_EP1";evac_group = creategroup west;};  
	case "bis_tk":
	{evac_p_type="TK_Soldier_Pilot_EP1";evac_group = creategroup east;};
	case "bis_tk_gue":
	{evac_p_type="TK_GUE_Soldier_AR_EP1";evac_group = creategroup resistance;}; 
	default {evac_p_type="Pilot";evac_group = creategroup civilian;};
};

	evac = _heliType createVehicle [_loc select 0, _loc select 1, (_loc select 2) + 116]; //spawn heli
	evac setposasl [_loc select 0, _loc select 1, 17];
	if (((getdir deck) + 180) > 360) then {_dir = (getdir deck + 180)- 360;} else {_dir = getdir deck + 180};
	evac setdir _dir;
	
	evac_p = evac_group createUnit [evac_p_type, _loc, [], 0, "NONE"];		//spawn pilot
	evac_p assignAsDriver evac;
	evac_p moveindriver evac;
	