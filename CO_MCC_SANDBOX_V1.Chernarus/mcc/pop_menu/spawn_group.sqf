#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003
#define MCC_AVTIVE_ZONE 3004
#define GROUP_INF 3005
#define GROUP_MOTO 3006
#define GROUP_MECH 3007
#define GROUP_ARMOR 3008
#define GROUP_AIR 3009

#define UNIT_INF 3010
#define UNIT_CAR 3011
#define UNIT_TANK 3012
#define UNIT_MOTOR 3013
#define UNIT_HELI 3014
#define UNIT_AIR 3015
#define UNIT_SHIP 3016
#define UNIT_DOC 3017
#define UNIT_AMMO 3018
#define UNIT_AAMMO 3019
#define SETTING_EMPTY 3020
#define SETTING_BEHAVIOR 3021
#define SETTING_AWERNESS 3022
#define SETTING_TRACK 3023

_type = _this select 0;

if (_type ==1) then { 
	mcc_spawntype="GROUP";
	mcc_classtype = (GEN_INFANTRY select (lbCurSel GROUP_INF)) select 0;
	mcc_spawnname = (GEN_INFANTRY select (lbCurSel GROUP_INF)) select 1;
	mcc_spawnfaction = (GEN_INFANTRY select (lbCurSel GROUP_INF)) select 2;
	mcc_spawndisplayname = (GEN_INFANTRY select (lbCurSel GROUP_INF)) select 3;
	//hint format ["%1, %2, %3, %4", mcc_classtype, mcc_spawnname, mcc_spawnfaction, mcc_spawndisplayname];
	};
if (_type ==2) then { 
	mcc_spawntype="GROUP";
	mcc_classtype = (GEN_MOTORIZED select (lbCurSel GROUP_MOTO)) select 0;
	mcc_spawnname = (GEN_MOTORIZED select (lbCurSel GROUP_MOTO)) select 1;
	mcc_spawnfaction = (GEN_MOTORIZED select (lbCurSel GROUP_MOTO)) select 2;
	mcc_spawndisplayname = (GEN_MOTORIZED select (lbCurSel GROUP_MOTO)) select 3;
	};
if (_type ==3) then { 
	mcc_spawntype="GROUP";
	mcc_classtype = (GEN_MECHANIZED select (lbCurSel GROUP_MECH)) select 0;
	mcc_spawnname = (GEN_MECHANIZED select (lbCurSel GROUP_MECH)) select 1;
	mcc_spawnfaction = (GEN_MECHANIZED select (lbCurSel GROUP_MECH)) select 2;
	mcc_spawndisplayname = (GEN_MECHANIZED select (lbCurSel GROUP_MECH)) select 3;
	};
if (_type ==4) then { 
	mcc_spawntype="GROUP";
	mcc_classtype = (GEN_ARMOR select (lbCurSel GROUP_ARMOR)) select 0;
	mcc_spawnname = (GEN_ARMOR select (lbCurSel GROUP_ARMOR)) select 1;
	mcc_spawnfaction = (GEN_ARMOR select (lbCurSel GROUP_ARMOR)) select 2;
	mcc_spawndisplayname = (GEN_ARMOR select (lbCurSel GROUP_ARMOR)) select 3;
	};
if (_type ==5) then { 
	mcc_spawntype="GROUP";
	mcc_classtype = (GEN_AIR select (lbCurSel GROUP_AIR)) select 0;
	mcc_spawnname = (GEN_AIR select (lbCurSel GROUP_AIR)) select 1;
	mcc_spawnfaction = (GEN_AIR select (lbCurSel GROUP_AIR)) select 2;
	mcc_spawndisplayname = (GEN_AIR select (lbCurSel GROUP_AIR)) select 3;
	};
if (_type ==6) then { //Spawn units;
	mcc_spawntype="MAN";
	mcc_classtype = (U_GEN_SOLDIER select (lbCurSel UNIT_INF)) select 0;
	mcc_spawnname = (U_GEN_SOLDIER select (lbCurSel UNIT_INF)) select 1;
	mcc_spawnfaction = (U_GEN_SOLDIER select (lbCurSel UNIT_INF)) select 2;
	mcc_spawndisplayname = (U_GEN_SOLDIER select (lbCurSel UNIT_INF)) select 3;
	
	};
if (_type ==7) then { 
	mcc_spawntype="VEHICLE";
	mcc_classtype = (U_GEN_CAR select (lbCurSel UNIT_CAR)) select 0;
	mcc_spawnname = (U_GEN_CAR select (lbCurSel UNIT_CAR)) select 1;
	mcc_spawnfaction = (U_GEN_CAR select (lbCurSel UNIT_CAR)) select 2;
	mcc_spawndisplayname = (U_GEN_CAR select (lbCurSel UNIT_CAR)) select 3;
	};
