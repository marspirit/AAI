// Norrn_AIBehaviour
// © AUGUST 2009 - norrin

private ["_name","_can_revive","_can_revive_2","_can_be_revived","_can_be_revived_2","_enemy_side_1","_enemy_side_2","_goto_revive_distance",
	   "_AI_smoke","_AI_aware","_AI_cover","_AI_dismount","_smoke_shell_types","_close_array","_unc_array","_revive_array","_goto_reviver","_goto_protect",
	   "_revive_units","_protect_units","_mags","_smoke_rounds","_round","_bloggs_pos","_bloggs_offset","_sav_pos","_sav_dir","_known_enemy","_count_enemies"];

_name 					= _this select 0;
_units 					= _this select 1;
_can_revive 			= Norrn_revive_array select 18;
_can_revive_2 			= Norrn_revive_array select 19;
_can_be_revived 		= Norrn_revive_array select 20;
_can_be_revived_2 		= Norrn_revive_array select 21;
_medic_1				= Norrn_revive_array select 76;
_medic_2				= Norrn_revive_array select 77;

_enemy_side_1			= Norrn_revive_array select 23;
_enemy_side_2			= Norrn_revive_array select 24;

_goto_revive_distance 	= Norrn_revive_array select 33;

_AI_smoke				= Norrn_revive_array select 40;
_AI_aware				= Norrn_revive_array select 49;
_AI_cover				= Norrn_revive_array select 50;
_AI_dismount			= Norrn_revive_array select 58;

_medpacks				= Norrn_revive_array select 80;

_smoke_shell_types = ["SmokeShell","SmokeShellRed","SmokeShellGreen"];
 
//all friendly units nearby
_close_array = [];
_unc_array = [];
_revive_array = [];
_goto_reviver = objNull;
_goto_protect = objNull;
_round = objNull;
_close_array = nearestObjects [_name, [_can_be_revived, _can_be_revived_2], _goto_revive_distance];
_group = group _name;
			
//create array of all friendly units nearby that are unconscious
{if (_x getVariable "NORRN_AIunconscious") then {_unc_array = _unc_array + [_x]}}forEach _close_array;

