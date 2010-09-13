
_mcc_config =configFile >> "CfgFactionClasses";
_mcc_faction_idx = 0;
_mcc_sides       = ["EAST","WEST","GUE","CIV"];
u_factions=[];

for "_i" from 1 to ((count _mcc_config) - 1) do 
   { 
     
	 _unitCfg = (_mcc_CONFIG select _i);
	  
		
		if ((getnumber((_unitCfg >> "side")))!= -1) then {
		_cfgname        = (configName(_unitcfg));
		_cfgdisplayname = (gettext(_unitCfg >> "displayname"));
		_side           = (getnumber((_unitCfg >> "side")));
		_sidename       = (_mcc_sides select _side);
		
		
		if (_cfgname == "FFAA") then
		{
			_sidename = "EAST";
		};

		
		U_FACTIONS set	[_mcc_faction_idx,[_cfgdisplayname, _sidename, _cfgname ]];
		_mcc_faction_idx = _mcc_faction_idx + 1;
		};
		
		
     
   };
   
   
   