#define SET_MONTH 3250
#define SET_HOUR 3251
#define SET_DAY 3252
#define SET_MINUTE 3253
#define SET_WEATHER 3254

#define SET_GRASS 3260
#define SET_VIEW 3261

private ["_weather","_type", "_grass"];
_type = _this select 0;

if (_type==1) then 
		{
		month = (months_array select (lbCurSel SET_MONTH)) select 1;
		day = (days_array select (lbCurSel SET_DAY));
		hour = (hours_array select (lbCurSel SET_HOUR)) select 1;
		minute = (minutes_array select (lbCurSel SET_MINUTE));
		nul=[] execVM "mcc\general_scripts\time.sqf";
		moths_index=lbCurSel SET_MONTH;
		day_index=lbCurSel SET_DAY;
		hours_index=lbCurSel SET_HOUR;
		minutes_index=lbCurSel SET_MINUTE;
		};
if (_type==2) then 
		{
		_weather = (weather_array select (lbCurSel SET_WEATHER)) select 1;
		["cba_network_weather", _weather] call CBA_fnc_globalEvent ;
		weather_index=lbCurSel SET_WEATHER;
		mcc_safe=mcc_safe + FORMAT ["
						  _weather=%1;
						  ['cba_network_weather', _weather] call CBA_fnc_globalEvent ;
						  sleep 1;
						  "								 
						  , _weather
						  ];
		};
if (_type==3) then 
		{
		_grass = (grass_array select (lbCurSel SET_GRASS)) select 1;
		setTerrainGrid _grass;
		};
if (_type==4) then 
		{
		setViewDistance (view_array select (lbCurSel SET_VIEW));
		};

		