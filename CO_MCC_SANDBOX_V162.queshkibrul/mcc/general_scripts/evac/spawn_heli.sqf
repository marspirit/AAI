private ["_heliType", "_faction", "_loc", "_dummy", "_dir","_gunNum","_type","_entry","_side","_gunnersGroup"];

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
	{evac_p_type="USMC_Soldier_Pilot";_side =  west;};
	case "ru":
	{evac_p_type="RU_Soldier_Pilot";_side =  east;};
	case "gue":
	{evac_p_type="GUE_Soldier_Pilot";_side =  resistance;};
	case "bis_us":
	{evac_p_type="US_Soldier_Pilot_EP1";_side =  west;};  
	case "bis_tk":
	{evac_p_type="TK_Soldier_Pilot_EP1";_side =  east;};
	case "bis_tk_gue":
	{evac_p_type="TK_GUE_Soldier_AR_EP1";_side =  resistance;}; 
	case "israel":
	{evac_p_type="US_Soldier_Pilot_EP1";_side =  west;}; 
	default {evac_p_type="Pilot";_side =  civilian;};
};

	evac = _heliType createVehicle [_loc select 0, _loc select 1, (_loc select 2) + 116]; //spawn heli
	evac setposasl [_loc select 0, _loc select 1, 17];
	if (((getdir deck) + 180) > 360) then {_dir = (getdir deck + 180)- 360;} else {_dir = getdir deck + 180};
	evac setdir _dir;
	clearMagazineCargoGlobal evac;
	evac addMagazineCargoGlobal ["ACE_Rope_M_120",2];
	evac_group = creategroup _side; //Create side for the pilot's group
	evac_p = evac_group createUnit [evac_p_type, _loc, [], 0, "NONE"];		//spawn pilot
	evac_group setbehaviour "stealth";
	evac_group setcombatmode "yellow";
	evac_p assignAsDriver evac; //Move the pilot in
	evac_p moveindriver evac;
	group evac setBehaviour "CARELESS";
	_gunnersGroup = creategroup _side; //Create gunners group
	_gunnersGroup setbehaviour "combat";	//Make the gunners aggresive
	_gunnersGroup setcombatmode "yellow";
	_type = typeOf evac;	//Find turrets
	_entry = configFile >> "CfgVehicles" >> _type;
	_turrets = [_entry >> "turrets"] call BIS_fnc_returnVehicleTurrets;
	//All turrets were found, now spawn crew for them
	_path = [];
	private ["_i"];
	_i = 0;
	while {_i < (count _turrets)} do
	{
		private ["_turretIndex", "_thisTurret"];
		_turretIndex = _turrets select _i;
		_thisTurret = _path + [_turretIndex];
		if (isNull (evac turretUnit _thisTurret)) then 
		{
			//Spawn unit into this turret, if empty.
			_unit = _gunnersGroup createUnit [evac_p_type, _loc, [], 0, "NONE"];
			_unit moveInTurret [evac, _thisTurret];
		};
		_i = _i + 2;
	};
	