//define revive and protector arrays
_revive_units = [];
_protect_units = [];
{call compile format ["if (%1 isKindOf _can_revive   && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 0 || 
						   %1 isKindOf _can_revive_2 && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 0 ||
						   %1 isKindOf _can_revive   && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 1 && (%1 getVariable 'NORRN_medpacks') > 0 || 
						   %1 isKindOf _can_revive_2 && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 1 && (%1 getVariable 'NORRN_medpacks') > 0 ||
						   %1 isKindOf _medic_1      && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 1 && (%1 getVariable 'NORRN_medpacks') > 0 || 
						   %1 isKindOf _medic_2      && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 1 && (%1 getVariable 'NORRN_medpacks') > 0) then {_revive_units = _revive_units + [%1]}", _x]} forEach _units;
{call compile format ["if (%1 isKindOf _can_revive   && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') || 
						   %1 isKindOf _can_revive_2 && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') ||
						   %1 isKindOf _medic_1      && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 1 || 
						   %1 isKindOf _medic_2      && !(%1 getVariable 'NORRN_unconscious') && !(%1 getVariable 'NORRN_AI_help') && _medpacks  == 1) then {_protect_units = _protect_units + [%1]}", _x]} forEach _units;
		
//define the unconscious unit array 
{if !(_x in _protect_units) then {_revive_array = _revive_array + [_x]}}forEach _unc_array;
		
if (count _revive_array > 0) then 
{	
	_mags = [];
	if (_medpacks == 0) then
	{
		if(_name isKindOf _can_revive || _name isKindOf _can_revive_2) then {_goto_reviver = _name};
	}; 
	if (_medpacks == 1 && (_name getVariable "NORRN_medpacks") > 0 ) then
	{
		if(_name isKindOf _can_revive || _name isKindOf _can_revive_2 || _name isKindOf _medic_1 || _name isKindOf _medic_2) then {_goto_reviver = _name};
	};
		
	if (_AI_cover == 1) then {_goto_protect = _name};
	_close_unc = objNull;		
	_close_unc = _revive_array select 0;
	_revive_units = _revive_units - [_name];
			
	sleep 1;
	if (count _revive_units > 0) then
	{
		{if ((_name distance _close_unc) > (_x distance _close_unc)) then {_goto_reviver = _x}}forEach _revive_units;
		_protect_units = _protect_units - [_goto_reviver];
		if (_name == _goto_reviver) then {_goto_protect = objnull};
		{if (_name != _goto_reviver && _AI_cover == 1 && (_name distance _close_unc) > (_x distance _close_unc)) then {_goto_protect = _x}}forEach _protect_units;
	};	
	
	//Overide settings if player calls for help
	if (_name == _goto_reviver && (_name getVariable "NORRN_AI_help")) then	{_goto_reviver = objnull; _close_unc = objNull};
	if (_name == _goto_protect && (_name getVariable "NORRN_AI_help")) then	{_goto_protect = objnull; _close_unc = objNull};
	
	if ((_name getVariable "NORRN_AI_help") && (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4])) > 1 && _name isKindOf _can_revive ||
 	    (_name getVariable "NORRN_AI_help") && (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4])) > 1 && _name isKindOf _can_revive_2) then
	{	
		if ((nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 3] select 1) getVariable "NORRN_unconscious") then
		{ 	
			_name playMove "AinvPknlMstpSlayWrflDnon_medic";
			_name setVariable ["NORRN_AI_help", false, true];
		};
	};
			
	//if unit is closest to unconscious unit and is not player moveTo and heal unit
	if (!isNull _goto_reviver && !isNull _close_unc && _goto_reviver == _name && !isplayer _name && (count _revive_array > 0) ||
 	    !isNull _goto_protect && !isNull _close_unc && _goto_protect == _name && !isplayer _name && (count _revive_array > 0)) then
	{  	
		if (_goto_reviver == _name && (_close_unc getVariable "NORRN_AIReviver") != _name) then 
		{	
			_close_unc setVariable ["NORRN_AIReviver", _goto_reviver, true];
		};
	
		//check to see if the healer has smoke
		_mags = magazines _name;
		_smoke_rounds = [];
		{if (_x in _smoke_shell_types) then {_smoke_rounds = _smoke_rounds + [_x]}} forEach _mags;	

		//healer throws smoke
		if (count _smoke_rounds > 0 && _AI_smoke == 1 && _name distance _close_unc < 50 && _name distance _close_unc > 4 && _name == _goto_reviver) then
		{	
			
			if !((_close_unc getVariable "NORRN_AISmoke") select 0)then
			{	
				
				_round = _smoke_rounds select 0;
				_bloggs_pos = getPos _close_unc;
				_bloggs_offset = (_close_unc distance _bloggs_pos);
				_sav_pos = getPos _name;
				_set_dir = ((_bloggs_pos select 0) - (_sav_pos select 0))atan2((_bloggs_pos select 1) - (_sav_pos select 1)); 
				_name setDir _set_dir;
				sleep 0.1;
				if(_name distance _close_unc > 15) then {_name playMove "AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthEnd"};

				_name removeMagazine _round;
				_round createVehicle [(_bloggs_pos select 0) + 1,(_bloggs_pos select 1) + 1, 0];
				_close_unc setVariable ["NORRN_AISmoke", [true, _round], true];
			};			
		};	
		//set behaviour healer
		_name setBehaviour "AWARE";
					
		//clears any known enemies
		if (_AI_aware == 1) then
		{
			_known_enemy = [];
			_count_enemies = 0;  
			_known_enemy = nearestObjects [_name, [_enemy_units_1,_enemy_units_2], 50];
			{if (_name knowsAbout _x > 0.105) then {_count_enemies = _count_enemies + 1}} forEach _known_enemy;
				
			while {_count_enemies > 0 && alive _name} do
			{
				_count_enemies = 0;  
				_known_enemy = nearestObjects [_name, [_enemy_units_1,_enemy_units_2], 50];
				{if (_name knowsAbout _x > 0.105) then {_count_enemies = _count_enemies + 1}} forEach _known_enemy;
				sleep 0.01;
			}; 
		};
					
		///////////////////////////////////////
		if (_AI_dismount == 1) then
		{
			//Reviver and protector dismount vehicle 
			if (vehicle _goto_reviver != _goto_reviver && _name == _goto_reviver || vehicle _goto_protect != _goto_protect && _name == _goto_protect) then 
			{ 	
				if ((vehicle _goto_reviver) isKindOf "Land" || (vehicle _goto_protect) isKindOf "Land") then
				{
					[_name] join grpNull;
					unAssignVehicle _name;
					doGetOut _name;
				};
			};
		};
		//Instruct stopped unit to move
		if (currentCommand _goto_reviver  == "stop" && _name == _goto_reviver  || currentCommand _goto_protect == "stop" && _name == _goto_protect)then
		{	
			_group = group _name;
			[_name] join grpNull;
		};
		///////////////////////////////////////
		//healer and protector move to unconscious unit
		if((_name distance _close_unc) > 10 && time > _doMove_time && (_close_unc getVariable "NORRN_AIunconscious") && _name == _goto_protect) then 
		{	
			if (_name == _goto_protect) then 
			{	
				_close_unc_pos = getPos _close_unc; 
				_name doMove [(_close_unc_pos select 0) + 5, (_close_unc_pos select 1) + 5, (_close_unc_pos select 2)];
			};
			_doMove_time = time + 4;
		};	
		if((_name distance _close_unc) > 10 && time > _doMove_time && (_close_unc getVariable "NORRN_AIunconscious") && _name == _goto_reviver) then 
		{		
			if (_name == _goto_reviver) then
			{
				sleep 0.1;
				_name doMove (getPos _close_unc);
			};
			_doMove_time = time + 4;
		};
		
		//healer revives unconscious unit
		
		if ((_name distance _close_unc) <= 3 && (_close_unc getVariable "NORRN_AIunconscious") && _name == _goto_reviver) then
		{	
			if (!(_name getVariable "NORRN_AIunconscious") && alive _name) then 
			{	
				_near_revivers = [];
				_dont_revive = false;
				_near_revivers = nearestObjects [_name,[_can_revive, _can_revive_2, _medic_1, _medic_2], 6];
				{if (animationState _x == "AinvPknlMstpSlayWrflDnon_medic") then {_dont_revive = true}} forEach _near_revivers;
				if (!_dont_revive) then
				{
					_name playMove "AinvPknlMstpSlayWrflDnon_medic";
					if (_medpacks == 1) then
					{
						_var = _name getVariable "Norrn_medpacks";
						_name setVariable ["Norrn_medpacks", (_var - 1), true];
					};
				};
				_name setVariable ["NORRN_AI_help", false, true];
				_name doMove (getPos _name);
				sleep 0.5;
				sleep 10;
				_name doMove (getPos _name);
			};
			
		};
	};
		
};

if(true) exitWith {};
//file last modified 170809