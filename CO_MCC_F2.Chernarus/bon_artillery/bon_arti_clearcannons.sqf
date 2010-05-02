//by Bon_Inf*
disableSerialization;

_dlg = findDisplay 999900;
_listbox = _dlg displayCtrl 999904;

_requestor = player;

_req_cannons = player getVariable "requesting_cannons";
_cannons_to_clear = _req_cannons;
_cannons_cleared = [];
{
	_cannons_to_clear = _cannons_to_clear - [_x+1];
	_cannons_cleared = _cannons_cleared + [_x+1];
	_old_conf = _requestor getVariable format["Cannon%1",_x+1];
	_old_shells = _old_conf select 3;
	arty_CurrNrShellsTotal = arty_CurrNrShellsTotal - _old_shells;
	_requestor setVariable [format["Cannon%1Summary",_x+1],nil,true];
} foreach lbSelection _listbox;
_requestor setVariable ["requesting_cannons",_cannons_to_clear,true];

ctrlSetText [999913,format["\n\nCannons %1 resetted.",_cannons_cleared]];

if(arty_CurrNrShellsTotal > (Server getVariable "arty_shellsleft")) then{
	ctrlEnable [999914,false];
	(_dlg displayCtrl 999901) ctrlSetTextColor [1,0,0,1];
} else{
	ctrlEnable [999914,true];
	(_dlg displayCtrl 999901) ctrlSetTextColor [1,1,1,1];
};

if(true) exitwith{};