//=================================================================================
// GCam 1.12
//
// Battle observation / Unit action pursuit camera script by Gigan
//
// Execute GCam
// handle = [ Unit ] execVM "gcam.sqf";
//
// This camera script needs "gcam_component.hpp".
// Include "gcam_component.hpp" to "description.ext".
//
//=================================================================================
// KEYBINDS
//
// - Common Key Operation -
// W,A,S,D           : Move Horizontal
// Q,Z               : Up/Down
// 2,X               : Move Straight
// Mouse Left Drag   : Turning
// Mouse Wheel       : Zooming
// Mouse Left Click  : Switch Clicked Unit
// Mouse Right Click : To Default Zoom
// Cursor Up/Down    : Switch Unit in Group
// Cursor Left/Right : Switch Group
// L                 : Units List
// M                 : Map Click to Switch Unit
// N                 : Night Vision
// B                 : Toggle Behind Mode
// F                 : Toggle Follow Mode
// C                 : Toggle Focus Mode
// H                 : Help
// Esc               : Quit Camera
//
// - At Behind Mode -
// A,D               : Move Around
// W,S               : Move Horizontal Near/Far
// 2,X               : Move Near/Far
//
//=================================================================================
// CONFIG

// Move Speed ( Recommended 0.0-1.0 )
#define CFMOVE 0.8

// Turn Speed ( Recommended 0.0-1.0 )
#define CFTRK 0.5

// Zoom Speed ( Recommended 0.0-1.0 )
#define CFWHEEL 0.3

// Show Unit Type in Units List and in Map. ( true | false )
#define LISTFRIENDLY true
#define LISTENEMY true
#define LISTCIVILIAN true
#define LISTANIMAL true

// Smoothly unit switching movement. ( true | false )
#define SWITCHSMOOTH true

// Camera and unit distance adjusts with unit size after unit switching. ( true | false )
#define SWITCHADJDIS true

// The unit shows up in screen center after unit switching. ( true | false )
#define SWITCHCENTER false

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
#define INITBEHINDMODE true
#define INITFOCUSMODE true

// Behind mode parameter.
#define BEHINDSPDAROUND 0.056
#define BEHINDSPDROTATE 2.7

// Smooth switch parameter.
#define SWITCHSPEED 510

//=================================================================================


GCam_Key_Down = [0,-1];
GCam_Key_Up = [0,-1];
GCam_Mouse_Move = [0,-1,-1];
GCam_Mouse_Hold = [0,-1,-1];
GCam_Mouse_Wheel = [0,0];
GCam_Mouse_BD = [0,-1];
GCam_Mouse_BU = [0,-1];
GCam_Key_Down_List = [0,-1];
GCam_Mouse_List = [1,-1];
GCam_Close_List = [1,-1];
GCam_Key_Down_Map = [1,-1];
GCam_Button_Map_Close = [1,-1];
GCam_Button_Map_Scan = [1,-1];
GCam_Button_List_Behind = [1,-1];
GCam_Button_List_Follow = [1,-1];
GCam_Button_List_Focus = [1,-1];

GCam_Map_Clicked = false;
GCam_Map_Clicked_PosX = 0;
GCam_Map_Clicked_PosY = 0;

_loopexit = false;
_wait = accTime / (diag_fps * 2);

_obj = objnull;
_obj_last = objnull;
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
camUseNVG false;
_nvg = true;
_cfalt = 1.0;

_showhelp = true;
_helptext = "-= GCam =-\n\n- Common Key Operation -\nW,A,S,D : Move Horizontal\nQ,Z : Up/Down\n2,X : Move Straight\nMouse Left Drag : Turning\nMouse Wheel : Zooming\nMouse Left Click : Switch Clicked Unit\nMouse Right Click : To Default Zoom\nCursor Up/Down : Switch Unit in Group\nCursor Left/Right : Switch Group\nL : Units List\nM : Map Click to Switch Unit\nN : Night Vision\nB : Toggle Behind Mode\nF : Toggle Follow Mode\nC : Toggle Focus Mode\nH : Help\nEsc : Quit Camera\n\n- At Behind Mode -\nA,D : Move Around\nW,S : Move Horizontal Near/Far\n2,X : Move Near/Far";

_keyd = 0;
_keyu = 0;
_wheel = 0;
_mousemove = false;
_mousepos = [0,0];
_mousepos_last = [0,0];
_keyd_list = -1;
_button_close = -1;
_button_scan = -1;
_button_behind = -1;
_button_follow = -1;
_button_focus = -1;
_mouse_list = -1;

_exitmaploop = false;
_mapshow = false;
_scanned = false;
_scantime = 0;
_scanpos = [];
_markername = "";
_passtime = 0;
_msizecoef = 1;
_marked_objlist = [];
_addspace = "";
_crewname = "";

_so_objlist = [];
_so_chkgroup = grpNull;
_so_noleadercivgrp = [];
_so_objgroup = grpNull;
_so_grpmatch = false;
_so_matchobj = objnull;
_so_chkunit = objnull;
_so_firstunit_chkd = false;
_so_ignobjlist = [];
_so_enobjlist = [];
_so_leaderlist = [];

_behind = INITBEHINDMODE;
_follow = INITFOLLOWMODE;
_focus = INITFOCUSMODE;

_cy_objlist_ingroup = [];
_cy_objlist_leader = [];
_cy_vehlist = [];
_cy_num = 0;
_cy_i = 0;
_cy_selectnum = 0;

