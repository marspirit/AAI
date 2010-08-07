/*

Dead CAMERA DIALOG

© JULY 2009 - norrin  
**********************************************************************************************************************************
dead_cam_dialog.hpp
*/

class dead_cam_dialog 
{
	idd = 99128;   
	movingEnable = false;
	objects[] = {};
	controls[] = {mouse,TOP_BORDER,BOTTOM_BORDER,TITLE_DIALOG,PRESS_HELP,HELP_DIALOG,CAM_LIST,CAM_select,FRIEND_LIST,FRIEND_select};
	controlsBackground[] = {};
	
	class mouse  : NORRNmouseHandler {};
	
	class TOP_BORDER 
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_CENTER;
		x = -1.5; y = -0.2;
		w = 4.0; h = 0.26;
		font = "TahomaB";
		sizeEx = 0.04;
		colorText[] = { 1, 1, 1, 1 };
		colorBackground[] = {0,0,0,1};
		text = "";
	};

	class BOTTOM_BORDER	
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_CENTER;
		x = -1.5; y = 0.95;
		w = 4.0; h = 0.25;
		font = "TahomaB";
		sizeEx = 0.04;
		colorText[] = { 1, 1, 1, 1 };
		colorBackground[] = {0,0,0,1};
		text = "";
	};	

	class TITLE_DIALOG 
	{
		idc = -1;
		type = CT_ACTIVETEXT;
		style = ST_LEFT;
		x = 0.38; y = 0.01;
		w = 0.4; h = 0.04;
		font = "TahomaB";
		sizeEx = 0.04;
		color[] = { 1, 1, 1, 1 };
		colorActive[] = { 1, 0.2, 0.2, 1 };
		colorText[] = { 1, 1, 1, 1 };
		colorBackground[] = {0,0,0,1};
		soundEnter[] = { "", 0, 1 };   // no sound
		soundPush[] = { "", 0, 1 };
		soundClick[] = { "", 0, 1 };
		soundEscape[] = { "", 0, 1 };
		action = "";
		text = "Spectate Camera";
		default = true;
	};
	
	class PRESS_HELP : NORRNRscText 
	{    
		idc = 10000;
		style = ST_MULTI; 
		linespacing = 1;
		x = 0.8; y = 0.98;    
		w = 0.2; h = 0.1;  
		text = ""; 
	};
	
	class HELP_DIALOG : NORRNRscActiveText 
	{
		idc = -1;
		style = ST_LEFT; 
		linespacing = 1;	
		x = 0.8; y = 0.96;
		w = 0.4; h = 0.02;
		sizeEx = 0.02;
		action = "ctrlSetText [10000, ""Keyboard controls:       A/D - Previous/Next target W/S - Previous/Next camera   N - Toggle NV for Free Cam""]";
		text = "Press for Help";
	};
	
	class CAM_LIST: NORRNRscCombo  
	{
		idc = 10004;
		x = 0.09; y = 0.005;
		w = 0.15; h = 0.04;
		//sizeEx = 0.02; 
	};

	class CAM_select 
	{
		idc = 10001;
		type = CT_STATIC;        
		style = ST_LEFT; 
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		x = 0.02; y = 0.005;
		w = 0.08; h = 0.04;
		font = "TahomaB";
		sizeEx = 0.02;
		text = "Camera:";
		default = true;
	};

	class FRIEND_LIST: NORRNRscCombo  
	{
		idc = 10005;
		x = 0.82; y = 0.005;
		w = 0.15; h = 0.04;
	};

	class FRIEND_select 
	{	
		idc = 10002;
		type = CT_STATIC;        
		style = ST_LEFT; 
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		x = 0.75; y = 0.005;
		w = 0.08; h = 0.04;
		font = "TahomaB";
		sizeEx = 0.02;
		text = "Target:";
		default = true;
	};


};

