// By: Shay_gman
// Version: 1.1 (August 2010)
#define ExtrasDialog2_IDD 2997
#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog3_IDD 2996

#define CAPTURE 3204

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003

#define UNIT_CAR 3011
#define UNIT_TANK 3012
#define UNIT_HELI 3014
#define UNIT_AIR 3015
#define UNIT_SHIP 3016

#define IED_TYPE 4500
#define IED_OBJECT 4501
#define IED_EXPLOSION 4502
#define IED_EXPTYPE 4503
#define IED_DISARM 4504
#define IED_JAM 4505
#define IED_TRIGGER 4506
#define IED_AMBUSH 4507

#define IED_PROX 4510
#define IED_TARGET 4512

#define CONVOY_CAR1 5001
#define CONVOY_CAR2 5002
#define CONVOY_CAR3 5003
#define CONVOY_CAR4 5004
#define CONVOY_CAR5 5005
#define CONVOY_CARHVT 5006
#define CONVOY_HVT 5007

#define SUPPORT_PARATROOPS 5501
#define SUPPORT_HOSTAGES 5502
#define SUPPORT_UAV 5503
#define SUPPORT_ARTY_TYPE 5504
#define SUPPORT_ARTY_SPREAD 5505
#define SUPPORT_ARTY_NUMBER 5506 
#define AIRDROP_AMMOUNT 5507
#define AIRDROP_CAR 5508
#define AIRDROP_TANK 5509 
#define AIRDROP_AMMO 5510 
#define AIRDROP_AAMMO 5511 
#define CAS_PLANE 5512 
#define CAS_TYPE 5513 
#define CAS_AMMOUNT 5514 
#define CAS_APPROACH 5515 

//-----------------------------------------------------------------------------
// Main dialog
//-----------------------------------------------------------------------------
class ExtrasDialog {
  idd = ExtrasDialog_IDD;
  movingEnable = true;
  onLoad = "[] execVM 'mcc\dialogs\mcc_extra_init.sqf'"; 
  
  controlsBackground[] = 
  {
	MCC_Bckgrnd,		//mcc background
	MCC_mapBackground,	//map background
	zonesFrame,
	supportBackground,
	lhdPic,
	trapsFrame,
	factionFrame,
	convoyFrame,
	LHDFrame,
	supportFrame,
	airdropFrame,
	artilleryFrame	
  };
  

  //---------------------------------------------
  objects[] = 
  { 
  };
  
