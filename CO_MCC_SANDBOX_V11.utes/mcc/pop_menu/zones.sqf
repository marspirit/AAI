#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002
#define MCC_AVTIVE_ZONE 3004
_update = _this select 0;

mcc_zone_marker_X = (zones_x select (lbCurSel MCC_ZONE_X)) select 1;
mcc_zone_marker_Y = (zones_x select (lbCurSel MCC_ZONE_Y)) select 1;
mcc_zone_number = (zones_numbers select (lbCurSel MCC_ZONE_NUMBERS)) select 1;

zone_index = (lbCurSel MCC_ZONE_NUMBERS); 
zoneX_index = (lbCurSel MCC_ZONE_X);
zoneY_index = (lbCurSel MCC_ZONE_Y); 

mcc_zone_markername setMarkerColorLocal "ColorBlack";
mcc_zone_markername=format ["%1", mcc_zone_number]; 
mcc_zone_markername	setMarkerColorLocal "ColorYellow";
ctrlSetText [MCC_AVTIVE_ZONE, mcc_zone_markername];

if (_update==1) then {_nul=[1] execVM 'mcc\general_scripts\mcc_make_the_marker.sqf';};

 
		