_listshow = false;
_li_cnt = 0;
_li_keycnt = 0;
_li_selectedgroup = grpNull;
_li_keystr = ["1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

_sm_cnt = 0;
_sm_campos = [0,0,0];
_sm_objpos = [0,0,0];
_sm_camobjdis_ary = [0,0,0];
_sm_camobjxydis = 0;
_sm_corrattde = 0;
_sm_camobjdir = 0;
_sm_camobjdir_dif = 0;
_sm_camobjdive = 0;
_sm_dive_dif = 0;
_sm_campos_tar = [0,0,0];
_sm_campos_tar_last = [0,0,0];

_re_campos_last = [0,0,0];
_re_camobjdir = 0;
_re_camposrel_last = [0,0,0];

_fo_camobjxydis = sqrt(INITCAMDISY^2 + INITCAMDISZ^2);
_fo_camobjzdis = 0;
_fo_camdir_add = 0;
_fo_camobjdir = 0;
_fo_dir_last = 0;
_fo_dive_last = 0;

_be_corrattde = 0;
_be_camobjxydis_tar = sqrt(INITCAMDISY^2 + INITCAMDISZ^2);
_be_camobjxydis = sqrt(INITCAMDISY^2 + INITCAMDISZ^2);
_be_objdir = 0;
_be_camobjdir_add = 0;
_be_turncoef = 0;
_be_keypushed = false;
_be_lr = 0;
_be_lr_last = 0;
_be_camobjtardir = 0;
_be_camobjdir = 0;
_be_camobjdir_dif = 0;
_be_camdir_add = 0;
_be_camdir_tar = 0;
_be_camdir_dif = 0;
_be_camobjdive = 0;

_fc_objpos = [0,0,0];
_fc_camobjxydis = 0;
_fc_camobjdir = 0;
_fc_camdir_add = 0;
_fc_camobjdir_dif = 0;
_fc_dive_last = 0;
_fc_camdive_add = 0;
_fc_camobjdive_dif = 0;
_fc_corrattde = 0;

_cs_mousepos = [0,0];
_cs_objpos = [0,0,0];
_cs_scrpos = [0,0];
_cs_scr_dis = 0;
_cs_change = false;
_cs_clickareasize = 0;
_cs_clickareasize_coef = 0;
_cs_match = false;
_cs_zcor = 0;
_cs_corrattde = 0;


_SelectObjects =
{
	_so_ignobjlist = [];
	{
		if ( !(alive _x) or ((count(crew _x)) == 0) ) then { _so_ignobjlist = _so_ignobjlist + [_x] };
	} forEach _so_objlist;
	_so_objlist = _so_objlist - _so_ignobjlist;
	
	if (LISTCIVILIAN) then
	{
		_so_ignobjlist = [];
		_so_noleadercivgrp = [];
		{
			if ( (typeOf _x) == "BIS_alice_emptydoor" ) then
			{
				if ( format["%1",leader(group _x)] == format["%1",_x] ) then
				{
					_so_noleadercivgrp = _so_noleadercivgrp + [group _x];
				};
				_so_ignobjlist = _so_ignobjlist + [_x];
				
			};
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_ignobjlist;
		
		{
			_so_ignobjlist = [];
			_so_chkgroup = _x;
			_so_grpmatch = false;
			{
				if ( (group _obj) != _so_chkgroup ) then
				{
					if ( _so_grpmatch and (_so_chkgroup == (group _x)) ) then
					{
						_so_ignobjlist = _so_ignobjlist + [_x];
					};
					if ( !(_so_grpmatch) and (_so_chkgroup == (group _x)) ) then
					{
						_so_grpmatch = true;
					};
				};
			} forEach _so_objlist;
			_so_objlist = _so_objlist - _so_ignobjlist;
		} forEach _so_noleadercivgrp;
	};
	
	if ( !(LISTFRIENDLY) ) then
	{
		_so_ignobjlist = [];
		{
			if ( ((side player) getFriend (side _x)) >= 0.6 and !(((crew _x) select 0) iskindof "Civilian") and !(_x iskindof "Animal") ) then { _so_ignobjlist = _so_ignobjlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_ignobjlist;
	};
	
	if ( !(LISTENEMY) ) then
	{
		_so_enobjlist = [];
		{
			if ( ((side player) getFriend (side _x)) < 0.6 and !(((crew _x) select 0) iskindof "Civilian") and !(_x iskindof "Animal") ) then { _so_enobjlist = _so_enobjlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_enobjlist;
	};
	
	if ( !(LISTCIVILIAN) ) then
	{
		_so_ignobjlist = [];
		{
			if ( ((crew _x) select 0) iskindof "Civilian" ) then { _so_ignobjlist = _so_ignobjlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_ignobjlist;
	};
	
	if ( !(_cs_change) ) then
	{
		if ( _mouse_list == -1 and !(GCam_Map_Clicked) ) then
		{
			_so_grpmatch = false;
			_so_matchobj = objnull;
			{
				if ( _so_objgroup == (group _x) ) then
				{
					_so_matchobj = _x;
					_so_grpmatch = true;
					_so_objgroup = grpNull;
				};
			} forEach _so_objlist;
			if (_so_grpmatch) then
			{
				_so_objlist = _so_objlist - [_so_matchobj];
				_so_objlist = [_so_matchobj] + _so_objlist;
			};
		};
		
		_so_leaderlist = [];
		{
			if ( ((group _obj) != (group _x)) and !(alive(leader(group _x))) ) then
			{
				_so_chkunit = _x;
				_so_firstunit_chkd = false;
				{
					if ( !(_so_firstunit_chkd) ) then
					{
						if ( (alive _x) and (_so_chkunit == _x) ) then
						{
							_so_leaderlist = _so_leaderlist + [_so_chkunit];
							_so_firstunit_chkd = true;
						};
						if ( (alive _x) and (_so_chkunit != _x) ) then
						{
							_so_firstunit_chkd = true;
						};
					};
				} forEach units(group _x);
			};
			if ( ((group _obj) == (group _x)) or (vehicle(leader(group _x)) == (vehicle _x)) or ((_x iskindof "Animal") and LISTANIMAL) or ((group _x) in _so_noleadercivgrp) ) then { _so_leaderlist = _so_leaderlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_leaderlist;
		
		if ( !(alive _obj) and (_obj != _obj_last) ) then { _so_objlist = [_obj] + _so_objlist };
	};
};


_SelectCycleUnits =
{
	_cy_objlist_ingroup = [];
	_cy_vehlist = [];
	_cy_num = 0;
	_cy_i = 0;
	{
		if ( alive _x and !(_x iskindof "BIS_alice_emptydoor") ) then
		{
			if ( vehicle _x == _x ) then
			{
				_cy_objlist_ingroup = _cy_objlist_ingroup + [_x];
				if (_obj == vehicle _x) then
				{
					_cy_num = _cy_i;
				};
				_cy_i = _cy_i + 1;
			}
			else
			{
				if ( !((vehicle _x) in _cy_vehlist) ) then
				{
					_cy_objlist_ingroup = _cy_objlist_ingroup + [vehicle _x];
					_cy_vehlist = _cy_vehlist + [vehicle _x];
					if (_obj == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
		};
	} foreach units(group _obj);
};


_SelectCycleLeaders =
{
	_cy_objlist_leader = [];
	_cy_num = 0;
	_cy_i = 0;
	{
		if ( leader(group _x) == _x ) then
		{
			if ( LISTCIVILIAN ) then
			{
				if ( ((typeOf _x) != "BIS_alice_emptydoor") and (_x iskindof "Civilian") ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTFRIENDLY ) then
			{
				if ( (((side player) getFriend (side _x)) >= 0.6) and !(_x iskindof "Civilian") and !(_x iskindof "Animal") ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTENEMY ) then
			{
				if ( (((side player) getFriend (side _x)) < 0.6) and !(_x iskindof "Civilian") and !(_x iskindof "Animal") ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTANIMAL ) then
			{
				if ( _x iskindof "Animal" ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
		};
	} foreach allUnits;
};


_ListObjects =
{
	_li_cnt = 0;
	_li_keycnt = 0;
	_li_selectedgroup = group _obj;
	
	{
		if ( (vehicle(leader(group _x)) != (vehicle _x)) and !(_x iskindof "Animal") ) then
		{ _addspace = " " }
		else
		{ _addspace = "" };
		
		_crewname = "";
		if ((_so_objlist select 0) == _x) then
		{
			{
				if (((crew(_so_objlist select 0)) select 0) != _x) then { _crewname = _crewname + ", " };
				_crewname = _crewname + format["%1", name _x];
			} forEach (crew _x);
		}
		else
		{
			_crewname = name _x;
		};
		
		lbAdd[ 2, format[ "%1%4 %2 : %3", _li_keystr select _li_keycnt, getText( configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName" ), _crewname, _addspace ] ];
		
		switch (true) do
		{
			case ( (_li_selectedgroup == (group _x)) or ((_x iskindof "Animal") and (_x == (_so_objlist select 0)) and _obj == _X) ):
			{ lbSetColor[ 2, _li_cnt, [1,0.6,0.3,1] ] };
			case ( ((crew _x) select 0) iskindof "Civilian" ):
			{ lbSetColor[ 2, _li_cnt, [0.55,0.65,0.95,1] ] };
			case ( _x iskindof "Animal" ):
			{ lbSetColor[ 2, _li_cnt, [0.7,0.6,0.85,1] ] };
			case ( ((side player) getFriend (side _x) ) < 0.6):
			{ lbSetColor[ 2, _li_cnt, [1,0.4,0.4,1] ] };
			case ( ((side player) getFriend (side _x) ) >= 0.6):
			{ lbSetColor[ 2, _li_cnt, [0.3,0.9,0.3,1] ] };
		};
		
		_li_cnt = _li_cnt + 1;
		if ( _li_keycnt > 31 ) then { _li_keycnt = 0 } else { _li_keycnt = _li_keycnt + 1 };
	} forEach _so_objlist;
};


_MarkerSet =
{
	"object" setMarkerSizeLocal [0, 0];
	
	switch (true) do
	{
		case ((_obj iskindof "Animal") or (((crew _obj) select 0) iskindof "Civilian")):
		{ "object" setMarkerColorLocal "ColorBlue" };
		case (((side player) getFriend (side _obj)) < 0.6):
		{ "object" setMarkerColorLocal "ColorRed" };
		case (((side player) getFriend (side _obj)) >= 0.6):
		{ "object" setMarkerColorLocal "ColorGreen" };
	};
	
	_crewname = "";
	if ( (count(crew _obj)) > 1) then
	{
		{
			if (((crew _obj) select 0) != _x) then { _crewname = _crewname + ", " };
			_crewname = _crewname + format["%1", name _x];
		} forEach (crew _obj)
	}
	else
	{
		_crewname = name _obj;
	};
	
	"object" setMarkerTextLocal format["%1 : %2", getText (configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName"), _crewname];
	
	"object" setMarkerPosLocal [getpos _obj select 0, getpos _obj select 1];
	"object" setMarkerTypeLocal "dot";
	"object" setMarkerSizeLocal [1, 1];
};


_ScanMarkerSet =
{
	if (_scanned) then { { deleteMarkerLocal _x } forEach _marked_objlist };
	
	_marked_objlist = [];
	{
		_marked_objlist = _marked_objlist + [format["%1",_x]];
	} forEach _so_objlist;
	
	deleteMarkerLocal "circle";
	createMarkerLocal[ "circle", [ _scanpos select 0, _scanpos select 1 ] ];
	"circle" setMarkerShapeLocal "ELLIPSE";
	"circle" setMarkerBrushLocal "SOLID";
	"circle" setMarkerColorLocal "ColorOrange";
	"circle" setMarkerAlphaLocal 0.3;
	"circle" setMarkerSizeLocal [ViewDistance, ViewDistance];
	
	{
		if ( _obj != _x ) then
		{
			_markername = format["%1",_x];
			createMarkerLocal[ _markername, [ (getpos _x) select 0, (getpos _x) select 1 ] ];
			_markername setMarkerShapeLocal "ICON";
			_markername setMarkerSizeLocal [0,0];
			
			if ((speed _x) > 4) then
			{
				_markername setMarkerTypeLocal "mil_Arrow2";
				_markername setMarkerDirLocal (getdir _x);
				_msizecoef = 0.425;
			}
			else
			{
				_markername setMarkerTypeLocal "dot";
				_msizecoef = 1;
			};
			
			switch (true) do
			{
				case ((_x iskindof "Animal") or (((crew _x) select 0) iskindof "Civilian")):
				{
					_markername setMarkerColorLocal "ColorBlue";
				};
				case (((side player) getFriend (side _x)) < 0.6):
				{
					_markername setMarkerColorLocal "ColorRed";
				};
				case (((side player) getFriend (side _x)) >= 0.6):
				{
					_markername setMarkerColorLocal "ColorGreen";
				};
			};
			
			if ( (group _obj) == (group _x) ) then
			{
				_markername setMarkerSizeLocal [0.6 * _msizecoef, 0.6 * _msizecoef];
			}
			else
			{
				_markername setMarkerSizeLocal [1 * _msizecoef, 1 * _msizecoef];
			};
		};
	} forEach _so_objlist;
	
	_scanned = true;
	_scantime = time;
};


_SmoothMove =
{
	_sm_cnt = 0;
	_sm_campos = getposASL _cam;
	_sm_objpos = getposASL _obj;
	_sm_campos_tar_last = [ (_sm_objpos select 0) + (_campos_rel select 0), (_sm_objpos select 1) + (_campos_rel select 1), (_sm_objpos select 2) + (_campos_rel select 2) ];
	
	if ( _mapshow ) then { { deleteMarkerLocal _x } forEach _marked_objlist };
	
	while { ( [_sm_campos select 0, _sm_campos select 1] distance [_sm_campos_tar_last select 0, _sm_campos_tar_last select 1] ) > 0.1 and _sm_cnt < 110 } do
	{
		_sm_objpos = getposASL _obj;
		
		if ( _follow and _behind ) then
		{
			_be_objdir = ((getdir _obj) -90) * -1;
			if (_be_objdir >= 360) then { _be_objdir = _be_objdir - 360 };
			if (_be_objdir < 0) then { _be_objdir = _be_objdir + 360 };
			
			_be_camdir_tar = _dir - _be_camdir_add;
			if ( _be_camdir_tar >= 360 ) then { _be_camdir_tar = _be_camdir_tar - 360 };
			if ( _be_camdir_tar < 0 ) then { _be_camdir_tar = _be_camdir_tar + 360 };
			
			_be_camdir_dif = _be_objdir - _be_camdir_tar;
			if ( _be_camdir_dif >= 360 ) then { _be_camdir_dif = _be_camdir_dif - 360 };
			if ( _be_camdir_dif < 0 ) then { _be_camdir_dif = _be_camdir_dif + 360 };
			
			_be_camdir_dif = _be_camdir_dif + _be_camobjdir_add;
			if ( _be_camdir_dif >= 360 ) then { _be_camdir_dif = _be_camdir_dif - 360 };
			if ( _be_camdir_dif < 0 ) then { _be_camdir_dif = _be_camdir_dif + 360 };
			
			switch (true) do
			{
				case (_be_camdir_dif >= 0 and _be_camdir_dif < 180) : { _dir = _dir + (abs(sin(_be_camdir_dif/2))) * 15.0 * ((_sm_cnt atan2 15)/90) };
				case (_be_camdir_dif >= 180 and _be_camdir_dif < 360) : { _dir = _dir - (abs(sin(_be_camdir_dif/2))) * 15.0 * ((_sm_cnt atan2 15)/90) };
			};
			if ( _dir >= 360 ) then { _dir = _dir - 360 };
			if ( _dir < 0 ) then { _dir = _dir + 360 };
			
			_campos_rel = [ cos(_be_objdir+180+_be_camobjdir_add) * _be_camobjxydis_tar, sin(_be_objdir+180+_be_camobjdir_add) * _be_camobjxydis_tar, _campos_rel select 2 ];
		};
		
		
		if ( !(_follow) and _focus ) then
		{
			if ( _behind ) then
			{
				_fc_objdir = ((getdir _obj) -90) * -1;
				if (_fc_objdir >= 360) then { _fc_objdir = _fc_objdir - 360 };
				if (_fc_objdir < 0) then { _fc_objdir = _fc_objdir + 360 };
				
				_be_camdir_tar = _dir - _fc_camdir_add;
				if ( _be_camdir_tar >= 360 ) then { _be_camdir_tar = _be_camdir_tar - 360 };
				if ( _be_camdir_tar < 0 ) then { _be_camdir_tar = _be_camdir_tar + 360 };
				
				_be_camdir_dif = _fc_objdir - _be_camdir_tar;
				if ( _be_camdir_dif >= 360 ) then { _be_camdir_dif = _be_camdir_dif - 360 };
				if ( _be_camdir_dif < 0 ) then { _be_camdir_dif = _be_camdir_dif + 360 };
				
				_be_camdir_dif = _be_camdir_dif + _be_camobjdir_add;
				if ( _be_camdir_dif >= 360 ) then { _be_camdir_dif = _be_camdir_dif - 360 };
				if ( _be_camdir_dif < 0 ) then { _be_camdir_dif = _be_camdir_dif + 360 };
				
				switch (true) do
				{
					case (_be_camdir_dif >= 0 and _be_camdir_dif < 180) : { _dir = _dir + (abs(sin(_be_camdir_dif/2))) * 15.0 * ((_sm_cnt atan2 15)/90) };
					case (_be_camdir_dif >= 180 and _be_camdir_dif < 360) : { _dir = _dir - (abs(sin(_be_camdir_dif/2))) * 15.0 * ((_sm_cnt atan2 15)/90) };
				};
				if ( _dir >= 360 ) then { _dir = _dir - 360 };
				if ( _dir < 0 ) then { _dir = _dir + 360 };
				
				_campos_rel = [ cos(_fc_objdir+180+_be_camobjdir_add) * _be_camobjxydis_tar, sin(_fc_objdir+180+_be_camobjdir_add) * _be_camobjxydis_tar, _fo_camobjzdis ];
			}
			else
			{
				_fc_objpos = _sm_objpos;
				_fc_campos = _sm_campos;
				
				_fc_camobjdir = ( ( ((_fc_objpos select 0) - (_fc_campos select 0)) atan2 ((_fc_objpos select 1) - (_fc_campos select 1)) ) -90 ) * -1;
				if (_fc_camobjdir >= 360) then { _fc_camobjdir = _fc_camobjdir - 360 };
				if (_fc_camobjdir < 0) then { _fc_camobjdir = _fc_camobjdir + 360 };
				
				_fc_camobjdir_dif = _dir - _fc_camobjdir;
				if (_fc_camobjdir_dif >= 360) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360 };
				if (_fc_camobjdir_dif < 0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360 };
				
				_fc_camobjdir_dif = _fc_camobjdir_dif - _fc_camdir_add;
				if (_fc_camobjdir_dif >= 360) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360 };
				if (_fc_camobjdir_dif < 0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360 };
				
				switch (true) do
				{
					case (_fc_camobjdir_dif > 0 and _fc_camobjdir_dif < 180) : { _dir = _dir - (abs(sin(_fc_camobjdir_dif/2))) * 20 };
					case (_fc_camobjdir_dif > 180 and _fc_camobjdir_dif < 360) : { _dir = _dir + (abs(sin(_fc_camobjdir_dif/2))) * 20 };
				};
				if ( _dir >= 360 ) then { _dir = _dir - 360 };
				if ( _dir < 0 ) then { _dir = _dir + 360 };
				
				_fc_sw_camobjdir = ( ( (_re_camposrel_last select 0) atan2 (_re_camposrel_last select 1) ) -90 ) * -1;
				_campos_rel = [ cos(_fc_sw_camobjdir) * _fo_camobjxydis, sin(_fc_sw_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
			};
			
			_sm_camobjxydis = sqrt(((_sm_campos select 0) - (_sm_objpos select 0))^2 + ((_sm_campos select 1) - (_sm_objpos select 1))^2);
			if ( _obj isKindOf "Man" ) then { _sm_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30/(_sm_camobjxydis+0.1))) };
			
			_sm_camobjdive = (sqrt(((_sm_objpos select 0) - (_sm_campos select 0))^2 + ((_sm_objpos select 1) - (_sm_campos select 1))^2) atan2 (((_sm_objpos select 2) - (_sm_campos select 2)) + 1.57 + _sm_corrattde) - 90) * -1;
			_sm_dive_tar = _sm_camobjdive + _fc_camdive_add;
			_sm_dive_dif = _sm_dive_tar - _dive;
			
			switch (true) do
			{
				case (_sm_dive_dif > 0) : { _dive = _dive + abs sin(_sm_dive_dif/2) * 15.0 * ((_sm_cnt atan2 15)/90) };
				case (_sm_dive_dif <= 0) : { _dive = _dive - abs sin(_sm_dive_dif/2) * 15.0 * ((_sm_cnt atan2 15)/90) };
			};
			if (_dive > 89) then { _dive = 89 };
			if (_dive < -89) then { _dive = -89 };
		};
		
		if ( !(_follow) and !(_focus) ) then
		{
			_campos_rel = [ cos(_dir+180) * _fo_camobjxydis, sin(_dir+180) * _fo_camobjxydis, _fo_camobjzdis ];
		};
		
		if ( SWITCHCENTER or _cs_change ) then
		{
			if ( _follow or ( !(_focus) and !(_follow) ) ) then
			{
				if ( !(_behind) and _follow ) then
				{
					_sm_camobjdir = ( ( (_re_camposrel_last select 0) atan2 (_re_camposrel_last select 1) ) +90 ) * -1;
					if (_sm_camobjdir >= 360) then { _sm_camobjdir = _sm_camobjdir - 360 };
					if (_sm_camobjdir < 0) then { _sm_camobjdir = _sm_camobjdir + 360 };
					
					_sm_camobjdir_dif = _dir - _sm_camobjdir;
					if (_sm_camobjdir_dif >= 360) then { _sm_camobjdir_dif = _sm_camobjdir_dif - 360 };
					if (_sm_camobjdir_dif < 0) then { _sm_camobjdir_dif = _sm_camobjdir_dif + 360 };
					
					switch (true) do
					{
						case (_sm_camobjdir_dif > 0 and _sm_camobjdir_dif < 180) : { _dir = _dir - (abs(sin(_sm_camobjdir_dif/2))) * 5 };
						case (_sm_camobjdir_dif > 180 and _sm_camobjdir_dif < 360) : { _dir = _dir + (abs(sin(_sm_camobjdir_dif/2))) * 5 };
					};
					if ( _dir >= 360 ) then { _dir = _dir - 360 };
					if ( _dir < 0 ) then { _dir = _dir + 360 };
				};
				
				_sm_camobjxydis = sqrt(((_sm_campos select 0) - (_sm_objpos select 0))^2 + ((_sm_campos select 1) - (_sm_objpos select 1))^2);
				if ( _obj isKindOf "Man" ) then { _sm_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30/(_sm_camobjxydis+0.1))) };
				
				_sm_camobjdive = (sqrt(((_sm_objpos select 0) - (_sm_campos select 0))^2 + ((_sm_objpos select 1) - (_sm_campos select 1))^2) atan2 (((_sm_objpos select 2) - (_sm_campos select 2)) + 1.57 + _sm_corrattde) - 90) * -1;
				_sm_dive_dif = _sm_camobjdive - _dive;
				
				switch (true) do
				{
					case (_sm_dive_dif > 0) : { _dive = _dive + abs sin(_sm_dive_dif/2) * 15.0 * ((_sm_cnt atan2 15)/90) };
					case (_sm_dive_dif <= 0) : { _dive = _dive - abs sin(_sm_dive_dif/2) * 15.0 * ((_sm_cnt atan2 15)/90) };
				};
				if (_dive > 89) then { _dive = 89 };
				if (_dive < -89) then { _dive = -89 };
			};
		};
		
		
		if (_behind) then
		{
			if (_obj isKindOf "Man") then { _be_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30/(_be_camobjxydis_tar+0.1))) };
		};
		
		
		if ( _mapshow ) then
		{
			"camera" setMarkerPosLocal [_sm_campos select 0, _sm_campos select 1];
			"camera" setMarkerDirLocal -(_dir) + 90;
			"object" setMarkerPosLocal [_sm_objpos select 0, _sm_objpos select 1];
		};
		
		_sm_campos_tar = [ (_sm_objpos select 0) + (_campos_rel select 0), (_sm_objpos select 1) + (_campos_rel select 1), (_sm_objpos select 2) + (_campos_rel select 2) ];
		_sm_camobjdis_ary = [ (_sm_campos_tar select 0) - (_sm_campos select 0), (_sm_campos_tar select 1) - (_sm_campos select 1), (_sm_campos_tar select 2) - (_sm_campos select 2) ];
		_sm_campos = [ (_sm_campos select 0) + ((((_sm_camobjdis_ary select 0)/3)) * ((_sm_cnt atan2 110)/90)) + ((_sm_campos_tar select 0) - (_sm_campos_tar_last select 0)) * ((_sm_cnt atan2 5)/90), (_sm_campos select 1) + ((((_sm_camobjdis_ary select 1)/3)) * ((_sm_cnt atan2 110)/90)) + ((_sm_campos_tar select 1) - (_sm_campos_tar_last select 1)) * ((_sm_cnt atan2 5)/90), (_sm_campos select 2) + ((((_sm_camobjdis_ary select 2)/3)) * ((_sm_cnt atan2 110)/90)) + (((_sm_campos_tar select 2) - (_sm_campos_tar_last select 2)) * ((_sm_cnt atan2 5)/90)) ];
		_cam setPosASL [_sm_campos select 0, _sm_campos select 1, (_sm_campos select 2) + _be_corrattde];
		_cam camSetTarget [ (_sm_campos select 0) + (cos _dir) * (cos _dive) * 100000, (_sm_campos select 1) + (sin _dir) * (cos _dive) * 100000, (_sm_campos select 2) + (sin _dive) * 100000];
		_cam camCommit 0;
		
		_sm_campos_tar_last = _sm_campos_tar;
		
		if ( (getpos _cam select 2) < 0.5 ) then { _cam setPos [ getposASL _cam select 0, getposASL _cam select 1, 0.501 - _be_corrattde ] };
		
		_sm_cnt = _sm_cnt + 1;
		sleep _wait;
	};
	
	GCam_Key_Down set [1, -1];
};


_CreateDialog =
{
	createDialog "GCamDialog2";
	(findDisplay 5003 displayCtrl 2) ctrlShow false;
	(findDisplay 5003 displayCtrl 3) ctrlShow false;
	(findDisplay 5003 displayCtrl 3) ctrlSetText format["%1",_helptext];
	(findDisplay 5003 displayCtrl 4) ctrlShow false;
	(findDisplay 5003 displayCtrl 5) ctrlShow false;
	(findDisplay 5003 displayCtrl 6) ctrlShow false;
	(findDisplay 5003 displayCtrl 7) ctrlShow false;
	(findDisplay 5003 displayCtrl 8) ctrlShow false;
	(findDisplay 5003 displayCtrl 9) ctrlShow false;
	(findDisplay 5003 displayCtrl 10) ctrlShow false;
	(findDisplay 5003 displayCtrl 1) ctrlSetEventHandler ["KeyDown", "GCam_Key_Down = _this"];
	(findDisplay 5003 displayCtrl 1) ctrlSetEventHandler ["KeyUp", "GCam_Key_Up = _this"];
	(findDisplay 5003 displayCtrl 1) ctrlSetEventHandler ["MouseMoving", "GCam_Mouse_Move = _this"];
	(findDisplay 5003 displayCtrl 1) ctrlSetEventHandler ["MouseZChanged", "GCam_Mouse_Wheel = _this"];
	(findDisplay 5003 displayCtrl 1) ctrlSetEventHandler ["MouseButtonDown", "GCam_Mouse_BD = _this"];
	(findDisplay 5003 displayCtrl 1) ctrlSetEventHandler ["MouseButtonUp", "GCam_Mouse_BU = _this"];
	(findDisplay 5003 displayCtrl 2) ctrlSetEventHandler ["KeyDown", "GCam_Key_Down_List = _this"];
	(findDisplay 5003 displayCtrl 2) ctrlSetEventHandler ["LBSelChanged", "GCam_Mouse_List = _this"];
	(findDisplay 5003 displayCtrl 4) ctrlSetEventHandler ["MouseButtonClick", "GCam_Close_List = _this"];
	(findDisplay 5003 displayCtrl 5) ctrlSetEventHandler ["KeyDown", "GCam_Key_Down_Map = _this"];
	(findDisplay 5003 displayCtrl 6) ctrlSetEventHandler ["MouseButtonClick", "GCam_Button_Map_Close = _this"];
	(findDisplay 5003 displayCtrl 7) ctrlSetEventHandler ["MouseButtonClick", "GCam_Button_Map_Scan = _this"];
	(findDisplay 5003 displayCtrl 8) ctrlSetEventHandler ["MouseButtonClick", "GCam_Button_List_Behind = _this"];
	(findDisplay 5003 displayCtrl 9) ctrlSetEventHandler ["MouseButtonClick", "GCam_Button_List_Follow = _this"];
	(findDisplay 5003 displayCtrl 10) ctrlSetEventHandler ["MouseButtonClick", "GCam_Button_List_Focus = _this"];
	ctrlEnable [1,true];
};


_ResetCamera =
{
	_accx = 0;
	_accy = 0;
	_accz = 0;
	_accdir = 0;
	_accdive = 0;
	_acczoom = 0;
	
	_re_campos_last = getposASL _cam;
	_re_camposrel_last = _campos_rel;
	
	if ( SWITCHADJDIS ) then
	{
		switch (true) do
		{
			case (_obj isKindOf "Car"):
			{
				_campos_rel set [ 2, 1.2 + 1.2 ];
				_fo_camobjxydis = 6.6;
				_fo_camobjzdis = 2.4;
			};
			case (_obj isKindOf "Tank"):
		    {
				_campos_rel set [ 2, 1.2 + 1.55 ];
				_fo_camobjxydis = 7.5;
				_fo_camobjzdis = 2.75;
			};
			case (_obj isKindOf "Helicopter"):
		    {
				_campos_rel set [ 2, 1.2 + 2.7 ];
				_fo_camobjxydis = 10.0;
				_fo_camobjzdis = 3.9;
			};
			case (_obj isKindOf "Air"):
		    {
				_campos_rel set [ 2, 1.2 + 2.7 ];
				_fo_camobjxydis = 15.0;
				_fo_camobjzdis = 2.9;
			};
			case (_obj isKindOf "Ship"):
		    {
				_campos_rel set [ 2, 1.2 + 1.5 ];
				_fo_camobjxydis = 7.5;
				_fo_camobjzdis = 2.7;
			};
			default
			{
				_campos_rel set [ 2, 1.2 + 0.5 ];
				_fo_camobjxydis = 2.6;
				_fo_camobjzdis = 1.7;
			};
		};
		
		if ( _behind ) then
		{
			_be_camobjxydis_tar = _fo_camobjxydis;
			_be_camobjxydis = _be_camobjxydis_tar;
		};
		
		if ( _follow and !(_behind) ) then
		{
			_re_camobjdir = ( ( (_re_camposrel_last select 0) atan2 (_re_camposrel_last select 1) ) -90 ) * -1;
			_campos_rel = [ cos(_re_camobjdir) * _fo_camobjxydis, sin(_re_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
		};
	};
	
	
	if (!(_obj isKindOf "Man")) then
	{
		_be_corrattde = 0;
		_fc_corrattde = 0;
	};
	
	if ( SWITCHCENTER or _cs_change ) then
	{
		if (_behind) then
		{
			_be_camdir_add = 0;
		};
		
		if ( !(_follow) and _focus ) then
		{
			_fc_camdir_add = 0;
			_fc_camdive_add = 0;
		};
	};
		
	if ( SWITCHSMOOTH ) then { call _SmoothMove };
	
	
	if ( _follow and _behind ) then
	{
		_be_objdir = ((getdir _obj) -90) * -1;
		if (_be_objdir >= 360) then { _be_objdir = _be_objdir - 360 };
		if (_be_objdir < 0) then { _be_objdir = _be_objdir + 360 };
		
		_dir = _be_objdir + _be_camdir_add;
		if (_dir >= 360) then { _dir = _dir - 360 };
		if (_dir < 0) then { _dir = _dir + 360 };
		
		_dir = _dir + _be_camobjdir_add;
		if ( _dir >= 360 ) then { _dir = _dir - 360 };
		if ( _dir < 0 ) then { _dir = _dir + 360 };
		
		_campos_rel = [ cos(_be_objdir+180+_be_camobjdir_add) * _be_camobjxydis_tar, sin(_be_objdir+180+_be_camobjdir_add) * _be_camobjxydis_tar, _campos_rel select 2 ];
	};
	
	if ( !(_follow) and _focus ) then
	{
		if ( _behind ) then
		{
			_fc_objdir = ((getdir _obj) -90) * -1;
			if (_fc_objdir >= 360) then { _fc_objdir = _fc_objdir - 360 };
			if (_fc_objdir < 0) then { _fc_objdir = _fc_objdir + 360 };
			
			_dir = _fc_objdir + _fc_camdir_add;
			if (_dir >= 360) then { _dir = _dir - 360 };
			if (_dir < 0) then { _dir = _dir + 360 };
			
			_dir = _dir + _be_camobjdir_add;
			if ( _dir >= 360 ) then { _dir = _dir - 360 };
			if ( _dir < 0 ) then { _dir = _dir + 360 };
			
			_campos_rel = [ cos(_fc_objdir+180+_be_camobjdir_add) * _fo_camobjxydis, sin(_fc_objdir+180+_be_camobjdir_add) * _fo_camobjxydis, _fo_camobjzdis ];
		}
		else
		{
			_fc_sw_camobjdir = ( ( (_re_camposrel_last select 0) atan2 (_re_camposrel_last select 1) ) -90 ) * -1;
			_campos_rel = [ cos(_fc_sw_camobjdir) * _fo_camobjxydis, sin(_fc_sw_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
		};
	};
	
	if ( !(_follow) and !(_focus) ) then
	{
		_campos_rel = [ cos(_dir+180) * _fo_camobjxydis, sin(_dir+180) * _fo_camobjxydis, _fo_camobjzdis ];
	};
	
	
	_objpos = getposASL _obj;
	_campos = [ (_objpos select 0) + (_campos_rel select 0) , (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];
	_cam setPosASL [ _campos select 0, _campos select 1, (_campos select 2) + _be_corrattde ];
	_cam camSetTarget [ (_campos select 0) + (cos _dir) * (cos _dive) * 100000, (_campos select 1) + (sin _dir) * (cos _dive) * 100000, (_campos select 2) + (sin _dive) * 100000];
	_cam camCommit 0;
	
	
	_crewname = "";
	if ( count(crew _obj) > 1 ) then
	{
		{
			if (((crew _obj) select 0) != _x) then { _crewname = _crewname + ", " };
			_crewname = _crewname + format["%1", name _x];
		} forEach (crew _obj);
	}
	else
	{
		_crewname = name _obj;
	};
	titletext[format[ "%1 : %2\n%3", getText( configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName" ), _crewname, group _obj], "plain down", 0.3];
};


_obj = vehicle (_this select 0);
if (isnil"_obj") then { _obj = player };
_obj_last = _obj;
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

call _ResetCamera;
call _CreateDialog;



while {!(_loopexit)} do
{
	_wait = accTime / (diag_fps * 2);
	
	_accx = _accx * 0.8;
	_accy = _accy * 0.8;
	_accz = _accz * 0.8;
	_accdir = _accdir * 0.8;
	_accdive = _accdive * 0.8;
	_acczoom = _acczoom * 0.8;
	
	_mousebd = GCam_Mouse_BD select 1;
	_mousebu = GCam_Mouse_BU select 1;
	if (isnil "_mousebd") then { _mousebd = -1 };
	if (isnil "_mousebu") then { _mousebu = -1 };
	
	if ( (_mousebu == 0) or (_mousebu == 1 and _mousebd == 1) ) then
	{
		if ( _mousebu == 0 and (_mousepos distance _cs_mousepos) < 0.01 ) then
		{
			_cs_change = true;
			
			_so_objlist = nearestObjects [_obj, ["AllVehicles"], 600];
			call _SelectObjects;
			
			_cs_match = false;
			{
				_cs_objpos = getpos _x;
				
				if (typeOf _x == "2S6M_TUNGUSKA") then
				{
					_cs_zcor = 2.0;
				}
				else
				{
					_cs_zcor = 0;
				};
				
				if (_x isKindOf "Man") then
				{
					_cs_corrattde = ((_x selectionposition "head_axis") select 2) - 1.57;
				}
				else
				{
					_cs_corrattde = 0;
				};
				
				_cs_scrpos = worldtoscreen [ _cs_objpos select 0, _cs_objpos select 1, (_cs_objpos select 2) + 1.2 + _cs_zcor + _cs_corrattde ];
				if (count _cs_scrpos == 0) then { _cs_scrpos = [100,100] };
				
				_cs_scr_dis = _cs_mousepos distance _cs_scrpos;
				
				switch (true) do
				{
					case (_x isKindOf "Car"):
					{
						_cs_clickareasize_coef = 2.5;
					};
					case (_x isKindOf "Tank"):
				    {
						_cs_clickareasize_coef = 4.0;
					};
					case (_x isKindOf "Helicopter"):
				    {
						_cs_clickareasize_coef = 7.5;
					};
					case (_x isKindOf "Air"):
				    {
						_cs_clickareasize_coef = 11.0;
					};
					case (_x isKindOf "Ship"):
				    {
						_cs_clickareasize_coef = 3.0;
					};
					default
					{
						_cs_clickareasize_coef = 1.0;
					};
				};
				_cs_clickareasize = (1.25 / (0.1 + (_campos distance _cs_objpos) )) * _cs_clickareasize_coef * (0.5 / _cfzoom);
				
				if ( !(_cs_match) and (_cs_scr_dis < _cs_clickareasize) ) then
				{
					_obj = _x;
					_cs_match = true;
				};
			} foreach _so_objlist;
			
			if ( _cs_match and ((_obj != _obj_last) or !(_follow)) ) then
			{
				call _ResetCamera;
				
				_obj_last = _obj
			};
			
			_cs_change = false;
		};
		
		GCam_Mouse_BD set [1, -1];
		GCam_Mouse_BU set [1, -1];
		_mousemove = false;
	};
	if (_mousebd == 0 and _mousebu != 0 and !(_mousemove)) then
	{
		_mousepos_last = [ GCam_Mouse_Move select 1, GCam_Mouse_Move select 2 ];
		_cs_mousepos = _mousepos_last;
		
		_mousemove = true;
	};
	
	if (_mousebd == 0 and _mousebu != 0 and _mousemove) then
	{
		_mousepos = [ GCam_Mouse_Move select 1, GCam_Mouse_Move select 2 ];
		_accdir = _accdir - ((_mousepos_last select 0) - (_mousepos select 0)) * 140.0 * CFTRK * (-1) * _cfzoom / (cos abs(_dive / (1.0 + _cfzoom)));
		_dir = _dir + _accdir;
		if (_dir >= 360) then { _dir = _dir - 360 };
		if (_dir < 0) then { _dir = _dir + 360 };
		
		_accdive = _accdive - ((_mousepos_last select 1) - (_mousepos select 1)) * 105.0 * CFTRK * (-1) * _cfzoom;
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
		
		_mousepos_last = _mousepos;
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
		_be_keypushed = false;
	};
	
	if (_keyd == 17 and _keyu != 17) then
	{
		if (_behind and _follow) then
		{
			_accx = _accx + (cos _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
			_accy = _accy + (sin _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accx = _accx + (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy + (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			
		};
		_be_keypushed = true;
	};
	if (_keyd == 31 and _keyu != 31) then
	{
		if (_behind and _follow) then
		{
			_accx = _accx - (cos _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
			_accy = _accy - (sin _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accx = _accx - (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy - (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
		};
		_be_keypushed = true;
	};
	if (_keyd == 30 and _keyu != 30) then
	{
		if (_behind and _follow) then
		{
			_be_camobjdir_add = _be_camobjdir_add - CFMOVE * 2.2 * _cfzoom;
			if ( _be_camobjdir_add >= 360 ) then { _be_camobjdir_add = _be_camobjdir_add - 360 };
			if ( _be_camobjdir_add < 0 ) then { _be_camobjdir_add = _be_camobjdir_add + 360 };
		}
		else
		{
			_accx = _accx - (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy + (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_be_keypushed = true;
		};
	};
	if (_keyd == 32 and _keyu != 32) then
	{
		if (_behind and _follow) then
		{
			_be_camobjdir_add = _be_camobjdir_add + CFMOVE * 2.2 * _cfzoom;
			if ( _be_camobjdir_add >= 360 ) then { _be_camobjdir_add = _be_camobjdir_add - 360 };
			if ( _be_camobjdir_add < 0 ) then { _be_camobjdir_add = _be_camobjdir_add + 360 };
		}
		else
		{
			_accx = _accx + (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy - (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_be_keypushed = true;
		};
	};
	if (_keyd == 16 and _keyu != 16) then
	{
		if ( _follow ) then
		{
			_accz = _accz + CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accz = _accz + CFMOVE * 0.05 * _cfzoom * _cfalt;
		};
	};
	if (_keyd == 44 and _keyu != 44) then
	{
		if ( _follow ) then
		{
			_accz = _accz - CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accz = _accz - CFMOVE * 0.05 * _cfzoom * _cfalt;
		};
	};
	if (_keyd == 3 and _keyu != 3) then
	{
		if (_behind and _follow) then
		{
			_be_camobjdive = (sqrt(((_objpos select 0) - (_campos select 0))^2 + ((_objpos select 1) - (_campos select 1))^2) atan2 ((_objpos select 2) - (_campos select 2) + 1.57 + _be_corrattde) - 90) * -1;
			_accx = _accx + 1.5 * CFMOVE * 0.05 * (cos _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accy = _accy + 1.5 * CFMOVE * 0.05 * (sin _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accz = _accz + 1.5 * CFMOVE * 0.05 * (sin _be_camobjdive) * _cfzoom;
		}
		else
		{
			_accx = _accx + 1.5 * CFMOVE * 0.05 * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accy = _accy + 1.5 * CFMOVE * 0.05 * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accz = _accz + 1.5 * CFMOVE * 0.05 * (sin _dive) * _cfzoom * _cfalt;
		};
		_be_keypushed = true;
	};
	if (_keyd == 45 and _keyu != 45) then
	{
		if (_behind and _follow) then
		{
			_be_camobjdive = (sqrt(((_objpos select 0) - (_campos select 0))^2 + ((_objpos select 1) - (_campos select 1))^2) atan2 ((_objpos select 2) - (_campos select 2) + 1.57 + _be_corrattde) - 90) * -1;
			_accx = _accx - 1.5 * CFMOVE * 0.05 * (cos _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accy = _accy - 1.5 * CFMOVE * 0.05 * (sin _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accz = _accz - 1.5 * CFMOVE * 0.05 * (sin _be_camobjdive) * _cfzoom;
		}
		else
		{
			_accx = _accx - 1.5 * CFMOVE * 0.05 * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accy = _accy - 1.5 * CFMOVE * 0.05 * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accz = _accz - 1.5 * CFMOVE * 0.05 * (sin _dive) * _cfzoom * _cfalt;
		};
		_be_keypushed = true;
	};
	
	if (_keyd == 33 and _keyu == 33) then
	{
		_follow = !(_follow);
		
		if (_follow) then
		{
			titletext["Follow Mode Enabled","plain down",0.15];
			
			_cfalt = 1.0;
			
			if (_behind) then
			{
				_be_camobjxydis_tar = _fo_camobjxydis;
				_be_camobjxydis = _be_camobjxydis_tar;
				
				_be_camdir_add = 0;
				_be_camobjdir_add = 0;
				
				_objpos = getposASL _obj;
				_campos_rel = [ cos(((getdir _obj)+90)*-1) * _be_camobjxydis_tar, sin(((getdir _obj)+90)*-1) * _be_camobjxydis_tar, _fo_camobjzdis ];
				_campos = [ (_objpos select 0) + (_campos_rel select 0) , (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];
				
				_dir = ((getdir _obj) -90) * -1;
				if (_dir >= 360) then { _dir = _dir - 360 };
				if (_dir < 0) then { _dir = _dir + 360 };
				
				_dive = _fo_dive_last;
			}
			else
			{
				_campos_rel = [ cos(_dir+180) * _fo_camobjxydis, sin(_dir+180) * _fo_camobjxydis, _fo_camobjzdis ];
				
				_dive = _fo_dive_last;
			};
		}
		else
		{
			titletext["Follow Mode Disabled","plain down",0.15];
			
			_fo_camobjxydis = sqrt((_campos_rel select 0)^2 + (_campos_rel select 1)^2);
			_fo_camobjzdis = _campos_rel select 2;
			_fo_dive_last = _dive;
			_fo_dir_last = _dir;
			
			if (_behind) then
			{
				if (_focus) then
				{
					_fc_camdir_add = _be_camdir_add;
				}
				else
				{
					
				};
			}
			else
			{
				if (_focus) then
				{
					_fc_camdir_add = ( ( ((getposASL _obj select 0) - (getposASL _cam select 0)) atan2 ((getposASL _obj select 1) - (getposASL _cam select 1)) ) -90 ) * -1;
					if ( _fc_camdir_add >= 360 ) then { _fc_camdir_add = _fc_camdir_add - 360 };
					if ( _fc_camdir_add < 0 ) then { _fc_camdir_add = _fc_camdir_add + 360 };
					_fc_camdir_add = _dir - _fc_camdir_add;
					if ( _fc_camdir_add >= 360 ) then { _fc_camdir_add = _fc_camdir_add - 360 };
					if ( _fc_camdir_add < 0 ) then { _fc_camdir_add = _fc_camdir_add + 360 };
				}
				else
				{
					
				};
			};
		};
	};
	
	if (_keyd == 48 and _keyu == 48) then
	{
		_behind = !(_behind);
		
		if (_behind) then
		{
			titletext["Behind Mode Enabled","plain down",0.15];
			
			if (_follow) then
			{
				_be_camobjxydis_tar = sqrt((_campos_rel select 0)^2 + (_campos_rel select 1)^2);
				_be_camobjxydis = _be_camobjxydis_tar;
				
				_be_camdir_add = 0;
				_be_camobjdir_add = 0;
				
				_campos_rel = [ cos((((getdir _obj)+90)*-1)+_be_camobjdir_add) * _be_camobjxydis_tar, sin((((getdir _obj)+90)*-1)+_be_camobjdir_add) * _be_camobjxydis_tar, _campos_rel select 2 ];
				
				_dir = ((getdir _obj) -90) * -1;
				if (_dir >= 360) then { _dir = _dir - 360 };
				if (_dir < 0) then { _dir = _dir + 360 };
			};
		}
		else
		{
			titletext["Behind Mode Disabled","plain down",0.15];
		};
		
		GCam_Button_List_Behind set [1,-1];
		ctrlSetFocus (findDisplay 5003 displayCtrl 2);
	};
	
	if (_keyd == 46 and _keyu == 46) then
	{
		_focus = !(_focus);
		
		if (_focus) then
		{
			titletext["Focus Mode Enabled","plain down",0.15];
			
			if (_follow) then
			{
				
			}
			else
			{
				_fc_sw_camobjdir = ( ( ((getposASL _obj select 0) - (getposASL _cam select 0)) atan2 ((getposASL _obj select 1) - (getposASL _cam select 1)) ) +90 ) * -1;
				_campos_rel = [ cos(_fc_sw_camobjdir) * _fo_camobjxydis, sin(_fc_sw_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
				_objpos = getposASL _obj;
				
				_fc_camdir_add = 0;
				_fc_camdive_add = 0;
				
				if (_behind) then
				{
					_campos_rel = [ cos(((getdir _obj)+90)*-1) * _fo_camobjxydis, sin(((getdir _obj)+90)*-1) * _fo_camobjxydis, _fo_camobjzdis ];
					
					_dir = ((getdir _obj) -90) * -1;
					if (_dir >= 360) then { _dir = _dir - 360 };
					if (_dir < 0) then { _dir = _dir + 360 };
				};
			};
		}
		else
		{
			titletext["Focus Mode Disabled","plain down",0.15];
		};
	};
	
	if (_keyd == 200 and _keyu == 200) then
	{
		call _SelectCycleUnits;
		
		if (count _cy_objlist_ingroup > 0) then
		{
			_cy_num = _cy_num + 1;
			if ((count _cy_objlist_ingroup) == _cy_num) then
			{
				_cy_num = 0;
			};
			_obj = _cy_objlist_ingroup select _cy_num;
			
			while {_obj iskindof "BIS_alice_emptydoor"} do
			{
				_cy_num = _cy_num + 1;
				if ((count _cy_objlist_ingroup) == _cy_num) then
				{
					_cy_num = 0;
				};
				_obj = _cy_objlist_ingroup select _cy_num;
			};
			
			call _ResetCamera;
			_obj_last = _obj;
		};
	};
	if (_keyd == 208 and _keyu == 208) then
	{
		call _SelectCycleUnits;
		
		if (count _cy_objlist_ingroup > 0) then
		{
			_cy_num = _cy_num - 1;
			if (_cy_num < 0) then
			{
				_cy_num = (count _cy_objlist_ingroup) - 1;
			};
			_obj = _cy_objlist_ingroup select _cy_num;
			
			while {_obj iskindof "BIS_alice_emptydoor"} do
			{
				_cy_num = _cy_num - 1;
				if (_cy_num < 0) then
				{
					_cy_num = (count _cy_objlist_ingroup) - 1;
				};
				_obj = _cy_objlist_ingroup select _cy_num;
			};
			
			call _ResetCamera;
			_obj_last = _obj;
		};
	};
	if (_keyd == 205 and _keyu == 205) then
	{
		call _SelectCycleLeaders;
		
		_cy_num = _cy_num + 1;
		if ((count _cy_objlist_leader) == _cy_num) then
		{
			_cy_num = 0;
		};
		_obj = _cy_objlist_leader select _cy_num;
		
		_cy_selectnum = 1;
		while {_obj iskindof "BIS_alice_emptydoor" and count(units(group _obj)) > _cy_selectnum} do
		{
			_obj = units(group _obj) select _cy_selectnum;
			
			_cy_selectnum = _cy_selectnum + 1;
		};
		
		call _ResetCamera;
		_obj_last = _obj;
	};
	if (_keyd == 203 and _keyu == 203) then
	{
		call _SelectCycleLeaders;
		
		_cy_num = _cy_num - 1;
		if (_cy_num < 0) then
		{
			_cy_num = (count _cy_objlist_leader) - 1;
		};
		_obj = _cy_objlist_leader select _cy_num;
		
		_cy_selectnum = 1;
		while {_obj iskindof "BIS_alice_emptydoor" and count(units(group _obj)) > _cy_selectnum} do
		{
			_obj = units(group _obj) select _cy_selectnum;
			
			_cy_selectnum = _cy_selectnum + 1;
		};
		
		call _ResetCamera;
		_obj_last = _obj;
	};
	
	if (_keyd == 38 and _keyu == 38 and !(_listshow)) then
	{
		_accx = 0;
		_accy = 0;
		_accz = 0;
		_accdir = 0;
		_accdive = 0;
		_acczoom = 0;
		
		ctrlEnable [1,false];
		(findDisplay 5003 displayCtrl 2) ctrlShow true;
		(findDisplay 5003 displayCtrl 4) ctrlShow true;
		(findDisplay 5003 displayCtrl 9) ctrlShow true;
		if (_follow) then
		{
			(findDisplay 5003 displayCtrl 9) ctrlSetTextColor  [1.0, 0.0, 0.0, 1];
			(findDisplay 5003 displayCtrl 8) ctrlShow true;
			if (_behind) then
			{ (findDisplay 5003 displayCtrl 8) ctrlSetTextColor  [1.0, 0.0, 0.0, 1] }
			else
			{ (findDisplay 5003 displayCtrl 8) ctrlSetTextColor  [0.0, 0.0, 0.0, 1] };
		}
		else
		{
			(findDisplay 5003 displayCtrl 9) ctrlSetTextColor  [0.0, 0.0, 0.0, 1];
			(findDisplay 5003 displayCtrl 10) ctrlShow true;
			if (_focus) then
			{ (findDisplay 5003 displayCtrl 10) ctrlSetTextColor  [1.0, 0.0, 0.0, 1] }
			else
			{ (findDisplay 5003 displayCtrl 10) ctrlSetTextColor  [0.0, 0.0, 0.0, 1] };
		};
		ctrlEnable [2,true];
		
		_so_objlist = nearestObjects [_obj, ["AllVehicles"], ViewDistance];
		
		call _SelectObjects;
		call _ListObjects;
		
		GCam_Mouse_List set [1,-1];
		_listshow = true;
	};
	if (_listshow) then
	{
		_keyd_list = GCam_Key_Down_List select 1;
		if (isnil "_keyd_list") then { _keyd_list = -1 };
		_button_close = GCam_Close_List select 1;
		if (isnil "_button_close") then { _button_close = -1 };
		_button_follow = GCam_Button_List_Follow select 1;
		if (isnil "_button__follow") then { _button__follow = -1 };
		_button_behind = GCam_Button_List_Behind select 1;
		if (isnil "_button_behind") then { _button_behind = -1 };
		_button_focus = GCam_Button_List_Focus select 1;
		if (isnil "_button__focus") then { _button__focus = -1 };
		
		if ( _keyd_list == 1 or _keyd_list == 38 or _button_close == 0 or _keyd_list == 50 ) then
		{
			lbClear 2;
			ctrlEnable [2,false];
			(findDisplay 5003 displayCtrl 2) ctrlShow false;
			(findDisplay 5003 displayCtrl 4) ctrlShow false;
			(findDisplay 5003 displayCtrl 9) ctrlShow false;
			if (_follow) then
			{
				(findDisplay 5003 displayCtrl 8) ctrlShow false;
			}
			else
			{
				(findDisplay 5003 displayCtrl 10) ctrlShow false;
			};
			ctrlEnable [1,true];
			_listshow = false;
			GCam_Close_List set [1,-1];
			GCam_Mouse_List set [1,-1];
			GCam_Key_Down_List set [1,-1];
			GCam_Key_Down set [1,-1];
			if (_keyd_list == 1) then
			{
				call _CreateDialog;
				(findDisplay 5003 displayCtrl 3) ctrlShow !(_showhelp);
			};
			if (_keyd_list == 50) then
			{
				GCam_Key_Down set [1, 50];
			};
		};
		
		_mouse_list = GCam_Mouse_List select 1;
		if (isnil "_mouse_list") then { _mouse_list = -1 };
		if ( _mouse_list != -1 ) then
		{
			sleep (_wait * 20);
			if ( alive(_so_objlist select (GCam_Mouse_List select 1)) ) then
			{
				_obj = _so_objlist select (GCam_Mouse_List select 1);
			};
			
			lbSetCurSel [2, 0];
			lbClear 2;
			GCam_Mouse_List set [1,-1];
			
			_so_objlist = nearestObjects [_obj, ["AllVehicles"], ViewDistance];
			if ((count _so_objlist) == 0) then
			{
				_obj = _obj_last;
				
				_so_objlist = nearestObjects [_obj, ["AllVehicles"], ViewDistance];
			};
			
			if ((_obj != _obj_last) or !(_follow)) then
			{
				call _ResetCamera;
			};
			
			_so_objgroup = grpNull;
			call _SelectObjects;
			call _ListObjects;
			
			_obj_last = _obj;
		};
		
		if (_button_follow == 0) then
		{
			_follow = !(_follow);
			
			if (_follow) then
			{
				titletext["Follow Mode Enabled","plain down",0.15];
				
				(findDisplay 5003 displayCtrl 10) ctrlShow false;
				(findDisplay 5003 displayCtrl 8) ctrlShow true;
				if (_behind) then
				{ (findDisplay 5003 displayCtrl 8) ctrlSetTextColor  [1.0, 0.0, 0.0, 1] }
				else
				{ (findDisplay 5003 displayCtrl 8) ctrlSetTextColor  [0.0, 0.0, 0.0, 1] };
				(findDisplay 5003 displayCtrl 9) ctrlSetTextColor  [1.0, 0.0, 0.0, 1];
				
				_cfalt = 1.0;
				
				if (_behind) then
				{
					_be_camobjxydis_tar = _fo_camobjxydis;
					_be_camobjxydis = _be_camobjxydis_tar;
					
					_be_camdir_add = 0;
					_be_camobjdir_add = 0;
					
					_objpos = getposASL _obj;
					_campos_rel = [ cos(((getdir _obj)+90)*-1) * _be_camobjxydis_tar, sin(((getdir _obj)+90)*-1) * _be_camobjxydis_tar, _fo_camobjzdis ];
					_campos = [ (_objpos select 0) + (_campos_rel select 0) , (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];
					
					_dir = ((getdir _obj) -90) * -1;
					if (_dir >= 360) then { _dir = _dir - 360 };
					if (_dir < 0) then { _dir = _dir + 360 };
					
					_dive = _fo_dive_last;
				}
				else
				{
					_campos_rel = [ cos(_dir+180) * _fo_camobjxydis, sin(_dir+180) * _fo_camobjxydis, _fo_camobjzdis ];
					
					_dive = _fo_dive_last;
				};
			}
			else
			{
				titletext["Follow Mode Disabled","plain down",0.15];
				
				(findDisplay 5003 displayCtrl 8) ctrlShow false;
				(findDisplay 5003 displayCtrl 10) ctrlShow true;
				if (_focus) then
				{ (findDisplay 5003 displayCtrl 10) ctrlSetTextColor  [1.0, 0.0, 0.0, 1] }
				else
				{ (findDisplay 5003 displayCtrl 10) ctrlSetTextColor  [0.0, 0.0, 0.0, 1] };
				(findDisplay 5003 displayCtrl 9) ctrlSetTextColor  [0.0, 0.0, 0.0, 1];
				
				_fo_camobjxydis = sqrt((_campos_rel select 0)^2 + (_campos_rel select 1)^2);
				_fo_camobjzdis = _campos_rel select 2;
				_fo_dive_last = _dive;
				_fo_dir_last = _dir;
				
				if (_behind) then
				{
					if (_focus) then
					{
						_fc_camdir_add = _be_camdir_add;
					}
					else
					{
						
					};
				}
				else
				{
					if (_focus) then
					{
						_fc_camdir_add = ( ( ((getposASL _obj select 0) - (getposASL _cam select 0)) atan2 ((getposASL _obj select 1) - (getposASL _cam select 1)) ) -90 ) * -1;
						if ( _fc_camdir_add >= 360 ) then { _fc_camdir_add = _fc_camdir_add - 360 };
						if ( _fc_camdir_add < 0 ) then { _fc_camdir_add = _fc_camdir_add + 360 };
						_fc_camdir_add = _dir - _fc_camdir_add;
						if ( _fc_camdir_add >= 360 ) then { _fc_camdir_add = _fc_camdir_add - 360 };
						if ( _fc_camdir_add < 0 ) then { _fc_camdir_add = _fc_camdir_add + 360 };
					}
					else
					{
						
					};
				};
			};
			
			GCam_Button_List_Follow set [1,-1];
			ctrlSetFocus (findDisplay 5003 displayCtrl 2);
		};
		
		if (_button_behind == 0) then
		{
			_behind = !(_behind);
			
			if (_behind) then
			{
				titletext["Behind Mode Enabled","plain down",0.15];
				
				(findDisplay 5003 displayCtrl 8) ctrlSetTextColor  [1.0, 0.0, 0.0, 1];
				
				if (_follow) then
				{
					_be_camobjxydis_tar = sqrt((_campos_rel select 0)^2 + (_campos_rel select 1)^2);
					_be_camobjxydis = _be_camobjxydis_tar;
					
					_be_camdir_add = 0;
					_be_camobjdir_add = 0;
					
					_campos_rel = [ cos((((getdir _obj)+90)*-1)+_be_camobjdir_add) * _be_camobjxydis_tar, sin((((getdir _obj)+90)*-1)+_be_camobjdir_add) * _be_camobjxydis_tar, _campos_rel select 2 ];
					
					_dir = ((getdir _obj) -90) * -1;
					if (_dir >= 360) then { _dir = _dir - 360 };
					if (_dir < 0) then { _dir = _dir + 360 };
				};
			}
			else
			{
				titletext["Behind Mode Disabled","plain down",0.15];
				
				(findDisplay 5003 displayCtrl 8) ctrlSetTextColor  [0.0, 0.0, 0.0, 1];
			};
			
			GCam_Button_List_Behind set [1,-1];
			ctrlSetFocus (findDisplay 5003 displayCtrl 2);
		};
		
		if (_button_focus == 0) then
		{
			_focus = !(_focus);
			
			if (_focus) then
			{
				titletext["Focus Mode Enabled","plain down",0.15];
				
				(findDisplay 5003 displayCtrl 10) ctrlSetTextColor  [1.0, 0.0, 0.0, 1];
				
				if (_follow) then
				{
					
				}
				else
				{
					_fc_sw_camobjdir = ( ( ((getposASL _obj select 0) - (getposASL _cam select 0)) atan2 ((getposASL _obj select 1) - (getposASL _cam select 1)) ) +90 ) * -1;
					_campos_rel = [ cos(_fc_sw_camobjdir) * _fo_camobjxydis, sin(_fc_sw_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
					_objpos = getposASL _obj;
					
					_fc_camdir_add = 0;
					_fc_camdive_add = 0;
					
					if (_behind) then
					{
						_campos_rel = [ cos(((getdir _obj)+90)*-1) * _fo_camobjxydis, sin(((getdir _obj)+90)*-1) * _fo_camobjxydis, _fo_camobjzdis ];
						
						_dir = ((getdir _obj) -90) * -1;
						if (_dir >= 360) then { _dir = _dir - 360 };
						if (_dir < 0) then { _dir = _dir + 360 };
					};
				};
			}
			else
			{
				titletext["Focus Mode Disabled","plain down",0.15];
				
				(findDisplay 5003 displayCtrl 10) ctrlSetTextColor  [0.0, 0.0, 0.0, 1];
			};
			
			GCam_Button_List_Focus set [1,-1];
			ctrlSetFocus (findDisplay 5003 displayCtrl 2);
		};
	};
	
	
	if (_keyd == 49 and _keyu == 49) then
	{
		camUseNVG _nvg;
		_nvg = !(_nvg);
	};
	
	if (_keyd == 35 and _keyu == 35) then
	{
		(findDisplay 5003 displayCtrl 3) ctrlShow _showhelp;
		_showhelp = !(_showhelp);
	};
	
	
	if (_keyd == 50 and !(_mapshow)) then
	{
		_mapshow = true;
		
		_accx = 0;
		_accy = 0;
		_accz = 0;
		_accdir = 0;
		_accdive = 0;
		_acczoom = 0;
		
		GCam_Key_Down_Map set [1, -1];
		ctrlEnable [1,false];
		(findDisplay 5003 displayCtrl 5) ctrlShow true;
		(findDisplay 5003 displayCtrl 6) ctrlShow true;
		(findDisplay 5003 displayCtrl 7) ctrlShow true;
		ctrlEnable [5,true];
		
		createMarkerLocal["camera", [_campos select 0, _campos select 1]];
		"camera" setMarkerShapeLocal "ICON";
		"camera" setMarkerTypeLocal "mil_Arrow2";
		"camera" setMarkerColorLocal "ColorBlack";
		"camera" setMarkerSizeLocal [0.35, 0.35];
		"camera" setMarkerDirLocal -(_dir) + 90;
		
		createMarkerLocal["object", [_objpos select 0, _objpos select 1]];
		"object" setMarkerShapeLocal "ICON";
		"object" setMarkerTypeLocal "dot";
		
		(findDisplay 5003 displayCtrl 5) ctrlMapAnimAdd [0, ctrlMapScale (findDisplay 5003 displayCtrl 5), [_campos select 0,_campos select 1]];
		ctrlMapAnimCommit (findDisplay 5003 displayCtrl 5);
		
		call _MarkerSet;
		
		_scanpos = getpos _obj;
		_so_objlist = nearestObjects [_scanpos, ["AllVehicles"], ViewDistance];
		call _SelectObjects;
		call _ScanMarkerSet;
		
		onMapSingleClick "GCam_Map_Clicked_PosX = _pos select 0; GCam_Map_Clicked_PosY =_pos select 1; GCam_Map_Clicked = true";
	};
	if (_mapshow) then
	{
		if ( alive _obj ) then
		{
			"camera" setMarkerPosLocal [_campos select 0, _campos select 1];
			"camera" setMarkerDirLocal -(_dir) + 90;
			"object" setMarkerPosLocal [_objpos select 0, _objpos select 1];
			if ((speed _obj) > 4) then
			{
				"object" setMarkerTypeLocal "mil_Arrow2";
				"object" setMarkerSizeLocal [0.45, 0.45];
				"object" setMarkerDirLocal (getdir _obj);
			}
			else
			{
				"object" setMarkerTypeLocal "dot";
				"object" setMarkerSizeLocal [1, 1];
			};
			
			_crewname = "";
			if ( (count(crew _obj)) > 1) then
			{
				{
					if (((crew _obj) select 0) != _x) then { _crewname = _crewname + ", " };
					_crewname = _crewname + format["%1", name _x];
				} forEach (crew _obj);
			}
			else
			{
				_crewname = name _obj;
			};
			"object" setMarkerTextLocal format["%1 : %2", getText (configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName"), _crewname];
		}
		else
		{
			"object" setMarkerSizeLocal [0, 0];
			"object" setMarkerTextLocal "";
		};
		
		if (GCam_Map_Clicked) then
		{
			if (_scanned and [_scanpos select 0, _scanpos select 1] distance [GCam_Map_Clicked_PosX, GCam_Map_Clicked_PosY] < ViewDistance) then
			{
				_so_objlist = nearestObjects [ [GCam_Map_Clicked_PosX, GCam_Map_Clicked_PosY, (getpos _cam select 2)+50], ["AllVehicles"], 250 ];
				call _SelectObjects;
				
				if (count _so_objlist > 0) then
				{
					_obj = _so_objlist select 0;
					
					call _MarkerSet;
					call _ResetCamera;
				};
			};
			
			_scanpos = [GCam_Map_Clicked_PosX, GCam_Map_Clicked_PosY, getpos _cam select 2];
			_so_objlist = nearestObjects [_scanpos, ["AllVehicles"], ViewDistance];
			call _SelectObjects;
			call _ScanMarkerSet;
			
			_obj_last = _obj;
			
			GCam_Map_Clicked = false;
		};
		
		_button_scan = GCam_Button_Map_Scan select 1;
		if (isnil "_button_scan") then { _button_scan = -1 };
		_keyd_map = GCam_Key_Down_Map select 1;
		if (isnil "_keyd_map") then { _keyd_map = -1 };
		_button_close = GCam_Button_Map_Close select 1;
		if (isnil "_button_close") then { _button_close = -1 };
		
		if ( _button_scan == 0 or _keyd_map == 31 ) then
		{
			GCam_Button_Map_Scan set [1,-1];
			GCam_Key_Down_Map set [1,-1];
			
			_scanpos = getpos _obj;
			_so_objlist = nearestObjects [_scanpos, ["AllVehicles"], ViewDistance];
			call _SelectObjects;
			call _ScanMarkerSet;
			
			ctrlSetFocus (findDisplay 5003 displayCtrl 5);
		};
		
		if (_scanned) then
		{
			_passtime = time - _scantime;
			if (_passtime > (_wait * 500)) then
			{
				{
					deleteMarkerLocal _x;
				} forEach _marked_objlist;
				_scanned = false;
			};
			if (_passtime > (_wait * 50)) then
			{
				deleteMarkerLocal "circle";
			};
		};
		
		if ((_keyd_map == 50) or (_keyd_map == 1) or (_button_close == 0) or (_keyd_map == 38)) then
		{
			{ deleteMarkerLocal _x } forEach _marked_objlist;
			deleteMarkerLocal "camera";
			deleteMarkerLocal "object";
			onMapSingleClick "";
			GCam_Key_Down set [1, -1];
			GCam_Key_Up set [1, -1];
			GCam_Button_Map_Close set [1, -1];
			GCam_Button_Map_Scan set [1,-1];
			GCam_Key_Down_Map set [1,-1];
			_keyd = -1;
			_keyu = -1;
			ctrlEnable [5,false];
			(findDisplay 5003 displayCtrl 5) ctrlShow false;
			(findDisplay 5003 displayCtrl 6) ctrlShow false;
			(findDisplay 5003 displayCtrl 7) ctrlShow false;
			ctrlEnable [1,true];
			_mapshow = false;
			if (_keyd_map == 1) then
			{
				call _CreateDialog;
				(findDisplay 5003 displayCtrl 3) ctrlShow !(_showhelp);
			};
			if (_keyd_map == 38) then
			{
				GCam_Key_Down set [1, 38];
			};
		};
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
		_acczoom = _acczoom - _wheel * 0.12 * CFWHEEL * sin((_zoom / 2.0) * 90);
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
	
	
	if ( _so_objgroup != (group _obj) and !(alive(leader(group _obj))) ) then { _so_objgroup = group _obj };
	
	if ( (isnull _obj) or (count(crew _obj)) == 0 ) then
	{
		if (isnull _obj) then { sleep 1.0 };
		_so_objlist = nearestObjects [ [_objpos select 0, _objpos select 1,(getpos _cam select 2)-(_campos_rel select 2)], ["AllVehicles"], 10 ];
		if ( alive(_so_objlist select 0) ) then
		{
			_obj = _so_objlist select 0;
			
			_so_objlist = nearestObjects [ [_objpos select 0, _objpos select 1,(getpos _cam select 2)-(_campos_rel select 2)], ["AllVehicles"], viewdistance ];
			call _SelectObjects;
		}
		else
		{
			_so_objlist = nearestObjects [ [_objpos select 0, _objpos select 1,(getpos _cam select 2)-(_campos_rel select 2)], ["AllVehicles"], viewdistance ];
			call _SelectObjects;
		};
		
		if (_listshow) then
		{
			lbSetCurSel [2, 0];
			lbClear 2;
			call _ListObjects;
		};
		
		if ( (count _so_objlist) == 0 ) then
		{
			_obj = player;
		}
		else
		{
			_obj = _so_objlist select 0;
		};
		_obj_last = _obj;
	};
	
	
	if ( _behind and _follow ) then
	{
		_be_objdir = ((getdir _obj) -90) * -1;
		if (_be_objdir >= 360) then { _be_objdir = _be_objdir - 360 };
		if (_be_objdir < 0) then { _be_objdir = _be_objdir + 360 };
		
		_be_camobjtardir = _be_objdir + _be_camobjdir_add;
		if (_be_camobjtardir >= 360) then { _be_camobjtardir = _be_camobjtardir - 360 };
		if (_be_camobjtardir < 0) then { _be_camobjtardir = _be_camobjtardir + 360 };
		
		_be_camobjdir = ( ((_campos_rel select 0) atan2 (_campos_rel select 1)) + 90 ) * -1;
		if (_be_camobjdir >= 360) then { _be_camobjdir = _be_camobjdir - 360 };
		if (_be_camobjdir < 0) then { _be_camobjdir = _be_camobjdir + 360 };
		
		_be_camobjdir_dif = _be_camobjtardir - _be_camobjdir;
		if (_be_camobjdir_dif >= 360) then { _be_camobjdir_dif = _be_camobjdir_dif - 360 };
		if (_be_camobjdir_dif < 0) then { _be_camobjdir_dif = _be_camobjdir_dif + 360 };
		
		_be_camobjxydis = sqrt(((_campos select 0) - (_objpos select 0))^2 + ((_campos select 1) - (_objpos select 1))^2);
		if ( _be_camobjxydis > 2 ) then { _be_turncoef = 1 + (10/(_cam distance _obj)) };
		
		switch (true) do
		{
			case (_be_camobjdir_dif > 180 and _be_camobjdir_dif < 360):
			{
				_accx = _accx - (sin _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2))) * _be_turncoef * BEHINDSPDAROUND;
				_accy = _accy + (cos _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2))) * _be_turncoef * BEHINDSPDAROUND;
				_be_lr = 1;
			};
			case (_be_camobjdir_dif >= 0 and _be_camobjdir_dif <= 180):
			{
				_accx = _accx + (sin _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2))) * _be_turncoef * BEHINDSPDAROUND;
				_accy = _accy - (cos _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2))) * _be_turncoef * BEHINDSPDAROUND;
				_be_lr = -1;
			};
		};
		
		if ( _be_lr != _be_lr_last and !(_be_keypushed) ) then
		{
			_accx = 0;
			_accy = 0;
			_be_lr_last = _be_lr;
		};
		
		if ( _be_keypushed ) then { _be_camobjxydis_tar = sqrt(((_campos select 0) - (_objpos select 0))^2 + ((_campos select 1) - (_objpos select 1))^2) };
		_accx = _accx - ((cos _be_camobjdir) * (sin(_be_camobjxydis_tar - _be_camobjxydis)) * 2.4);
		_accy = _accy - ((sin _be_camobjdir) * (sin(_be_camobjxydis_tar - _be_camobjxydis)) * 2.4);
		if ( _be_camobjxydis < 0.2 ) then
		{
			_be_camobjxydis_tar = 0.21;
			_accx = 0;
			_accy = 0;
			_accx = _accx - ((cos _be_camobjdir_dif) * 0.01);
			_accy = _accy - ((sin _be_camobjdir_dif) * 0.01);
		};
		
		
		_be_camdir_add = _be_camdir_add + _accdir;
		if ( _be_camdir_add >= 360 ) then { _be_camdir_add = _be_camdir_add - 360 };
		if ( _be_camdir_add < 0 ) then { _be_camdir_add = _be_camdir_add + 360 };
		
		_be_camdir_tar = _dir - _be_camdir_add;
		if ( _be_camdir_tar >= 360 ) then { _be_camdir_tar = _be_camdir_tar - 360 };
		if ( _be_camdir_tar < 0 ) then { _be_camdir_tar = _be_camdir_tar + 360 };
		
		_be_camdir_dif = _be_objdir - _be_camdir_tar;
		if ( _be_camdir_dif >= 360 ) then { _be_camdir_dif = _be_camdir_dif - 360 };
		if ( _be_camdir_dif < 0 ) then { _be_camdir_dif = _be_camdir_dif + 360 };
		
		_be_camdir_dif = _be_camdir_dif + _be_camobjdir_add;
		if ( _be_camdir_dif >= 360 ) then { _be_camdir_dif = _be_camdir_dif - 360 };
		if ( _be_camdir_dif < 0 ) then { _be_camdir_dif = _be_camdir_dif + 360 };
		
		switch (true) do
		{
			case (_be_camdir_dif >= 0 and _be_camdir_dif < 180) : { _dir = _dir + (abs(sin(_be_camdir_dif/2))) * _cfzoom * (_be_turncoef^BEHINDSPDROTATE) };
			case (_be_camdir_dif >= 180 and _be_camdir_dif < 360) : { _dir = _dir - (abs(sin(_be_camdir_dif/2))) * _cfzoom * (_be_turncoef^BEHINDSPDROTATE) };
		};
		if ( _dir >= 360 ) then { _dir = _dir - 360 };
		if ( _dir < 0 ) then { _dir = _dir + 360 };
		
		if ( _obj isKindOf "Man" ) then { _be_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30/(_be_camobjxydis_tar+0.1))) };
	};
	
	if ( _focus and !(_follow) ) then
	{
		_fc_objpos = getposASL _obj;
		_fc_campos = getposASL _cam;
		
		_fc_camobjdir = ( ( ((_fc_objpos select 0) - (_fc_campos select 0)) atan2 ((_fc_objpos select 1) - (_fc_campos select 1)) ) -90 ) * -1;
		if (_fc_camobjdir >= 360) then { _fc_camobjdir = _fc_camobjdir - 360 };
		if (_fc_camobjdir < 0) then { _fc_camobjdir = _fc_camobjdir + 360 };
		
		_fc_camobjdir_dif = _dir - _fc_camobjdir;
		if (_fc_camobjdir_dif >= 360) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360 };
		if (_fc_camobjdir_dif < 0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360 };
		
		_fc_camdir_add = _fc_camdir_add + _accdir;
		if (_fc_camdir_add >= 360) then { _fc_camdir_add = _fc_camdir_add - 360 };
		if (_fc_camdir_add < 0) then { _fc_camdir_add = _fc_camdir_add + 360 };
		
		_fc_camobjdir_dif = _fc_camobjdir_dif - _fc_camdir_add;
		if (_fc_camobjdir_dif >= 360) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360 };
		if (_fc_camobjdir_dif < 0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360 };
		
		switch (true) do
		{
			case (_fc_camobjdir_dif > 0 and _fc_camobjdir_dif < 180) : { _dir = _dir - (abs(sin(_fc_camobjdir_dif/2))) * 20 };
			case (_fc_camobjdir_dif > 180 and _fc_camobjdir_dif < 360) : { _dir = _dir + (abs(sin(_fc_camobjdir_dif/2))) * 20 };
		};
		if ( _dir >= 360 ) then { _dir = _dir - 360 };
		if ( _dir < 0 ) then { _dir = _dir + 360 };
		
		
		_fc_camobjxydis = sqrt(((_fc_campos select 0) - (_fc_objpos select 0))^2 + ((_fc_campos select 1) - (_fc_objpos select 1))^2);
		if ( _obj isKindOf "Man" ) then { _fc_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30/(_fc_camobjxydis+0.1))) };
		
		_fc_camobjdive = (sqrt(((_fc_objpos select 0) - (_fc_campos select 0))^2 + ((_fc_objpos select 1) - (_fc_campos select 1))^2) atan2 (((_fc_objpos select 2) - (_fc_campos select 2)) + 1.57 + _fc_corrattde) - 90) * -1;
		_fc_camobjdive_dif = _fc_camobjdive - _dive;
		
		_fc_camdive_add = _fc_camdive_add + _accdive;
		_fc_camobjdive_dif = _fc_camobjdive_dif + _fc_camdive_add;
		
		switch (true) do
		{
			case (_fc_camobjdive_dif > 0) : { _dive = _dive + abs(sin(_fc_camobjdive_dif/2)) * 20 };
			case (_fc_camobjdive_dif <= 0) : { _dive = _dive - abs(sin(_fc_camobjdive_dif/2)) * 20 };
		};
		if (_dive > 89) then { _dive = 89 };
		if (_dive < -89) then { _dive = -89 };
		
		//if (_autozoom) then
		//{
		//	_az_acczoom = _az_acczoom - _az_dis * 0.1 * sin((_zoom / 2.0) * 90);
		//	_zoom = 0.762 - sin(((_cam distance _obj)/100)*60);
		//	if (_zoom < 0.01) then
		//	{
		//		_zoom = 0.01;
		//	};
		//	if (_zoom > 2.0) then
		//	{
		//		_zoom = 2.0;
		//	};
		//	_cam camSetFov _zoom;
		//};
	};
	
	_campos_rel = [ (_campos_rel select 0) + _accx, (_campos_rel select 1) + _accy, (_campos_rel select 2) + _accz ];
	if (_follow) then
	{
		_objpos = getposASL _obj;
	};
	_campos = [ (_objpos select 0) + (_campos_rel select 0) , (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];
	_cam setPosASL [ _campos select 0, _campos select 1, (_campos select 2) + _be_corrattde ];
	_cam camSetTarget [ (_campos select 0) + (cos _dir) * (cos _dive) * 100000, (_campos select 1) + (sin _dir) * (cos _dive) * 100000, (_campos select 2) + (sin _dive) * 100000];
	_cam camCommit 0;
	
	
	if ( (getpos _cam select 2) < 0.5 ) then
	{
		_cam setPos [ _campos select 0, _campos select 1, 0.501 ];
		if (_follow) then
		{
			_campos_rel set [ 2, (getposASL _cam select 2) - _be_corrattde - (getposASL _obj select 2) ];
		}
		else
		{
			_objpos set [ 2 , getposASL _obj select 2];
			_campos_rel set [ 2, (getposASL _cam select 2) - (_objpos select 2) ];
		};
		if ( _accz < 0 ) then { _accz = 0 };
	};
	
	sleep _wait;
};

titletext["GCam Terminated","plain down",0.2];
