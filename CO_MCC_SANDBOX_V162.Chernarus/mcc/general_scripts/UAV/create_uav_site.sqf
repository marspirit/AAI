//UAV/ULB  script made by Shay_Gman 09/2010 (c)
disableSerialization;
private ["_pos", "_uavSyncObj", "_uav_index", "_grp","_uav","_dummy","_lbpos","_pilot"];
_pos = _this select 0; 
_uavSyncObj = _this select 1; 
_uav_index = _this select 2;

BIS_UAV synchronizeObjectsRemove (synchronizedObjects BIS_UAV);	//lets remove all the synced units from the module
BIS_ULB synchronizeObjectsRemove (synchronizedObjects BIS_ULB);

spawnUAV=	
			{
				private ["_pos","_uavType","_uavSyncObj","_grpSide", "_grp","_uav","_dummy","_nul"];
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
				private ["_pos","_uavType","_uavSyncObj","_grpSide", "_grp","_uav","_dummy","_lbpos","_pilot"];
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
				else {BIS_ULB synchronizeObjectsAdd [_uav, _pos]};
			};
			
spawnAC130=	
			{
				private ["_player","_grpSide", "_grp","_uav","_dummy","_ruck","_null","_vel"];
				_player = _this select 0; 
				_grpSide = _this select 1;
				
				LDL_AI_ceaseFire = true;	//set fire off
				
				_ruck = [_player] call ACE_fnc_FindRuck;	//Create rucksuck
				if (_player hasWeapon _ruck) then {_player removeWeapon _ruck};
				sleep 0.3; 
				_player addWeapon "ACE_P159_RD90";
				/*_dummy = "ACE_Target_CInf" createVehicle getpos _player;
				_dummy attachto [_player,[0,1,0]];*/
				
				_grp = creategroup _grpSide; 
				_uav = [[(getpos _player select 0), (getpos _player select 1), 800], random 180, "C130J", _grp] call BIS_fnc_spawnVehicle;
				(_uav select 0) setdir 180;
				(_uav select 0) disableAI "AUTOTARGET"; 
				(_uav select 0) disableAI "TARGET" ; 
				(_uav select 0) flyinheight 1000 ;
				_grp setCombatMode "BLUE";
				_grp setBehaviour "careless";
				
				[(_uav select 0)] spawn rotateAC130;
						
				_null = _player addaction ["Take Control AC-130", "mcc\general_scripts\UAV\fnc_TakeControl_AC130.sqf",[(_uav select 0)],6,false,true,"","_target == _this"];
				_null = _player addaction ["Move AC-130", "mcc\general_scripts\UAV\fnc_move_AC130.sqf",[(_uav select 0)],6,false,true,"","_target == _this"];
			};
			
rotateAC130 =
			{
				private ["_plane","_vel","_cam_rotating_angle","_cam_rotating_center","_pos","_cam_rotating_height"];
				_plane	= _this select 0;
				
				ac130Abort = false; 
				_plane enableSimulation true;
				_cam_rotating_center = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0,0,0], [], 0, ""];
				
				/*_vel = [sin(getDir _plane)*200,cos(getDir _plane)*200,0];
				_plane setVelocity _vel;*/
				
				_pos = _plane modelToWorld [-1000,0,0];
				_cam_rotating_angle = [(getDir _plane) + 90] call LDL_normalizeAngle;
				_cam_rotating_center setPos [_pos select 0,_pos select 1,0];
				_cam_rotating_height = getPosASL _plane select 2;
				
				while {alive _plane && !ac130Abort} do
					{
						sleep 0.005;
						_cam_rotating_angle = [_cam_rotating_angle - 0.1] call LDL_normalizeAngle;
						[_plane, _cam_rotating_center, 1000, _cam_rotating_angle, _cam_rotating_height] call LDL_setCirclePosition;
						
						_plane setDir (_cam_rotating_angle - 90);
						[_plane,0,-15] call LDL_setPitchBank; //bank for the AC130
					};
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
	
	case 4: //AH64D
		{	
		_dummy = "AH64D_EP1" createvehicle _pos;
		_grp = creategroup west; 
		_lbpos = getmarkerpos "pos8"; 
		_pilot = _grp createUnit ["US_Soldier_Pilot_EP1", _pos, [], 0, "NONE"];
		AHuav= createVehicle ["AH6X_EP1",[_lbpos select 0, _lbpos select 1,50], [], 0, "FLY"];
		_pilot assignAsDriver AHuav;
		_pilot moveindriver AHuav;
		_pilot disableAI "AUTOTARGET"; 
		_pilot disableAI "TARGET" ; 
		_pilot flyinheight 150 ;
		_grp setCombatMode "BLUE";
		_grp setBehaviour "careless";
		_dummy addeventhandler ["GetIn",{BIS_ULB synchronizeObjectsRemove (synchronizedObjects BIS_ULB);BIS_ULB synchronizeObjectsAdd [_this select 0, AHuav];hint format ["%1", synchronizedObjects BIS_ULB];}];
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
	
	case 8: //West  ULB spawn crate
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
	
	case 12: // Backpack AC-130 Box
		{
		_dummy = "USBasicAmmunitionBox" createvehicle _pos;		
		_dummy setVehicleInit "clearweaponcargo this; clearmagazinecargo this; nul = this addAction [""Take Backpack (AC-130)"", ""mcc\general_scripts\uav\create_uav_handheld.sqf"",[13],0,false]";
		};
		
	case 13: // Backpack LDL UAV Box
		{
		LDL_AI_ceaseFire = true;
		[_pos, west] spawn spawnAC130;
		};
	};
	
processInitCommands;
if (true) exitWith {};




	