if (_type ==8) then { 
	mcc_spawntype="VEHICLE";
	mcc_classtype = (U_GEN_TANK select (lbCurSel UNIT_TANK)) select 0;
	mcc_spawnname = (U_GEN_TANK select (lbCurSel UNIT_TANK)) select 1;
	mcc_spawnfaction = (U_GEN_TANK select (lbCurSel UNIT_TANK)) select 2;
	mcc_spawndisplayname = (U_GEN_TANK select (lbCurSel UNIT_TANK)) select 3;
	};
if (_type ==9) then { 
	mcc_spawntype="VEHICLE";
	mcc_classtype = (U_GEN_MOTORCYCLE select (lbCurSel UNIT_MOTOR)) select 0;
	mcc_spawnname = (U_GEN_MOTORCYCLE select (lbCurSel UNIT_MOTOR)) select 1;
	mcc_spawnfaction = (U_GEN_MOTORCYCLE select (lbCurSel UNIT_MOTOR)) select 2;
	mcc_spawndisplayname = (U_GEN_MOTORCYCLE select (lbCurSel UNIT_MOTOR)) select 3;
	};
if (_type ==10) then { 
	mcc_spawntype="VEHICLE";
	mcc_classtype = (U_GEN_HELICOPTER select (lbCurSel UNIT_HELI)) select 0;
	mcc_spawnname = (U_GEN_HELICOPTER select (lbCurSel UNIT_HELI)) select 1;
	mcc_spawnfaction = (U_GEN_HELICOPTER select (lbCurSel UNIT_HELI)) select 2;
	mcc_spawndisplayname = (U_GEN_HELICOPTER select (lbCurSel UNIT_HELI)) select 3;
	};
if (_type ==11) then { 
	mcc_spawntype="VEHICLE";
	mcc_classtype = (U_GEN_AIRPLANE select (lbCurSel UNIT_AIR)) select 0;
	mcc_spawnname = (U_GEN_AIRPLANE select (lbCurSel UNIT_AIR)) select 1;
	mcc_spawnfaction = (U_GEN_AIRPLANE select (lbCurSel UNIT_AIR)) select 2;
	mcc_spawndisplayname = (U_GEN_AIRPLANE select (lbCurSel UNIT_AIR)) select 3;
	};
if (_type ==12) then { 
	mcc_spawntype="VEHICLE";
	mcc_classtype = (U_GEN_SHIP select (lbCurSel UNIT_SHIP)) select 0;
	mcc_spawnname = (U_GEN_SHIP select (lbCurSel UNIT_SHIP)) select 1;
	mcc_spawnfaction = (U_GEN_SHIP select (lbCurSel UNIT_SHIP)) select 2;
	mcc_spawndisplayname = (U_GEN_SHIP select (lbCurSel UNIT_SHIP)) select 3;
	};
if (_type ==13) then { 
	mcc_spawntype="DOC";
	mcc_classtype = (GEN_DOC1 select (lbCurSel UNIT_DOC)) select 0;
	mcc_spawnname = (GEN_DOC1 select (lbCurSel UNIT_DOC)) select 1;
	mcc_spawnfaction = (GEN_DOC1 select (lbCurSel UNIT_DOC)) select 2;
	mcc_spawndisplayname = (GEN_DOC1 select (lbCurSel UNIT_DOC)) select 3;
	};
if (_type ==14) then { 
	mcc_spawntype="AMMO";
	mcc_classtype = (U_AMMO select (lbCurSel UNIT_AMMO)) select 0;
	mcc_spawnname = (U_AMMO select (lbCurSel UNIT_AMMO)) select 1;
	mcc_spawnfaction = (U_AMMO select (lbCurSel UNIT_AMMO)) select 2;
	mcc_spawndisplayname = (U_AMMO select (lbCurSel UNIT_AMMO)) select 3;
	};
if (_type ==15) then { 
	mcc_spawntype="AMMO";
	mcc_classtype = (U_ACE_AMMO select (lbCurSel UNIT_AAMMO)) select 0;
	mcc_spawnname = (U_ACE_AMMO select (lbCurSel UNIT_AAMMO)) select 1;
	mcc_spawnfaction = (U_ACE_AMMO select (lbCurSel UNIT_AAMMO)) select 2;
	mcc_spawndisplayname = (U_ACE_AMMO select (lbCurSel UNIT_AAMMO)) select 3;
	};

mcc_spawnwithcrew = (spawn_empty select (lbCurSel SETTING_EMPTY)) select 1;	//let's add the behavior/awerness
empty_index = (lbCurSel SETTING_EMPTY);
//hint format ["%1, %2, %3, %4", mcc_classtype, mcc_spawnname, mcc_spawnfaction, mcc_spawndisplayname];

mcc_spawnbehavior = (spawn_behavior select (lbCurSel SETTING_BEHAVIOR)) select 1;
behavior_index = (lbCurSel SETTING_BEHAVIOR);

mcc_awareness = (spawn_awereness select (lbCurSel SETTING_AWERNESS)) select 1;
awereness_index = (lbCurSel SETTING_AWERNESS);

mcc_track_units = (spawn_track select (lbCurSel SETTING_TRACK)) select 1;
track_index = (lbCurSel SETTING_TRACK);
		
nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';


 
		