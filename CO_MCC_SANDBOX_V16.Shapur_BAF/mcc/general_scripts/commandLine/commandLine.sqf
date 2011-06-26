#define COMMAND_LINE 7061
disableSerialization;
private ["_type"];

_type = _this select 0;
_string = ctrlText COMMAND_LINE;

switch (_type) do
{
   case 0:	//Local
	{ 
	call (compile _string); 
	};
	
   case 1:	//Global
	{ 
	[-2, {call (compile _this)}, _string] call CBA_fnc_globalExecute;
	};
};