// I_need_help
// © AUGUST 2009 - norrin

private ["_can_revive","_can_revive_2","_goto_revive_distance","_AI_smoke","_AI_cover","_call_for_AI_help","_smoke_shell_types","_helpComments","_revive_units","_potential_revivers","_possible_reviver","_reviver","_mags","_smoke_rounds"];

_unit 						= player;
_can_revive 				= Norrn_revive_array select 18;
_can_revive_2 				= Norrn_revive_array select 19;
_can_be_revived 			= Norrn_revive_array select 20;
_can_be_revived_2 			= Norrn_revive_array select 21;
_medic_1					= Norrn_revive_array select 76;
_medic_2					= Norrn_revive_array select 77;
_goto_revive_distance 		= Norrn_revive_array select 33;
_AI_smoke 					= Norrn_revive_array select 40;
_AI_cover					= Norrn_revive_array select 50;
_call_for_AI_help 			= Norrn_revive_array select 59;
_medic_1					= Norrn_revive_array select 76;
_medic_2					= Norrn_revive_array select 77;
_medpacks					= Norrn_revive_array select 80;

_smoke_shell_types = ["SmokeShell","SmokeShellRed","SmokeShellGreen"];

_reviver = objNull;

if (_call_for_AI_help == 0) exitWith {titleText ["This option is not enabled in this mission","PLAIN",1]}; 

_helpComments = ["Brian_Need_help","Brian_A_little_help_here"];
_unit say (_helpComments select floor(random 2));

//create revivable unit array
_revive_units = [];
{call compile format ["if (!isNull %1) then {_revive_units = _revive_units + [%1]}", _x]} forEach NORRN_player_units;

//Find and designate reviver
if (count (nearestObjects [_unit, [_can_be_revived, _can_be_revived_2], _goto_revive_distance]) > 1) then
{	
	_potential_revivers = [];
	_potential_revivers = nearestObjects [_unit, [_can_revive, _can_revive_2, _medic_1,_medic_2], _goto_revive_distance];
	_possible_reviver = [];
	_possible_protectors =[];
	
	{if (_x in _revive_units) then {if (!(_x getVariable "NORRN_AI_help") && !(_x getVariable "NORRN_unconscious") && _medpacks == 0 || !(_x getVariable "NORRN_AI_help") && !(_x getVariable "NORRN_unconscious") && _medpacks == 1 && (_x getVariable "NORRN_medpacks") > 0) then {_possible_reviver = _possible_reviver + [_x]}}}forEach _potential_revivers;
	{if (_x in _revive_units) then {if (!(_x getVariable "NORRN_AI_help") && !(_x getVariable "NORRN_unconscious")) then {_possible_protectors = _possible_protectors + [_x]}}}forEach _potential_revivers;	
	
	if ((count _possible_reviver) > 0) then
	{	
		_reviver = _possible_reviver select 0;
		titleCut [format ["\n\nCalling %1 for help", name _reviver], "PLAIN", 0.5];
		_reviver setVariable ["NORRN_AI_help", true, true];
		
		Norrn_helper_list = Norrn_helper_list + [(_reviver)];
		
		if (!isplayer _reviver) then 
		{
			
			//Instruct stopped AI unit to move
			if (currentCommand _reviver  == "stop")then
			{	
				if (!local _reviver) then 
				{
					_reviver setVehicleInit "[this] join grpNull";
					processInitCommands;
				}else{ 
					[_reviver] join grpNull;
				};
			};
			
			//move AI reviver to unconscious body (_unit)			
			call compile format ["_reviver setVehicleInit 'this doMove (getPos %1)'", _unit];
			processInitCommands; 
			
			//Added helper throw smmoke
			if (_AI_smoke == 1) then
			{	
				//check to see if the reviver has smoke
				_mags = magazines _reviver;
				_smoke_rounds = [];
				{if (_x in _smoke_shell_types) then {_smoke_rounds = _smoke_rounds + [_x]}} forEach _mags;	

				//healer throws smoke
				if (count _smoke_rounds > 0) then {[_reviver, _smoke_rounds] spawn Norrn_AI_throwSmoke;};
			};		
		}else
		{
			//call compile format ["_reviver setVehicleInit 'if (this == %1) then {titleText [''%2 has called for help'',''PLAIN'', 1]}'", _reviver, (name player)];
			call compile format ["_reviver setVehicleInit 'hint ''%1 has called for help \nCheck map if markers are enabled for wounded players position'''", name player]; 
			processInitCommands;
			hint "";
		};
	};
	_possible_protectors = _possible_protectors - [_reviver ];
	if ((count _possible_protectors) > 1 && _AI_cover == 1) then
	{
		_goto_protector =  _possible_protectors select 0;	
		
		if (!isplayer _goto_protector) then
		{	
		
			//Instruct stopped AI unit to move
			if (currentCommand _goto_protector == "stop")then
			{	
				if (!local _goto_protector) then 
				{
					_goto_protector setVehicleInit "[this] join grpNull";
					processInitCommands;
				}else{ 
					[_goto_protector] join grpNull;
				};
			};
			
			//move AI cover unit to unconscious body
			call compile format ["_goto_protector setVehicleInit 'this doMove [((getPos %1) select 0) + 5, ((getPos %1) select 1) + 5, ((getPos %1) select 2)]'", _unit];
			processInitCommands;
		};
	};		
};

[_reviver,_unit] execVM "f\revive\functions\wait_check.sqf";

if (true) exitWith {};
// file last edited 240609