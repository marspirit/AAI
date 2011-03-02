#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003
#define MCC_AVTIVE_ZONE 3004

#define GROUP_TYPE 3005
#define GROUP_CLASS 3006

#define UNIT_TYPE 3010
#define UNIT_CLASS 3011

#define SETTING_EMPTY 3020
#define SETTING_BEHAVIOR 3021
#define SETTING_AWERNESS 3022
#define SETTING_TRACK 3023

#define SUPPORT_PARATROOPS 5501
private ["_group", "_type","_groupArray"];

_group = _this select 0;

if (_group ==0) then //Group
	{ 
	_type = lbCurSel GROUP_TYPE;
	
	switch (_type) do		//Which group do we want
		{
		   case 0:	//Infantry
			{
				_groupArray = GEN_INFANTRY;
			};
			
			case 1:	//Motorized
			{
				_groupArray = GEN_MOTORIZED;
			};
			
			case 2:	//Mechnized
			{
				_groupArray = GEN_MECHANIZED;
			};
			
			case 3:	//Armor
			{
				_groupArray = GEN_ARMOR;
			};
			
			case 4:	//Air
			{
				_groupArray = GEN_AIR;
			};
		};
		
	if (_type==5) then 	//Paratroopers
		{
			if (lbCurSel GROUP_CLASS==0) then {
			mcc_spawnname="1"} else {mcc_spawnname="2"};
			mcc_spawntype="PARATROOPER";
			mcc_classtype = "PARATROOPER";
			mcc_spawnfaction = mcc_sidename;
		} else 
		{
		mcc_spawntype="GROUP";
		mcc_classtype = (_groupArray select (lbCurSel GROUP_CLASS)) select 0;
		mcc_spawnname = (_groupArray select (lbCurSel GROUP_CLASS)) select 1;
		mcc_spawnfaction = (_groupArray select (lbCurSel GROUP_CLASS)) select 2;
		mcc_spawndisplayname = (_groupArray select (lbCurSel GROUP_CLASS)) select 3;
		};
	};
	
if (_group ==1) then //Unit
	{ 
	_type = lbCurSel UNIT_TYPE;
	switch (_type) do		//Which unit do we want
		{
		   case 0:	//Infantry
			{
				_groupArray = U_GEN_SOLDIER;
				mcc_spawntype="MAN";
			};
			
			case 1:	//Car
			{
				_groupArray = U_GEN_CAR;
				mcc_spawntype="VEHICLE";
			};
			
			case 2:	//Tank
			{
				_groupArray = U_GEN_TANK;
				mcc_spawntype="VEHICLE";
			};
			
			case 3:	//Motorcycle
			{
				_groupArray = U_GEN_MOTORCYCLE;
				mcc_spawntype="VEHICLE";
			};
			
			case 4:	//Helicopter
			{
				_groupArray = U_GEN_HELICOPTER;
				mcc_spawntype="VEHICLE";
			};
			
			case 5:	//Aircraft
			{
				_groupArray = U_GEN_AIRPLANE;
				mcc_spawntype="VEHICLE";
			};
			
			case 6:	//Ship
			{
				_groupArray = U_GEN_SHIP;
				mcc_spawntype="VEHICLE";
			};
					
			case 7:	//DOC
			{
				_groupArray = GEN_DOC1;
				mcc_spawntype="DOC";
			};
			
			case 8:	//AMMO
			{
				_groupArray = U_AMMO;
				mcc_spawntype="AMMO";
			};
			
			case 9:	//ACE_AMMO
			{
				_groupArray = U_ACE_AMMO;
				mcc_spawntype="AMMO";
			};
			
			case 10:	//Fortifications
			{
				_groupArray = U_FORT;
				mcc_spawntype="AMMO";
			};
				
			case 11:	//Dead Bodies
			{
				_groupArray = U_DEAD_BODIES;
				mcc_spawntype="AMMO";
			};
			
			case 12:	//Furniture
			{
				_groupArray = U_FURNITURE;
				mcc_spawntype="AMMO";
			};
			
			case 13:	//Military
			{
				_groupArray = U_MILITARY;
				mcc_spawntype="AMMO";
			};
			
			case 14:	//Misc
			{
				_groupArray = U_MISC;
				mcc_spawntype="AMMO";
			};
			
			case 15:	//Sighns
			{
				_groupArray = U_SIGHNS;
				mcc_spawntype="AMMO";
			};
			
			case 16:	//Warefare
			{
				_groupArray = U_WARFARE;
				mcc_spawntype="AMMO";
			};
			
			case 17:	//Wrecks
			{
				_groupArray = U_WRECKS;
				mcc_spawntype="AMMO";
			};
			
			case 18:	//Houses
			{
				_groupArray = U_HOUSES;
				mcc_spawntype="AMMO";
			};
			
			case 19:	//Ruins
			{
				_groupArray = U_RUINS;
				mcc_spawntype="AMMO";
			};
			
			case 20:	//fire
			{
				_groupArray = [[0,"USBasicAmmunitionBox",0,0],[0,"USLaunchersBox",0,0],[0,"USOrdnanceBox",0,0]];
				mcc_spawntype="FIRE";
			};
		};
	mcc_classtype = (_groupArray select (lbCurSel UNIT_CLASS)) select 0;
	mcc_spawnname = (_groupArray select (lbCurSel UNIT_CLASS)) select 1;
	mcc_spawnfaction = (_groupArray select (lbCurSel UNIT_CLASS)) select 2;
	mcc_spawndisplayname = (_groupArray select (lbCurSel UNIT_CLASS)) select 3;
	};

mcc_spawnwithcrew = (spawn_empty select (lbCurSel SETTING_EMPTY)) select 1;	//let's add the behavior/awerness
empty_index = (lbCurSel SETTING_EMPTY);

mcc_spawnbehavior = (spawn_behavior select (lbCurSel SETTING_BEHAVIOR)) select 1;
behavior_index = (lbCurSel SETTING_BEHAVIOR);

mcc_awareness = (spawn_awereness select (lbCurSel SETTING_AWERNESS)) select 1;
awereness_index = (lbCurSel SETTING_AWERNESS);

mcc_track_units = (spawn_track select (lbCurSel SETTING_TRACK)) select 1;
track_index = (lbCurSel SETTING_TRACK);
		
nul=[4] execVM "mcc\general_scripts\mcc_SpawnStuff.sqf";
