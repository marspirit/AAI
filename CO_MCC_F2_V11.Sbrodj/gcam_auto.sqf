//=================================================================================
// GCam Auto 1.12
//
// Inertia camera script by Gigan
//
// Execute GCam Auto
// handle = [ Unit ] execVM "gcam_auto.sqf"
//
// This camera script needs "gcam_component.hpp".
// Include "gcam_component.hpp" to "description.ext".
//
//=================================================================================
// KEYBINDS
//
// W,A,S,D           : Move Horizontal
// Q,Z               : Up / Down
// 2,X               : Move Straight
// Mouse Left Drag   : Turning
// Mouse Wheel       : Zooming
// Mouse Right Click : To Default Zoom
// F                 : Brake
// C                 : Stop Zooming
// G                 : Toggle Follow Mode
// H                 : Help
// Esc               : Quit Camera
//
//=================================================================================
// CONFIG

// Move Speed ( Recommended 0.0-1.0 )
#define CFMOVE 0.5

// Turn Speed ( Recommended 0.0-1.0 )
#define CFTRK 0.5

// Zoom Speed ( Recommended 0.0-1.0 )
#define CFWHEEL 0.3

// When GCamKill = true, Camera quits immediately.
GCamKill = false;

//=================================================================================
// CONFIG ADVANCED

// Initial camera parameter.
#define INITCAMDISY 7.5
#define INITCAMDISZ 2.5
#define INITCAMAGL -8
#define INITCAMZOOM 0.7

// Initial mode enable/disable statement.
#define INITFOLLOWMODE true

// Behind mode parameter.
#define BEHINDSPDAROUND 0.18
#define BEHINDSPDROTATE 2.7

//=================================================================================

GCam_Key_Down = [0,-1];
GCam_Key_Up = [0,-1];
GCam_Mouse_Move = [0,-1,-1];
GCam_Mouse_Wheel = [0,0];
GCam_Mouse_BD = [0,-1];
GCam_Mouse_BU = [0,-1];

_loopexit = false;
_wait = accTime / (diag_fps * 2);

_obj = objnull;
_cam = objnull;
_dir = 0;
_dive = 0;
_zoom = INITCAMZOOM;
_accdir = 0;
_accdive = 0;
_acczoom = 0;
_accx = 0;
_accy = 0;
_accz = 0;
_objpos = getpos player;
_campos = [0,0,0];
_campos_rel = [0,0,0];
_cfzoom = sin((_zoom / 1.8) * 90);
_cfalt = 1.0;

_showhelp = true;
_helptext = "-= GCam Auto =-\n\nW,A,S,D : Move Horizontal\nQ,Z : Up/Down\n2,X : Move Straight\nMouse Left Drag : Turning\nMouse Wheel : Zooming\nMouse Right Click : To Default Zoom\nF : Brake\nC : Stop Zooming\nG : Toggle Follow Mode\nH : Help\nEsc : Quit Camera";

_keyd = 0;
_keyu = 0;
_wheel = 0;
_mousemove = false;
_mousepos = [0,0];
_mousepos_last = [0,0];

_follow = INITFOLLOWMODE;


_CreateDialog =
{
	createDialog "GCamDialog3";
	(findDisplay 5004 displayCtrl 3) ctrlShow false;
	(findDisplay 5004 displayCtrl 3) ctrlSetText format["%1",_helptext];
	(findDisplay 5004 displayCtrl 1) ctrlSetEventHandler ["KeyDown", "GCam_Key_Down = _this"];
	(findDisplay 5004 displayCtrl 1) ctrlSetEventHandler ["KeyUp", "GCam_Key_Up = _this"];
	(findDisplay 5004 displayCtrl 1) ctrlSetEventHandler ["MouseMoving", "GCam_Mouse_Move = _this"];
	(findDisplay 5004 displayCtrl 1) ctrlSetEventHandler ["MouseZChanged", "GCam_Mouse_Wheel = _this"];
	(findDisplay 5004 displayCtrl 1) ctrlSetEventHandler ["MouseButtonDown", "GCam_Mouse_BD = _this"];
	(findDisplay 5004 displayCtrl 1) ctrlSetEventHandler ["MouseButtonUp", "GCam_Mouse_BU = _this"];
	ctrlEnable [1,true];
};


