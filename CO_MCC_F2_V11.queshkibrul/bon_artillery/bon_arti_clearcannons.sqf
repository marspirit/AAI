//by Bon_Inf*
#include "dialog\definitions.sqf"
disableSerialization;

_dlg = findDisplay BON_ARTY_DIALOG;
_listbox = _dlg displayCtrl BON_ARTY_CANNONLIST;

_requestor = player;

_req_cannons = player getVariable "requesting_cannons";
_cannons_to_clear = _req_cannons;
_cannons_cleared = [];
{
	_cannons_to_clear = _cannons_to_clear - [_x+1];
	_cannons_cleared = _cannons_cleared + [_x+1];

	_old_conf = _requestor getVariable format["Arti_%2_Cannon%1",_x+1,playerSide];
	if(not isNil "_old_conf") then{
		_old_shells = _old_conf select 3;
		arty_CurrNrShellsTotal = arty_CurrNrShellsTotal - _old_shells;
	};

	_requestor setVariable [format["Arti_%2_Cannon%1Summary",_x+1,playerSide],nil,false];
	_requestor setVariable [format["Arti_%2_Cannon%1",_x+1,playerSide],nil,true];
} foreach lbSelection _listbox;
_requestor setVariable ["requesting_cannons",_cannons_to_clear,true];

ctrlSetText [BON_ARTY_SUMMARY,format["\n\nCannons %1 resetted.",_cannons_cleared]];

if(arty_CurrNrShellsTotal > (Server getVariable format["Arti_%1_shellsleft",playerSide])) then{
	ctrlEnable [BON_ARTY_REQUESTBUTTON,false];
	(_dlg displayCtrl BON_ARTY_SHELLSLEFT) ctrlSetTextColor [1,0,0,1];
} else{
	ctrlEnable [BON_ARTY_REQUESTBUTTON,true];
	(_dlg displayCtrl BON_ARTY_SHELLSLEFT) ctrlSetTextColor [1,1,1,1];
};

if(true) exitwith{};