  controls[] = 
  {
	MCC_map,		//Map dialog
	MCC_Title,
	
	Zone_Number,	//Zones
	Zone_NumberTitle,
	zoneTitle,
	Zone_x,
	Zone_xTitle,
	Zone_y,
	Zone_yTitle,
	Zone_set,
	faction,
	factionTitle,
	Update_Faction,
	
	Close_dialog,	//butonns
	Logout,
	Safe,
	Load,
	Extras,
	trigger_capturing,
	
	airTitle, //LHD spawn
	unit_Air,
	lhdAirSpawn,
	heliTitle,
	unit_Heli,
	lhdHeliSpawn,
	carsTitle,
	unit_Car,
	lhdCarSpawn,
	tanksTitle,
	unit_Tank,
	lhdTankSpawn,
	shipsTitle,
	unit_ship,
	lhdShipSpawn,
	LHD_pos1,
	LHD_pos2,
	LHD_pos3,
	LHD_pos4,
	LHD_pos5,
	LHD_pos6,
	LHD_pos7,
	LHD_pos8,
	LHD_pos9,
	LHD_pos10,
	
	IedTitle,	//Traps
	iedProxTitle,
	iedProx,
	
	typeIEDTitle,
	typeIED,
	explosionSizeIEDTitle,
	explosionSizeIED,
	explosionTypeIEDTitle,
	explosionTypeIED,
	disarmIEDTitle,
	disarmIED,
	jammIEDTitle,
	jammIED,
	iedTargetTitle,
	iedTarget,
	iedTriggerTitle,
	iedTrigger,
	iedAmbushGroupTitle,
	iedAmbushGroup,
	typeIEDSpawn,
	typeIEDSpawnGroup,
	iedHelpTitle,
	
	objectIEDTitle,
	objectIED,
	typeIEDRteSave,
	
	car1Title,			//Convoy
	car2Title,
	car3Title,
	car4Title,
	car5Title,
	car1,
	car2,
	car3,
	car4,
	car5,
	HVTTitle,
	HVTcarTitle,
	HVT,
	HVTCar,
	convoyPlace,
	convoyStart,
	convoyResetWaypoints,
	
	supportTitle,		//support
	hostageTitle,
	hostages,
	hostageSpawn,
	uav,
	uavTitle,
	uavSpawn,
	airDropTitle,
	airDropAmmountTitle,
	airDropType,
	airDropAmount,
	airDropCar,
	airDropTank,
	airDropAmmo,
	airDropAceammo,
	airDropCarSpawn,
	airDropTankSpawn,
	airDropAmmoSpawn,
	airDropAAmmoSpawn,
	CASTitle,
	CASAmmountTitle,
	CASAprochTitle,
	CASApproch,
	CASPlaneTitle,
	CASTypeTitle,
	CASAmount,
	CASPlane,
	CASType,
	CASSpawn,
	artyType,
	artySpread,
	artyNumber,
	artilleryTitle,
	artilleryTypeTitle,
	artillerySpreadTitle,
	artilleryNumberTitle,
	artySpawn
	
  };
 //========================================= Background========================================
 class MCC_Title : RscText {x = 0.02; y = 0.01;w = 3; colorBackground[] = { 1, 1, 1, 0 };text = "MCC Sandbox V1.51 redone by Shay_gman";};
 class MCC_Bckgrnd : RscPicture {idc = -1; moving = true; x = 0.0; y = 0.0; w = 1.5; h = 1.5; text = "\ca\ui\data\igui_background_diary_ca.paa";};
 class MCC_mapBackground : RscText {idc = -1; moving = true; colorBackground[] = { 1, 1, 1, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44;	w = 0.52; h = 0.4; text = "";};
 class zonesFrame : RscFrame {moving = true; x = 0.35; y = 0.61;w = 0.21; h = 0.23;};
 class lhdPic : RscPicture {idc = -1; moving = true; x = 0.005; y = 0.04; w = 0.18; h = 0.36; text = "mcc\dialogs\1lhd.paa";};
 class trapsFrame : RscFrame {moving = true; x = 0.35; y = 0.09;w = 0.725; h = 0.25;};
 class factionFrame : trapsFrame {moving = true; x = 0.35; y = 0.04;w = 0.725; h = 0.05;};
 class convoyFrame : trapsFrame {moving = true; x = 0.35; y = 0.34;w = 0.725; h = 0.27;};
 class LHDFrame : convoyFrame {moving = true; x = 0.005; y = 0.04;w = 0.345; h = 0.36;}; 
 class supportFrame : LHDFrame {moving = true;  y = 0.44;w = 0.345; h = 0.29;}; 
 class airdropFrame : LHDFrame {moving = true;  y = 0.53;w = 0.345; h = 0.13;}; 
 class artilleryFrame : LHDFrame {moving = true;  y = 0.73;w = 0.345; h = 0.11;}; 
 class supportBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.005; y = 0.04;w = 0.345; h = 0.8;text = "";};
 //========================================= Controls========================================
  
  //mapDialog
  class MCC_map : RscMapControl {idc = -1; moving = true; colorBackground[] = { 0, 0, 0, 1}; colorText[] = { 1, 1, 1, 0}; x = 0.555; y = 0.44; w = 0.52; h = 0.4;text = "";onMouseButtonDown = "[_this] execVM 'mcc\mouseDown.sqf'";onMouseButtonUp = "[_this] execVM 'mcc\mouseUp.sqf'";};
  
