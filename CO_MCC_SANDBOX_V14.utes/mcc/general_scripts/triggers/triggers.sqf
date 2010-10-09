#define ExtrasDialog3_IDD 2996

#define TRIGGER_ACTIVEATE 7000
#define TRIGGER_COND 7001
#define TRIGGER_SIZEX 7002
#define TRIGGER_SIZEY 7003
#define TRIGGER_ANGLE 7004
#define TRIGGER_SHAPE 7005
#define TRIGGER_TEXT 7006 

disableSerialization;
private ["_dlg","_type","_zoneX","_zoneY","_activate","_cond","_angle","_shape","_text","_pos"];

_dlg = findDisplay ExtrasDialog3_IDD;
_type = _this select 0;

switch (_type) do
{
   case 0:	//Mapclick
	{ 
		mcc_capture_state = true;
		hint "Left click on the map to create a trigger";
			onMapSingleClick " 	hint 'Trigger set. Capture the action linked to the trigger.'; 
								nul=[1,_pos] execVM 'mcc\general_scripts\triggers\triggers.sqf';
								onMapSingleClick """";";
	};
	
	case 1:	//Generate
	{ 
		_pos = _this select 1;	
		_zoneX = zones_x select (lbCurSel TRIGGER_SIZEX) select 1;
		_zoneY = zones_x select (lbCurSel TRIGGER_SIZEY) select 1;
		_activate = musicActivateby_array select (lbCurSel TRIGGER_ACTIVEATE);
		_cond = musicCond_array select (lbCurSel TRIGGER_COND);
		_angle = angle_array select (lbCurSel TRIGGER_ANGLE);
		_shape = shapeMarker select (lbCurSel TRIGGER_SHAPE);
		_text = ctrlText (_dlg displayCtrl TRIGGER_TEXT);
		
		createmarkerlocal [_text, _pos];	//create trigger marker for MM
		_text setMarkerColorLocal "ColorOrange";
		_text setMarkerSizeLocal [_zoneX, _zoneY];
		_text setMarkerShapeLocal  _shape;
		_text setMarkerBrushLocal  "SOLID";
		_text setMarkerDirLocal _angle;
		
		waituntil {(!mcc_capture_state)};
		//hint format ["%1", mcc_capture_var];
		["trigger_generated",[_pos, _zoneX, _zoneY, _activate, _cond, _angle, _shape,_text,mcc_capture_var]] call CBA_fnc_globalEvent;
		//hint format ["%1/%2, %3, %4, %5, %6, %7, %8", _zoneX, _zoneY, _activate, _cond, _angle, _shape, _text, _pos];
	};
	   
   case 2:	//Link to zone
	{
		_zone = (zones_numbers select (lbCurSel MUSIC_ZONE)) select 1;
		_zonePos = mcc_zone_pos select _zone;
		_zoneX = mcc_zone_size select (_zone) select 0;
		_zoneY = mcc_zone_size select (_zone) select 1;
		_activate = musicActivateby_array select (lbCurSel MUSIC_ACTIVATE);
		_cond = musicCond_array select (lbCurSel MUSIC_COND);
		if (jukeboxMusic) then {_track = (musicTracks_array select (lbCurSel MUSIC_TRACK)) select 1;} else {_track = (soundTracks_array select (lbCurSel MUSIC_TRACK)) select 1;};
		mcc_safe=mcc_safe + FORMAT ["
						  _zone=%1;
						  _zonePos=%2;
						  _zoneX=%3;
						  _zoneY=%4;
						  _activate='%5';
						  _cond='%6';
						  _track='%7';
						  jukeboxMusic=%8;
						  ['music_trigger',[_zone, _zonePos, _zoneX, _zoneY, _activate, _cond,_track,jukeboxMusic ]] call CBA_fnc_globalEvent;
						   sleep 1;
						  "								 
						  ,_zone
						  , _zonePos
						  , _zoneX
						  , _zoneY
						  , _activate
						  , _cond
						  , _track
						  , jukeboxMusic
						  ];
		hint format ["Trigger linked to zone: %1 \nCondition: %2, %3 \nOn activation play: %4",_zone,_activate,_cond,_track];
		["music_trigger",[_zone, _zonePos, _zoneX, _zoneY, _activate, _cond,_track,jukeboxMusic ]] call CBA_fnc_globalEvent;
	};
};