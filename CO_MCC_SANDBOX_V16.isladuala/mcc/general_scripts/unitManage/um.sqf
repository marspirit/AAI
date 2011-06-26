#define MCC_PLAYERS 7060
#define ExtrasDialog3_IDD 2996
disableSerialization;

private ["_type", "_name", "_worldPos","_dummy", "_unitpos", "_ok", "_markerColor", "_leader", "_markerType", "_tempMarkers", "_tempLines", "_tempVehicles",
		"_targetUnit","_oldUnit","_group","_params","_ctrl","_pressed","_shift","_ctrlKey","_mccdialog","_comboBox","_nul","_dummyUnit"];

_mccdialog = findDisplay ExtrasDialog3_IDD;
_comboBox = _mccdialog displayCtrl MCC_PLAYERS;
_type = _this select 0;

	switch (_type) do
	{
		case 0: //Teleport
		{
		mapClick = false; 
			hint "Click on the map"; 
			onMapSingleClick " 	hint format ['%1 teleported', UMName];
								teleportPos = _pos; 
								mapClick = true;
								onMapSingleClick """";";
			waituntil {mapClick};
			if (UMUnit==0) then 
				{
					{[0, {_this}, [_x setpos teleportPos]] call CBA_fnc_globalExecute;} foreach selectedUnits;
				} else 
					{
					{{[0, {_this}, [_x setpos teleportPos]] call CBA_fnc_globalExecute;} foreach (units _x);} foreach selectedUnits;
				};
		};
		
		case 1:	//Teleport to LHD
		{
			_worldPos = deck modelToWorld [0,0,0];
			if (UMUnit==0) then 
			{
				{[0, {_this}, [_x setPosASL [_worldPos select 0, _worldPos select 1, 15.9]]] call CBA_fnc_globalExecute;} foreach selectedUnits;
			} 
			else
			{
				{[0, {_this}, [{_x setPosASL [_worldPos select 0, _worldPos select 1, 15.9]} foreach (units _x)]] call CBA_fnc_globalExecute;} foreach selectedUnits;
			};
		};

		case 2:	//Hijak unit
		{
			if (UMUnit==0) then 
			{
				_targetUnit = UMunitsNames select (lbCurSel MCC_PLAYERS);	//Hijacked unit
				if (isplayer _targetUnit) exitwith {hint "Can't hijak other players"};
				Prev_Player = player; 
				Prev_Side = side player; 
				_oldUnit = player; 
				_group = creategroup (side _targetUnit); 
				_dummyUnit = _group createUnit ["RU_Assistant", position player,[], 0, "NONE"];
				[_targetUnit] joinSilent _group;
				setPlayable _dummyUnit;
				selectPlayer _dummyUnit;	//Make the switch
				removeSwitchableUnit _oldUnit;
				_group selectLeader player;
				selectPlayer _targetUnit;
				deleteVehicle _dummyUnit;
				deletegroup _group;
				_null = _targetUnit addaction ["Back to player", "mcc\general_scripts\unitManage\backToPlayer.sqf"];
				_ok = _targetUnit addEventHandler ["Killed", "[_this select 0] joinSilent (Prev_Group);selectPlayer Prev_Player;"];
				/*
				[player] joinSilent grpNull;
				[player] joinSilent _group;
				[_targetUnit] joinSilent _group;
				_group selectLeader player;
				_null = _targetUnit addaction ["Back to player", "mcc\general_scripts\unitManage\backToPlayer.sqf"];
				[_oldUnit] joinSilent grpNull; 
				setPlayable _targetUnit;
				selectPlayer _targetUnit;	//Make the switch
				removeSwitchableUnit _oldUnit;
				_oldUnit setcaptive true; 
				_ok = _targetUnit addEventHandler ["Killed", "[_this select 0] joinSilent (Prev_Group);selectPlayer Prev_Player;"];*/
			}
			else
			{hint "Can only hijak units not groups"};
		};
			
		case 3:	//Markers
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
		
		case 4:	//Indevidual Marker
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
		
		case 5:	//High command: Assighn Commander
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

		case 6:	//High command: Clear ALL groups
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
		
		case 7:	//High command: Add group
		{
		if ((lbCurSel MCC_PLAYERS)>=0) then 
			{
			if (UMUnit==0) then 
				{UMName =  UMunitsNames select (lbCurSel MCC_PLAYERS)} 
				else {UMName = leader (UMgroupNames select (lbCurSel MCC_PLAYERS))};
			["highCommand", [UMName, 2]] call CBA_fnc_globalEvent;
			};
		};

		case 8:	//Multi-Selection
		{
			_params = _this select 1;

			_ctrl = _params select 0;
			_pressed = _params select 1;
			_shift = _params select 4;
			_ctrlKey = _params select 5;
			
			if (UMUnit==0) then {
				if (_ctrlKey) then {
					if !((UMunitsNames select (lbCurSel MCC_PLAYERS)) in selectedUnits) then
						{
						selectedUnits = selectedUnits + [UMunitsNames select (lbCurSel MCC_PLAYERS)];
						lbSetColor [MCC_PLAYERS, (lbCurSel MCC_PLAYERS), [0, 1, 1, 1]];
						hint format ["%1", selectedUnits];
						} else {
							selectedUnits = selectedUnits - [UMunitsNames select (lbCurSel MCC_PLAYERS)];
							lbSetColor [MCC_PLAYERS, (lbCurSel MCC_PLAYERS), [1, 1, 1, 1]];
							//hint format ["%1", selectedUnits];
							};
					} else {
						selectedUnits = [UMunitsNames select (lbCurSel MCC_PLAYERS)];
						for [{_x=0},{_x<(lbSize MCC_PLAYERS)},{_x=_x+1}] do {
							lbSetColor [MCC_PLAYERS, _x, [1, 1, 1, 1]];
							}
						lbSetColor [MCC_PLAYERS, (lbCurSel MCC_PLAYERS), [0, 1, 1, 1]];
						//hint format ["%1", selectedUnits];
						};
				};
						
			if (UMUnit==1) then {
				if (_ctrlKey) then {
					if !((UMgroupNames select (lbCurSel MCC_PLAYERS)) in selectedUnits) then
						{
						selectedUnits = selectedUnits + [UMgroupNames select (lbCurSel MCC_PLAYERS)];
						lbSetColor [MCC_PLAYERS, (lbCurSel MCC_PLAYERS), [0, 1, 1, 1]];
						} else {
							selectedUnits = selectedUnits - [UMgroupNames select (lbCurSel MCC_PLAYERS)];
							lbSetColor [MCC_PLAYERS, (lbCurSel MCC_PLAYERS), [1, 1, 1, 1]];
							};
					} else {
						selectedUnits = [UMgroupNames select (lbCurSel MCC_PLAYERS)];
						for [{_x=0},{_x<(lbSize MCC_PLAYERS)},{_x=_x+1}] do {
							lbSetColor [MCC_PLAYERS, _x, [1, 1, 1, 1]];
							}
						lbSetColor [MCC_PLAYERS, (lbCurSel MCC_PLAYERS), [0, 1, 1, 1]];
						//hint format ["%1", selectedUnits];
						};
				};
		};
		
		case 9:	//ParaDrop
		{
			hint "Click on the map"; 
			onMapSingleClick " 	hint format ['%1 Paradroped', UMName];
								['paradrop', [_pos, selectedUnits, UMUnit]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
		};
		
		default //default - no match
		{
			player globalchat format ["Access Denied: type %1", _type];
		};
	};
	