  //-------------------------------------------ComboBox-------------------------------------------
  //zones
  class Zone_Number : RscComboBox {	idc = MCC_ZONE_NUMBERS;	style = ST_LEFT;colorText[] = { 1, 1, 1, 1 };colorSelect[] = { 1.0, 0.35, 0.3, 1 };	colorBackground[] = { 0, 0, 0, 0.6 };
									colorSelectBackground[] = { 0, 0, 0, 1 };font = "BitStream";sizeEx =0.028;	x = 0.42; y = 0.65;w = 0.06; h = 0.028;onLBSelChanged = "[0] execVM 'mcc\pop_menu\zones.sqf'";};
  class Zone_x : Zone_Number {idc = MCC_ZONE_X;y = 0.65 + 0.05;};
  class Zone_y : Zone_Number {idc = MCC_ZONE_Y;y = 0.65 + 0.05 + 0.05;};
  class faction : Zone_Number {idc = MCC_FACTION;x = 0.45;y = 0.05;sizeEx = 0.028;w = 0.10; h = 0.028;};
  //LHD
  class unit_Air : Zone_Number {idc = UNIT_AIR;x = 0.19;y = 0.08;sizeEx = 0.02;w = 0.07; h = 0.028;};
  class lhdAirSpawn : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.19+0.08; y = 0.08;w = 0.08;h = 0.04;size = 0.02;sizeEx = 0.03;text = "Spawn";onButtonClick = "nul=[0] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';";};
  class unit_Heli : unit_Air {idc = UNIT_HELI;y = 0.08+0.07;};
  class lhdHeliSpawn : lhdAirSpawn {x = 0.19+0.08; y = 0.08+0.07;text = "Spawn";onButtonClick = "nul=[1] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';";};
  class unit_Car : unit_Air {idc = UNIT_CAR;x = 0.19;y = 0.08+0.14;sizeEx = 0.02;w = 0.07; h = 0.028;};
  class lhdCarSpawn : lhdAirSpawn {x = 0.19+0.08; y = 0.08+0.14;text = "Spawn";onButtonClick = "nul=[2] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';";};
  class unit_Tank : unit_Air {idc = UNIT_TANK;x = 0.19;y = 0.08+0.21;sizeEx = 0.02;w = 0.07; h = 0.028;};
  class unit_ship : unit_Air {idc = UNIT_SHIP;x = 0.19;y = 0.08+0.28;sizeEx = 0.02;w = 0.07; h = 0.028;};
  class lhdTankSpawn : lhdAirSpawn {x = 0.19+0.08; y = 0.08+0.21;text = "Spawn";onButtonClick = "nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';";};
  class lhdShipSpawn : lhdAirSpawn {x = 0.19+0.08; y = 0.08+0.28;text = "Spawn";onButtonClick = "nul=[4] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';";};
  //Traps
  class typeIED : unit_Air {idc = IED_TYPE;x = 0.5;y = 0.13;sizeEx = 0.02;w = 0.1; h = 0.03;onLBSelChanged = "[0] execVM 'mcc\general_scripts\traps\trap_change.sqf'";};  
  class objectIED : unit_Air {idc = IED_OBJECT;x = 0.5;y = 0.16;sizeEx = 0.02;w = 0.1; h = 0.03;};  
  class explosionSizeIED : objectIED {idc = IED_EXPLOSION;y = 0.19;};  
  class explosionTypeIED : objectIED {idc = IED_EXPTYPE;y = 0.22;};
  class disarmIED : objectIED {idc = IED_DISARM;y = 0.25;};
  class jammIED : objectIED {idc = IED_JAM;y = 0.28;};
  class iedTarget : objectIED {idc = IED_TARGET;y = 0.31;}; 
  class iedTrigger : objectIED {idc = IED_TRIGGER;x = 0.75;y = 0.13;};
  class iedProx : iedTrigger {idc = IED_PROX;y = 0.16;}; 
  class iedAmbushGroup : iedTrigger {idc = IED_AMBUSH;y = 0.19;};
     
  class typeIEDSpawn : RscButton {x = 0.61; y = 0.24;w = 0.11;h = 0.025;colorText[] = {0,0,1,1}; text = "Create IED";onButtonClick = "nul=[0] execVM 'mcc\general_scripts\traps\trap_request.sqf';";};
  class typeIEDSpawnGroup : RscButton {x = 0.74; y = 0.24;w = 0.11;h = 0.025;colorText[] = {0,0,1,1}; text = "Create Ambush";onButtonClick = "nul=[1] execVM 'mcc\general_scripts\traps\trap_request.sqf';";};
  class typeIEDRteSave : RscButton {x = 0.61; y = 0.27;w = 0.24;h = 0.025;colorText[] = {0,0,1,1}; text = "Save armed civilian to clipboard";onButtonClick = "nul=[2] execVM 'mcc\general_scripts\traps\trap_request.sqf';";};
    
  //Convoy
  class car1 : typeIED {idc = CONVOY_CAR1;x = 0.35+0.06;y = 0.36;}; 
  class car2 : car1 {idc = CONVOY_CAR2;y = 0.36+0.05;}; 
  class car3 : car1 {idc = CONVOY_CAR3;y = 0.36+0.1;}; 
  class car4 : car1 {idc = CONVOY_CAR4;y = 0.36+0.15;}; 
  class car5 : car1 {idc = CONVOY_CAR5;y = 0.36+0.2;}; 
  class HVT : car1 {idc = CONVOY_HVT;x = 0.64;y = 0.35;w = 0.08;}; 
  class HVTCar : HVT {idc = CONVOY_CARHVT;y = 0.4;}; 
  
  //Support
  class hostages : HVT {idc = SUPPORT_HOSTAGES;x = 0.15; y = 0.47;}; 
  class uav : hostages {idc = SUPPORT_UAV; y = 0.47+0.03;}; 
  class airDropAmount : hostages {idc = AIRDROP_AMMOUNT; y = 0.47+0.07;w = 0.05; h = 0.025;}; 
  class airDropCar : hostages {idc = AIRDROP_CAR; x = 0.01;y = 0.47+0.13;w = 0.06; h = 0.028;}; 
  class airDropTank : airDropCar {idc = AIRDROP_TANK; x = 0.01+0.065;}; 
  class airDropAmmo : airDropCar {idc = AIRDROP_AMMO; x = 0.01+0.14;}; 
  class airDropAceammo : airDropCar {idc = AIRDROP_AAMMO; x = 0.01+0.23;}; 
  class CASAmount : hostages {idc = CAS_AMMOUNT;y = 0.665;w = 0.05; h = 0.025;};
  class CASApproch : CASAmount {idc = CAS_APPROACH;x = 0.29;};  
  class CASPlane : airDropCar {idc = CAS_PLANE; x = 0.01+0.065;y = 0.69;}; 
  class CASType : CASPlane {idc = CAS_TYPE; x = 0.01+0.204;}; 
  class artyType : hostages {idc = SUPPORT_ARTY_TYPE;x = 0.01; y = 0.61+0.18;}; 
  class artySpread : artyType {idc = SUPPORT_ARTY_SPREAD;x = 0.01+0.09;};
  class artyNumber : artyType {idc = SUPPORT_ARTY_NUMBER;x = 0.01+0.18;};
 
  //-------------------------------------------Titels-------------------------------------------
