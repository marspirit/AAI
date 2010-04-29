//by Bon_Inf*
disableSerialization;

arty_Type = 0;
arty_NrShells = 1;
arty_Spread = 0;
arty_CurrNrShellsTotal = 0;

// First we register for the artillery.
// There won't be two units setting up arty at the same time.
_arty_requestor = Server getVariable "arty_requestor";
if(not (isNull _arty_requestor) && alive _arty_requestor && isPlayer _arty_requestor && not (player == _arty_requestor)) exitWith{[WEST,"HQ"] sideChat format["Negative. %1 has registered for a fire mission already.",name _arty_requestor]; CloseDialog 0;};
Server setVariable ["arty_requestor",player,true];
if(_arty_requestor != player) then{[WEST,"HQ"] sideChat "You are registered for Fire Mission."};

_artidialog = findDisplay 999900;

ctrlSetText [999901,format["Shells left for this hour: %1",Server getVariable "arty_shellsleft"]];
ctrlSetText [999902,format["x-ray: %1",round (getPos player select 0)]];
ctrlSetText [999903,format["yankee: %1",round (getPos player select 1)]];

_ctrlListBox = _artidialog displayCtrl 999904;
lbClear _ctrlListBox;
for "_i" from 1 to HW_Arti_CannonNumber do{
	_ctrlListBox lbAdd format["Cannon %1",_i];
	_cannon_available = Server getVariable format["Cannon%1_available",_i];
	if(not _cannon_available) then{_ctrlListBox lbSetColor [_i-1,[1.0, 0.35, 0.3, 1]];};
	[_i,_ctrlListBox] spawn {
		disableSerialization;
		_cannon2update = _this select 0;
		_ctrlListBox = _this select 1;
		While{sleep 1; dialog} do {
			_cannon_available = Server getVariable format["Cannon%1_available",_cannon2update];
			if(_cannon_available) then{_ctrlListBox lbSetColor [_cannon2update-1,[1, 1, 1, 1]]};
		};
	};
};

sliderSetRange [999909,-50,0];
sliderSetPosition [999909,0];

[] spawn {
	While{sleep 0.12; dialog} do{
		ctrlSetText [999910,format["%1m",round abs sliderPosition 999909]];
	};
};

if(not isNil "arty_LastData") then{
	_req_cannons = player getVariable "requesting_cannons";
	ctrlSetText [999905,format["%1",arty_LastData select 0]]; //xpos
	ctrlSetText [999906,format["%1",arty_LastData select 1]]; //ypos
	ctrlSetText [999907,format["%1",arty_LastData select 2]]; //degrees
	ctrlSetText [999908,format["%1",arty_LastData select 3]]; //distance
	sliderSetPosition [999909,(arty_LastData select 4)*-1]; //height_disp
	ctrlSetText [999911,format["%1",arty_LastData select 5]]; //firedelay
};