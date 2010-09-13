mcc_safe=mcc_safe + FORMAT ["
						  month=%1;
						  day=%2;
						  hour=%3;
						  minute=%4;
						  script_handler = [0] execVM 'mcc\general_scripts\time.sqf';
						  waitUntil {scriptDone script_handler};
						  "								 
						  , month
						  , day
						  , hour
						  , minute
						  ];
_d=date;
_d=[_d select 0, month, day, hour, minute];
["cba_network_date", _d] call CBA_fnc_globalEvent;



