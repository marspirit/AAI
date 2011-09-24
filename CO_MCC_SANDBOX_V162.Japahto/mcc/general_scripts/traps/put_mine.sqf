//Made by Shay_Gman (c) 09.10
private ["_pos", "_trapkind", "_iedMarkerName", "_fakeIed", "_eib_marker","_zoneCenter","_zoneX","_zoneY","_startingPos","_visable",
		"_mcc_zone_pos","_mcc_zone_size","_mineClass"]; 
disableSerialization;

_pos = _this select 0; 
_trapkind = _this select 1; 
_iedMarkerName = _this select 2;
_mcc_zone_pos = _this select 3;
_mcc_zone_size = _this select 4;
_startingPos = []; 

if (_trapkind=="apv" || _trapkind=="ap" || _trapkind=="atv" || _trapkind=="at") then
	{
	if (_trapkind=="apv") then {_trapkind ="ACE_BBetty_burried_Editor"; _visable = true;};
	if (_trapkind=="ap") then {_trapkind ="ACE_BBetty_burried_Editor"; _visable = false;};
	if (_trapkind=="atv") then {_trapkind ="MineE"; _visable = true;};
	if (_trapkind=="at") then {_trapkind ="MineE"; _visable = false;};
	_zoneX = _mcc_zone_size select 0;
	_zoneY = _mcc_zone_size select 1;
	_startingPos = [((_mcc_zone_pos select 0) -_zoneX), ((_mcc_zone_pos select 1) - _zoneY),0];
	for [{_i=0},{_i<=(_zoneX*2)},{_i=_i+10}] do 
		{
		for [{_x=1},{_x<=(_zoneY*2)},{_x=_x+10}] do 
			{
			if (_visable && (random 5 <1)) then {_mineClass = "Hedgehog";} else {_mineClass = _trapkind};
			if ((_mineClass=="MineE")) then {	//Case AT mine let's hide it a bit
				_fakeIed = _mineClass createVehicle [((_startingPos select 0) + (_i - 3) + random 6),((_startingPos select 1) + (_x - 3) + random 6),(_startingPos select 2) - 0.06];
				} else	//Not AT mine
					{
					_fakeIed = _mineClass createVehicle [((_startingPos select 0) + (_i - 3) + random 6),((_startingPos select 1) + (_x - 3) + random 6),0];
					};
			};
		};
	} else
		{
		_eib_marker = createMarkerlocal ["traps",_pos];
		_pos= getMarkerPos "traps";

		_fakeIed = _trapkind createVehicle _pos;
		_fakeIed setposatl _pos;

		_fakeIed setvariable ["iedTrigered", false, true]; 

		[_fakeIed, _iedMarkerName] spawn
			{
			private ["_fakeIedS", "_iedMarkerNameS"];
			_fakeIedS = _this select 0;
			_iedMarkerNameS = _this select 1;
			waituntil {!alive _fakeIedS};
			[-2, {deletemarkerlocal format ["%1", _this];}, _iedMarkerNameS] call CBA_fnc_globalExecute;	//de;ete IED marker 
			_fakeIedS setvariable ["iedTrigered", true, true]; 
			};
		sleep 0.01;
		deletemarker "traps";
		};