//Zones
  class Zone_NumberTitle : RscText {idc = -1;style = ST_LEFT;colorBackground[] = { 1, 1, 1, 0 };colorText[] = { 1, 1, 1, 1 };x = 0.35; y = 0.65 - 0.015;	w = 0.22; h = 0.05;	sizeEx = 0.03;text = "Zone:";};
  class Zone_xTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05;text = "Size X:";};
  class Zone_yTitle : Zone_NumberTitle {y = 0.65 - 0.015 + 0.05 + 0.05;text = "Size Y:";};
  class factionTitle : Zone_NumberTitle {x = 0.45-0.1;y = 0.05;colorText[] = {0,1,1,1};text = "Faction:";};
  class zoneTitle : Zone_NumberTitle {x = 0.39;y = 0.6;colorText[] = {0,1,1};text = "Zones:*";};
  //LHD
  class airTitle : Zone_NumberTitle {x = 0.2;y = 0.04;text = "Planes:";};
  class heliTitle : airTitle {y = 0.04+0.07;text = "Helis:";};
  class carsTitle : airTitle {y = 0.04+0.14;text = "Cars:";};
  class tanksTitle : airTitle {y = 0.04+0.21;text = "Tanks:";};
  class shipsTitle : airTitle {y = 0.04+0.28;text = "Ships:";};
  //Traps
  class IedTitle : airTitle {x = 0.35;y = 0.08;colorText[] = {0,1,1};text = "Explosives:";};
  class typeIEDTitle : airTitle {x = 0.35;y = 0.12;text = "Type:";};
  class objectIEDTitle : typeIEDTitle {y = 0.15;text ="Object:";};
  class explosionSizeIEDTitle : typeIEDTitle {y = 0.18;text ="Explosion Size:";};
  class explosionTypeIEDTitle : typeIEDTitle {y = 0.21;text ="Explosion Type:";};
  class disarmIEDTitle : typeIEDTitle {y = 0.24;text = "Disarm Duration:";};
  class jammIEDTitle : typeIEDTitle {y = 0.27;text = "Jammable:";};
  class iedTargetTitle : typeIEDTitle {y = 0.3;text = "Target Faction:";};
  class iedTriggerTitle : typeIEDTitle {x = 0.6;y = 0.12;text = "Trigger Type:";};
  class iedProxTitle : iedTriggerTitle {y = 0.15;text = "Proximity:";};
  class iedAmbushGroupTitle : iedTriggerTitle {y = 0.18;text = "Ambush Group:";};
  class iedHelpTitle : RscStructuredText {x = 0.86;y = 0.12;w = 0.2; h = 0.2;text = "*Press Ctrl + left mouse button to trigger an IED or ambushing party --------------------------- *Press Shift + drag left mouse button to link between IEDs and ambush parties";};
  
  //convoy
  class car1Title : IedTitle {x = 0.35;y = 0.35;colorText[] = {1,1,1};text = "Car1:";};
  class car2Title : car1Title {y = 0.35+0.05;text = "Car2:";};
  class car3Title : car1Title {y = 0.35+0.10;text = "Car3:";};
  class car4Title : car1Title {y = 0.35+0.15;text = "Car4:";};
  class car5Title : car1Title {y = 0.35+0.20;text = "Car5:";};
  class HVTTitle : car1Title {y = 0.34;x = 0.55;text = "HVT:";};
  class HVTcarTitle : HVTTitle {y = 0.35+0.04;text = "HVT Car:";};
  //Support
  class supportTitle : IedTitle {x = 0.01;y = 0.43;colorText[] = {0,1,1};text = "Support:";};
  class hostageTitle : supportTitle {y = 0.46;colorText[] = {1,1,1};text = "Hostage:";};
  class uavTitle : hostageTitle {y = 0.46+0.03;text = "UAV/ULB:";};
  class airDropTitle : uavTitle {y = 0.46+0.07;colorText[] = {0,1,1};text = "AirDrop:";};
  class airDropAmmountTitle : uavTitle {x = 0.12;y = 0.46+0.07;text = "#:";};
  class airDropType : uavTitle {y = 0.46+0.1;w = 0.4;text = "Car					Tank					Ammo					AceAmmo";};
  class CASTitle : uavTitle {y = 0.65;colorText[] = {0,1,1,1};text = "CAS:";};
  class CASAmmountTitle : uavTitle {x = 0.12;y = 0.65;text = "#:";};
  class CASAprochTitle : uavTitle {x = 0.2;y = 0.65;text = "Approach:";};
  class CASPlaneTitle : uavTitle {y = 0.65+0.03;text = "Plane:";};
  class CASTypeTitle : CASPlaneTitle {x = 0.01+0.14;text = "Type:";};
  class artilleryTitle : hostageTitle {x = 0.01; y = 0.6+0.12;colorText[] = {0,1,1};text = "Artillery:*";};
  class artilleryTypeTitle : hostageTitle {x = 0.01; y = 0.6+0.15;text = "Type:";};
  class artillerySpreadTitle : hostageTitle {x = 0.01+0.09; y = 0.6+0.15;text = "Spread:";};
  class artilleryNumberTitle : hostageTitle {x = 0.01+0.18; y = 0.6+0.15;text = "Number:";};  
 
	
