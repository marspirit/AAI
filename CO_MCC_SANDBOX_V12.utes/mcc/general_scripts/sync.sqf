private ["_type","_d","_RainLevel","_foglevel","_cloudLevel","_weather"];

_type = _this select 0;
 
switch (_type) do
{
   case 0:
   {[0, {[_this] execVM "mcc\general_scripts\sync.sqf";},1] call CBA_fnc_globalExecute; 
   hint "Synced with the server";};
   
   case 1:
   {
   _d=date;
   ["cba_network_date", _d] call CBA_fnc_globalEvent;   
   _RainLevel = rain;
   _foglevel=fog;
   _cloudLevel = overcast;
   _weather = [_cloudLevel, _foglevel, _RainLevel];
   ['cba_network_weather', _weather] call CBA_fnc_globalEvent ;
   [-1, {[] spawn compile _this},mcc_sync] call CBA_fnc_globalExecute;
   };
 };
