#include "script_component.hpp"

private ["_slam"];
_slam = _this select 0;
//_trigger = nearestObject [(getpos _slam), "LAND"];
if (isNull _slam) exitwith { false };

_dir = direction _slam;
_slam_bum_fight = "ACE_ClaymoreExplosion" createVehicle [(position _slam) select 0,(position _slam) select 1, (0.8 + ([_slam] call CBA_fnc_realHeight))];

_slam_bum = "Sh_125_SABOT" createVehicle [(position _slam) select 0,(position _slam) select 1, (0.8 + ([_slam] call CBA_fnc_realHeight))];
_slam_bum setDir _dir;
_slam_bum setVelocity [(sin _dir) * 200, (cos _dir) * 200, ((vectorDir _slam) select 2) * 200];

deleteVehicle _slam;
