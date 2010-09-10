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
	onMapSingleClick " 	hint 'Wp added.'; 
						['tasks', [typ, stringName, stringDescription, _pos]] call CBA_fnc_globalEvent;
						onMapSingleClick """";";
	};
	
	case 2:	//Set Succeeded
   {_stringName = mcc_tasks select (lbCurSel ACTIVETASKS) select 0; 
    _stringDescription = mcc_tasks select (lbCurSel ACTIVETASKS) select 1;
	_pos =[];
	["tasks", [_type, _stringName, _stringDescription, _pos]] call CBA_fnc_globalEvent;
	};
	
	case 3:	//Set Failed
   {_stringName = mcc_tasks select (lbCurSel ACTIVETASKS) select 0; 
    _stringDescription = mcc_tasks select (lbCurSel ACTIVETASKS) select 1;
	_pos =[];
	["tasks", [_type, _stringName, _stringDescription, _pos]] call CBA_fnc_globalEvent;
	};
	
	case 4:	//Set Canceled
   {_stringName = mcc_tasks select (lbCurSel ACTIVETASKS) select 0; 
    _stringDescription = mcc_tasks select (lbCurSel ACTIVETASKS) select 1;
	_pos =[];
	["tasks", [_type, _stringName, _stringDescription, _pos]] call CBA_fnc_globalEvent;
	};
 };


