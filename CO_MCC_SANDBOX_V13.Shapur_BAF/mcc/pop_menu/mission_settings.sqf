#define SET_MONTH 3250
#define SET_HOUR 3251
#define SET_DAY 3252
#define SET_MINUTE 3253
#define SET_WEATHER 3254
#define SET_FOG 3255

#define SET_GRASS 3260
#define SET_VIEW 3261

private ["_weather","_type", "_grass","_fogLevel","_d"];
_type = _this select 0;

switch (_type) do
	{
		case 0:	//Set fog
		{
			_fogLevel = (fog_array select (lbCurSel SET_FOG)) select 1;
			fog_index=lbCurSel SET_FOG;
			[-2, {20 setFog _this}, _fogLevel] call CBA_fnc_globalExecute;
			mcc_safe=mcc_safe + FORMAT ["
						  _fogLevel=%1;
						 [-2, {60 setFog _this}, _fogLevel] call CBA_fnc_globalExecute;
						  "								 
						  , _fogLevel
						  ];
		};
		
		case 1:	//Set time
	   	{
			month = (months_array select (lbCurSel SET_MONTH)) select 1;
			day = (days_array select (lbCurSel SET_DAY));
			hour = (hours_array select (lbCurSel SET_HOUR)) select 1;
			minute = (minutes_array select (lbCurSel SET_MINUTE));
			nul=[0] execVM "mcc\general_scripts\time.sqf";
			moths_index=lbCurSel SET_MONTH;
			day_index=lbCurSel SET_DAY;
			hours_index=lbCurSel SET_HOUR;
			minutes_index=lbCurSel SET_MINUTE;
		};
		
		case 2:	//Set weather
		{
			_weather = (weather_array select (lbCurSel SET_WEATHER)) select 1;
			nul=[1,_weather] execVM "mcc\general_scripts\time.sqf";
			weather_index=lbCurSel SET_WEATHER;
		};
		
		case 3:	//Set grass (CS)
		{
			_grass = (grass_array select (lbCurSel SET_GRASS)) select 1;
			setTerrainGrid _grass;
		};
	
	    case 4:	//Set viewdistance (CS)
		{
		setViewDistance (view_array select (lbCurSel SET_VIEW));
		};
	 };
		