private ["_mccdialog","_comboBox","_displayname"];
unit_array_ready=false;
#define ExtrasDialog2_IDD 2997

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

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

disableSerialization;
_mccdialog = findDisplay ExtrasDialog2_IDD;

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
	} foreach zones_y;
	_comboBox lbSetCurSel zoneY_index;
	
_comboBox = _mccdialog displayCtrl MCC_FACTION;		//fill combobox CFG factions
	lbClear _comboBox;
	{
		_displayname = format ["%1(%2)",_x select 0,_x select 1];
		_comboBox lbAdd _displayname;
	} foreach U_FACTIONS;
	_comboBox lbSetCurSel faction_index;

_comboBox = _mccdialog displayCtrl ACTIVETASKS;		//fill Tasks
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach mcc_tasks;
	_comboBox lbSetCurSel 0;

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
	
if (faction_choice) then {waituntil {(unit_array_ready)}}; //wait for arrays to build up if faction choice
faction_choice=false; 



