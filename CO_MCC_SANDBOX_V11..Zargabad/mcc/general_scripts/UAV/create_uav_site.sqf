disableSerialization;
private ["_pos", "_uav_dummy", "_uav_index", "_dummy","_nul","_grp", "_pilot1"];
_pos = _this select 0; 
_uav_dummy = _this select 1; 
_uav_index = _this select 2;

BIS_UAV_1 synchronizeObjectsRemove (synchronizedObjects BIS_UAV_1);

BIS_ULB_1 synchronizeObjectsRemove (synchronizedObjects BIS_ULB_1);

switch (_uav_index) do 
	{
	case 0: //west  static UAV
	{
	BIS_UAV synchronizeObjectsRemove (synchronizedObjects BIS_UAV);
	_dummy = "US_WarfareBUAVterminal_Base_EP1" createvehicle _pos;
	//_dummy setposatl _pos; 
	_grp = creategroup west; 
	_uav = [[(_pos select 0), (_pos select 1), 1000], random 180, _uav_dummy select _uav_index, _grp] call BIS_fnc_spawnVehicle;
	(_uav select 0) disableAI "AUTOTARGET"; 
	(_uav select 0) disableAI "TARGET" ; 
	(_uav select 0) flyinheight 1000 ;
	_grp setCombatMode "BLUE";
	_grp setBehaviour "careless";
	BIS_UAV synchronizeObjectsAdd [(_uav select 0), _dummy];
	};
	
	case 1: //West static ULB
	{
	BIS_ULB synchronizeObjectsRemove (synchronizedObjects BIS_ULB);
	_dummy = "US_WarfareBUAVterminal_Base_EP1" createvehicle _pos;
	//_dummy setposatl _pos; 
	_grp = creategroup west; 
	_lbpos = getmarkerpos "pos8"; 
	_uav= createVehicle [_uav_dummy select _uav_index,[_lbpos select 0, _lbpos select 1, (_lbpos select 2) + 116], [], 0, "FLY"];
	_pilot1 = _grp createUnit ["US_Soldier_Pilot_EP1", _pos, [], 0, "NONE"];
	_pilot1 assignAsDriver _uav;
	_pilot1 moveindriver _uav;
	_pilot1 disableAI "AUTOTARGET"; 
	_pilot1 disableAI "TARGET" ; 
	_pilot1 flyinheight 1000 ;
	_grp setCombatMode "BLUE";
	_grp setBehaviour "careless";
	BIS_ULB synchronizeObjectsAdd [_uav, _dummy];
	};
	
	case 2: //East static UAV
	{
	BIS_UAV synchronizeObjectsRemove (synchronizedObjects BIS_UAV);
	_dummy = "TK_GUE_WarfareBUAVterminal_Base_EP1" createvehicle _pos;
	//_dummy setposatl _pos; 
	_grp = creategroup east; 
	_uav = [[(_pos select 0), (_pos select 1), 1000], random 180, _uav_dummy select _uav_index, _grp] call BIS_fnc_spawnVehicle;
	(_uav select 0) disableAI "AUTOTARGET"; 
	(_uav select 0) disableAI "TARGET" ; 
	(_uav select 0) flyinheight 1000 ;
	_grp setCombatMode "BLUE";
	_grp setBehaviour "careless";
	BIS_UAV synchronizeObjectsAdd [(_uav select 0), _dummy];
	};
	
	case 3: //west  bag UAV
	{
	BIS_UAV synchronizeObjectsRemove (synchronizedObjects BIS_UAV);
	_dummy = "HMMWV_Terminal_EP1" createvehicle _pos;
	_grp = creategroup west; 
	_uav = [[(_pos select 0), (_pos select 1), 1000], random 180, _uav_dummy select 0, _grp] call BIS_fnc_spawnVehicle;
	(_uav select 0) disableAI "AUTOTARGET"; 
	(_uav select 0) disableAI "TARGET" ; 
	(_uav select 0) flyinheight 1000 ;
	_grp setCombatMode "BLUE";
	_grp setBehaviour "careless";
	BIS_UAV synchronizeObjectsAdd [(_uav select 0), _dummy];
	};
	
	case 4: //West bag ULB
	{
	BIS_ULB synchronizeObjectsRemove (synchronizedObjects BIS_ULB);
	_dummy = "HMMWV_Terminal_EP1" createvehicle _pos;
	_grp = creategroup west; 
	_lbpos = getmarkerpos "pos8"; 
	_uav= createVehicle [_uav_dummy select 1,[_lbpos select 0, _lbpos select 1, (_lbpos select 2) + 116], [], 0, "FLY"];
	_pilot1 = _grp createUnit ["US_Soldier_Pilot_EP1", _pos, [], 0, "NONE"];
	_pilot1 assignAsDriver _uav;
	_pilot1 moveindriver _uav;
	_pilot1 disableAI "AUTOTARGET"; 
	_pilot1 disableAI "TARGET" ; 
	_pilot1 flyinheight 1000 ;
	_grp setCombatMode "BLUE";
	_grp setBehaviour "careless";
	BIS_ULB synchronizeObjectsAdd [_uav, _dummy];
	};
	
	case 5: //East bag UAV
	{
	BIS_UAV synchronizeObjectsRemove (synchronizedObjects BIS_UAV);
	_dummy = "V3S_Salvage_TK_GUE_EP1" createvehicle _pos;
	_grp = creategroup east; 
	_uav = [[(_pos select 0), (_pos select 1), 1000], random 180, _uav_dummy select 2, _grp] call BIS_fnc_spawnVehicle;
	(_uav select 0) disableAI "AUTOTARGET"; 
	(_uav select 0) disableAI "TARGET" ; 
	(_uav select 0) flyinheight 1000 ;
	_grp setCombatMode "BLUE";
	_grp setBehaviour "careless";
	BIS_UAV synchronizeObjectsAdd [(_uav select 0), _dummy];
	};
	};
	
processInitCommands;
if (true) exitWith {};




	
