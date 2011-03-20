//by Bon_Inf*
#include "dialog\definitions.sqf"
disableSerialization;

_requestor = _this;

// read out the dialog input
_dlg = findDisplay BON_ARTY_DIALOG;
_x_correction = parseNumber ctrlText (_dlg displayCtrl BON_ARTY_XCORRECTION);
_y_correction = parseNumber ctrlText (_dlg displayCtrl BON_ARTY_YCORRECTION);
_missiontype = lbText [BON_ARTY_MISSIONTYPE,lbCurSel BON_ARTY_MISSIONTYPE];
_spreadtype = lbText [BON_ARTY_SPREAD,lbCurSel BON_ARTY_SPREAD];

_message = "Polar,";
if(_x_correction != 0 || _y_correction != 0) then{
	_message = "SHIFT";
	if(_x_correction < 0) then{_message =  format["%1 Left %2,",_message,abs _x_correction]};
	if(_x_correction > 0) then{_message =  format["%1 Right %2,",_message,_x_correction]};
	if(_y_correction < 0) then{_message =  format["%1 Drop %2,",_message,abs _y_correction]};
	if(_y_correction > 0) then{_message =  format["%1 Add %2,",_message,_y_correction]};
};

if(_spreadtype == "LASER") then{_message = "Polar Laser,"};

_requestor spawn {
	[_this, ["req_unit",5]] call CBA_fnc_globalSay3d;
	//_this sideChat format["%1, this is %2, Fire Mission, OVER",HW_Arti_CallSign,group player];
	sleep (3 + random 2);
	[_this, ["req_art",5]] call CBA_fnc_globalSay3d;
	sleep (3 + random 2);
	[_this, ["request",5]] call CBA_fnc_globalSay3d;
	//[playerSide,"HQ"] sideChat format["%1, this is %2, Fire Mission, OUT",group player,HW_Arti_CallSign];
};
sleep (6 + random 6);
switch _missiontype do {
	case "ADJUSTMENT" : {
		[] execVM (BON_ARTI_PATH+"bon_arti_adjustfire.sqf");
		sleep 6;
		[_requestor, ["confirm_art",5]] call CBA_fnc_globalSay3d;
		//_requestor sideChat format["%1, this is %2, Adjustment Fire, %3 OVER",HW_Arti_CallSign,group _requestor,_message];
		sleep (5 + random 2);
		//[playerSide,"HQ"] sideChat format["%1, this is %2, Adjustment Fire, %3 OUT",group _requestor,HW_Arti_CallSign,_message];
	};

	case "FOR EFFECT" : {
		CloseDialog 0;
		// initiate fire mission
		if(isServer) then{[_requestor,playerSide] execVM (BON_ARTI_PATH+"bon_arti_fire.sqf")}
		else{bon_arti_execution = [_requestor,playerSide]; publicVariable "bon_arti_execution";};
		//_requestor setVehicleInit format["this execVM '%1bon_arti_fire.sqf';",BON_ARTI_PATH]; processInitCommands;		
		sleep 6;
		[_requestor, ["confirm_art",5]] call CBA_fnc_globalSay3d;
		//_requestor sideChat format["%1, this is %2, Fire For Effect, %3 OVER",HW_Arti_CallSign,group _requestor,_message];
		sleep (2 + random 2);
		[_requestor, ["shot_art",5]] call CBA_fnc_globalSay3d;
		sleep (1 + random 2);
		[_requestor, ["shot_unit",5]] call CBA_fnc_globalSay3d;


		arty_LastData = nil;
	};
};

sleep 6 + random 6;
[_requestor, ["splash_art",5]] call CBA_fnc_globalSay3d;
//[playerSide,"HQ"] sideChat "Shot, Over";
sleep 1;
[_requestor, ["splash_unit",5]] call CBA_fnc_globalSay3d;
//_requestor sideChat "Shot, Out";
sleep 10;
[_requestor, ["end_mission",5]] call CBA_fnc_globalSay3d;

if(true) exitWith{};