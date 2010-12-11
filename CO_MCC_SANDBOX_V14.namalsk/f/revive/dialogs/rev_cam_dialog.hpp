/*

REVIVE CAMERA DIALOG

© JULY 2009 - norrin  
**********************************************************************************************************************************
rev_cam_dialog.hpp
*/

class rev_cam_dialog 
{
	idd = 99123;   
	movingEnable = false;
	objects[] = {};
	controls[] = {mouse,TOP_BORDER,BOTTOM_BORDER,TITLE_DIALOG,PRESS_HELP,HELP_DIALOG,CAM_LIST,CAM_select,FRIEND_LIST,FRIEND_select,Help_1,
				  HINT_BOX0,HINT_BOX1,HINT_BOX2,HINT_BOX3,HINT_BOX4,HINT_BOX5,HINT_BOX6,HINT_BOX7,HINT_BOX8,HINT_BOX9};
	controlsBackground[] = {};
	
	class mouse  : NORRNmouseHandler {};
	
	class TOP_BORDER 
	{
			idc = -1;
			type = CT_STATIC;
			style = ST_CENTER;
			x = -1.5; y = -0.2;
			w = 4.0; h = 0.28;
			font = "TahomaB";
			sizeEx = 0.04;
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,1};
			text = "";
	};

		class BOTTOM_BORDER	{
			idc = -1;
			type = CT_STATIC;
			style = ST_CENTER;
			x = -1.5; y = 0.89;
			w = 4.0; h = 0.25;
			font = "TahomaB";
			sizeEx = 0.04;
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,1};
			text = "";
		};	

		class TITLE_DIALOG {
			idc = -1;
			type = CT_ACTIVETEXT;
			style = ST_LEFT;
			x = 0.38; y = 0.03;
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
			text = "Unconscious Camera";
			default = true;
		};
	
		class PRESS_HELP : NORRNRscText {    
			idc = 10000;
			style = ST_MULTI; 
			linespacing = 1;
			x = 0.8; y = 0.92;    
			w = 0.2; h = 0.1;    
			text = ""; 
		};
	
		class HELP_DIALOG : NORRNRscActiveText {
			idc = -1;
			style = ST_LEFT; 
			linespacing = 1;	
			x = 0.8; y = 0.9;
			w = 0.4; h = 0.02;
			sizeEx = 0.02;
			action = "ctrlSetText [10000, ""Keyboard controls:             A/D - Previous/Next target W/S - Previous/Next camera   N - Toggle NV for Free Cam""]";
			text = "Press for Help";
		};
	
		class CAM_LIST: NORRNRscCombo  {
			idc = 10004;
			x = 0.09; y = 0.03;
			w = 0.15; h = 0.04;
			//sizeEx = 0.02; 
		};
	
		class CAM_select {
			idc = 10001;
			type = CT_STATIC;        
			style = ST_LEFT; 
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			x = 0.02; y = 0.03;
			w = 0.08; h = 0.04;
			font = "TahomaB";
			sizeEx = 0.02;
			text = "Camera:";
			default = true;
		};

		class FRIEND_LIST: NORRNRscCombo  {
			idc = 10005;
			x = 0.82; y = 0.03;
			w = 0.15; h = 0.04;
			//sizeEx = 0.02; 
		};

		class FRIEND_select {	
			idc = 10002;
			type = CT_STATIC;        
			style = ST_LEFT; 
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			x = 0.75; y = 0.03;
			w = 0.08; h = 0.04;
			font = "TahomaB";
			sizeEx = 0.02;
			text = "Target:";
			default = true;
		};

		class Help_1 : NORRNRscNavButton 
		{	
			x = 0.02; y = 0.10;
			w = 0.11; h = 0.04;
			idc = 5;
			colorBackground[] = { 1, 1, 1, 0.5 };
			text = "Call for Help";
			action = "[] call Norrn_Call4Help";	
		};

		class HINT_BOX0 : NORRNRscText 
		{	
			idc = 10;
			x = 0.02; y = 0.87;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX1 : NORRNRscText 
		{	
			idc = 11;
			x = 0.02; y = 0.89;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX2 : NORRNRscText
		{	
			idc = 12;
			x = 0.02; y = 0.91;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX3 : NORRNRscText 
		{	
			idc = 13;
			x = 0.56; y = 0.87;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX4 : NORRNRscText
		{	
			idc = 14;
			x = 0.56; y = 0.89;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX5 : NORRNRscText	
		{	
			idc = 15;
			x = 0.56; y = 0.91;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX6 : NORRNRscText
		{	
			idc = 16;
			x = 0.30; y = 0.87;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX7 : NORRNRscText	
		{	
			idc = 17;
			x = 0.30; y = 0.89;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX8 : NORRNRscText
		{	
			idc = 18;
			x = 0.30; y = 0.91;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX9 : NORRNRscText	
		{	
			idc = 19;
			x = 0.30; y = 0.93;
			w = 0.4; h = 0.1;
		};
	

};

