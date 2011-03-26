private ["_type","_weather"];
_type = _this select 0;

switch (_type) do
	{
		case 0:	//Set time
		{
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
		};
		
		case 1:	//Set weather
	   	{
			_weather = _this select 1;
			["cba_network_weather", _weather] call CBA_fnc_globalEvent ;
			mcc_safe=mcc_safe + FORMAT ["
							_weather=%1;
							script_handler = [1,_weather] execVM 'mcc\general_scripts\time.sqf';
							waitUntil {scriptDone script_handler};
							"								 
							, _weather
							];
		};
	};







