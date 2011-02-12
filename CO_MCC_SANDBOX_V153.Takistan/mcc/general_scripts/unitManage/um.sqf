#define MCC_PLAYERS 7060
disableSerialization;

private ["_type", "_name", "_worldPos"];

_type = _this select 0;
UMName =  UMunitsNames select (lbCurSel MCC_PLAYERS); 

if (_type == 0) then	//Teleport
	{
	hint "Click on the map"; 
	onMapSingleClick " 	hint format ['Unit: %1 teleported', UMName];
						[0, {_this}, [UMName setpos _pos]] call CBA_fnc_globalExecute;
						onMapSingleClick """";";
	};
	
if (_type == 1) then	//Teleport to LHD
	{
	_worldPos = deck modelToWorld [0,0,0];
	[0, {_this}, [UMName setPosASL [_worldPos select 0, _worldPos select 1, 15.9]]] call CBA_fnc_globalExecute;
	};