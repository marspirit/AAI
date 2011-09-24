#include "\x\cba\addons\main\script_macros_common.hpp"
//=============================================================================Functions=========================================================================
BIS_AdvHints_createCountdownLine =		
{
	private ["_elapsed","_max","_line","_char","_i","_segments","_segmentsElapsed","_segmentsRemaining"];
	
	_elapsed = _this select 0;

	if (count(_this) > 1) then {
		_max = _this select 1;
	};	
	if isNil("_max") then {
		_max = 10;
	};

	//number of countdown segments
	_segments = 20;

	_segmentsElapsed = round(_elapsed/_max * _segments);
	_segmentsRemaining = _segments - _segmentsElapsed;

	if (_segmentsElapsed > _segments) then {
		_segmentsElapsed = _segments;
		_segmentsRemaining = 0;
	};
	
	_char = "|";
	
	_line = "<t color='#818960'>";

	for "_i" from 1 to _segmentsElapsed do 
	{
		_line = _line + _char;
	};
	_line = _line + "</t>";
	
	if (_segmentsRemaining > 0) then {
		_line = _line + "<t color='#000000'>";
		for "_i" from 1 to _segmentsRemaining do 
		{
			_line = _line + _char;
		};
		_line = _line + "</t>";
	};
	_line
};
//=========================================================================================================================================================================================
IedFakeExplosion = 	
	{
		private ["_pos", "_volume"];
		_pos = _this select 0;
		_volume = _this select 1; 
		switch (_volume) do
		{
		   case "small":	
			{ 
			   "SmallSecondary" createVehicle _pos;
			};
			
			case "medium":	
			{ 
			   "ARTY_SADARM_BURST" createVehicle _pos;
			};
			
			case "large":	
			{ 
			   "ShellBase" createVehicle _pos;
			};
		};
	};
//=========================================================================================================================================================================================		
IedDeadlyExplosion = 
	{
		private ["_pos", "_volume"];
		_pos = _this select 0;
		_volume = _this select 1; 
		switch (_volume) do
		{
		   case "small":	
			{ 
			   "GrenadeHand" createVehicle _pos;
			};
			
			case "medium":	
			{ 
			   "R_57mm_HE" createVehicle _pos;
			};
			
			case "large":	
			{ 
			   "Sh_105_HE" createVehicle _pos;
			};
		};
	};
