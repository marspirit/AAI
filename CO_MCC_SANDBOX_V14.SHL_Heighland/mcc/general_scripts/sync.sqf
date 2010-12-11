private ["_type","_d","_RainLevel","_foglevel","_cloudLevel","_weather"];

_type = _this select 0;
 
switch (_type) do
{
   case 0:
   {	
	   mcc_sync_status = false; 
	   [0, {[_this] execVM "mcc\general_scripts\sync.sqf";},1] call CBA_fnc_globalExecute; 
	   hintsilent "Synchronizing with the server...";
	   WaitUntil{mcc_sync_status};
	   [] spawn compile mcc_sync;
	    hint "Sync Complete";
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
