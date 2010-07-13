private 
["_CfgVehicles",
  "_i",
  "_CfgVehicle",    
  "_vehicleClass", 		//VK
  "_simulation",
  "_simTypesUnits",
  "_simTypesObjects",
  "_simTypesAll",
  "_u_GEN_car_idx",
  "_faction"
];


_u_GEN_car_idx		 	= 0;
convoy_array1 = [];
convoy_array2 = [];
convoy_array3 = [];
convoy_array4 = [];
convoy_array5 = [];
convoy_array1a = [];
convoy_array2a = [];
convoy_array3a = [];
convoy_array4a = [];
convoy_array5a = [];

_faction = mcc_faction;



_simTypesUnits 	= ["soldier", "car", "motorcycle", "tank", "helicopter", "airplane", "ship", "parachute"];   
 
_simTypesObjects 	= ["house", "thing", "thingeffect", "flagcarrier", "fire", "fountain", "forest", "church"];
_simTypesAll 		= (_simTypesUnits + _simTypesObjects) - ["soldier"];  
_CfgVehicles 		= configFile >> "CfgVehicles" ;



for "_i" from 1 to (count _CfgVehicles - 1) do {
 _CfgVehicle = _CfgVehicles select _i;
 
 //Keep going when it is a public entry
 if (getNumber(_CfgVehicle >> "scope") == 2) then {
  
  _vehicleDisplayName 	= getText(_CfgVehicle >> "displayname");
  _cfgclass 			= (configName (_CfgVehicle));  
  _cfgFaction 			= getText(_CfgVehicle >> "faction");
  _simulation 			= getText(_CfgVehicle >> "simulation");
  
  //VK - Added to recognize ammo crates
  _vehicleclass			= getText(_CfgVehicle >> "vehicleclass");
  
  //VK - Let ammoboxes through
  if ((_simulation in _simTypesUnits) or (toLower(_vehicleclass) == "ammo") or (toLower(_vehicleclass) == "ace_ammunition")) then 
  {
  
  //Verwerking
	//Start russian shit
	
	
	
	if (toUpper(_cfgFaction) == _faction) then 
	{
        
		switch (toLower(_simulation)) do 
		{
				  
			case "car"			: {
									if (_u_gen_car_idx < 20) then
									{
										convoy_array1 set[_u_GEN_car_idx,[["Item", _vehicleDisplayName],["Action", format ["convoy_car1=""%1"";",_cfgclass]] ]];
										convoy_array2 set[_u_GEN_car_idx,[["Item", _vehicleDisplayName],["Action", format ["convoy_car2=""%1"";",_cfgclass]] ]];
										convoy_array3 set[_u_GEN_car_idx,[["Item", _vehicleDisplayName],["Action", format ["convoy_car3=""%1"";",_cfgclass]] ]];
										convoy_array4 set[_u_GEN_car_idx,[["Item", _vehicleDisplayName],["Action", format ["convoy_car4=""%1"";",_cfgclass]] ]];
										convoy_array5 set[_u_GEN_car_idx,[["Item", _vehicleDisplayName],["Action", format ["convoy_car5=""%1"";",_cfgclass]] ]];
										_u_GEN_car_idx = _u_GEN_car_idx +1;
									};
									if (_u_gen_car_idx > 19 && _u_gen_car_idx < 40 ) then
									{
										convoy_array1a set[_u_GEN_car_idx-20,[["Item", _vehicleDisplayName],["Action", format ["convoy_car1=""%1"";",_cfgclass]] ]];
										convoy_array2a set[_u_GEN_car_idx-20,[["Item", _vehicleDisplayName],["Action", format ["convoy_car2=""%1"";",_cfgclass]] ]];
										convoy_array3a set[_u_GEN_car_idx-20,[["Item", _vehicleDisplayName],["Action", format ["convoy_car3=""%1"";",_cfgclass]] ]];
										convoy_array4a set[_u_GEN_car_idx-20,[["Item", _vehicleDisplayName],["Action", format ["convoy_car4=""%1"";",_cfgclass]] ]];
										convoy_array5a set[_u_GEN_car_idx-20,[["Item", _vehicleDisplayName],["Action", format ["convoy_car5=""%1"";",_cfgclass]] ]];
										_u_GEN_car_idx = _u_GEN_car_idx +1;
									};
								  };
			default		 { };
				
			
		}; 
       
	};
  };
  

 };
};

