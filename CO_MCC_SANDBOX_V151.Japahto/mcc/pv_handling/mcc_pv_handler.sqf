// Enable debug mode, enables tracing to rpt. PARAMS_# autotracing etc.
#define DEBUG_MODE_FULL
// Include macros required
#include "\x\cba\addons\main\script_macros_common.hpp"
// Define functions
//Init UPSMON scritp
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
mcc_ups 					= compile preProcessFileLineNumbers "scripts\upsmon.sqf";

// global Chat message handler
if !(isDedicated) then
{ 
	mcc_groupchat_handler =
	{
		PARAMS_3(_unit,_text,_local);
		if (_local && !(local _unit)) exitWith {};
		_unit globalchat _text;
	};

	["mcc_groupchat", {_this call mcc_groupchat_handler}] call CBA_fnc_addEventHandler;
	
	
};


my_pv = [];
#define DEBUG
if (isServer) then
{
	["mcc_setup", {_this call my_pv_handler}] call CBA_fnc_addEventHandler;

	my_pv_handler =
	{
		private ["_p_mcc_spawntype"
				,"_p_mcc_classtype"
				,"_p_mcc_iszone_update"
				,"_p_mcc_spawnwithcrew"
				,"_p_mcc_spawnname"
				,"_p_mcc_spawnfaction"
				,"_p_mcc_zone_number"
				,"_p_mcc_zone_inform"
				,"_p_mcc_zone_markername"
				,"_p_mcc_zone_behavior"
				,"_p_mcc_zone_markposition"
				,"_p_mcc_zone_markerSize"
				,"_p_maxrange"
				,"_p_mcc_grouptype"
				,"_p_mcc_player"
				,"_p_mcc_request"
				,"_p_mcc_track_units"
				,"_p_mcc_resetmissionmaker"
				,"_p_mcc_player_name"
				,"_safepos"
				,"_unitspawned"		
				,"_mappos"
				,"_trackername"
				,"_markerobj"
				,"_markertype"
			    ,"_track_units"
				,"_spawndirection"
				];
		#ifdef DEBUG
			diag_log format["my_pv: %1",_this];
		#endif
		//mcc_spawntype   		["VEHICLE","MAN","DOC","GROUP"]  		- What kind of shit is it we try to deliver as they all need seperate handle (car, soldier etc)
		//mcc_classtype   		["AIR","LAND","WATER"]					- And on where is that stuff at its best. Example, boats dont like to be on land
		//mcc_isnewzone   		[true,false]							- Are we making a new zone or are we working in yet made stuff
		//mcc_spawnwithcrew 	[true,false]							- If we spawn a car do we want the default config file crew with it
		//mcc_spawnname     	[CONFIGFILE VEHICLENAME]				- How is the spawn thing named in the config file as thats what we need to call spawn functions
		//mcc_spawnfaction  	["GUE","USMC","RU","INS","CDF","CIV"]	- What faction does he belong to?
		//mcc_zone_number 		[1 ...9999]								- What is the zone number we are working in?
		//mcc_zone_inform       ["NOTHING","TRIGGER"]                   - If set on trigger all players will be informed when that zone is clear of spawned unit side
		//mcc_zone_markername   [NAME OF MARKER]						- What is the name of the marker or in functional names the name of the zone (example "ONE")		
		//mcc_spawnbehavior     ["NORMAL","NOFOLLOW","NOMOVE"]			- If we throw out a unit then how should it behave there, defensive? Agressive? :P
		//mcc_zone_pos          [ ARRAY of zone positions where nr in array determines zone position]
		//mcc_zone_size			[ contains the size of the zone ]
	
		_p_mcc_spawntype 			= _this select 0;
		_p_mcc_classtype			= _this select 1;
		_p_mcc_iszone_update		= _this select 2;
		_p_mcc_spawnwithcrew		= _this select 3;
		_p_mcc_spawnname			= _this select 4;
		_p_mcc_spawnfaction			= _this select 5;
		_p_mcc_zone_number			= _this select 6;
		_p_mcc_zone_inform			= _this select 7;
		_p_mcc_zone_markername		= _this select 8;
		_p_mcc_zone_behavior		= _this select 9;
		_p_mcc_zone_markposition	= _this select 10;
		_p_mcc_zone_markerSize		= _this select 11;
		_p_maxrange					= _this select 12;
		_p_mcc_grouptype			= _this select 13;
		_p_mcc_player				= _this select 14;
		_p_mcc_request				= _this select 15;
		_p_mcc_track_units			= _this select 16;
		_p_mcc_resetmissionmaker	= _this select 17;
		_p_mcc_player_name			= _this select 18;
		_p_mcc_awareness			= _this select 19;

		
		if _p_mcc_track_units then { _track_units = "TRACK";} else { _track_units = "NOTHING";};
		
		//The first one activating MCC is considered the mission maker. Futher access is all denied as the MCC at the moment does not support multi-user
		if ((format["%1",mcc_MissionMaker])=="") then
			{
				mcc_missionmaker = _p_mcc_player_name;
				["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Access granted to: %2",_p_mcc_request,mcc_missionMaker], false]] call CBA_fnc_globalEvent;                
				publicVariable "mcc_missionmaker";
			};
			
		//Lets see if we are the mission maker, if not we simple deny access
		if (mcc_missionmaker == _p_mcc_player_name) then 		
				//Yeah we are the mission maker, lets go dude!
				{	
					if _p_mcc_resetmissionmaker then
					{
						
						["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> %2 Logged out as Misson Maker.",_p_mcc_request,mcc_missionMaker], false]] call CBA_fnc_globalEvent;                
						  mcc_missionmaker="";
						  publicVariable "mcc_missionmaker";
					}
					else
					{
						// If it is a new zone (marker) then we need to make it also on the server
						if _p_mcc_iszone_update then 
								{
								 if  (format["%1", getMarkerPos _p_mcc_zone_markername]== "[0,0,0]") then 		
										{
										// Create Marker
										createMarkerLocal [_p_mcc_zone_markername, _p_mcc_zone_markposition];
										_p_mcc_zone_markername setMarkerShapeLocal "RECTANGLE";
										_p_mcc_zone_markername setMarkerSizeLocal _p_mcc_zone_markerSize;		
										}
								else
										{
										_p_mcc_zone_markername SetMarkerPosLocal _p_mcc_zone_markposition;
										_p_mcc_zone_markername setMarkerSizeLocal _p_mcc_zone_markerSize;		
										};
								};
						
						
					
						// Dont start using the BIS functions till they are ready for lift off sir...3...2...1.... GO
						waituntil {!isnil "bis_fnc_init"};

						// What ever we do, we need a good position
						switch (_p_mcc_classtype) do
								{
									case "AIR":
									{
										if !_p_mcc_spawnwithcrew then 
										{_safepos     =[_p_mcc_zone_markposition,1,_p_maxrange,2,0,100,0,[],[[-500,-500,0],[-500,-500,0]]] call BIS_fnc_findSafePos; }
										else
										{_safepos     =[_p_mcc_zone_markposition ,1,_p_maxrange,2,1,10,0,[],[[-500,-500,0],[-500,-500,0]]] call BIS_fnc_findSafePos;};						
									};
									
									case "PARATROOPER":
									{
										
										_safepos     =[_p_mcc_zone_markposition,1,_p_maxrange,2,1,100,0,[],[[-500,-500,0],[-500,-500,0]]] call BIS_fnc_findSafePos;					
										
									};
									
									case "LAND":
									{
										_safepos     =[_p_mcc_zone_markposition,1,_p_maxrange,2,0,100,0,[],[[-500,-500,0],[-500,-500,0]]] call BIS_fnc_findSafePos;					
									};

									case "WATER":
									{					
										_safepos     =[_p_mcc_zone_markposition,1,_p_maxrange,2,2,100,0,[],[[-500,-500,0],[-500,-500,0]]] call BIS_fnc_findSafePos; 
									};
								};
							if (format["%1",_safepos] != "[-500,-500,0]" ) then
						{
						// As some stuff needs to be spawned from the inside of the zone to the outside we need that direction
						_spawndirection = [_p_mcc_zone_markposition, _safepos] call BIS_fnc_dirTo;
						
						if (_p_mcc_spawntype == "PARATROOPER") then
						{

								if (_p_mcc_spawnfaction=="WEST") then
									{
									 nul=[[(_safepos select 0),(_safepos select 1),0],1,_p_mcc_spawnname,_p_mcc_zone_markername,_p_mcc_zone_behavior,_p_mcc_awareness] spawn (compile (preprocessFileLineNumbers( 'mcc\general_scripts\paratroops\paratroops.sqf')));
									 };	
								if (_p_mcc_spawnfaction=="EAST") then
									{
									 nul=[[(_safepos select 0),(_safepos select 1),0],2,_p_mcc_spawnname,_p_mcc_zone_markername,_p_mcc_zone_behavior,_p_mcc_awareness] spawn (compile (preprocessFileLineNumbers( 'mcc\general_scripts\paratroops\paratroops.sqf')));
									 };		
								if (_p_mcc_spawnfaction=="GUE") then
									{
									 nul=[[(_safepos select 0),(_safepos select 1),0],3,_p_mcc_spawnname,_p_mcc_zone_markername,_p_mcc_zone_behavior,_p_mcc_awareness] spawn (compile (preprocessFileLineNumbers( 'mcc\general_scripts\paratroops\paratroops.sqf')));
									 };		
							
						};
						
						//Hey its a dude, lets get him out there 
						if (_p_mcc_spawntype == "MAN") then
							{
								
								if (_p_mcc_spawnfaction=="GUE") then
									{_unitspawned = createGroup resistance;};
								if (_p_mcc_spawnfaction=="WEST") then
									{_unitspawned = createGroup west;};							
								if (_p_mcc_spawnfaction=="EAST") then
									{_unitspawned = createGroup east;};
								if (_p_mcc_spawnfaction=="CIV") then
									{_unitspawned = createGroup civilian;};							
							
								
								_p_mcc_spawnname createUnit [_safepos, _unitspawned];
								
								["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Spawned ""%2"" of type %3.",_p_mcc_request,_unitspawned,_p_mcc_spawnname], true]] call CBA_fnc_globalEvent;  
								
								nul = [leader _unitspawned, _p_mcc_zone_markername, _p_mcc_zone_behavior, "SHOWMARKER",_track_units,"spawned" ,_p_mcc_awareness  ] spawn mcc_ups;
							};
							
						//Incase we encounter a vehicle
						if ((_p_mcc_spawntype == "VEHICLE") or (_p_mcc_spawntype == "AMMO")) then
							{	
								if (_p_mcc_spawnwithcrew and (_p_mcc_spawntype == "VEHICLE") ) then
									{
										//Some sort of vehicle, now if the config has any crew we spawn it with it, incase not, well its still empty
										if (_p_mcc_spawnfaction=="GUE") then
											{_unitspawned 	=	[_safepos, _spawndirection, _p_mcc_spawnname, resistance] call BIS_fnc_spawnVehicle;};										
										if (_p_mcc_spawnfaction=="WEST") then
											{ _unitspawned 	=	[_safepos, _spawndirection, _p_mcc_spawnname, WEST] call BIS_fnc_spawnVehicle;};
										if (_p_mcc_spawnfaction=="EAST") then
											{ _unitspawned 	=	[_safepos, _spawndirection, _p_mcc_spawnname, EAST] call BIS_fnc_spawnVehicle;};										
										if (_p_mcc_spawnfaction=="CIV") then
											{ _unitspawned 	=	[_safepos, _spawndirection, _p_mcc_spawnname, civilian] call BIS_fnc_spawnVehicle;};
											
										//Find out who is the poor bastard leading this joint and then give him something to do with UPS
										//Specific resctrictions or lifting rescrictions on type of unit in UPS
										switch (_p_mcc_classtype) do
											{
												case "AIR":
												{
													nul = [leader (_unitspawned select 2), _p_mcc_zone_markername, _p_mcc_zone_behavior, "SHOWMARKER","NOWAIT","NOSLOW",_track_units,"spawned",_p_mcc_awareness] spawn mcc_ups;				
												};

												case "LAND":
												{
													nul = [leader (_unitspawned select 2), _p_mcc_zone_markername, _p_mcc_zone_behavior, "SHOWMARKER",_track_units,"spawned", _p_mcc_awareness] spawn mcc_ups;
												};

												case "WATER":
												{					
													nul = [leader (_unitspawned select 2), _p_mcc_zone_markername, _p_mcc_zone_behavior, "SHOWMARKER","NOWAIT",_track_units,"spawned",_p_mcc_awareness] spawn mcc_ups;				
												};
											};
										
										
										["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Spawned ""%3"" of type %2.",_p_mcc_request,_p_mcc_spawnname,(_unitspawned select 0)], true]] call CBA_fnc_globalEvent;                
								
									}
								else
									{
										//Vehicle without any crew, so here we go 
										_unitspawned 	= _p_mcc_spawnname createVehicle _safepos;
										["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Spawned type %2.",_p_mcc_request,_p_mcc_spawnname], true]] call CBA_fnc_globalEvent;                
									};
							
							};
						
						//What we do if we find a DOC (Dynamic Object Composition)
						if (_p_mcc_spawntype == "DOC") then
							{
								//Well we need a dynamic object composition to spawn so we us a BIS function for that.
								_unitspawned =[ _safepos, _spawndirection, _p_mcc_spawnname] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));			
								["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Spawned type %2.",_p_mcc_request,_p_mcc_spawnname], true]] call CBA_fnc_globalEvent;                											
								
								
							};		
							
						//Now the spawntype is a predefined group in the config, now this needs some specific handling, a BIS function is available so lets go	
						if (_p_mcc_spawntype == "GROUP") then
							
							{
										
										//Depending on faction we spawn for side
										if (_p_mcc_grouptype=="GUE") then
										    {_unitspawned=[_safepos, resistance, (call compile _p_mcc_spawnfaction)] call BIS_fnc_spawnGroup;};										
										if (_p_mcc_grouptype=="WEST") then
										    {_unitspawned=[_safepos, west, (call compile _p_mcc_spawnfaction)] call BIS_fnc_spawnGroup;};																				
										if (_p_mcc_grouptype=="EAST") then
										    {_unitspawned=[_safepos, east, (call compile _p_mcc_spawnfaction)] call BIS_fnc_spawnGroup;};										
										if (_p_mcc_grouptype=="CIV") then
										    {_unitspawned=[_safepos, civilian, (call compile _p_mcc_spawnfaction)] call BIS_fnc_spawnGroup;};										
											
										//Find out who is the poor bastard leading this joint and then give him something to do with UPS
										//Specific resctrictions or lifting rescrictions on type of unit in UPS
										switch (_p_mcc_classtype) do
											{
												case "AIR":
												{
													nul = [leader _unitspawned, _p_mcc_zone_markername, _p_mcc_zone_behavior, "SHOWMARKER", "NOWAIT", "NOSLOW", "spawned" ,_track_units, _p_mcc_awareness  ] spawn mcc_ups;
												};

												case "LAND":
												{
													nul = [leader _unitspawned, _p_mcc_zone_markername, _p_mcc_zone_behavior, "SHOWMARKER",_track_units, "spawned", _p_mcc_awareness   ] spawn mcc_ups;
												};

												case "WATER":
												{					
													nul = [leader _unitspawned, _p_mcc_zone_markername, _p_mcc_zone_behavior, "SHOWMARKER", "NOWAIT" ,_track_units, "spawned", _p_mcc_awareness  ] spawn mcc_ups;
												};
											};
										
										["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Spawned ""%3"" of type %2.",_p_mcc_request,_p_mcc_spawnname,((units _unitspawned) select 0)], true]] call CBA_fnc_globalEvent;                

							
							};
						};
						if _p_mcc_iszone_update then
							{
								["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Created/Updated zone: %2.",_p_mcc_request,_p_mcc_zone_markername], true]] call CBA_fnc_globalEvent;   
							}
						else
							{
								if (format["%1",_safepos] != "[-500,-500,0]" ) 
								then
									{
										["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> Spawned in grid: %2.",_p_mcc_request,(_safepos call BIS_fnc_PosToGrid)], true]] call CBA_fnc_globalEvent;   
									}
								else
									{
										["mcc_groupchat", [_p_mcc_player, format["MCC ID %1-> SPAWN FAILED! No good position found!",_p_mcc_request], true]] call CBA_fnc_globalEvent;   
									};
							};
					};
				}
				// we are at the if then else part of checking if we are the mission maker. At this case it will be denied cause player <> mcc_missionmaker
				else
				{
					["mcc_groupchat", [_p_mcc_player, format["MCC ID %1->: Server access denied for: %2.",_p_mcc_request,_p_mcc_player], false]] call CBA_fnc_globalEvent;                
				};
				
	
		
	};
};
