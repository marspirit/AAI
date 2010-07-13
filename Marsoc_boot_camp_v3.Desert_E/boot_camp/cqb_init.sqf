if(not isServer) exitWith{}; //run only onserver
cqb_trig=false; // keep triger run once for eacb group inside the killhouse
_seconds= 0; //init seconds counts
_numenemy=0;
_numhostage=0;
cqb_h=0; //init hostage kills
cqb_e=0; //init enemy kills
{_x animate ["terc", 1];
} foreach doopopup;
{
if (random 3 > 1.5) then {_x animate ["terc", 0]; if (_x iskindof "ACE_Hostage_Target_4") then {_numhostage=_numhostage+1} else {_numenemy=_numenemy+1}}; 
  //randomly pop targets
} foreach doopopup;
server globalchat  "CQB range reset";

while {!cqb_trig} do //count the seconds while having fun
	{
	 sleep 1;
	 _seconds=_seconds+1;
	 };
	 
_hours = floor(_seconds / 3600); //format seconds for readable time
_seconds = _seconds - (_hours * 3600);
_tensOfMinutes = floor(_seconds / 600);
_seconds = _seconds - (_tensOfMinutes * 600);
_minutes = floor(_seconds / 60);
_seconds = _seconds - (_minutes * 60);
_tensOfSeconds = floor(_seconds / 10);
_wholeSeconds = floor(_seconds - (_tensOfSeconds * 10));
["chat_cqb", [_hours, _tensOfMinutes, _minutes,
	_tensOfSeconds, _wholeSeconds, _numhostage, _numenemy, cqb_h, cqb_e]] call CBA_fnc_globalEvent;
{
_x animate ["terc", 0];
} foreach doopopup;
	 
