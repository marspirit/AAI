//UAV/ULB  script made by Shay_Gman 09/2010 (c)
disableSerialization;
private ["_pos", "_uavSyncObj", "_uav_index"];
_pos = _this select 0; 
_uavSyncObj = _this select 1; 
_uav_index = _this select 2;

BIS_UAV synchronizeObjectsRemove (synchronizedObjects BIS_UAV);	//lets remove all the synced units from the module
BIS_ULB synchronizeObjectsRemove (synchronizedObjects BIS_ULB);

spawnUAV=	
			{
				private ["_pos","_uavType","_uavSyncObj""_grpSide", "_grp","_uav","_dummy","_nul"];
				_pos = _this select 0; 
				_uavType = _this select 1;
				_uavSyncObj = _this select 2;
				_grpSide = _this select 3;
				BIS_UAV synchronizeObjectsRemove (synchronizedObjects BIS_UAV);
				if (_uavSyncObj != "ACE_Target_CInf") then {_dummy = _uavSyncObj createvehicle _pos} else //If it's a backpack UAV
					{
					_nul = [_pos] call ACE_fnc_FindRuck;
					if (_pos hasWeapon _nul) then {_pos removeWeapon _nul};
					sleep 0.3; 
					_pos addWeapon "ACE_P159_RD90";
					_dummy = "ACE_Target_CInf" createVehicle getpos _pos;
					_dummy attachto [_pos,[0,1,0]];
					};
				_grp = creategroup _grpSide; 
				_uav = [[(getpos _dummy select 0), (getpos _dummy select 1), 800], random 180, _uavType, _grp] call BIS_fnc_spawnVehicle;
				(_uav select 0) disableAI "AUTOTARGET"; 
				(_uav select 0) disableAI "TARGET" ; 
				(_uav select 0) flyinheight 800 ;
				_grp setCombatMode "BLUE";
				_grp setBehaviour "careless";
				if (_uavSyncObj != "ACE_Target_CInf") then {BIS_UAV synchronizeObjectsAdd [(_uav select 0), _dummy]} //If it's a backpack UAV
				else {BIS_UAV synchronizeObjectsAdd [(_uav select 0),_dummy, _pos]};
				
			};

spawnULB=
			{
				private ["_pos","_uavType","_uavSyncObj""_grpSide", "_grp","_uav","_dummy","_lbpos","_pilot"];
				_pos = _this select 0; 
				_uavType = _this select 1;
				_uavSyncObj = _this select 2;
				_grpSide = _this select 3;
				BIS_ULB synchronizeObjectsRemove (synchronizedObjects BIS_ULB);
				if (_uavSyncObj != "ACE_Target_CInf") then {_dummy = _uavSyncObj createvehicle _pos} else //If it's a backpack ULB
					{
					_nul = [_pos] call ACE_fnc_FindRuck;
					if (_pos hasWeapon _nul) then {_pos removeWeapon _nul};
					sleep 0.3; 
					_pos addWeapon "ACE_P159_RD90";
					_dummy = "ACE_Target_CInf" createVehicle getpos _pos;
					_dummy attachto [_pos,[0,1,0]];
					};
				_grp = creategroup _grpSide; 
				_lbpos = getmarkerpos "pos8"; 
				_uav= createVehicle [_uavType,[_lbpos select 0, _lbpos select 1, (_lbpos select 2) + 116], [], 0, "FLY"];
				_pilot = _grp createUnit ["US_Soldier_Pilot_EP1", _pos, [], 0, "NONE"];
				_pilot assignAsDriver _uav;
				_pilot moveindriver _uav;
				_pilot disableAI "AUTOTARGET"; 
				_pilot disableAI "TARGET" ; 
				_pilot flyinheight 150 ;
				_grp setCombatMode "BLUE";
				_grp setBehaviour "careless";
				if (_uavSyncObj != "ACE_Target_CInf") then {BIS_ULB synchronizeObjectsAdd [_uav, _dummy]} //If it's a backpack ULB
				else {BIS_ULB synchronizeObjectsAdd [_uav,_dummy, _pos]};
			};
			
			
switch (_uav_index) do //Now lets see what are we spawning?
	{
	case 0: //west  static UAV
	{
	[_pos, "MQ9PredatorB_US_EP1", "US_WarfareBUAVterminal_Base_EP1", west] spawn spawnUAV;
	};
	
	case 1: //West static ULB
	{
	[_pos, "AH6X_EP1", "US_WarfareBUAVterminal_Base_EP1", west] spawn spawnULB;
	};
	
	case 2: //East static UAV
	{
	[_pos, "Pchela1T", "TK_GUE_WarfareBUAVterminal_Base_EP1", east] spawn spawnUAV;
	};
	
	case 3: //west  mobile UAV
	{
	[_pos, "MQ9PredatorB_US_EP1", "HMMWV_Terminal_EP1", west] spawn spawnUAV;
	};
	
	case 4: //West mobile ULB
	{
	[_pos, "AH6X_EP1", "HMMWV_Terminal_EP1", west] spawn spawnULB;
	};
	
	case 5: //East mobile UAV
	{
	[_pos, "Pchela1T", "V3S_Salvage_TK_GUE_EP1", east] spawn spawnUAV;
	};
	
	case 6: //West Backpack UAV spawn crate
	{
	_dummy = "USBasicAmmunitionBox" createvehicle _pos;
	_dummy setVehicleInit "clearweaponcargo this; clearmagazinecargo this;nul = this addAction [""Take Backpack (UAV)"", ""mcc\general_scripts\uav\create_uav_handheld.sqf"",[7],0,false] ";
	};
		
	case 7: //West Backpack action triggered Server Side
	{
	[_pos, "MQ9PredatorB_US_EP1", _uavSyncObj, west] spawn spawnUAV;
	};
	
	case 8: //West Backpack ULB spawn crate
	{
	_dummy = "USBasicAmmunitionBox" createvehicle _pos;
	_dummy setVehicleInit "clearweaponcargo this; clearmagazinecargo this;nul = this addAction [""Take Backpack (ULB)"", ""mcc\general_scripts\uav\create_uav_handheld.sqf"",[9],0,false] ";
	};
		
	case 9: //West Backpack action triggered Server Side
	{
	[_pos, "AH6X_EP1", _uavSyncObj, west] spawn spawnULB;
	};
	
	case 10: //East Backpack UAV spawn crate
	{
	_dummy = "USBasicAmmunitionBox" createvehicle _pos;
	_dummy setVehicleInit "clearweaponcargo this; clearmagazinecargo this;nul = this addAction [""Take Backpack (UAV)"", ""mcc\general_scripts\uav\create_uav_handheld.sqf"",[11],0,false] ";
	};
		
	case 11: //West Backpack action triggered Server Side
	{
	[_pos, "Pchela1T", _uavSyncObj, east] spawn spawnUAV;
	};
	
	};
	
processInitCommands;
if (true) exitWith {};




	
