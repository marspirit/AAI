private ["_type","_d","_RainLevel","_foglevel","_cloudLevel","_weather","_footer","_x", "_html", "_loop"];

_type = _this select 0;
 
switch (_type) do
{
   case 0:
	{	
		mcc_sync_status = false; 
		[0, {[_this] execVM "mcc\general_scripts\sync.sqf";},1] call CBA_fnc_globalExecute; 
		_ok = [] spawn compile mcc_sync;
		_loop = 10; 
		for [{_x=1},{_x<=_loop},{_x=_x+1}]  do //Create progress bar
		{
			_footer = [_x,_loop] call BIS_AdvHints_createCountdownLine;
			//add header
			_html = "<t color='#818960' size='0.85' shadow='0' align='left'>" + "Synchronizing with server" + "</t><br/><br/>";
			//add _text
			_html = _html + "<t color='#a9b08e' size='1' shadow='0' shadowColor='#312100' align='left'>" + "Wait a moment, Synchronizing with the server" + "</t>";
			//add _footer
			_html = _html + "<br/><br/><t color='#818960' size='0.85' shadow='0' align='right'>" + _footer + "</t>";
			hintsilent parseText(_html);
			sleep 0.3;
			if (!scriptdone _ok) then {sleep 1}; 
		};
		Hint "Synchronizing Done";		
	};
   
   case 1:
   {
		sleep 10;
	   _d=date;
	   ["cba_network_date", _d] call CBA_fnc_globalEvent;   
	   _RainLevel = rain;
	   _foglevel=fog;
	   _cloudLevel = overcast;
	   _weather = [_cloudLevel, _foglevel, _RainLevel];
	   ['cba_network_weather', _weather] call CBA_fnc_globalEvent ;
	   [-1, {mcc_sync = _this select 0;mcc_missionmaker = _this select 1; mcc_sync_status = true},[mcc_sync, mcc_missionmaker]] call CBA_fnc_globalExecute;
	};
 };
