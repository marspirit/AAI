
private ["_p_classtype","_p_mcc_spawnwithcrew","p_mcc_zone_markposition","_p_maxrange"];
_p_classtype      		= _this select 0;
_p_mcc_spawnwithcrew  	= _this select 1;
_p_markerPosition 		= _this select 2;
_p_maxrange		  		= _this select 3;
_safepos = [];

switch (_p_classtype) do
				{
					case "AIR":
					{
						if !_p_mcc_spawnwithcrew then 
						{_safepos     =[_p_markerPosition,10,_p_maxrange,10,0,100,0] call BIS_fnc_findSafePos; }
						else
						{_safepos     =[_p_markerPosition ,10,_p_maxrange,10,1,10,0] call BIS_fnc_findSafePos;};
						
					};

					case "LAND":
					{
						_safepos     =[_p_markerPosition,10,_p_maxrange,10,0,100,0] call BIS_fnc_findSafePos; 
						
						
						
					};

					case "WATER":
					{
					
						_safepos     =[_p_markerPosition,10,_p_maxrange,10,2,100,0] call BIS_fnc_findSafePos; 
						
						

					};
				};


_safepos