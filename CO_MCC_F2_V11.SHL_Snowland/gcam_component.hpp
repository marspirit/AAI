// GCam Component 1.12
// This file is necessary to use GCam.
// Include this file to "description.ext".
// #include "gcam_component.hpp"

class GCamMapControlBase
{
	access = 0;
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = {1, 1, 1, 1};
	colorOutside[] = {1, 0, 0, 1};
	colorText[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.040000;
	colorSea[] = {0.560000, 0.800000, 0.980000, 0.500000};
	colorForest[] = {0.600000, 0.800000, 0.200000, 0.500000};
	colorRocks[] = {0.500000, 0.500000, 0.500000, 0.500000};
	colorCountlines[] = {0.650000, 0.450000, 0.270000, 0.500000};
	colorMainCountlines[] = {0.650000, 0.450000, 0.270000, 1};
	colorCountlinesWater[] = {0, 0.530000, 1, 0.500000};
	colorMainCountlinesWater[] = {0, 0.530000, 1, 1};
	colorForestBorder[] = {0.400000, 0.800000, 0, 1};
	colorRocksBorder[] = {0.500000, 0.500000, 0.500000, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorRailWay[] = {0.800000, 0.200000, 0.300000, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.500000};
	colorLevels[] = {0, 0, 0, 1};
	fontLabel = "TahomaB";
	sizeExLabel = 0.040000;
	fontGrid = "TahomaB";
	sizeExGrid = 0.040000;
	fontUnits = "TahomaB";
	sizeExUnits = 0.040000;
	fontNames = "TahomaB";
	sizeExNames = 0.040000;
	fontInfo = "TahomaB";
	sizeExInfo = 0.040000;
	fontLevel = "TahomaB";
	sizeExLevel = 0.040000;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.200000, {"Gamma", 1, 1.500000}};
	stickY[] = {0.200000, {"Gamma", 1, 1.500000}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	showCountourInterval = "true";
	maxSatelliteAlpha = 0.660000;
	alphaFadeStartScale = 0.050000;
	alphaFadeEndScale = 0.150000;
	class Legend {
		x = 0.700000;
		y = 0.850000;
		w = 0.250000;
		h = 0.100000;
		font = "TahomaB";
		sizeEx = 0.040000;
		colorBackground[] = {1, 1, 1, 1};
		color[] = {0, 0, 0, 1};
	};
	class ActiveMarker {
		color[] = {0.300000, 0.100000, 0.900000, 1};
		size = 50;
	};
	class Command {
		icon = "\ca\ui\data\icon_task_board_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task {
		icon = "\ca\ui\data\icon_task_ca.paa";
		iconCreated = "\ca\ui\data\ui_task_created_ca.paa";
		iconCanceled = "\ca\ui\data\ui_task_cancelled_ca.paa";
		iconDone = "\ca\ui\data\ui_task_done_ca.paa";
		iconFailed = "\ca\ui\data\ui_task_failed_ca.paa";
		colorCreated[] = {1, 1, 1, 1};
		colorCanceled[] = {1, 1, 1, 1};
		colorDone[] = {1, 1, 1, 1};
		colorFailed[] = {1, 1, 1, 1};
		color[] = {1, 1, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark {
		icon = "\ca\ui\data\icon_custom_task_ca.paa";
		color[] = {1, 1, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.6 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Cross {
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Bunker {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fortress {
		icon = "\ca\ui\data\map_fortress_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "3 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fuelstation {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {1, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
};

class GCamListBoxBase
{
	access = 0;
	type = 5;
	style = 0;
	w = 0.400000;
	h = 0.400000;
	font = "TahomaB";
	sizeEx = 0.040000;
	rowHeight = 0;
	colorText[] = {1, 1, 1, 1};
	colorScrollbar[] = {1, 1, 1, 1};
	colorSelect[] = {1, 0, 0, 1};
	colorSelect2[] = {1, 0.5, 0, 1};
	colorSelectBackground[] = {0.600000, 0.600000, 0.600000, 1};
	colorSelectBackground2[] = {0.200000, 0.200000, 0.200000, 1};
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.000000;
	soundSelect[] = {"", 0.100000, 1};
	period = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class GCamButtonBase
{
	access = 0;
	type = 1;
	style = 0;
	x = 0;
	y = 0;
	w = 0.03236;
	h = 0.02;
	text = "";
	font = "TahomaB";
	sizeEx = 0.043;
	colorText[] = {0, 0, 0, 1};
	colorDisabled[] = {0.9, 0.9, 0.9, 1};
	colorBackground[] = {0.9, 0.9, 0.9, 1};
	colorBackgroundDisabled[] = {0.9, 0.9, 0.9, 1};
	colorBackgroundActive[] = {1, 1, 1, 1};
	offsetX = 0.0;
	offsetY = 0.0;
	offsetPressedX = 0.001;
	offsetPressedY = 0.001;
	colorFocused[] = {0.9, 0.9, 0.9, 1};
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0.0;
	soundEnter[] = {"", 0.100000, 1};
	soundPush[] = {"", 0.100000, 1};
	soundClick[] = {"", 0.100000, 1};
	soundEscape[] = {"", 0.100000, 1};
};


class GCamDialog1
{
	idd = 5002;
	movingEnable = 0;
	class controls
	{
		class Base
		{
			idc = -1;
			style = 0x00;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1};
			font = "Zeppelin32";
			sizeEx = 0.04;
			h = 0.04;
			text = "";
		};
		class MousePosHandle : Base
		{
			idc = 1;
			type = 0;
			style = 16;
			colorBackground[] = { 0.5, 0.5, 0.5, 0 };
			colorText[] = { 1, 1, 1, 1 };
			text = "";
			lineSpacing = 1;
			x = -0.6; y = -0.375;
			w = 2.2; h = 1.75;
		};
		class Map : GCamMapControlBase
		{
			idc = 2;
			colorBackground[] = {1.00, 1.00, 1.00, 0.80};
			x = 0.05;
			y = 0.05;
			w = 0.9;
			h = 0.9;
			showCountourInterval = "false";
		};
		class Text
		{
			idc = 3;
			type = 13;
			style = 0;
			colorBackground[] = { 0, 0, 0, 0 };
			x = 0; y = 0; w = 1; h = 1;
			size = 0.04;
			text = "";
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "left";
				valign = "top";
				shadow = true;
				shadowColor = "#000000";
				size = 1;
			};
		};
		class CloseButton_Map : GCamButtonBase
		{
			idc = 4;
			x = 0.8655;
			y = 0.9675;
			h = 0.035
			w = 0.0845;
			text = "Close";
			toolTip = "Close Map";
		};
		class ScanButton_Map : GCamButtonBase
		{
			idc = 5;
			x = 0.759;
			y = 0.9675;
			h = 0.035
			w = 0.0845;
			text = "Scan";
			toolTip = "Scan and Show Groups (5sec, Visibility Range)";
		};
	};
};


class GCamDialog2
{
	idd = 5003;
	movingEnable = 0;
	class controls
	{
		class Base
		{
			idc = -1;
			style = 0x00;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1};
			font = "Zeppelin32";
			sizeEx = 0.04;
			h = 0.04;
			text = "";
		};
		class MousePosHandle : Base
		{
			idc = 1;
			type = 0;
			style = 16;
			colorBackground[] = { 0.5, 0.5, 0.5, 0 };
			colorText[] = { 1, 1, 1, 1 };
			text = "";
			lineSpacing = 1;
			x = -0.6; y = -0.375;
			w = 2.2; h = 1.75;
		};
		class Combo: GCamListBoxBase
		{
			idc = 2;
			x = 0.65;
			y = 0.25;
			w = 0.35;
			h = 0.5;
			sizeEx = 0.03;
			rowHeight = 0.029;
			period = 0;
		};
		class Text
		{
			idc = 3;
			type = 13;
			style = 0;
			colorBackground[] = { 0, 0, 0, 0 };
			x = 0; y = 0; w = 1; h = 1;
			size = 0.04;
			text = "";
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "left";
				valign = "top";
				shadow = true;
				shadowColor = "#000000";
				size = 1;
			};
		};
		class CloseButton : GCamButtonBase
		{
			idc = 4;
			x = 0.9155;
			y = 0.7675;
			h = 0.035
			w = 0.0845;
			text = "Close";
			toolTip = "Close Units List";
		};
		class Map : GCamMapControlBase
		{
			idc = 5;
			colorBackground[] = {1.00, 1.00, 1.00, 0.70};
			x = 0.05;
			y = 0.05;
			w = 0.9;
			h = 0.9;
			showCountourInterval = "false";
		};
		class CloseButton_Map : GCamButtonBase
		{
			idc = 6;
			x = 0.8655;
			y = 0.9675;
			h = 0.035
			w = 0.0845;
			text = "Close";
			toolTip = "Close Map";
		};
		class ScanButton_Map : GCamButtonBase
		{
			idc = 7;
			x = 0.7590;
			y = 0.9675;
			h = 0.035
			w = 0.0845;
			text = "Scan";
			toolTip = "Scan and Show Groups (5sec, Visibility Range)";
		};
		class Button_Behind : GCamButtonBase
		{
			idc = 8;
			x = 0.7485;
			y = 0.7675;
			h = 0.035
			w = 0.0845;
			text = "Behind";
			sizeEx = 0.0385;
			toolTip = "Toggle Behind Mode";
		};
		class Button_Follow : GCamButtonBase
		{
			idc = 9;
			x = 0.6520;
			y = 0.7675;
			h = 0.035
			w = 0.0845;
			text = "Follow";
			sizeEx = 0.0385;
			toolTip = "Toggle Follow Mode";
		};
		class Button_Focus : GCamButtonBase
		{
			idc = 10;
			x = 0.7485;
			y = 0.7675;
			h = 0.035
			w = 0.0845;
			text = "Focus";
			sizeEx = 0.0385;
			toolTip = "Toggle Focus Mode";
		};
	};
};

class GCamDialog3
{
	idd = 5004;
	movingEnable = 0;
	class controls
	{
		class Base
		{
			idc = -1;
			style = 0x00;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1};
			font = "Zeppelin32";
			sizeEx = 0.04;
			h = 0.04;
			text = "";
		};
		class MousePosHandle : Base
		{
			idc = 1;
			type = 0;
			style = 16;
			colorBackground[] = { 0.5, 0.5, 0.5, 0 };
			colorText[] = { 1, 1, 1, 1 };
			text = "";
			lineSpacing = 1;
			x = -0.6; y = -0.375;
			w = 2.2; h = 1.75;
		};
		class Text
		{
			idc = 3;
			type = 13;
			style = 0;
			colorBackground[] = { 0, 0, 0, 0 };
			x = 0; y = 0; w = 1; h = 1;
			size = 0.04;
			text = "";
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "left";
				valign = "top";
				shadow = true;
				shadowColor = "#000000";
				size = 1;
			};
		};
	};
};

