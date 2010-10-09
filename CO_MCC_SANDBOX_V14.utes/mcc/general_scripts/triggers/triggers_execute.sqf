private ["_pos","_zoneX","_zoneY","_activate","_cond","_angle","_shape","_text","_capture","_trigger","_s"];

_pos = _this select 0;	
_zoneX = _this select 1;	
_zoneY = _this select 2;	
_activate = _this select 3;	
_cond = _this select 4;	
_angle = _this select 5;	
_shape = _this select 6;	
_text = _this select 7;	
_capture = _this select 8;	
		
if (_shape == "RECTANGLE") then {_s = true} else {_s = false}; //rectangel or elipse

_trigger = createTrigger ["EmptyDetector", _pos];
_trigger setpos _pos;
_trigger setTriggerArea [_zoneX, _zoneY, _angle, _s];
_trigger setTriggerStatements ["this", format ["%1",_capture] , ""];
_trigger setTriggerText _text;
_trigger setTriggerActivation [_activate, _cond, false];
hint format ["%1", _capture];
