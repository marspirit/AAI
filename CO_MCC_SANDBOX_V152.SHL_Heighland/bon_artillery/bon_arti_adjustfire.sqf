//by Bon_Inf*
#include "dialog\definitions.sqf"
disableSerialization;

private ['_splashpos'];

_requestor = player;
_dlg = findDisplay BON_ARTY_DIALOG;

arti_already_adjusting = true;

// read out the dialog input
_spotter_xpos = (parseNumber ctrlText (_dlg displayCtrl BON_ARTY_XRAYEDIT)) mod 100000;
_spotter_ypos = (parseNumber ctrlText (_dlg displayCtrl BON_ARTY_YANKEEEDIT)) mod 100000;
_degrees = (parseNumber ctrlText (_dlg displayCtrl BON_ARTY_DIRECTION)) mod 360;
_distance = abs (parseNumber ctrlText (_dlg displayCtrl BON_ARTY_DISTANCE));
_height_disp = abs sliderPosition BON_ARTY_HEIGHT;
_firedelay = abs (parseNumber ctrlText (_dlg displayCtrl BON_ARTY_DELAYEDIT));
_x_correction = parseNumber ctrlText (_dlg displayCtrl BON_ARTY_XCORRECTION);
_y_correction = parseNumber ctrlText (_dlg displayCtrl BON_ARTY_YCORRECTION);

arty_LastData = [_spotter_xpos,_spotter_ypos,_degrees,_distance,_height_disp,_firedelay];

_splashpos = _requestor getVariable "Arti_adj_splashpos";
if(isNil "_splashpos") then{
	_splashpos = [_spotter_xpos,_spotter_ypos,_degrees,_distance,_height_disp] call arti_func_getSplashPos;
	_splashpos = [(_splashpos select 0) + 25 - random 50,(_splashpos select 1) + 25 - random 50,_splashpos select 2];
};

_modelpos = _requestor worldToModel _splashpos;
_modelpos = [(_modelpos select 0) + _x_correction, (_modelpos select 1) + _y_correction, _modelpos select 2];
_splashpos = _requestor modelToWorld _modelpos;
_requestor setVariable ["Arti_adj_splashpos",_splashpos,false];

closeDialog 0;

sleep (15 + random 5);
_adjustround = "SmokeShellRed" createVehicle [_splashpos select 0,_splashpos select 1,0];
sleep 3;
deleteVehicle _adjustround;
sleep 20;
arti_already_adjusting = false;

if(true) exitWith{};