/*

RESPAWN AT BASE DIALOG

© JULY 2009 - norrin
**********************************************************************************************************************************
respawn_button_3map.hpp
*/

class Respawn_button_3map 
{
  idd = -1;
  movingEnable = false;
  controlsBackground[] = {};
  objects[] = { };
  controls[] = {TOP_BORDER, TITLE_DIALOG,SPWN_RespawnMap,Respawn_1, Respawn_2, Respawn_3};   

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

class SPWN_RespawnMap: NORRNRscMapControl
{
    	idc = -1; 
    	x = 0.01;
    	y = 0.1;
  	w = 0.7;
  	h = 0.7; 
};

class Respawn_1 : NORRNRscNavButton 
{	
	idc = 1;
	x = 0.85; y = 0.65;
	w = 0.11; h = 0.04;
	text = "RESPAWN 1";
	action = "[1,player] execVM ""f\revive\show_map_loc.sqf""";
};

class Respawn_2 : NORRNRscNavButton 
{	
	idc = 2;
	x = 0.85; y = 0.7;
	w = 0.11; h = 0.04;
	text = "RESPAWN 2";
	action = "[2,player] execVM ""f\revive\show_map_loc.sqf""";

};

class Respawn_3 : NORRNRscNavButton 
{	
	idc = 3;
	x = 0.85; y = 0.75;
	w = 0.11; h = 0.04;
	text = "RESPAWN 3";
	action = "[3,player] execVM ""f\revive\show_map_loc.sqf""";
};

};