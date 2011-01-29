//Returns the control, the pressed button, the x and y coordinates and the state of Shift, Ctrl and Alt.
private ["_params", "_ctrl", "_pressed", "_posX", "_posY", "_shift", "_ctrlKey", "_alt", "_eib_marker","_pointB","_nearObjectsA","_nearObjectsB"];
disableSerialization;
 
_params = _this select 0;

_ctrl = _params select 0;
_pressed = _params select 1;
_posX = _params select 2; 
_posY = _params select 3;
_shift = _params select 4;
_ctrlKey = _params select 5;
_alt = _params select 6;

if (mcc_missionmaker == (name player)) then
	{
	if (rcPlacing && _pressed!=1) then 	//Road charge placing
		{
			_pointB = _ctrl ctrlmapscreentoworld [_posX,_posY];
			IEDDir = [pointA,_pointB] call BIS_fnc_dirTo;
			if (mcc_capture_state) then
									{
										hint "Road Charge Captured."; 
										 mcc_capture_var=mcc_capture_var + FORMAT ['
												["RC_single", [%1 , %2 select 0, %3 select 0, %4]] call CBA_fnc_globalEvent;
												_eib_marker = createMarkerlocal [%3 select 0 ,%1];
												_eib_marker setMarkerTypelocal "hd_arrow";
												_eib_marker setMarkerColorlocal "ColorBlue";
												_eib_marker setMarkerTextlocal (%3 select 0);
												_eib_marker setMarkerdirlocal %4;
												'								 
												, pointA
												, trapkind
												, IedName
												, IEDDir
												];
									} else 
									{
										hint "Road Charge Placed."; 
										_eib_marker = createMarkerlocal [IedName select 0 ,pointA];
										_eib_marker setMarkerTypelocal "hd_arrow";
										_eib_marker setMarkerColorlocal "ColorBlue";
										_eib_marker setMarkerTextlocal (IedName select 0);
										_eib_marker setMarkerdirlocal IEDDir;
										mcc_safe=mcc_safe + FORMAT ['
										["RC_single", [%1 , %2 select 0, %3 select 0, %4]] call CBA_fnc_globalEvent;
										sleep 1;
										_eib_marker = createMarkerlocal [%3 select 0 ,%1];
										_eib_marker setMarkerTypelocal "hd_arrow";
										_eib_marker setMarkerColorlocal "ColorBlue";
										_eib_marker setMarkerTextlocal (%3 select 0);
										_eib_marker setMarkerdirlocal %4;
										'								 
										, pointA
										, trapkind
										, IedName 
										, IEDDir
										];
										["RC_single", [pointA , trapkind select 0,IedName select 0, IEDDir]] call CBA_fnc_globalEvent;
									};
			rcPlacing = false; 							
		};

	if (ambushPlacing && _pressed!=1) then //Ambush group placing
		{
			pointB = _ctrl ctrlmapscreentoworld [_posX,_posY];
			IEDDir = [pointA,pointB] call BIS_fnc_dirTo;
			IEDnearObjects = _pointB nearObjects ["ACE_Target_CInf",20];
			if (mcc_capture_state) then
				{
					hint "Ambush Captured."; 
					mcc_capture_var=mcc_capture_var + FORMAT ["
					['ambush_single', [%1 , '%2' , '%3', %4, %5, %6]] call CBA_fnc_globalEvent;
					_eib_marker = createMarkerlocal [%4 select 0 ,%1];
					_eib_marker setMarkerTypelocal 'mil_ambush';
					_eib_marker setMarkerColorlocal 'ColorRed';
					_eib_marker setMarkerTextlocal (%4 select 0);
					_eib_marker setMarkerdirlocal %5 -90;
					"								 
					, pointA
					, IEDAmbushspawnname
					, mcc_sidename
					, IedName
					, IEDDir
					, pointB
					];
				} else 
				{
				hint "Ambush Placed."; 
					_eib_marker = createMarkerlocal [IedName select 0 ,pointA];
					_eib_marker setMarkerTypelocal "mil_ambush";
					_eib_marker setMarkerColorlocal "ColorRed";
					_eib_marker setMarkerTextlocal (IedName select 0);
					_eib_marker setMarkerdirlocal IEDDir-90;
					mcc_safe=mcc_safe + FORMAT ["
					['ambush_single', [%1 , '%2' , '%3', %4, %5, %6]] call CBA_fnc_globalEvent;
					sleep 1;
					_eib_marker = createMarkerlocal [%4 select 0 ,%1];
					_eib_marker setMarkerTypelocal 'mil_ambush';
					_eib_marker setMarkerColorlocal 'ColorRed';
					_eib_marker setMarkerTextlocal (%4 select 0);
					_eib_marker setMarkerdirlocal %5 -90;
					"							 
					, pointA
					, IEDAmbushspawnname
					, mcc_sidename
					, IedName
					, IEDDir
					, pointB
					];
				["ambush_single", [pointA , IEDAmbushspawnname,mcc_sidename, IedName, IEDDir, pointB]] call CBA_fnc_globalEvent;
				};
			ambushPlacing = false; 							
		};
	if (_shift && _pressed!=1) then //Sync with shift key
		{
		pointB = _ctrl ctrlmapscreentoworld [_posX,_posY];
		_nearObjectsA = pointA nearObjects ["ACE_Target_CInf",20];
		_nearObjectsB = pointB nearObjects ["ACE_Target_CInf",20];
		if (count _nearObjectsA>0 && count _nearObjectsB >0) then
			{
			IEDLineCount = IEDLineCount +1;
			[pointA,pointB,IEDLineCount] call MCC_fnc_drawLine;
			mcc_safe=mcc_safe + FORMAT ["
			['ied_sync', [%1,%2,%3]] call CBA_fnc_globalEvent;
			sleep 2;
			[%1,%2,%3] call MCC_fnc_drawLine;
			"							 
			, pointA
			, pointB
			, IEDLineCount
			];
			[pointA , pointB,IEDLineCount] execVM "mcc\general_scripts\traps\ied_sync.sqf";
			};
		};
	};
