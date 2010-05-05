// Norrn_UncAnimFix
// © JANUARY 2009 - norrin

private["_name","_pos","_center_x","_center_y","_radius","_angle","_found_it","_set_pos","_x1","_y1","_slope"];

_name = _this select 0;
_pos =  _this select 1;  

_name setCaptive true;
_center_x = _pos select 0;
_center_y = _pos select 1;
_radius = 500;
_angle = 0;
_found_it = false;
_set_pos = [(_pos select 0) - 500, _pos select 1];

while {_angle <= 350 && !_found_it} do 
{
	_x1 = _center_x - (_radius * sin _angle);
	_y1 = _center_y - (_radius * cos _angle);
	_slope = [[_x1, _y1, 0], 1] call GetTerrainSlope;
	if (!(surfaceiswater [_x1, _y1])&& _slope < 0.78) then 
	{
		_set_pos = [_x1, _y1];
		_found_it = true;
	};
	_angle = _angle + 10;
};
	
if (_angle == 360) then {_set_pos = NORRN_respawn_mrkr};
_name setPos [_set_pos select 0, _set_pos select 1, 0];

//file created 080109
