#define ExtrasDialog2_IDD 2997
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

private ["_case","_dlg","_pos"];
_case = _this select 0;
_dlg = findDisplay ExtrasDialog2_IDD;

switch (_case) do
	{
		case 0:		//create marker
		{
			Mcase = _case; 
			Mcolor = (colorsarray select (lbCurSel MARKER_COLOR)) select 1;
			_sizeX = (zones_x select (lbCurSel MARKER_SIZEX)) select 1;
			_sizeY = (zones_x select (lbCurSel MARKER_SIZEY)) select 1;	
			Msize = [_sizeX,_sizeY];
			Mshape = (shapeMarker select (lbCurSel MARKER_SHAPE));
			Mbrush = (brushesarray select (lbCurSel MARKER_BRUSH)) select 2;
			Mtype = (markerarray select (lbCurSel MARKER_TYPE)) select 2;
			Mtext = ctrlText (_dlg displayCtrl MARKERSTEXT);
			hint "Left click on the map to set a marker";
			onMapSingleClick " 	hint 'marker added.'; 
								['marker', [Mcase, Mcolor, Msize, Mshape, Mbrush, Mtype, Mtext, _pos]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
		};
	
	   case 1:	//create Brush
			{
			Mcase = _case; 
			Mcolor = (colorsarray select (lbCurSel MARKER_COLOR2)) select 1;
			_sizeX = (zones_x select (lbCurSel MARKER_SIZEX)) select 1;
			_sizeY = (zones_x select (lbCurSel MARKER_SIZEY)) select 1;	
			Msize = [_sizeX,_sizeY];
			Mshape = (shapeMarker select (lbCurSel MARKER_SHAPE));
			Mbrush = (brushesarray select (lbCurSel MARKER_BRUSH)) select 2;
			Mtype = (markerarray select (lbCurSel MARKER_TYPE)) select 2;
			Mtext = ctrlText (_dlg displayCtrl MARKERSTEXT2);
			hint "Left click on the map to set a brush";
			onMapSingleClick " 	hint 'Brush added.'; 
								['marker', [Mcase, Mcolor, Msize, Mshape, Mbrush, Mtype, Mtext, _pos]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
			};
			
	  case 2:	//Delete Markers
	   {Mcase = _case; 
		Mcolor = (colorsarray select (lbCurSel MARKER_COLOR)) select 1;
		_sizeX = (zones_x select (lbCurSel MARKER_SIZEX)) select 1;
		_sizeY = (zones_x select (lbCurSel MARKER_SIZEY)) select 1;	
		Msize = [_sizeX,_sizeY];
		Mshape = (shapeMarker select (lbCurSel MARKER_SHAPE));
		Mbrush = (brushesarray select (lbCurSel MARKER_BRUSH)) select 2;
		Mtype = (markerarray select (lbCurSel MARKER_TYPE)) select 2;
		Mtext = ctrlText (_dlg displayCtrl MARKERSTEXT);
		_pos = [];
		["marker", [Mcase, Mcolor, Msize, Mshape, Mbrush, Mtype, Mtext, _pos]] call CBA_fnc_globalEvent;
	   };
	  
	   case 3:	//Delete Brushes
	   {Mcase = _case; 
		Mcolor = (colorsarray select (lbCurSel MARKER_COLOR2)) select 1;
		Msize = (zones_x select (lbCurSel MARKER_SIZE)) select 1;
		Mshape = (shapeMarker select (lbCurSel MARKER_SHAPE));
		Mbrush = (brushesarray select (lbCurSel MARKER_BRUSH)) select 2;
		Mtype = (markerarray select (lbCurSel MARKER_TYPE)) select 2;
		Mtext = ctrlText (_dlg displayCtrl MARKERSTEXT2);
		_pos = [];
		["marker", [Mcase, Mcolor, Msize, Mshape, Mbrush, Mtype, Mtext, _pos]] call CBA_fnc_globalEvent;
	   };
	};