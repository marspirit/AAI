#define ExtrasDialog3_IDD 2996
#define CAPTURE 3204

#define TRIGGER_ACTIVEATE 7000
#define TRIGGER_COND 7001
#define TRIGGER_SIZEX 7002
#define TRIGGER_SIZEY 7003
#define TRIGGER_ANGLE 7004
#define TRIGGER_SHAPE 7005
#define TRIGGER_TEXT 7006 
#define TRIGGER_SELECTED 7007

disableSerialization;
private ["_dlg","_type","_zoneX","_zoneY","_activate","_cond","_angle","_shape","_text","_pos","_nul","_triggerSelected"];

_dlg = findDisplay ExtrasDialog3_IDD;
_type = _this select 0;

switch (_type) do
{
   case 0:	//Mapclick Generate
	{ 
		mcc_capture_state = true;
		hint "Left click on the map to create a trigger";
			onMapSingleClick " 	hint 'Trigger set. Capture the action linked to the trigger.'; 
								nul=[1,_pos] execVM 'mcc\general_scripts\triggers\triggers.sqf';
								onMapSingleClick """";";
	};
	
	case 1:	//Generate
	{ 
		ctrlEnable [3204,true];
		_pos = _this select 1;	
		_zoneX = zones_x select (lbCurSel TRIGGER_SIZEX) select 1;
		_zoneY = zones_x select (lbCurSel TRIGGER_SIZEY) select 1;
		_activate = musicActivateby_array select (lbCurSel TRIGGER_ACTIVEATE);
		_cond = musicCond_array select (lbCurSel TRIGGER_COND);
		_angle = angle_array select (lbCurSel TRIGGER_ANGLE);
		_shape = shapeMarker select (lbCurSel TRIGGER_SHAPE);
		_text = ctrlText (_dlg displayCtrl TRIGGER_TEXT);
		mcc_capture_var = "";
		waituntil {(!mcc_capture_state)};
		mcc_safe=mcc_safe + FORMAT ["
							mcc_capture_var = '%9';
							script_handler = [0, %1, %2, %3, '%4', '%5', %6, '%7', '%8', mcc_capture_var] execvm 'mcc\general_scripts\triggers\triggers_execute.sqf';
							waitUntil {scriptDone script_handler};"								 
							,_pos
							,_zoneX
							,_zoneY
							,_activate
							,_cond
							,_angle
							,_shape
							,_text
							,mcc_capture_var  
							];
		[0, _pos, _zoneX, _zoneY, _activate, _cond, _angle, _shape, _text, mcc_capture_var] execvm "mcc\general_scripts\triggers\triggers_execute.sqf";
		closedialog 2996;
		sleep 0.3;
		_ok = createDialog "ExtrasDialog3";
	};
	   
   case 2:	//Mapclick Move trigger
	{
		hint "Left click on the map to move a trigger";
			onMapSingleClick " 	hint 'Trigger moved.'; 
								nul=[3,_pos] execVM 'mcc\general_scripts\triggers\triggers.sqf';
								onMapSingleClick """";";
	};
	
   case 3:	// Move trigger
	{
		_pos = _this select 1;
		_text = mcc_triggers select (lbCurSel TRIGGER_SELECTED) select 0;
		_triggerSelected = mcc_triggers select (lbCurSel TRIGGER_SELECTED) select 1;
		[1,_pos, _text, _triggerSelected] execVM 'mcc\general_scripts\triggers\triggers_execute.sqf';
								
	};
};