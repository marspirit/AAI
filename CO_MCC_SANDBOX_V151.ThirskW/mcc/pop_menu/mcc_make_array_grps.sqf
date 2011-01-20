
private ["_unitCfg", "_side", "_faction", "_type","_classtype","_cfgname", "_cfgclass", "_spawnside"];
_side      = _this select 0;
_faction   = _this select 1;
_type      = _this select 2;
_classtype = _this select 3;
_sides     = [east, west, resistance, civilian];
_grp_array = [];
_indexar   = 0;


dumtel    = 0;
dumar     = [];

#define CONFIG (configFile >> "CfgGroups" )

if (_faction == "ACEXPLA") then { _faction = "OHPLA";};
if (_faction == "MOL_army") then { _faction = "Molatian army";};
if (_faction == "AFR_army") then { _faction = "Afrenian army";};



for "_i" from 0 to ((count CONFIG) - 1)  do
{
    _Cfgside = (CONFIG select _i);  
    if (isClass(_cfgside)) then
	{
        
		 for "_j" from 0 to ((count _Cfgside) - 1) do
		 
		 {
		    _Cfgfaction = (_cfgside select _j);  
			
            if (isClass(_cfgfaction)) then
			{
		
				
				for "_k" from 0 to ((count _Cfgfaction) - 1) do
		         
				{
				_Cfgtype = (_cfgfaction select _k); 
				if (isClass(_cfgtype)) then
					{
					    _cfgname = configname(_cfgtype );
						
						
						if (_cfgname == _type) then
							{
								for "_m" from 0 to ((count _cfgtype) -1) do
								{
								   _cfgclasstype =( _cfgtype select _m);
								   if (isClass(_cfgclasstype)) then
									{
									    
										if ((getText(_cfgclasstype >> "faction"))== _faction) then 
										{
										    
											
											_cfgname  =  getText(_cfgclasstype >> "name");
											
											_cfgclass = configname(_cfgclasstype );
											_cfgentry = format ["configFile >> ""CfgGroups"" >>""%1"">>""%2"">>""%3"">>""%4"" ",(configname (_Cfgside)),(configname (_Cfgfaction)),(configname (_Cfgtype)),(configname (_cfgclasstype))];
											_grp_array set[_indexar,[_classtype,_cfgclass,_cfgentry,_cfgname]];										
											_indexar = _indexar + 1;
											
										};
										
										
										
									};
								};
							
							};
					};
				};
		
			  
			
			  
			};
		 };
//         _cfgname = getText(_unitCfg >> "name");

         
//         _cfgclass = (configName ((configFile >> "CfgGroups" >>  _side >> _faction >> _type) select _i));

//         _grp_array set[(_i-1),[["Item", _cfgname],["Action", format ["mcc_spawntype=""GROUP"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";mcc_grouptype=""%4"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%5"";",_classtype,_cfgclass,_faction,_type,_cfgname]]  ]];									
    };


};



_grp_array