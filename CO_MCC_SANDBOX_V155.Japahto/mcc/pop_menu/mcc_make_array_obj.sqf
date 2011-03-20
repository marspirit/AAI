private 
["_CfgVehicles",  "_type",  "_i",  "_CfgVehicle",   "_vehicleClass","_vehicleDisplayName","_cfgclass","_faction","_u_Fortifications_idx","_u_Dead_bodies_idx","_u_furniture_idx"
	,"_u_military_idx","_u_misc_idx","_u_sighns_idx","_u_warfare_idx","_u_wrecks_idx", "_u_houses_idx", "_u_ruins_idx"];

_u_Fortifications_idx		= 0;	
_u_Dead_bodies_idx			= 0;	
_u_furniture_idx			= 0;	
_u_military_idx				= 0;
_u_misc_idx					= 0;
_u_sighns_idx				= 0;
_u_warfare_idx				= 0;
_u_wrecks_idx				= 0;
_u_houses_idx				= 0;
_u_ruins_idx				= 0;
_u_ace_ammo_idx				= 0;
_faction = "CIV"; 

_CfgVehicles 		= configFile >> "CfgVehicles" ;
for "_i" from 1 to (count _CfgVehicles - 1) do
	{
	_CfgVehicle = _CfgVehicles select _i;
	_vehicleDisplayName 	= getText(_CfgVehicle >> "displayname");
	_cfgclass 			= (configName (_CfgVehicle));  
	_vehicleclass			= getText(_CfgVehicle >> "vehicleclass");
	_vehicleDisplayName	= [_vehicleDisplayName, gettext(_CfgVehicle >> "picture")];
		
	if ((toLower(_vehicleclass) == "fortifications")) then
		{
			_type="LAND";
			U_FORT set[_u_Fortifications_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_Fortifications_idx = _u_Fortifications_idx+1;
		};

	if (toLower(_vehicleclass) == "dead_bodies")then
		{
			_type="LAND";
			U_DEAD_BODIES set[_u_Dead_bodies_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_Dead_bodies_idx = _u_Dead_bodies_idx+1;
		};
	
	if (toLower(_vehicleclass) == "furniture")then
		{
			_type="LAND";
			U_FURNITURE set[_u_furniture_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_furniture_idx = _u_furniture_idx+1;
		};
	
	if (toLower(_vehicleclass) == "military")then
		{
			_type="LAND";
			U_MILITARY set[_u_military_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_military_idx = _u_military_idx+1;
		};
	
	if (toLower(_vehicleclass) == "misc")then
		{
			_type="LAND";
			U_MISC set[_u_misc_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_misc_idx = _u_misc_idx+1;
		};
		
	if (toLower(_vehicleclass) == "signs")then
		{
			_type="LAND";
			U_SIGHNS set[_u_sighns_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_sighns_idx = _u_sighns_idx+1;
		};
		
	if (toLower(_vehicleclass) == "warfarebuildingsclassname")then
		{
			_type="LAND";
			U_WARFARE set[_u_warfare_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_warfare_idx = _u_warfare_idx+1;
		};
		
	if (toLower(_vehicleclass) == "wrecks")then
		{
			_type="LAND";
			U_WRECKS set[_u_wrecks_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_wrecks_idx = _u_wrecks_idx+1;
		};
	
	if (toLower(_vehicleclass) == "fallujah_hou" || toLower(_vehicleclass) == "housebase" || toLower(_vehicleclass) == "test")then
		{
			_type="LAND";
			U_HOUSES set[_u_houses_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_houses_idx = _u_houses_idx+1;
		};
		
	if (toLower(_vehicleclass) == "ruins")then
		{
			_type="LAND";
			U_RUINS set[_u_ruins_idx,[_type,_cfgclass,_faction,_vehicleDisplayName]];
			_u_ruins_idx = _u_ruins_idx+1;
		};
		
		//For separate menu for ACE stuff, problems with the length when combined into single menu, I think.
	if (toLower(_vehicleclass) == "ace_ammunition" || toLower(_vehicleclass) == "ace_ammunitiontransportus" || toLower(_vehicleclass) == "ace_ammunitiontransportru"
		|| toLower(_vehicleclass) == "ace_ammunition_rope" || toLower(_vehicleclass) == "ace_objects" ||  toLower(_vehicleclass) == "ace_ammunition_csw" 
		||  toLower(_vehicleclass) == "ace_ammunitiontransportcsw" ||  toLower(_vehicleclass) == "ace_ammunition_rope" ||  toLower(_vehicleclass) == "ace_arty_ammunition"
		||  toLower(_vehicleclass) == "ace_arty_equipment")then
		{
			_type="LAND";
			U_ACE_AMMO set[_u_ace_ammo_idx,[_type,_cfgclass,mcc_sidename,_vehicleDisplayName]];
			_u_ace_ammo_idx = _u_ace_ammo_idx+1;
		};
   	};
	

