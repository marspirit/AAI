//=================================================================================
// GCam Auto 1.13
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
// Space             : Quit GCam
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

//=================================================================================

GCam_KeyDown = [0,-1];
GCam_KeyUp = [0,-1];
GCam_MouseMove = [0,0,0];
GCam_MouseWheel = [0,0];
GCam_MouseBD = [0,-1];
GCam_MouseBU = [0,-1];

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
_objpos = getposATL player;
_campos = [0,0,0];
_campos_rel = [0,0,0];
_cfzoom = sin((_zoom / 1.8) * 90);
_cfalt = 1.0;

_keyd = 0;
_keyu = 0;
_wheel = 0;
_mousemove = false;
_mousepos = [0,0];
_mousepos_last = [0,0];

_follow = INITFOLLOWMODE;

sleep _wait;

_ehid_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", "GCam_KeyDown = _this"];
_ehid_keyup = (findDisplay 46) displayAddEventHandler ["KeyUp", "GCam_KeyUp = _this"];
_ehid_mousemove = (findDisplay 46) displayAddEventHandler ["MouseMoving", "GCam_MouseMove = _this"];
_ehid_mousezchange = (findDisplay 46) displayAddEventHandler ["MouseZChanged", "GCam_MouseWheel = _this"];
_ehid_mousebd = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "GCam_MouseBD = _this"];
_ehid_mousebu = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", "GCam_MouseBU = _this"];

_obj = vehicle (_this select 0);
if (isnil"_obj") then { _obj = player };
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

sleep _wait;
showCinemaBorder false;


while {!(_loopexit)} do
{
	_mousebd = GCam_MouseBD select 1;
	_mousebu = GCam_MouseBU select 1;
	if (isnil "_mousebd") then { _mousebd = -1 };
	if (isnil "_mousebu") then { _mousebu = -1 };
	if ( (_mousebu == 0) or (_mousebu == 1 and _mousebd == 1) ) then
	{
		GCam_MouseBD set [1, -1];
		GCam_MouseBU set [1, -1];
	};
	if (_mousebd == 1 and _mousebu == 1) then
	{
		_acczoom = 0;
		_zoom = 0.7;
		_cam camSetFov _zoom;
		_cfzoom = sin ((_zoom / 1.8) * 90);
	};
	
	_mousepos = [ GCam_MouseMove select 1, GCam_MouseMove select 2 ];
	_accdir = _accdir + (_mousepos select 0) * 0.03 * CFTRK * (-1) * _cfzoom / (cos abs(_dive / (1.0 + _cfzoom)));
	_accdive = _accdive + (_mousepos select 1) * 0.09 * CFTRK * (-1) * _cfzoom;
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
	GCam_MouseMove set [ 1, (GCam_MouseMove select 1)*0.8 ];
	GCam_MouseMove set [ 2, (GCam_MouseMove select 2)*0.8 ];
	
	if (!(isnil "GCam_KeyDown")) then { _keyd = GCam_KeyDown select 1 };
	if (!(isnil "GCam_KeyUp")) then { _keyu = GCam_KeyUp select 1 };
	if (_keyd == _keyu) then
	{
		GCam_KeyDown set [1, -1];
		GCam_KeyUp set [1, -1];
	};
	
	if (_keyd == 17 and _keyu != 17) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx + 0.003 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy + 0.003 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 31 and _keyu != 31) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx - 0.003 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy - 0.003 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 30 and _keyu != 30) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx - 0.003 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy + 0.003 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 32 and _keyu != 32) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx + 0.003 * (sin _dir) * CFMOVE * _cfzoom * _cfalt;
		_accy = _accy - 0.003 * (cos _dir) * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 16 and _keyu != 16) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accz = _accz + 0.003 * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 44 and _keyu != 44) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accz = _accz - 0.003 * CFMOVE * _cfzoom * _cfalt;
	};
	if (_keyd == 3 and _keyu != 3) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx + 0.005 * CFMOVE * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accy = _accy + 0.005 * CFMOVE * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accz = _accz + 0.005 * CFMOVE * (sin _dive) * _cfzoom * _cfalt;
	};
	if (_keyd == 45 and _keyu != 45) then
	{
		_accx = _accx * 0.995;
		_accy = _accy * 0.995;
		_accz = _accz * 0.995;
		_accx = _accx - 0.005 * CFMOVE * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accy = _accy - 0.005 * CFMOVE * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
		_accz = _accz - 0.005 * CFMOVE * (sin _dive) * _cfzoom * _cfalt;
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
	
	_wheel = GCam_MouseWheel select 1;
	if (_wheel > 0.0001 or _wheel < -0.0001) then
	{
		_acczoom = _acczoom - _wheel * 0.004 * CFWHEEL * sin((_zoom / 2.0) * 90);
		GCam_MouseWheel set [1, 0];
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
	
	if (_keyd == 57 or !(alive player) or GCamKill) then
	{
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", _ehid_keydown];
		(findDisplay 46) displayRemoveEventHandler ["KeyUp", _ehid_keyup];
		(findDisplay 46) displayRemoveEventHandler ["MouseMoving", _ehid_mousemove];
		(findDisplay 46) displayRemoveEventHandler ["MouseZChanged", _ehid_mousezchange];
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _ehid_mousebd];
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonUp", _ehid_mousebu];
		
		_cam cameraEffect ["Terminate", "BACK"];
		camDestroy _cam;
		_loopexit = true;
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
	
	if ( (getposATL _cam select 2) < 0.5 ) then
	{
		_cam setPosATL [ _campos select 0, _campos select 1, 0.501 ];
		if (_follow) then
		{
			_campos_rel set [ 2, (getposASL _cam select 2) - (getposASL _obj select 2) ];
		}
		else
		{
			_objpos set [ 2 , getposASL _obj select 2];
			_campos_rel set [ 2, (getposASL _cam select 2) - (_objpos select 2) ];
		};
		if ( _accz < 0 ) then { _accz = 0 };
	};
	
	_wait = accTime / (diag_fps * 2);
	sleep _wait;
};

titletext["GCam Terminated","plain down",0.2];
