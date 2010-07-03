/*
 DEAD SPECTATE SCRIPT 

 Upon the player falling dead creates a camera that follows the nearest alive friendly unit

 JULY 2009 - norrin
 
**************************************************************************************************************************
 Start camera_follow.sqf
*/

disableserialization;

private ["_alive_friends","_all_dead_dialog","_allUnits","_c","_camera_friends","_Camera_target","_camx","_camy","_camz","_can_be_revived","_can_be_revived_2","_d","_destroy","_destroy2","_dialog_1","_dialog_2","_display","_distance_to_friend","_e","_f","_follow_cam","_follow_cam_distance","_foo","_friends","_index","_index_friends","_max_box","_name_player","_nearest_friend","_nearest_teammate_dialog","_no_respawn_points","_Object","_pos","_respawn_button_timer","_show_respawn_time","_target","_me"];
//define variables
_Object 					= _this select 0;
_pos 						= _this select 1;
_foo 						= [];
_allUnits 					= [];
_alive_friends 				= [];
_destroy 					= false;
_switch 					= false;
_c							= 0;
NORRN_FOCUS_CAM_ON 			= 0;
NORRN_REVIVE_CAM_TYPE 		= 0;
NORRN_CAM_NVG 				= false;
NORRNAllUnits 				= [];

_boot_hill					= getMarkerPos "Boot_hill";
_respawn_mrkr				= NORRN_respawn_mrkr;
_top_view_height 			= NORRN_revive_array select 55;
_r_dialog_0 				= "";
_r_display  				= "";

showcinemaborder false;

//set camera to target body
_camx = _pos select 0;
_camy = _pos select 1;
_camz = _pos select 2;

NORRN_REVIVE_cam = "camera" CamCreate [_camx,_camy+5,_camz+1];
NORRN_REVIVE_cam CamSetTarget object;
NORRN_REVIVE_cam CameraEffect ["INTERNAL","Back"];
NORRN_REVIVE_cam CamCommit 2;
hint "";

//setVars for free camera 
_angh = 0; 
_angv = 45;

_allUnits =  allUnits;
{if (side _x != sideLogic && (_x distance _boot_hill) > 100 && (_x distance _respawn_mrkr) > 100 && alive _x) then {_alive_friends = _alive_friends + [_x]}} forEach _allUnits;
COUNT_CAM_friends = count _alive_friends;

//create dialog and initialise keyboard;
_r_dialog_0 = createDialog "dead_cam_dialog"; 
_r_display = findDisplay 99128;
_r_display displaySetEventHandler ["Keydown", "_this call CAM_KEY_pressed"];
titletext [" ","BLACK IN",1];
CAM_KEY_pressed = compile preprocessfile "f\revive\CAM_KEY_pressed.sqf";

//change camera via dialog
lbClear 10004;
_index = lbAdd[10004, "3rd Person"];
_index = lbAdd[10004, "Top Down"];
_index = lbAdd[10004, "Front Side"];
_index = lbAdd[10004, "1st Person"];
_index = lbAdd[10004, "Follow/Free"];
lbSetCurSel [10004, 0];

//change target via dialog
lbClear 10005;
{if (alive _x) then {_index_friends = lbAdd[10005, name _x]}} forEach _alive_friends;
lbSetCurSel [10005, 0];

