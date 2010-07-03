#include "script_component.hpp"

private ["_action_id","_claymore"];
_ar = _this;
if ((count _this) > 1) then {
	_action_id = _this select 2;
	_claymore = _this select 3;
	player removeAction _action_id;
} else {
	_claymore = _this select 0;
};

if (isNull _claymore) exitwith { false };

_position = position _claymore;
_z = [_claymore] call CBA_fnc_realHeight;
_position = [_position select 0,_position select 1, _z];
_direction = direction _claymore; 
_pitch = 0;
deleteVehicle _claymore;
"ACE_ClaymoreExplosion" createVehicle [_position select 0,_position select 1, _z + 0.2];

// Takes a little while for the claymore to actually explode
sleep 0.18;

{ // Extract our pitch from public CurrentPitches
	if (_x select 0 == _claymore) then { _pitch = (-(_x select 2)); };
} forEach ClaymoreDetails;

// Calculate the needed upwards force
// Two meter high spread at 50 meters
_muzzle_velocity = 1200;
_target_distance = 50;
_emit_height = 0.093;
_target_height = 2 - _emit_height;

_degree = (_target_distance * (2 * 3.141592)) / 360;

_aiming_point = _target_height + (_target_distance / _muzzle_velocity) * 9.8;
_shrapnel_angle = _aiming_point / _degree;
_pitch = _pitch + _shrapnel_angle;
_forward_velocity = _muzzle_velocity * cos _pitch;
_upward_velocity = _muzzle_velocity * sin _pitch;
_shrapnel_random = _muzzle_velocity * sin _shrapnel_angle;

//q1184 - spawning pellets in two frames to go easy on fps
[_position, _direction, 60, _forward_velocity, _emit_height, 250, _upward_velocity, "ACE_B_BallBearing", _shrapnel_random] call ace_sys_explosives_fnc_claymore_spawnpellets;
sleep 0.02;
[_position, _direction, 60, _forward_velocity, _emit_height, 250, _upward_velocity, "ACE_B_BallBearing", _shrapnel_random] call ace_sys_explosives_fnc_claymore_spawnpellets;