_obj = vehicle (_this select 0);
if (isnil"_obj") then { _obj = player };
_lastobj = _obj;
_dir = 90;
_dive = INITCAMAGL;
_campos_rel = [0,- INITCAMDISY,INITCAMDISZ];
_objpos = getposASL _obj;
_campos = [ (_objpos select 0) + (_campos_rel select 0), (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2)];

_cam = "camera" camCreate [0,0,0];
_cam setPosASL [_campos select 0, _campos select 1, _campos select 2];
_cam camSetTarget [_campos select 0, (_campos select 1) + 1, _campos select 2];
_cam cameraEffect ["Internal", "Back"];
_campos = [0,0,0];
_cam camSetFov _zoom;

sleep 0.1;
showCinemaBorder false;

call _CreateDialog;


while {!(_loopexit)} do
{
	_wait = accTime / (diag_fps * 2);
	
	_mousebd = GCam_Mouse_BD select 1;
	_mousebu = GCam_Mouse_BU select 1;
	if (isnil "_mousebd") then { _mousebd = -1 };
	if (isnil "_mousebu") then { _mousebu = -1 };
	if ( (_mousebu == 0) or (_mousebu == 1 and _mousebd == 1) ) then
	{
		GCam_Mouse_BD set [1, -1];
		GCam_Mouse_BU set [1, -1];
		_mousemove = false;
	};
	
	if (_mousebd == 0 and _mousebu != 0 and !(_mousemove)) then
	{
		_mousepos_last = [ GCam_Mouse_Move select 1, GCam_Mouse_Move select 2 ];
		_mousemove = true;
	};
	if (_mousebd == 0 and _mousebu != 0 and _mousemove) then
	{
		_mousepos = [ GCam_Mouse_Move select 1, GCam_Mouse_Move select 2 ];
		
		_accdir = _accdir - ((_mousepos_last select 0) - (_mousepos select 0)) * 7.0 * CFTRK * (-1) * _cfzoom / (cos abs(_dive / (1.0 + _cfzoom)));
		_accdive = _accdive - ((_mousepos_last select 1) - (_mousepos select 1)) * 5.25 * CFTRK * (-1) * _cfzoom;
		
		_mousepos_last = _mousepos;
	};
	_dir = _dir + _accdir;
	if (_dir >= 360) then { _dir = _dir - 360 };
	if (_dir < 0) then { _dir = _dir + 360 };
	_dive = _dive + _accdive;
	if (_dive > 89.9) then
	{
		_dive = 89.9;
		_accdive = 0;
	};
	if (_dive < -89.9) then
	{
		_dive = -89.9;
		_accdive = 0;
	};
	if (_mousebd == 1 and _mousebu == 1) then
	{
		_acczoom = 0;
		_zoom = 0.7;
		_cam camSetFov _zoom;
		_cfzoom = sin ((_zoom / 1.8) * 90);
	};
	
	
	if (!(isnil "GCam_Key_Down")) then { _keyd = GCam_Key_Down select 1 };
	if (!(isnil "GCam_Key_Up")) then { _keyu = GCam_Key_Up select 1 };
	if (_keyd == _keyu) then
	{
		GCam_Key_Down set [1, -1];
		GCam_Key_Up set [1, -1];
	};
	
	if (_keyd == 17 and _keyu != 17) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx + 0.005 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy + 0.005 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 31 and _keyu != 31) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx - 0.005 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy - 0.005 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 30 and _keyu != 30) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx - 0.005 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy + 0.005 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 32 and _keyu != 32) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx + 0.005 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy - 0.005 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 16 and _keyu != 16) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accz = _accz + 0.005 * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 44 and _keyu != 44) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accz = _accz - 0.005 * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 3 and _keyu != 3) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx + 0.0075 * CFMOVE * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accy = _accy + 0.0075 * CFMOVE * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accz = _accz + 0.0075 * CFMOVE * (sin _dive) * _cfzoom * _cfalt;
	};
	if (_keyd == 45 and _keyu != 45) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx - 0.0075 * CFMOVE * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accy = _accy - 0.0075 * CFMOVE * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accz = _accz - 0.0075 * CFMOVE * (sin _dive) * _cfzoom * _cfalt;
	};
	if (_keyd == 33 and _keyu != 33) then
	{
		_accx = _accx * 0.95;
		_accy = _accy * 0.95;
		_accz = _accz * 0.95;
		_accdir = _accdir * 0.95;
		_accdive = _accdive * 0.95;
	};
	if (_keyd == 46 and _keyu != 46) then
	{
		_acczoom = 0;
	};
	if (_keyd == 34 and _keyu == 34) then
	{
		_follow = !(_follow);
		
		if (_follow) then
		{
			titletext["Follow Mode Enabled","plain down",0.15];
			
			_cfalt = 1.0;
			
			_campos_rel = [ cos(_dir+180) * INITCAMDISY, sin(_dir+180) * INITCAMDISY, INITCAMDISZ ];
			_dive = INITCAMAGL;
			
			_accx = 0;
			_accy = 0;
			_accz = 0;
			_accdir = 0;
			_accdive = 0;
		}
		else
		{
			titletext["Follow Mode Disabled","plain down",0.15];
			
			_accx = 0;
			_accy = 0;
			_accz = 0;
			_accdir = 0;
			_accdive = 0;
		};
	};
	if (_keyd == 35 and _keyu == 35) then
	{
		(findDisplay 5004 displayCtrl 3) ctrlShow _showhelp;
		_showhelp = !(_showhelp);
	};
	if (_keyd == 1 or !(alive player) or GCamKill) then
	{
		closeDialog 1;
		_cam cameraEffect ["Terminate", "BACK"];
		camDestroy _cam;
		_loopexit = true;
	};
	
	_wheel = GCam_Mouse_Wheel select 1;
	if (_wheel > 0.001 or _wheel < -0.001) then
	{
		_acczoom = _acczoom - _wheel * 0.006 * CFWHEEL * sin((_zoom / 2.0) * 90);
		GCam_Mouse_Wheel set [1, 0];
	};
	if ((abs _acczoom) > 0.0001) then
	{
		_zoom = _zoom + _acczoom;
		if (_zoom < 0.01) then
		{
			_zoom = 0.01;
			_acczoom = 0;
		};
		if (_zoom > 2.0) then
		{
			_zoom = 2.0;
			_acczoom = 0;
		};
		_cam camSetFov _zoom;
		_cfzoom = sin ((_zoom / 1.8) * 90);
	};
	
	if (!(_follow)) then
	{
		_cfalt = 1 + 100 * (getpos _cam select 2) / 1000;
		if (_cfalt > 100) then { _cfalt = 100 };
	};
	
	
	_campos_rel = [ (_campos_rel select 0) + _accx, (_campos_rel select 1) + _accy, (_campos_rel select 2) + _accz ];
	if (_follow) then
	{
		_objpos = getposASL _obj;
	};
	_campos = [ (_objpos select 0) + (_campos_rel select 0), (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];
	_cam setPosASL [ _campos select 0, _campos select 1, _campos select 2 ];
	_cam camSetTarget [ (_campos select 0) + (cos _dir) * (cos _dive) * 100000, (_campos select 1) + (sin _dir) * (cos _dive) * 100000, (_campos select 2) + (sin _dive) * 100000];
	_cam camCommit 0;
	
	if ( (getpos _cam select 2) < 0.5 ) then
	{
		_cam setPos [ _campos select 0, _campos select 1, 0.501 ];
		_campos_rel set [ 2, (getposASL _cam select 2) - (getposASL _obj select 2) ];
		if ( _accz < 0 ) then { _accz = 0 };
	};
	
	sleep _wait;
};

titletext["GCam Terminated","plain down",0.2];