//=========================================================================================================================================================================================	
IedDisablingExplosion = 
	{
		private ["_pos", "_volume","_radius","_targetUnits"];
		_pos = _this select 0;
		_volume = _this select 1; 
		switch (_volume) do
		{
		   case "small":	
			{ 
			   "SmallSecondary" createVehicle _pos;
			   _radius = 10;
			};
			
			case "medium":	
			{ 
			   "ARTY_SADARM_BURST" createVehicle _pos;
			    _radius = 20;
			};
			
			case "large":	
			{ 
			   "ShellBase" createVehicle _pos;
			   _radius = 40;
			};
		};
		
		_targetUnits = _pos nearObjects _radius;
		{if(_x isKindOf "Man") then 
			{
				if ((_x distance _pos) < (_radius/2)+5)then 
					{
						[_x,0.6] call ace_sys_wounds_fnc_addDamage;
					} else
						{
							[_x,0.4] call ace_sys_wounds_fnc_addDamage;
						}
			};
		} forEach _targetUnits;
		
		{if(_x isKindOf "Car") then
			{
				if ((_x distance _pos) < (_radius/2)+5)then 
					{
						_x setVariable ["ace_sys_vehicledamage_enable", false];					
						_x setdamage 0.7;
						[-2, {vehicle _this setHit ["wheel_1_1_steering", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {vehicle _this setHit ["wheel_2_1_steering", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {vehicle _this setHit ["Glass1", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {vehicle _this setHit ["Glass2", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {vehicle _this setHit ["Glass3", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {vehicle _this setHit ["Glass4", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {vehicle _this setHit ["Glass5", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {vehicle _this setHit ["Glass6", 1];}, _x] call CBA_fnc_globalExecute;
						[-2, {[_this,5,time,false,true] spawn BIS_Effects_Burn}, _x] call CBA_fnc_globalExecute;
					} else
						{
							_x setVariable ["ace_sys_vehicledamage_enable", false];
							_x setdamage 0.4;
							[-2, {vehicle _this setHit ["wheel_1_1_steering", 0.5];}, _x] call CBA_fnc_globalExecute;
							[-2, {vehicle _this setHit ["wheel_2_1_steering", 0.5];}, _x] call CBA_fnc_globalExecute;
							[-2, {vehicle _this setHit ["Glass1", 1];}, _x] call CBA_fnc_globalExecute;
							[-2, {vehicle _this setHit ["Glass2", 1];}, _x] call CBA_fnc_globalExecute;
							[-2, {vehicle _this setHit ["Glass3", 1];}, _x] call CBA_fnc_globalExecute;
							[-2, {vehicle _this setHit ["Glass4", 1];}, _x] call CBA_fnc_globalExecute;
							[-2, {vehicle _this setHit ["Glass5", 1];}, _x] call CBA_fnc_globalExecute;
							[-2, {vehicle _this setHit ["Glass6", 1];}, _x] call CBA_fnc_globalExecute;
							[-2, {[_this,5,time,false,false] spawn BIS_Effects_Burn}, _x] call CBA_fnc_globalExecute;
						}
			};
		} forEach _targetUnits;
		
		{if(_x isKindOf "Tank") then
			{
				if ((_x distance _pos) < (_radius/2)+5) then 
					{
						_x setVariable ["ace_sys_vehicledamage_enable", false];					
						_x setdamage 0.7;
						vehicle _x setHit ["Ltrack", 1];
						vehicle _x setHit ["Rtrack", 1];
						[-2, {[_this,5,time,false,false] spawn BIS_Effects_Burn}, _x] call CBA_fnc_globalExecute;
					};
			};
		} forEach _targetUnits;
	};
//=========================================================================================================================================================================================
MCC_fnc_drawLine = 
		{
		private ["_start", "_end", "_marker","_dist","_center"];
		_start = _this select 0;
		_end = _this select 1;
		_marker = _this select 2;
		_lineMarkerName = format ["line_%1", _marker];
		_dist = _start distance _end;
		_dir = ((_end select 0) - (_start select 0)) atan2
		((_end select 1) - (_start select 1));

		_center = [(_start select 0) + ((sin _dir) * _dist / 2),
		(_start select 1) + ((cos _dir) * _dist / 2)];
		
		createMarkerLocal [_lineMarkerName, _center];
		_lineMarkerName setMarkerShapeLocal "RECTANGLE";
		_lineMarkerName setMarkerSizeLocal [0.5, _dist / 2];
		_lineMarkerName setMarkerColorLocal "ColorBlack";
		_lineMarkerName setMarkerDirLocal _dir;
		};
//=============================================================================================================================================================================
FNC_MOBILE_RESPAWN = {
						private ["_dummy", "_respawnMarker", "_respawnStart","_safePos"];
						_dummy = _this select 0;
						_respawnMarker = _this select 1;
						_respawnStart = _this select 2;
						while {(Alive _dummy)} do
							{
								_safePos = [(getPos _dummy),1,10,1,0,900,0] call BIS_fnc_findSafePos;
								sleep 1;
								_respawnMarker setMarkerPos _safePos;
							};
						_respawnMarker setMarkerPos _respawnStart;
					};
//================================================================================================================================================================================
FNC_BUILDING_POS_COUNT ={
							private ["_x"];
							_x = 0;
							while { format ["%1", _this buildingPos _x] != "[0,0,0]" } do	{_x = _x + 1};
							_x
						};
//================================================================================================================================================================================
FNC_MAKE_UNITS_ARRAY =	{
						private ["_CfgVehicles","_i","_CfgVehicle","_simulation","_simTypesUnits","_idx","_faction",
						"_vehicleDisplayName","_cfgclass","_cfgFaction","_unitsArray"];
						
						_faction		= (toLower(_this select 0));
						_simTypesUnits	= (toLower(_this select 1));
						_idx      		= 0;
						_CfgVehicles 	= configFile >> "CfgVehicles" ;
						_unitsArray		=[];
						
						for "_i" from 1 to (count _CfgVehicles - 1) do {
							_CfgVehicle = _CfgVehicles select _i;
							//Keep going when it is a public entry
							if (getNumber(_CfgVehicle >> "scope") == 2) then {
								_vehicleDisplayName 	= getText(_CfgVehicle >> "displayname");
								_vehicleDisplayName		= [_vehicleDisplayName, gettext(_CfgVehicle >> "picture")];
								_cfgclass 				= (configName (_CfgVehicle));  
								_cfgFaction 			= getText(_CfgVehicle >> "faction");
								_simulation 			= getText(_CfgVehicle >> "simulation");
								  
								if (toLower(_cfgFaction) == _faction) then {
									if (toLower(_simulation)== _simTypesUnits) then {
										_unitsArray set[_idx,[_cfgclass,_vehicleDisplayName]];									
										_idx = _idx + 1;
										};
								};
							};
						};
						_unitsArray
						};					