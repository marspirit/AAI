#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997
#define ExtrasDialog3_IDD 2996

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003
#define CAPTURE 3204

#define LOGOUT 3290
#define LOGIN 3291

#define MAIN 3293
#define MENU2 3294
#define MENU3 3295
#define MENU4 3296

#define MCC_FACTION 3003
#define UNIT_HELI 3014

#define BRIEFINGSBOX 6000
#define TASKNAMEBOX 6001
#define TASKDESCRIPTIONBOX 6002
#define ACTIVETASKS 6003

#define MARKER_COLOR 6050 
#define MARKER_COLOR2 6051 
#define MARKER_SIZEX 6052 
#define MARKER_SIZEY 6053 
#define MARKER_SHAPE 6054 
#define MARKER_BRUSH 6055 
#define MARKER_TYPE 6056 
#define MARKERSTEXT 6057 
#define MARKERSTEXT2 6058 

#define HELI_TYPE 6100
#define FLY_HIGHT 6101
#define FAST_ROPE 6102 

#define MUSIC_TRACK 6200 
#define MUSIC_VOLUME 6201 
#define MUSIC_ACTIVATE 6202 
#define MUSIC_COND 6203 
#define MUSIC_ZONE 6204 

private ["_mccdialog","_comboBox","_displayname","_x"];
disableSerialization;

ctrlEnable [MAIN,false]; //Disable switching menus till the init is done
ctrlEnable [MENU2,false];
ctrlEnable [MENU3,false];
ctrlEnable [MENU4,false];

_mccdialog = findDisplay ExtrasDialog2_IDD;

if (!mcc_capture_state) then { ctrlEnable [CAPTURE,false];};

//-----------------------------------------------------Zones & Factions--------------------------------------------
_comboBox = _mccdialog displayCtrl MCC_ZONE_NUMBERS; //fill combobox zone's numbers
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_numbers;
	_comboBox lbSetCurSel zone_index;

_comboBox = _mccdialog displayCtrl MCC_ZONE_X;		//fill combobox X length
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel zoneX_index;

_comboBox = _mccdialog displayCtrl MCC_ZONE_Y;		//fill comboboxYlength
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel zoneY_index;
	
_comboBox = _mccdialog displayCtrl MCC_FACTION;		//fill combobox CFG factions
	lbClear _comboBox;
	{
		_displayname = format ["%1(%2)",_x select 0,_x select 1];
		_comboBox lbAdd _displayname;
	} foreach U_FACTIONS;
	_comboBox lbSetCurSel faction_index;
//---------------------------------------------------Taskss--------------------------------------------------------
_comboBox = _mccdialog displayCtrl ACTIVETASKS;		//fill Tasks
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach mcc_tasks;
	_comboBox lbSetCurSel 0;
	
//------------------------------------------------Markers-------------------------------------------------------
_comboBox = _mccdialog displayCtrl MARKER_COLOR;		//fill Markers Colors 1
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach colorsarray;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MARKER_COLOR2;		//fill Markers Colors 2
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach colorsarray;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MARKER_SIZEX;		//fill Markers Size X
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MARKER_SIZEY;		//fill Markers Size Y
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MARKER_SHAPE;		//fill Markers Shape
	lbClear _comboBox;
	{
		_displayname = _x;
		_comboBox lbAdd _displayname;
	} foreach shapeMarker;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MARKER_BRUSH;		//fill Markers Brush
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_index = _comboBox lbAdd _displayname;
		_comboBox lbsetpicture [_index, _x select 1];
	} foreach brushesarray;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MARKER_TYPE;		//fill Markers Type
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_index = _comboBox lbAdd _displayname;
		_comboBox lbsetpicture [_index, _x select 1];
	} foreach markerarray;
	_comboBox lbSetCurSel 0;
//--------------------------------------------------Jukebox---------------------------------------------------------------------------
if (jukeboxMusic) then
		{
			_comboBox = _mccdialog displayCtrl MUSIC_TRACK; //fill combobox music tracks
			lbClear _comboBox;
				{
					_displayname = format ["%1",_x  select 0];
					_comboBox lbAdd _displayname;
				} foreach musicTracks_array;
			_comboBox lbSetCurSel musicTracks_index;
		} else
		{
			_comboBox = _mccdialog displayCtrl MUSIC_TRACK; //fill combobox sound tracks
			lbClear _comboBox;
				{
					_displayname = format ["%1",_x  select 0];
					_comboBox lbAdd _displayname;
				} foreach soundTracks_array;
			_comboBox lbSetCurSel musicTracks_index;
		};

_comboBox = _mccdialog displayCtrl MUSIC_ACTIVATE; //fill combobox Activate by

	lbClear _comboBox;
	{
		_displayname = _x;
		_comboBox lbAdd _displayname;
	} foreach musicActivateby_array;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MUSIC_COND; //fill combobox Condition

	lbClear _comboBox;
	{
		_displayname =_x;
		_comboBox lbAdd _displayname;
	} foreach musicCond_array;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MUSIC_ZONE; //fill combobox zone's numbers
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_numbers;
	_comboBox lbSetCurSel zone_index;
	
sliderSetRange [MUSIC_VOLUME, 0, 1];
_volume = musicVolume;
sliderSetPosition [MUSIC_VOLUME, (1 - _volume)];
//--------------------------------------------------Evac-------------------------------------------------------------------------------	
_comboBox = _mccdialog displayCtrl FLY_HIGHT;		//fill combobox Fly in Hight
lbClear _comboBox;
{
	_displayname = format ["%1",_x  select 0];
	_index = _comboBox lbAdd _displayname;
} foreach evacFlyInHight_array;
_comboBox lbSetCurSel evacFlyInHight_index;

_comboBox = _mccdialog displayCtrl FAST_ROPE;		//fill combobox FastRope
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Off","On"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl HELI_TYPE;		//fill combobox CFG unit's HELI
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_HELICOPTER;
_comboBox lbSetCurSel 0;


//-------------------------------------------------
// GUI enhancements
ctrlEnable [MENU3,false];

(_mccdialog displayCtrl MAIN) ctrlSetTooltip "Main/Login";
(_mccdialog displayCtrl MENU2) ctrlSetTooltip "LHD/AirDrop/UAV/CAS/Artillery/IED/Convoy";
(_mccdialog displayCtrl MENU3) ctrlSetTooltip "Markers/Briefing/Brushes/Tasks/Evac/JukeBox";
(_mccdialog displayCtrl MENU4) ctrlSetTooltip "Triggers/Gita";

if (mcc_missionmaker == (name player)) then
 { ctrlEnable [LOGOUT,true];}
else 
 { ctrlEnable [LOGOUT,false];};
//-------------------------------------------------

ctrlEnable [MAIN,true]; //Enable switching menus 
ctrlEnable [MENU2,true];
ctrlEnable [MENU3,false];
ctrlEnable [MENU4,true];

//player sidechat format["mcc_extra_init2.sqf"]; // debug