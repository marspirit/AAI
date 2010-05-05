/*

RESPAWN AT BASE DIALOG - Single button

© JULY 2009 - norrin
**********************************************************************************************************************************
respawn_button_1.hpp
*/

class Respawn_button_1b 
{
  idd = -1;
  movingEnable = false;
  controlsBackground[] = {};
  objects[] = { };
  controls[] = {Respawn_1b};   


	class Respawn_1b : NORRNRscNavButton
	{
		idc = 1;
		x = 0.85; y = 0.8;
		w = 0.11; h = 0.04;
		text = "RESPAWN 1";
		action = "[1, player] execVM ""f\revive\respawn_at_base_jip.sqf""";
	};

	
};