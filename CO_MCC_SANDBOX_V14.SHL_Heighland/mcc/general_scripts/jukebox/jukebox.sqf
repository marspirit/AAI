#define ExtrasDialog2_IDD 2997
#define MUSIC_TRACK 6200 
#define MUSIC_VOLUME 6201 
#define MUSIC_ACTIVATE 6202 
#define MUSIC_COND 6203 
#define MUSIC_ZONE 6204 
disableSerialization;
private ["_type","_track","_trigger","_zone","_zoneX","_zoneY","_activate","_cond","_mccdialog","_markerName"];

_mccdialog = findDisplay ExtrasDialog2_IDD;
_type = _this select 0;

switch (_type) do
{
   case 0:	//Previous
	{ 
		if (lbCurSel MUSIC_TRACK == 0) then 
			{
			lbSetCurSel [MUSIC_TRACK, (lbSize MUSIC_TRACK)-1];
			} else 
				{
				lbSetCurSel [MUSIC_TRACK, (lbCurSel MUSIC_TRACK)-1];
				};
		if (jukeboxMusic) then 
			{
				_track = (musicTracks_array select (lbCurSel MUSIC_TRACK)) select 1;
				musicTracks_index = lbCurSel MUSIC_TRACK;
				[-1, {playMusic _this;}, _track] call CBA_fnc_globalExecute
			} else 
			{
				_track = (soundTracks_array select (lbCurSel MUSIC_TRACK)) select 1;
				musicTracks_index = lbCurSel MUSIC_TRACK;
			};
	};
	
   case 1:	//Play
	{ 
		if (jukeboxMusic) then 
			{
				_track = (musicTracks_array select (lbCurSel MUSIC_TRACK)) select 1;
				musicTracks_index = lbCurSel MUSIC_TRACK;
				[-1, {playMusic _this;}, _track] call CBA_fnc_globalExecute
			} else 
			{
				_track = (soundTracks_array select (lbCurSel MUSIC_TRACK)) select 1;
				musicTracks_index = lbCurSel MUSIC_TRACK;
			};
	};
	
   case 2:	//Forward
    { 
		if (lbCurSel MUSIC_TRACK == (lbSize MUSIC_TRACK)-1) then 
			{
			lbSetCurSel [MUSIC_TRACK, 0];
			} else 
				{
				lbSetCurSel [MUSIC_TRACK, (lbCurSel MUSIC_TRACK)+1];
				};
		if (jukeboxMusic) then 
			{
				_track = (musicTracks_array select (lbCurSel MUSIC_TRACK)) select 1;
				musicTracks_index = lbCurSel MUSIC_TRACK;
				[-1, {playMusic _this;}, _track] call CBA_fnc_globalExecute
			} else 
			{
				_track = (soundTracks_array select (lbCurSel MUSIC_TRACK)) select 1;
				musicTracks_index = lbCurSel MUSIC_TRACK;
			};
	};
	
   case 3:	//Stop
	{
		[-1, {playMusic "";}] call CBA_fnc_globalExecute;
	}; 

   case 4:	//Volume slider
	{
		if (jukeboxMusic) then {0 fadeMusic (1 - sliderPosition MUSIC_VOLUME)} else {0 fadesound (1 - sliderPosition MUSIC_VOLUME)};
	};	
	
   case 5:	//Link to zone
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
		_markerName = format ["%1: %2", _zone, _track];
		createmarkerlocal [_markerName, _zonePos];	//create  marker for MM
		_markerName setMarkerColorLocal "ColorBlue";
		_markerName setMarkerTypeLocal  "Camp";
		_markerName setmarkertextlocal _markerName;
		
		["music_trigger",[_zone, _zonePos, _zoneX, _zoneY, _activate, _cond,_track,jukeboxMusic ]] call CBA_fnc_globalEvent;
	};
	
	case 6:	//Switch to music tracks
	{
	jukeboxMusic = true;	
	_comboBox = _mccdialog displayCtrl MUSIC_TRACK; //fill combobox tracks
	lbClear _comboBox;
		{
			_displayname = format ["%1",_x  select 0];
			_comboBox lbAdd _displayname;
		} foreach musicTracks_array;
	_comboBox lbSetCurSel musicTracks_index;
	};
	
	case 7:	//Switch to sound tracks
	{
	jukeboxMusic = false;	
	_comboBox = _mccdialog displayCtrl MUSIC_TRACK; //fill combobox tracks
	lbClear _comboBox;
		{
			_displayname = format ["%1",_x  select 0];
			_comboBox lbAdd _displayname;
		} foreach soundTracks_array;
	_comboBox lbSetCurSel musicTracks_index;
	};
};