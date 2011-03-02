#define ExtrasDialog2_IDD 2997
#define TASKNAMEBOX 6001
#define TASKDESCRIPTIONBOX 6002
#define ACTIVETASKS 6003

disableSerialization;
private ["_type","_dlg","_stringName","_stringDescription","_ok"];
_type = _this select 0;

_dlg = findDisplay ExtrasDialog2_IDD;

switch (_type) do
{
   case 0:	//create
   {_stringName = ctrlText (_dlg displayCtrl TASKNAMEBOX);
	_stringDescription = ctrlText (_dlg displayCtrl TASKDESCRIPTIONBOX); 
	_pos =[];
	mcc_safe=mcc_safe + FORMAT ["_type=%1;
							 _stringName='%2';
							 _stringDescription='%3';
							 _pos = %4;
							['tasks', [_type, _stringName, _stringDescription, _pos]] call CBA_fnc_globalEvent;
							sleep 1;"								 
							,_type
							,_stringName
							,_stringDescription
							,_pos
							];
	hint "Task updated";
	["tasks", [_type, _stringName, _stringDescription, _pos]] call CBA_fnc_globalEvent;
	closedialog 0;
	sleep 1;
	_ok = createDialog "ExtrasDialog2";
	};
	
   case 1:	//Set WP
   {stringName = mcc_tasks select (lbCurSel ACTIVETASKS) select 0; 
    stringDescription = lbCurSel ACTIVETASKS;
	typ = _type;
	hint "Left click on the map to set a WP for this Task";
	if (mcc_capture_state) then
		{
		onMapSingleClick " 	hint 'Wp captured.'; 
							mcc_capture_var = mcc_capture_var + FORMAT ['
							[""tasks"", [%1, ""%2"", %3, %4]] call CBA_fnc_globalEvent;'
							,typ
							,stringName
							,stringDescription
							,_pos
							];
							onMapSingleClick """";";
		} else 
		{
		onMapSingleClick " 	hint 'Wp added.'; 
							['tasks', [typ, stringName, stringDescription, _pos]] call CBA_fnc_globalEvent;
							onMapSingleClick """";";
		};
	};
	
	case 2:	//Set Succeeded
   {_stringName = mcc_tasks select (lbCurSel ACTIVETASKS) select 0; 
    _stringDescription = mcc_tasks select (lbCurSel ACTIVETASKS) select 1;
	_pos =[];
	if (mcc_capture_state) then
		{
		mcc_capture_var = mcc_capture_var + FORMAT ['
							_stringDescription =  (mcc_tasks select %1) select 1;
							_stringDescription setTaskState "SUCCEEDED";
							[-2, {taskHint ["TASK ACCOMPLISHED: \n %2", [0,1,0,1], "taskDone"]}] call CBA_fnc_globalExecute;'
							,lbCurSel ACTIVETASKS
							,_stringName
							];
		} else
		{
		_stringDescription setTaskState "SUCCEEDED";
		[-2, {taskHint [format ["TASK ACCOMPLISHED: \n %1",_this], [0,1,0,1], "taskDone"]},_stringName] call CBA_fnc_globalExecute;
		};
	};
	
	case 3:	//Set Failed
   {_stringName = mcc_tasks select (lbCurSel ACTIVETASKS) select 0; 
    _stringDescription = mcc_tasks select (lbCurSel ACTIVETASKS) select 1;
	_pos =[];
	if (mcc_capture_state) then
		{
		mcc_capture_var = mcc_capture_var + FORMAT ['
							_stringDescription =  (mcc_tasks select %1) select 1;
							_stringDescription setTaskState "FAILED";
							[-2, {taskHint ["TASK FAILED: \n %2", [1,0,0,1], "taskFAILED"]}] call CBA_fnc_globalExecute;'
							,lbCurSel ACTIVETASKS
							,_stringName
							];
		} else
		{
		_stringDescription setTaskState "FAILED";
		[-2, {taskHint [format ["TASK FAILED: \n %1",_this], [1,0,0,1], "taskFAILED"]},_stringName] call CBA_fnc_globalExecute;
		};
	};
	
	case 4:	//Set Canceled
   {_stringName = mcc_tasks select (lbCurSel ACTIVETASKS) select 0; 
    _stringDescription = mcc_tasks select (lbCurSel ACTIVETASKS) select 1;
	_pos =[];
	if (mcc_capture_state) then
		{
		mcc_capture_var = mcc_capture_var + FORMAT ['
							_stringDescription =  (mcc_tasks select %1) select 1;
							_stringDescription setTaskState "CANCELED";
							[-2, {taskHint ["TASK CANCELED: \n %2", [1,1,1,1], "taskDone"]}] call CBA_fnc_globalExecute;'
							,lbCurSel ACTIVETASKS
							,_stringName
							];
		} else
		{
		_stringDescription setTaskState "CANCELED";
		[-2, {taskHint [format ["TASK CANCELED: \n %1",_this], [1,1,1,1], "taskDone"]},_stringName] call CBA_fnc_globalExecute;
		};
	};
	
	case 5:	//End Mission : Sucess
	{
		if (mcc_capture_state) then
		{
		mcc_capture_var = mcc_capture_var + FORMAT ['
							[-2, {titlecut ["Mission Accomplished","BLACK OUT", 3];sleep 3;endMission "LOSER"}] call CBA_fnc_globalExecute;
							'
							];
		} else
		{
		[-2, {titlecut ["Mission Accomplished","BLACK OUT", 3];sleep 3;endMission _this},"LOSER"] call CBA_fnc_globalExecute;
		};
	};
	
	case 6:	//End Mission : Fail
	{
		if (mcc_capture_state) then
		{
		mcc_capture_var = mcc_capture_var + FORMAT ['
							[-2, {titlecut ["Mission Failed","BLACK OUT", 3];sleep 3;endMission "LOSER"}] call CBA_fnc_globalExecute;
							'
							];
		} else
		{
		[-2, {titlecut ["Mission Failed","BLACK OUT", 3];sleep 3;endMission _this},"LOSER"] call CBA_fnc_globalExecute;
		};
	};
 };


