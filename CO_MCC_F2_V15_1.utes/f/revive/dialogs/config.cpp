/*
  CONFIG.CPP 

  
Taken and adapted from ArmA Group Link II Plus! script by SNKMAN.

********************************************************************************************************************************
Start config.cpp
*/

class CfgSounds
{
	sounds[] = 
	{
		Brian_Im_hit, Brian_Im_bleeding,Brian_Medic,Brian_Bastards,Brian_Shit_Man_down,Brian_Oh_no,
		Brian_Fuck,Brian_Fuck_it,Brian_Shit,Brian_Need_help,Brian_A_little_help_here
	};

	class Brian_Im_hit
	{
		name="Brian_Im_hit";
		sound[]={"f\revive\sound\UNIV_v05.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_Im_bleeding
	{
		name="Brian_Im_bleeding";
		sound[]={"f\revive\sound\UNIV_v06.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_Medic
	{
		name="Brian_Medic";
		sound[]={"f\revive\sound\UNIV_v07.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_Bastards
	{
		name="Brian_Bastards";
	        sound[]={"f\revive\sound\UNIV_v10.ogg",0.05,1.0};
	        titles[]={};
	};
	class Brian_Shit_Man_down
	{
		name="Brian_Shit_Man_down";
	        sound[]={"f\revive\sound\UNIV_v11.ogg",0.05,1.0};
	        titles[]={};
	};
	class Brian_Oh_no
	{
		name="Brian_Oh_no";
		sound[]={"f\revive\sound\UNIV_v18.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_Fuck
	{
		name="Brian_Fuck";
		sound[]={"sound\UNIV_v24.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_Fuck_it
	{
		name="Brian_Fuck_it";
		sound[]={"f\revive\sound\UNIV_v25.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_Shit
	{
		name="Brian_Shit";
		sound[]={"f\revive\sound\UNIV_v31.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_Need_help
	{
		name="Brian_Need_help";
		sound[]={"f\revive\sound\UNIV_v50.ogg",0.05,1.0};
		titles[]={};
	};
	class Brian_A_little_help_here
	{
		name="Brian_A_little_help_here";
		sound[]={"f\revive\sound\UNIV_v51.ogg",0.05,1.0};
		titles[]={};
	};
	
};