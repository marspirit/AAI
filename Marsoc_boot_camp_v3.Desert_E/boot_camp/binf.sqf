if(not isServer) exitWith{}; //run only onserver
binf_trig=1; // keep triger run once for eacb group inside the killhouse
_seconds= 0; //init seconds counts
server globalchat  "Basic infantry course reset";

while {binf_trig <2} do //count the seconds while having fun
	{
	 sleep 1;
	 _seconds=_seconds+1;
	 };
_seconds1=_seconds;
server globalchat  "Basic infantry first one finished";
while {binf_trig <3} do //count the seconds while having fun
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

_hours1 = floor(_seconds1 / 3600); //format seconds for readable time
_seconds1 = _seconds1 - (_hours1 * 3600);
_tensOfMinutes1 = floor(_seconds1 / 600);
_seconds1 = _seconds1 - (_tensOfMinutes1 * 600);
_minutes1 = floor(_seconds1 / 60);
_seconds1 = _seconds1 - (_minutes1 * 60);
_tensOfSeconds1 = floor(_seconds1 / 10);
_wholeSeconds1 = floor(_seconds1 - (_tensOfSeconds1 * 10));
["chat_binf", [_hours1, _tensOfMinutes1, _minutes1,
	_tensOfSeconds1, _wholeSeconds1, _hours, _tensOfMinutes, _minutes,
	_tensOfSeconds, _wholeSeconds]] call CBA_fnc_globalEvent;
binf_trig=0;
