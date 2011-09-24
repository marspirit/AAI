#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997
#define ExtrasDialog3_IDD 2996

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define GROUP_SPAWN_B 3007
#define UNIT_SPAWN_B 3012

#define LOGOUT 3290
#define LOGIN 3291

#define ZONE_B 3015

#define MCC_ACTIVE_ZONE 3004 // not used..
private ["_type", "_update", "_display", "_zone", "_zoneNumber", "_comboBox", "_mccdialog", "_zoneX", "_zoneY", "_zoneXIndex",
		"_zoneYIndex", "_displayname", "_displaynameX", "_displaynameY", "_index", "_zoneXArray", "_zoneYArray", "_max_zones", 
		"_ArrayCount","_nul"];
disableSerialization;
_update = _this select 0;
_display = _this select 1; // to determine at which menu tab the zone and map detail is
if ((lbCurSel MCC_ZONE_X)==-1) exitwith {closeDialog 0;hintsilent "Error opening dialog"}; //if error eccure
mcc_zone_marker_X = (zones_x select (lbCurSel MCC_ZONE_X)) select 1;
mcc_zone_marker_Y = (zones_x select (lbCurSel MCC_ZONE_Y)) select 1;
mcc_zone_number = (zones_numbers select (lbCurSel MCC_ZONE_NUMBERS)) select 1;

zone_index = (lbCurSel MCC_ZONE_NUMBERS); 
zoneX_index = (lbCurSel MCC_ZONE_X);
zoneY_index = (lbCurSel MCC_ZONE_Y); 

_type = "Create"; //For chat

switch _display do
	{
		case 1:
		{ _mccdialog = findDisplay MCC_SANDBOX_IDD; };
		
		case 2:
		{ _mccdialog = findDisplay ExtrasDialog_IDD; };
		
		case 3:
		{ _mccdialog = findDisplay ExtrasDialog2_IDD; };
		
		case 4:
		{ _mccdialog = findDisplay ExtrasDialog3_IDD; };
	};

	
if ( (_update==0) && !(mcc_active_zone == mcc_zone_number) ) then 
	{	
		if ( (count mcc_zone_size -1) < mcc_zone_number ) then   //new zone
		{
			// new zone set to default values
			mcc_zone_marker_X = 10;
			mcc_zone_marker_Y = 10;
			
			_type = "Create";
		}
		else
		{
			_zone_sizes = (mcc_zone_size select mcc_zone_number);
		
			if ( format ["X%1X", str(_zone_sizes select 0)] == "XX") then //only if-then config to get this to work :-/
			{
				// null type entry in array, so set to default values
				mcc_zone_marker_X = 10; 
				mcc_zone_marker_Y = 10;
				
				_type = "Create";
			}
			else
			{
				mcc_zone_marker_X = _zone_sizes select 0;
				mcc_zone_marker_Y = _zone_sizes select 1;
				
				_type = "Update";
			};
		};

		_comboBox = _mccdialog displayCtrl MCC_ZONE_X;
		_comboBox lbSetCurSel 7;

		_comboBox = _mccdialog displayCtrl MCC_ZONE_X;
		
		_ArrayCount = 0;
		{
			_displayname = _x select 0;
			if ( str(mcc_zone_marker_X) == _displayname) then 
			{			
				_zoneXIndex = _ArrayCount;
			};
			_ArrayCount = _ArrayCount + 1;
		} foreach zones_x;
		_comboBox lbSetCurSel _zoneXIndex;

		_comboBox = _mccdialog displayCtrl MCC_ZONE_Y;
		
		_ArrayCount = 0;
		{	
			_displayname = _x select 0;
			if ( str(mcc_zone_marker_Y) == _displayname ) then 
			{			
				_zoneYIndex = _ArrayCount;
			};
			_ArrayCount = _ArrayCount + 1;
		} foreach zones_x;
		_comboBox lbSetCurSel _zoneYIndex;

		mcc_active_zone = mcc_zone_number;	// to stop looping

		(_mccdialog displayCtrl ZONE_B) ctrlSetStructuredText parseText format["%1 Zone %2", _type, mcc_zone_number];
		
	//	player globalchat format ["Zone change - %1 - %2 - 3%", mcc_zone_markername, _type, round ( random 9)]; //debug
	};


zoneX_index = (lbCurSel MCC_ZONE_X);
zoneY_index = (lbCurSel MCC_ZONE_Y); 

mcc_zone_markername setMarkerColorLocal "ColorBlack";
mcc_zone_markername=format ["%1", mcc_zone_number]; 
mcc_zone_markername	setMarkerColorLocal "ColorYellow";

//player globalchat format ["ZoneInfo B: %1 - %2 - %3 - %4 - %5 - %6 - %7 - %8", mcc_zone_number, mcc_zone_marker_X, mcc_zone_marker_Y, mcc_zone_markername, zoneX_index, zoneY_index, zone_index, random 7]; //debug

if (_update==1) then 
{
	// set button text to 'update zone'
	_mccdialog = findDisplay MCC_SANDBOX_IDD;	
	(_mccdialog displayCtrl ZONE_B) ctrlSetStructuredText parseText format["Update Zone"];
										
	_nul=[1] execVM 'mcc\general_scripts\mcc_make_the_marker.sqf';
	
	(_mccdialog displayCtrl UNIT_SPAWN_B) ctrlEnable true;
	(_mccdialog displayCtrl GROUP_SPAWN_B) ctrlEnable true;
	(_mccdialog displayCtrl LOGOUT) ctrlEnable true;
	(_mccdialog displayCtrl LOGIN) ctrlEnable false;
	(_mccdialog displayCtrl MCC_MM) ctrlSetText format["MissionMaker: %1",mcc_missionmaker];
}
else
{
	if (((count mcc_zone_size -1) < mcc_zone_number ) && (!(count mcc_zone_size == 0) )) then
	{
		zone_index = (count mcc_zone_size -2);
		mcc_zone_marker_X = zones_x select zone_index;
		mcc_zone_marker_Y = zones_x select zone_index;
	};
};

//player globalchat format ["%1 - %2 - %3", _update, _type, random 7]; //debug
