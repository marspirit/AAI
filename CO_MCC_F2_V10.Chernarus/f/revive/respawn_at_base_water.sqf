/*

RESPAWN AT BASE SCRIPT (WATER)

© DECEMBER 2007 norrin 
****************************************************************************
respawn_at_base_water.sqf
*/

_name = _this select 0;


titlecut ["","PLAIN",5];
_water = false;
_zzzz = 0;

sleep 3;

while{surfaceIsWater (getPos player)} do
{	
			_downed_x = getPos _name select 0;
			_downed_y = getPos _name select 1;
			_center_x = getMarkerPos "center" select 0;
			_center_y = getMarkerPos "center" select 1;
						
			while {surfaceIsWater [_downed_x, _downed_y]} do
			{
				if (_zzzz == 0) then {titlecut ["Your body is washing ashore please wait","BLACK FADED",5]};
				
				sleep 0.01;
				if (_downed_x > _center_x) then 
				{
					_downed_x = _downed_x - 25;
					sleep 0.01;
					_name setPos [_downed_x, _downed_y];
					sleep 0.01;
				};
				if (_downed_y > _center_y) then 
				{
					_downed_y = _downed_y - 25;
					sleep 0.01;
					_name setPos [_downed_x, _downed_y];
					sleep 0.01;
				};
				if (_downed_x < _center_x) then 
				{
					_downed_x = _downed_x + 25;
					sleep 0.01;
					_name setPos [_downed_x, _downed_y];
					sleep 0.01;
				};
				if (_downed_y < _center_y) then 
				{
					_downed_y = _downed_y + 25;
					sleep 0.01;
					_name setPos [_downed_x, _downed_y];
					sleep 0.01;
				};
			_zzzz = _zzzz + 1;					
			sleep 0.1;
			};
};
_body = player;
//player setdamage 1;
waitUntil {alive player};
//deleteVehicle _body; 

if(true) exitWith {};