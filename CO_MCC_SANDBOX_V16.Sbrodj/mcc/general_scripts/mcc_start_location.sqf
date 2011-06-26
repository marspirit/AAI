#define START_WEST 3200
#define START_EAST 3201
#define START_GUE 3202

private ["_side"];

_side = _this select 0;

if !mcc_isloading then 
	{
		hint "click on map where you want your start location"; 
		
		switch (_side) do
			{
				case 0:	//West
			    { 
					onMapSingleClick "	
		                    MCC_START_WEST  = _pos;
							publicVariable ""MCC_START_WEST"";
							mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_WEST  = %1;
														publicVariable 'MCC_START_WEST';
														mcc_flagteleport setpos ([(%1),1,10,1,0,900,0] call BIS_fnc_findSafePos);
														""							  
														,MCC_START_WEST
														];
							hint ""Start WEST location updated.""
						";
					 ctrlEnable [START_WEST,false];
					 enable_west=false; 
				};
				
				case 1:	//East
			    { 
					onMapSingleClick "	
		                    MCC_START_EAST  = _pos;
							publicVariable ""MCC_START_EAST"";
							mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_EAST  = %1;
														publicVariable 'MCC_START_EAST';
														mcc_flagteleport setpos ([(%1),1,10,1,0,900,0] call BIS_fnc_findSafePos);
														""							  
														,MCC_START_EAST
														];
							hint ""Start East location updated.""
						";
					 ctrlEnable [START_EAST,false];
					 enable_east=false; 
				};
				
				case 2:	//Guer
			    { 
					onMapSingleClick "	
		                    MCC_START_GUER  = _pos;
							publicVariable ""MCC_START_GUER"";
							mcc_flagteleport setpos ([(_pos),1,10,1,0,900,0] call BIS_fnc_findSafePos);
							onMapSingleClick """";
							mcc_safe=mcc_safe + FORMAT [""
														MCC_START_GUER  = %1;
														publicVariable 'MCC_START_GUER';
														mcc_flagteleport setpos ([(%1),1,10,1,0,900,0] call BIS_fnc_findSafePos);
														""							  
														,MCC_START_GUER
														];
							hint ""Start Guer location updated.""
						";
					 ctrlEnable [START_GUE,false];
					 enable_gue=false; 
				};
			};
	};

	