//-------------------------------------------Buttons-------------------------------------------
//Zones
  class Zone_set : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.35; y = 0.8;	text = "Update Zone";onButtonClick = "[1] execVM 'mcc\pop_menu\zones.sqf'";};
//Bottom Buttons
  class Close_dialog : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.895; y = 0.84;text = "Close";onButtonClick = "closeDialog 0";};
  class Update_Faction : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.56; y = 0.05;w = 0.105825; h = 0.0422876;size = 0.02821;sizeEx = 0.02821;text = "Update";onButtonClick = "mcc_screen=1;[] execVM 'mcc\pop_menu\faction.sqf'";};
  class Logout : Close_dialog {x = 0.7;text = "Logout";onButtonClick = "mcc_resetmissionmaker=true;nul=[0] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';closeDialog 0";};
  class Safe : Close_dialog {x = 0.01;text = "Safe";onButtonClick = "copyToClipboard mcc_safe;hint 'SAVED to Clipboard! Now you can paste this code where you like to save it. Simple copy it all back in clipboard (ctrl-c) and press load to rebuild your mission.';";};
  class Load : Close_dialog {x = 0.2;text = "Load";onButtonClick = "mcc_safe = CopyFromClipboard;mcc_load='mcc_isloading=true;' + mcc_safe + 'mcc_isloading=false;';[] spawn compile mcc_load;";};
  class Extras : Close_dialog {x = 0.01;y=0.4;w = 0.33;text = "Main Menu";onButtonClick = "mcc_screen=0;closeDialog 0;[] execVM 'mcc\pop_menu\mcc_CreatePopupMenu.sqf'";};
  class trigger_capturing : RscButton {idc = CAPTURE;x = 0.35;y = 0.01;w = 0.15;colorText[] = {1,0,0,1};text = "Stop Capturing";action = "ctrlEnable [3204,false];mcc_capture_state=false;";};
  //LHD spawn positions
  class LHD_pos1 : RscButton {idc = -1;x = 0.08;y = 0.07;w = 0.025; h = 0.025;colorText[] = {0,0,1,1};text = "1";action = "lhdpos = 'pos1'"};
  class LHD_pos2 : LHD_pos1 {y = 0.07+0.03;text = "2";action = "lhdpos = 'pos2'";};
  class LHD_pos3 : LHD_pos1 {y = 0.07+0.06;text = "3";action = "lhdpos = 'pos3'";};
  class LHD_pos4 : LHD_pos1 {y = 0.07+0.23;text = "4";action = "lhdpos = 'pos5'";};
  class LHD_pos5 : LHD_pos1 {y = 0.07+0.26;text = "5";action = "lhdpos = 'pos6'";};
  class LHD_pos6 : LHD_pos1 {y = 0.07+0.29;text = "6";action = "lhdpos = 'pos7'";};
  class LHD_pos7 : LHD_pos1 {x = 0.04;y = 0.05;text = "7";action = "lhdpos =  'pos8'";};
  class LHD_pos8 : LHD_pos1 {x = 0.02;y = 0.26;text = "8";action = "lhdpos =  'pos9'";};
  class LHD_pos9 : LHD_pos3 {x = 0.14;y = 0.12;text = "9";action = "lhdpos =  'pos10'";};
  class LHD_pos10 : LHD_pos9 {y = 0.18;text = "10";action = "lhdpos =  'pos11'";};
  //Covoy
  class convoyPlace : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};w = 0.15;h = 0.04;size = 0.025;sizeEx = 0.025;x = 0.75;y = 0.35;text = "Place Convoy";onButtonClick = "nul=[3] execVM 'mcc\general_scripts\convoy\make_convoy_WP.sqf'";};
  class convoyStart : convoyPlace {x = 0.9;text = "Start Convoy";onButtonClick = "nul=[3] execVM 'mcc\general_scripts\convoy\start_convoy.sqf';";};
  class convoyResetWaypoints : convoyPlace {x = 0.9;y = 0.4;text = "Reset Waypoints";onButtonClick = "nul=[3] execVM 'mcc\general_scripts\convoy\reset_convoy_WP.sqf';";};
  //Support
  class hostageSpawn : RscGUIShortcutButton {idc = -1;colorDisabled[] = {1, 0.4, 0.3, 0.8};x = 0.25; y = 0.47;w = 0.07;h = 0.04;size = 0.025;sizeEx = 0.028;text = "Spawn";onButtonClick = "nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf'";};
  class uavSpawn : hostageSpawn {y = 0.47+0.03;text = "Spawn";onButtonClick = "nul=[3] execVM 'mcc\general_scripts\uav\uav_request.sqf';";};
  class airDropCarSpawn : hostageSpawn {x = 0.01;y = 0.6+0.03;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[0] execVM 'mcc\general_scripts\cas\cas_request.sqf';} else {player globalchat 'Access Denied'};";};
  class airDropTankSpawn : airDropCarSpawn {x = 0.08;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[1] execVM 'mcc\general_scripts\cas\cas_request.sqf';} else {player globalchat 'Access Denied'};";};
  class airDropAmmoSpawn : airDropCarSpawn {x = 0.15;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[2] execVM 'mcc\general_scripts\cas\cas_request.sqf';} else {player globalchat 'Access Denied'};";};
  class airDropAAmmoSpawn : airDropCarSpawn {x = 0.24;text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[3] execVM 'mcc\general_scripts\cas\cas_request.sqf';} else {player globalchat 'Access Denied'};";};
  class CASSpawn : airDropCarSpawn {x = 0.28; y = 0.69; text = "Spawn";onButtonClick = "if (mcc_missionmaker == (name player)) then {nul=[4] execVM 'mcc\general_scripts\cas\cas_request.sqf';} else {player globalchat 'Access Denied'};";};
  class artySpawn : hostageSpawn {x = 0.28;y = 0.79;text = "Spawn";onButtonClick = "nul= execVM 'mcc\general_scripts\artillery\artillery_request.sqf';";};
  };
