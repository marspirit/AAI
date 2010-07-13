if(not isServer) exitWith{}; //run only onserver
_seconds= 0; //init seconds counts
_numenemy=60;
c360_h=0; //init hostage kills
c360_e=0; //init enemy kills
_d= "meduim";
{_x animate ["terc", 1];} foreach c360;
server globalchat  "C360 range reset";

for [{_i=1},{_i<=20},{_i=_i+1}] do   //Start poping targets
	{
	 _seconds=_seconds+5;
	 _targ1 = c360 select (floor random (count c360)-1);
	 _targ1 animate ["terc", 0];
	 ["say", [_targ]] call CBA_fnc_globalEvent;
	 sleep 1;
	 _targ2 = c360 select (floor random (count c360)-1);
	 _targ2 animate ["terc", 0];
	 ["say", [_targ]] call CBA_fnc_globalEvent;
	 sleep 1;
	 _targ3 = c360 select (floor random (count c360)-1);
	 _targ3 animate ["terc", 0];
	 ["say", [_targ]] call CBA_fnc_globalEvent;
	  sleep 3;
	 _targ1 animate ["terc", 1]; 
	 _targ2 animate ["terc", 1];
	 _targ3 animate ["terc", 1];
	 
	 };
	 
_hours = floor(_seconds / 3600); //format seconds for readable time
_seconds = _seconds - (_hours * 3600);
_tensOfMinutes = floor(_seconds / 600);
_seconds = _seconds - (_tensOfMinutes * 600);
_minutes = floor(_seconds / 60);
_seconds = _seconds - (_minutes * 60);
_tensOfSeconds = floor(_seconds / 10);
_wholeSeconds = floor(_seconds - (_tensOfSeconds * 10));
_p=(c360_e/_numenemy)*100;
["chat_c360", [_hours, _tensOfMinutes, _minutes,
	_tensOfSeconds, _wholeSeconds, c360_e, _numenemy, _d, _p]] call CBA_fnc_globalEvent;
{
_x animate ["terc", 0];
} foreach c360;
	 
