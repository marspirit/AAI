
private ["_faction", "_cfgname", "_cfgclass", "_comp", "_startpoint", "_type","_side","_spawnside"];
_faction   = _this select 0;
_startpoint= _this select 1;

//#define CONFIG (configFile >> "CfgGroups" >>  _side >> _faction >> _type)



//#define CONFIG (configFile >> "CfgGroups" >> "East" >> "RU" >> "Mechanized")

_type = "";
_side = "";
_spawnside = "";
_DOC_ARRAY = [];


_cfgComp = configFile >> "CfgObjectCompositions";
_k = 0;
for "_i" from 0 to ((count _cfgComp) - 1) do 
	{

		_comp = _cfgComp select _i;

		//Make sure we selected a class.
		if (isClass _comp) then 
		{
			//If the faction is right, add this composition.
			if (getText(_comp >> "faction") == _faction) then 
			{
				_cfgname  = (getText(_comp >> "displayName"));
			        _cfgclass = configName(_comp);

                          if (_i>_startpoint) then {
         _DOC_ARRAY set[(_k),[["Item", _cfgclass],["Action", format ["mcc_spawntype=""DOC"";mcc_classtype=""LAND"";mcc_spawnname=""%1"";mcc_spawnfaction=""%2"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%3"";",_cfgclass,_faction,_cfgname]]  ]];									
			                            _k = _k + 1;
                          };
			};	
		};
	};


_DOC_ARRAY