private ["_suspect","_men","_index","_rand"];
_suspect = _this select 0;
_men = _this select 1;
_index = _this select 2;
_rand= random 10;

if (!natureIsRuning) then
	{
	natureIsRuning = true; 
	if (_men distance _suspect <=10) then 
		{
		if (random 10 > 5) then {[[_men], ["hands",5]] call CBA_fnc_globalSay} else {[[_men], ["dontmove",5]] call CBA_fnc_globalSay};
		sleep 2;
			if (_rand > 2) then {
									if (random 10 > 5) then {[[_suspect], ["dontshot",5]] call CBA_fnc_globalSay} else {[[_suspect], ["enough",5]] call CBA_fnc_globalSay};
									removeAllWeapons _suspect;
									_suspect switchmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
									sleep 1;
									_suspect setvariable ["armed",false,true];
									_suspect removeaction _index;
									_suspect addaction ["Order to follow","mcc\general_scripts\hostages\hostage.sqf"];
									} else
										{
										if (random 10 > 5) then {[[_suspect], ["hell",5]] call CBA_fnc_globalSay} else {[[_suspect], ["alone",5]] call CBA_fnc_globalSay};
										sleep 1;
										};
		natureIsRuning = false;				
		}
		else {hint "To far to neutralize"};
	};
							
																
