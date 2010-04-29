/*

CHOOSE MAP SPAWN DIALOG

© JULY 2008 - norrin
**********************************************************************************************************************************
OK_map.hpp
*/

class OK_map 
{
	idd = 202024;
	movingEnable = false;
	controlsBackground[] = {};
	objects[] = { };
	controls[] = {TOP_BORDER, TITLE_DIALOG,r_CHOICE,SPWN_RespawnMap,Respawn_1, Respawn_2};   

class TOP_BORDER
{
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER;
	x = -1.5; 
	y = -0.2;
	w = 4.0; 
	h = 0.28;
	font = FontM;
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
	x = 0.38; 
	y = 0.03;
	w = 0.4; 
	h = 0.04;
	font = FontM;
	sizeEx = 0.04;
	color[] = { 1, 1, 1, 1 };
	colorActive[] = { 1, 0.2, 0.2, 1 };
	soundEnter[] = { "", 0, 1 };   // no sound
	soundPush[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	action = "";
	text = "You are dead!";
	default = true;
};

class r_CHOICE  
{
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	x = 0.84;    
	y = 0.52;
	w = 0.3;    
	h = 0.2; 
	font = FontM;
	sizeEx = 0.025;
	colorText[] = { 1, 1, 1, 1 };
	colorBackground[] = {0,0,0,0};
	colorActive[] = { 1, 0.2, 0.2, 1 };
	soundEnter[] = { "", 0, 1 };   // no sound
	soundPush[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	action = "";
	text = "Choose this respawn point?"; 
	default = true;
};

class SPWN_RespawnMap: NORRNRscMapControl
{
    	idc = 202001;
    	x = 0.01; y = 0.1;
		w = 0.7; h = 0.7; 
};

class Respawn_1 : NORRNRscNavButton
{
	idc = 1;
	x = 0.85; y = 0.65;
	w = 0.11; h = 0.04;
	text = "     OK   ";
	action = "NORRN_r_OK = 2";
};

class Respawn_2 : NORRNRscNavButton
{
	idc = 2;
	x = 0.85; y = 0.7;
	w = 0.11; h = 0.04;
	text = "  GO BACK";
	action = "NORRN_r_OK = 3; [] execVM ""f\revive\Go_back.sqf""";
};

};