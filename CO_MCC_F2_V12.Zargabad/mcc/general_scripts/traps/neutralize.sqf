private ["_suspect","_rand"];
_suspect = _this select 0;
_men = _this select 1;
_index = _this select 2;
_rand= random 10;
_randsound = random 10;

if (_men distance _suspect <=8) then 
	{
	if (_randsound > 5) then {_men say ["hands",1]} else {_men say ["dontmove",1]};
	sleep 1;
		if (_rand > 7) then {
								if (_randsound > 5) then {_suspect say ["dontshot",1]} else {_suspect say ["enough",1]};
								removeAllWeapons _suspect;
								_suspect disableAI "ANIM";
								_suspect switchmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
								sleep 1;
								_suspect setvariable ["armed",false,true];
								_suspect removeaction _index;
								} else
									{
									if (_randsound > 5) then {_suspect say ["hell",1]} else {_suspect say ["alone",1]};
									sleep 1;
									};
									
										
					
	}
	else {hint "To far to neutralize"};
						
																
