// wait_check
// © MAY 2009 - norrin

private ["_reviver","_d","_name"];

_reviver 	= _this select 0;
_unit 		= _this select 1;
_name 		= name _reviver;
_d 			= 0;

if (!isNull _reviver) then
{	
	waitUntil {!(_unit getVariable "NORRN_unconscious") || !alive _reviver || !(_reviver getVariable "NORRN_AI_help")};
	_reviver setVehicleInit "this doMove (getPos this);";
	processInitCommands;
	
	if (!alive _reviver && dialog) then 
	{
		titleCut[format ["Oh no %1 is down, you will need to call for help again", _name], "PLAIN", 1];
		Norrn_helper_list = Norrn_helper_list - [_reviver];
	};
	
	if (!isNull _unit && alive _reviver && dialog) then
	{ 
		if (!(_reviver getVariable "NORRN_AI_help") && (unconscious_body distance _reviver) > 4.5) then 
		{
			titleCut [format ["%1 is helping another unit you will need to call for help again", (name _reviver)],"PLAIN", 1];
			Norrn_helper_list = Norrn_helper_list - [_reviver];
		};
	};
	_reviver setVariable ["NORRN_AI_help", false, true];
}else{titleCut ["No potential revivers are currently available", "PLAIN", 1]};
if (true) exitWith {};

//Last edited 06/05/09