/*

RESPAWN AT BASE DIALOG - 2 Buttons

© JULY 2009 - norrin 
**********************************************************************************************************************************
respawn_button_2.hpp
*/

class Respawn_button_2b 
{
  idd = -1;
  movingEnable = true;
  controlsBackground[] = {};
  objects[] = { };
  controls[] = {Respawn_1b, Respawn_2b};   


	class Respawn_1b : NORRNRscNavButton
	{
		idc = 1;
		x = 0.85; y = 0.75;
		w = 0.11; h = 0.04;
		text = "RESPAWN 1";
		action = "[1,player] execVM ""f\revive\respawn_at_base_jip.sqf""";
	};

	class Respawn_2b : NORRNRscNavButton
	{
		idc = 2;
		x = 0.85; y = 0.8;
		w = 0.11; h = 0.04;
		text = "RESPAWN 2";
		action = "[2, player] execVM ""f\revive\respawn_at_base_jip.sqf""";
	};

};