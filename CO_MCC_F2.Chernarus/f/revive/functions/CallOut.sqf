// Norrn_CallOut
// © October 2009 - norrin

private ["_unconscious_body"];

_call_out_function 	=  NORRN_revive_array select 6;
_unconscious_body 	= _this select 0;

_ran = floor(random 11);
if (_call_out_function == 1) then 
{ 
	_unconscious_body say (commentsBrian select _ran);
	r_say = [_unconscious_body, _ran];
	publicVariable "r_say";
};

20 + ceil(random 10);

//file modified 191009