while {!_destroy} do 
{
	scopeName "FollowCam_01";
	if (mission_Over) then {sleep 5; _destroy = true;breakOut "FollowCam_01";};
	
	if (_c == 400) then {_c = 0};
	
	if (_c == 0) then 
	{	
		_allUnits =  allUnits;
		_new_friends = [];
		{if (side _x != sideLogic && (_x distance _boot_hill) > 100 && (_x distance _respawn_mrkr) > 100 && alive _x) then {_new_friends = _new_friends + [_x]}} forEach _allUnits;
	
		if (count _new_friends != COUNT_CAM_friends) then {_alive_friends = _new_friends; COUNT_CAM_friends = count _new_friends};
		_camera_friends = _alive_friends;
		_c = 0;
	};
	
	//change target via dialog
	lbClear 10005;
	{if (alive _x) then {_index_friends = lbAdd[10005, name _x]}} forEach _camera_friends;
	lbSetCurSel [10005, lbCurSel 10005];
	if (dialog) then 
	{
		NORRN_REVIVE_CAM_TYPE = lbCurSel 10004;
		NORRN_FOCUS_CAM_ON = (lbCurSel 10005);
		_unit = _camera_friends select NORRN_FOCUS_CAM_ON; 
		_target = vehicle _unit;
	};		
	if (!dialog) then {if (!isNull _me) then {_target = _me; NORRN_REVIVE_cam camsettarget _target;NORRN_REVIVE_cam cameraeffect ["internal", "back"];NORRN_REVIVE_cam camsetrelpos [-3, +1, (_max_box select 2) +1];NORRN_REVIVE_cam camcommit 1};};
	switch (NORRN_REVIVE_CAM_TYPE) do {
		case 0: {_target switchCamera "EXTERNAL"; NORRN_REVIVE_cam CameraEffect ["Terminate","Back"];};
		case 1: {NORRN_REVIVE_cam camsettarget _target; NORRN_REVIVE_cam cameraeffect ["internal", "back"];NORRN_REVIVE_cam camsetrelpos [0, -2, _top_view_height];NORRN_REVIVE_cam camcommit 0.01};
		case 2: {NORRN_REVIVE_cam camsettarget _target; NORRN_REVIVE_cam cameraeffect ["internal", "back"];NORRN_REVIVE_cam camsetrelpos [-1.5, 3, 0.2];NORRN_REVIVE_cam camSetFov 1.1; NORRN_REVIVE_cam camcommit 0.01};
		case 3: {_target switchCamera "INTERNAL";NORRN_REVIVE_cam CameraEffect ["Terminate","Back"]};
	};
	
	//========================================================================================
	// Free cam courtesy of hoz and mandoble see: OFPEC - see: http://www.ofpec.com/forum/index.php?topic=32970.0
	if (NORRN_REVIVE_CAM_TYPE == 4) then
	{ 	 
		NORRN_REVIVE_cam camsettarget _target; 
		NORRN_REVIVE_cam cameraeffect ["internal", "back"];
		
		if (OFPEC_MouseButtons select 1) then 
		{	
			if (((OFPEC_MouseCoord select 0) >= 0) && ((OFPEC_MouseCoord select 0) <= 1) &&
			((OFPEC_MouseCoord select 1) >= 0) && ((OFPEC_MouseCoord select 1) <= 1)) then
	   		{
				_deltah = (0.5 - (OFPEC_MouseCoord select 0))*10/0.2;
				_deltav = (0.5 - (OFPEC_MouseCoord select 1))*10/0.2;
				_angv = (_angv + _deltav);
				_angh = (_angh + _deltah);
				_angv = _angv max 0;			
				_angv = _angv min 89;
			};						
		}; 
		_free_pos = [(getpos _target select 0) + sin(_angh)*OFPEC_range_to_unit, (getpos _target select 1) + cos(_angh)*OFPEC_range_to_unit, (getpos _target select 2) + OFPEC_range_to_unit*sin(_angv)];
		NORRN_REVIVE_cam camSetPos _free_pos;
		NORRN_REVIVE_cam camCommit 0.01;  
	};     
	//========================================================================================	
	_c = _c + 1;
	sleep 0.02;
};

//destroy camera
if (_destroy || _destroy2) exitWith {
	if (_destroy) then 
	{
		sleep 0;
	};
	camUseNVG false;
	closeDialog 4;
	closeDialog 3;
	closeDialog 2;
	closeDialog 1;
	closeDialog 0;
	if (_unc_music == 1) then {playMusic ""};
	if (mission_Over) then {titletext ["Mission Failed - all players are unconscious","BLACK", 4]; sleep 1};
	player switchCamera "INTERNAL";
	NORRN_REVIVE_cam CameraEffect ["Terminate","Back"];
	CamDestroy NORRN_REVIVE_cam;
	deleteVehicle _Object;
};

//Last edited 19/07/09