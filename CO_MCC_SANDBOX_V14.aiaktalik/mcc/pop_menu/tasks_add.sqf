disableSerialization;
private ["_type","_string","_exe","_markerstr"];

_type = _this select 0;
_stringName = _this select 1;
_stringDescription = _this select 2;
_pos = _this select 3;

switch (_type) do
{
   case 0:		//create task
   {_exe = player createSimpleTask [_stringName];
    _exe setSimpleTaskDescription [_stringDescription, _stringName, _stringName];
	mcc_tasks set [count mcc_tasks,[_stringName,_exe]];
	mcc_sync=mcc_sync + FORMAT ["_type=%1;
							_stringName='%2';
						    _stringDescription='%3';
							_pos = %4;
							_exe = player createSimpleTask [_stringName];
							_exe setSimpleTaskDescription [_stringDescription, _stringName, _stringName];
							mcc_tasks set [count mcc_tasks,[_stringName,_exe]];
							sleep 1;"								 
							,_type
							,_stringName
							,_stringDescription
							,_pos
							];
	};
	
   case 1:	//Set task destination
   {mcc_tasks select _stringDescription select 1 setSimpleTaskDestination _pos;
	 deleteMarker _stringName;
   	_markerstr = createMarker[_stringName,_pos];
	_markerstr setMarkerShape "ICON";
	_stringName setMarkerType "Warning";
	mcc_sync=mcc_sync + FORMAT ["_type=%1;
							_stringName='%2';
						    _stringDescription=%3;
							_pos = %4;
							mcc_tasks select _stringDescription select 1 setSimpleTaskDestination _pos;
							 deleteMarker _stringName;
							_markerstr = createMarker[_stringName,_pos];
							_markerstr setMarkerShape 'ICON';
							_stringName setMarkerType 'Warning';
							sleep 1;"								 
							,_type
							,_stringName
							,_stringDescription
							,_pos
							];
	mcc_safe=mcc_safe + FORMAT ["_type=%1;
							_stringName='%2';
						    _stringDescription=%3;
							_pos = %4;
							mcc_tasks select _stringDescription select 1 setSimpleTaskDestination _pos;
							 deleteMarker _stringName;
							_markerstr = createMarker[_stringName,_pos];
							_markerstr setMarkerShape 'ICON';
							_stringName setMarkerType 'Warning';
							sleep 1;"								 
							,_type
							,_stringName
							,_stringDescription
							,_pos
							];
  };
   
    case 2:
   {_stringDescription setTaskState "SUCCEEDED";
   [-2, {taskHint [format ["TASK ACCOMPLISHED: \n %1",_this], [0,1,0,1], "taskDone"]},_stringName] call CBA_fnc_globalExecute;
	};
	
	case 3:
   {_stringDescription setTaskState "FAILED";
   [-2, {taskHint [format ["TASK FAILED: \n %1",_this], [1,0,0,1], "taskFAILED"]},_stringName] call CBA_fnc_globalExecute;
	};
	
	case 4:
   {_stringDescription setTaskState "CANCELED";
   [-2, {taskHint [format ["TASK CANCELED: \n %1",_this], [1,1,1,1], "taskDone"]},_stringName] call CBA_fnc_globalExecute;
	};
 };