//by Bon_Inf*
#include "definitions.sqf"
disableSerialization;

arty_Type = 0;
arty_NrShells = 1;
arty_Spread = 0;
arty_CurrNrShellsTotal = 0;
arty_xcorrection = 0;
arty_ycorrection = 0;

_artidialog = findDisplay BON_ARTY_DIALOG;

_shellsleft = Server getVariable format["Arti_%1_shellsleft",playerSide];
ctrlSetText [BON_ARTY_SHELLSLEFT,format["Shells left for this hour: %1",_shellsleft]];
ctrlSetText [BON_ARTY_XRAY,format["x-ray: %1",round (getPos player select 0)]];
ctrlSetText [BON_ARTY_YANKEE,format["yankee: %1",round (getPos player select 1)]];

_ctrlListBox = _artidialog displayCtrl BON_ARTY_CANNONLIST;
lbClear _ctrlListBox;
for "_i" from 1 to HW_Arti_CannonNumber do{
	_ctrlListBox lbAdd format["Cannon %1",_i];
	_cannon_available = Server getVariable format["Arti_%2_Cannon%1_available",_i,playerSide];
	if(not _cannon_available) then{_ctrlListBox lbSetColor [_i-1,[1.0, 0.35, 0.3, 1]];};
	[_i,_ctrlListBox] spawn {
		disableSerialization;
		_cannon2update = _this select 0;
		_ctrlListBox = _this select 1;
		While{sleep 1; dialog} do {
			_cannon_available = Server getVariable format["Arti_%2_Cannon%1_available",_cannon2update,playerSide];
			if(_cannon_available) then{_ctrlListBox lbSetColor [_cannon2update-1,[1, 1, 1, 1]]};
		};
	};
};


[] spawn {
	while{dialog} do {
		if(arti_already_adjusting) then{
			ctrlEnable [BON_ARTY_ADJUSTBUTTON, false];
		} else {
			ctrlEnable [BON_ARTY_ADJUSTBUTTON, true];
		};
		sleep 1;
	};
};

_comboBox = _artidialog displayCtrl BON_ARTY_TYPE;
lbClear _comboBox;
{
	_displayname = _x select 0;
	_comboBox lbAdd _displayname;
} foreach HW_arti_types;
_comboBox lbSetCurSel 0;

_comboBox = _artidialog displayCtrl BON_ARTY_NRSHELLS;
lbClear _comboBox;
for "_i" from 1 to HW_arti_maxnrshells do {
	_comboBox lbAdd str _i
};
_comboBox lbSetCurSel 0;

_comboBox = _artidialog displayCtrl BON_ARTY_SPREAD;
lbClear _comboBox;
{
	_displayname = _x select 0;
	_comboBox lbAdd _displayname;
} foreach HW_arti_spreads;
_comboBox lbSetCurSel 0;

_comboBox = _artidialog displayCtrl BON_ARTY_MISSIONTYPE;
lbClear _comboBox;
{
	_displayname = _x;
	_comboBox lbAdd _displayname;
} foreach ["FOR EFFECT","ADJUSTMENT"];
_comboBox lbSetCurSel 0;

sliderSetRange [BON_ARTY_HEIGHT,-50,0];
sliderSetPosition [BON_ARTY_HEIGHT,0];

[] spawn {
	While{sleep 0.12; dialog} do{
		ctrlSetText [BON_ARTY_HEIGHTINDEX,format["%1m",round abs sliderPosition BON_ARTY_HEIGHT]];
	};
};

if(not isNil "arty_LastData") then{
	_req_cannons = player getVariable "requesting_cannons";
	ctrlSetText [BON_ARTY_XRAYEDIT,format["%1",arty_LastData select 0]]; //xpos
	ctrlSetText [BON_ARTY_YANKEEEDIT,format["%1",arty_LastData select 1]]; //ypos
	ctrlSetText [BON_ARTY_DIRECTION,format["%1",arty_LastData select 2]]; //degrees
	ctrlSetText [BON_ARTY_DISTANCE,format["%1",arty_LastData select 3]]; //distance
	sliderSetPosition [BON_ARTY_HEIGHT,(arty_LastData select 4)*-1]; //height_disp
	ctrlSetText [BON_ARTY_DELAYEDIT,format["%1",arty_LastData select 5]]; //firedelay
};