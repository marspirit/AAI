#define MCC_PLAYERS 7060
disableSerialization;

private ["_type", "_name", "_worldPos","_dummy", "_unitpos", "_ok", "_markerColor", "_leader", "_markerType", "_tempMarkers", "_tempLines", "_tempVehicles",
		"_targetUnit","_oldUnit","_group"];

_type = _this select 0;

if (_type == 0) then	//Teleport
	{
	if (UMUnit==0) then 
		{
		UMName = UMunitsNames select (lbCurSel MCC_PLAYERS); 
		hint "Click on the map"; 
		onMapSingleClick " 	hint format ['Unit: %1 teleported', UMName];
							[0, {_this}, [UMName setpos _pos]] call CBA_fnc_globalExecute;
							onMapSingleClick """";";
		} else 
			{
			UMName =  UMgroupNames select (lbCurSel MCC_PLAYERS); 
			hint "Click on the map"; 
			onMapSingleClick " 	hint format ['Group: %1 teleported', UMName];
								[0, {_this}, [{_x  setpos _pos} foreach (units UMName)]] call CBA_fnc_globalExecute;
								onMapSingleClick """";";
			};
	};
	
if (_type == 1) then	//Teleport to LHD
	{
	if (UMUnit==0) then 
		{
		UMName =  UMunitsNames select (lbCurSel MCC_PLAYERS); 
		_worldPos = deck modelToWorld [0,0,0];
		[0, {_this}, [UMName setPosASL [_worldPos select 0, _worldPos select 1, 15.9]]] call CBA_fnc_globalExecute;
		} else
			{
			UMName =  UMgroupNames select (lbCurSel MCC_PLAYERS); 
			_worldPos = deck modelToWorld [0,0,0];
			[0, {_this}, [{_x setPosASL [_worldPos select 0, _worldPos select 1, 15.9]} foreach (units UMName)]] call CBA_fnc_globalExecute;
			};
	};
	
if (_type == 2) then	//Hijak unit
	{
	if (UMUnit==0) then 
		{
		_targetUnit = UMunitsNames select (lbCurSel MCC_PLAYERS);	//Hijacked unit
		if (isplayer _targetUnit) exitwith {hint "Can't hijak other players"};
		Prev_Player = player; 
		Prev_Side = side player; 
		_oldUnit = player; 
		if ((count units (group _targetUnit)) > 1) then	//unit isn't alone player joins target unit
			{
			  _group = group _oldUnit;
			  [player] joinSilent (group _targetUnit);
			  (group _targetUnit) selectLeader _oldUnit;
			  [player] joinSilent grpNull;
			  [_targetUnit] joinSilent (group Player);
			  deleteGroup _group;
			} else 
			{
			  if ((count units (group Player)) > 1) then 	//Player isn't alone target unit joins him
				{
					[_targetUnit] joinSilent (group Player);
				} else 
				{
				   [Player] joinSilent grpNull;
				   [_targetUnit] joinSilent (group Player);
				};
			};
		_null = _targetUnit addaction ["Back to player", "mcc\general_scripts\unitManage\backToPlayer.sqf"];
		_oldUnit setcaptive true; 
		selectPlayer _targetUnit;	//Make the switch
		[_oldUnit] joinSilent grpNull;
		_ok = _targetUnit addEventHandler ["Killed", "[_this select 0] joinSilent (Prev_Group);selectPlayer Prev_Player;"];
		} else {hint "Can only hijak units not groups"};
	};
		

if (_type == 3) then	//Markers
	{
	_tempMarkers = [];
	_tempLines = [];
	_tempVehicles = [];
		{
			_leader = leader _x; 
					{
					switch (format ["%1", side  _x]) do 
						{
						case "EAST": //East
							{
							_markerColor = "ColorRed";
							}; 
							
						case "WEST": //West
							{
							_markerColor = "ColorBlue";
							};
							
						case "GUER": //Resistance
							{
							_markerColor = "ColorGreen";
							};
						};
					if ((vehicle _x) != _x) then 
						{
						if (!((vehicle _x) in _tempVehicles)) then
							{
							_tempVehicles set [count _tempVehicles, vehicle _x];
							if ((vehicle _x) iskindof "Car") then {_markerType = "Car";};
							if ((vehicle _x) iskindof "Tank") then {_markerType = "Tank";};
							if ((vehicle _x) iskindof "Air") then {_markerType = "Air";};
							if ((vehicle _x) iskindof "Boat") then {_markerType = "Boat";};
							createMarkerLocal [format["%1", _x], getpos (vehicle _x)];
							format["%1", _x] setMarkerTypelocal _markerType;
							format["%1", _x] setMarkerColorlocal _markerColor;
							_tempMarkers set [count _tempMarkers, format["%1", _x]];
							};
						} else
						{
						createMarkerLocal [format["%1", _x], getpos _x];
						format["%1", _x] setMarkerTypelocal "dot";
						format["%1", _x] setMarkerColorlocal _markerColor;
						_tempMarkers set [count _tempMarkers, format["%1", _x]];
						if ( _x != _leader) then 
							{
							[getpos _x , getpos _leader ,format ["%1", _x]] call MCC_fnc_drawLine;
							_tempLines set [count _tempLines, format["line_%1", _x]];
							};
						};
					} foreach units _x; 
		} foreach allGroups;
		sleep 10; 
		{
			deletemarkerlocal _x;
		} foreach _tempMarkers;
		{
			deletemarkerlocal _x;
		} foreach _tempLines;
	};
	
if (_type == 4) then	//Indevidual Marker
	{
	if ((lbCurSel MCC_PLAYERS)>=0) then 
		{
		if (UMUnit==0) then 
			{UMName =  UMunitsNames select (lbCurSel MCC_PLAYERS)} 
			else {UMName = leader (UMgroupNames select (lbCurSel MCC_PLAYERS))};
			deletemarkerlocal "currentUnitSelected";
			createMarkerLocal ["currentUnitSelected", getpos UMName];
			"currentUnitSelected" setMarkerType "Flag";
			"currentUnitSelected" setMarkerColor "ColorRedAlpha";
		};
	};
	
if (_type == 5) then	//High command: Assighn Commander
	{
	if ((lbCurSel MCC_PLAYERS)>=0) then 
		{
		if (UMUnit==1) then 
			{
			hint "Only units can be assighned as high commanders";
			} 
			else 
			{
			UMName =  UMunitsNames select (lbCurSel MCC_PLAYERS);
			["highCommand", [UMName, 0]] call CBA_fnc_globalEvent;
			};
		};
	};

if (_type == 6) then	//High command: Clear ALL groups
	{
	if ((lbCurSel MCC_PLAYERS)>=0) then 
		{
		if (UMUnit==0) then 
			{UMName =  UMunitsNames select (lbCurSel MCC_PLAYERS)} 
			else {UMName = leader (UMgroupNames select (lbCurSel MCC_PLAYERS))};
		hint "cleared all High Command units"; 
		["highCommand", [UMName, 1]] call CBA_fnc_globalEvent;
		};
	};
	
if (_type == 7) then	//High command: Add group
	{
	if ((lbCurSel MCC_PLAYERS)>=0) then 
		{
		if (UMUnit==0) then 
			{UMName =  UMunitsNames select (lbCurSel MCC_PLAYERS)} 
			else {UMName = leader (UMgroupNames select (lbCurSel MCC_PLAYERS))};
		["highCommand", [UMName, 2]] call CBA_fnc_globalEvent;
		};
	};