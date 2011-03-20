// Made By: Shay_gman
// Version: 1.1 (February 2011)

//-----------------------------------------------------------------------------
// IDD's & IDC's
//-----------------------------------------------------------------------------

#define MCC3D_IDD 100
#define MCC_FACTION 3003

#define UNIT_TYPE 3010
#define UNIT_CLASS 3011
#define SETTING_EMPTY 3020
#define INITBOX 88555

//-----------------------------------------------------------------------------
// Main dialog
//-----------------------------------------------------------------------------
class MCC3D_Dialog 
{
  idd = MCC3D_IDD;
  movingEnable = true;
  onLoad = "[] execVM 'mcc\dialogs\mcc_3d_init.sqf'";
  
  controlsBackground[] = 
  {
	MCC_Bckgrnd,		//mcc background
	initBackground
  };
  

  //---------------------------------------------
  objects[] = 
  { 
  };
  
  controls[] = 
  {
  faction,
  factionTittle,
  mcc3DTitle,
  factionUpdate,
  unit_type,
  unit_Class,
  UnitTitle,
  UnitTypeTitle,
  setting_Empty,
  EmptyTitle,
  change,
  Close_dialog,
  initTitle,
  initBox
  };
 //========================================= Background========================================
class MCC_Bckgrnd : RscPicture {idc = -1; moving = true; x = 0.0; y = 0.0; w = 0.5; h = 0.6; text = "\ca\ui\data\ui_mainmenu_background_ca.paa";};
class initBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.046; y = 0.29;w = 0.2; h = 0.08;sizeEx = 0.028;text = "";};
 //========================================= Controls========================================
 
//-------------------------------------------ComboBox-------------------------------------------
class faction : RscComboBox {idc=MCC_FACTION; style=ST_LEFT; colorText[]={1,1,1,1};colorSelect[]={1.0,0.35,0.3,1};colorBackground[]={0,0,0,0.6};
							colorSelectBackground[]={0,0,0,1}; font="BitStream"; sizeEx=0.028;x=0.08; y = 0.12; w = 0.08; h = 0.028;};
class unit_type : faction {idc=UNIT_TYPE; y=0.17; sizeEx=0.028; w=0.15; h=0.028; onLBSelChanged="[0] execVM 'mcc\pop_menu\group_change3d.sqf'";};
class unit_Class : faction {idc=UNIT_CLASS; y=0.21; sizeEx=0.028; w=0.15; h=0.028;};
class setting_Empty : faction {idc=SETTING_EMPTY; y=0.25;};
class initBox : RscText {idc = INITBOX;type = CT_EDIT;style = ST_MULTI;colorBackground[] = {0,0,0,0};colorText[] = {1,1,1,1};colorSelection[] = {1,1,1,1};colorBorder[] = { 1, 1, 1, 1 };
		BorderSize = 0.01;autocomplete = true;x = 0.046; y = 0.29;w = 0.2; h = 0.08;sizeEx = 0.028;text = "";};
//-------------------------------------------Titels-------------------------------------------
class factionTittle : RscText {idc = -1; style=ST_LEFT; colorBackground[]={1,1,1,0}; colorText[]={1,1,1,1}; x=0; y = 0.11; 
							w=0.22; h=0.05;	sizeEx=0.03; text = "Faction:";};
class mcc3DTitle : factionTittle {y=0.04; colorText[]={0,1,1,1}; w=0.22; h=0.08;	sizeEx=0.04; text="MCC 3D Editor:";};							
class UnitTitle : factionTittle {y=0.16; text="Type:";};
class UnitTypeTitle : UnitTitle {y=0.2; text="Class:";};
class EmptyTitle : UnitTitle {y=0.24; text="Empty:";};
class initTitle : UnitTitle {y=0.28; text="Init:";};
//-------------------------------------------Buttons-------------------------------------------
class factionUpdate : RscGUIShortcutButton {idc = -1; colorDisabled[]={1,0.4,0.3,0.8}; x=0.17; y=0.12; w=0.08; h=0.0422876; size=0.02821;
							sizeEx=0.02821; text="Update"; onButtonClick="mcc_screen=4;[] execVM 'mcc\pop_menu\faction.sqf'";};
class change : RscGUIShortcutButton {idc=-1; colorDisabled[]={1,0.4,0.3,0.8}; x=0.03; y=0.38; text="Apply"; onButtonClick="[1] execVM 'mcc\pop_menu\spawn_group3d.sqf'";};
class Close_dialog : RscGUIShortcutButton {idc=-1; colorDisabled[]={1,0.4,0.3,0.8}; x=0.03; y=0.44; text="Close"; onButtonClick="closeDialog 0";};

};
