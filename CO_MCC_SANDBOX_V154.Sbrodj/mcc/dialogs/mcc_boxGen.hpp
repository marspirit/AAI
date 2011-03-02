// By: Shay_gman
// Version: 1.1 (February 2011)
#define MCC_SANDBOX_IDD 2999
#define ExtrasDialog_IDD 2998
#define ExtrasDialog2_IDD 2997
#define ExtrasDialog3_IDD 2996
#define boxGen_IDD 2995

#define ALLGEAR_IDD 8500
#define BOXGEAR_IDD 8501
#define GEARCLASS_IDD 8502

//-----------------------------------------------------------------------------
// Main dialog
//-----------------------------------------------------------------------------
class boxGen {
  idd = boxGen_IDD;
  movingEnable = true;
  onLoad = "[] execVM 'mcc\dialogs\mcc_boxGen_init.sqf'"; 
  
  controlsBackground[] = 
  {
	MCC_Bckgrnd,
	allGearBackground,
	boxGearBackground
  };
  

  //---------------------------------------------
  objects[] = 
  { 
  };
  
  controls[] = 
  {
  allGearList,
  boxGearList,
  boxGeneratorTittle,
  gearClassTitle,
  gearClasCombo,
  addAllButton,
  addOneButton,
  removeOneButtton,
  generateBoxButton,
  boxGeneratorFrame,
  closeGeneratorButton
  };
  
 //========================================= Background========================================
	class MCC_Bckgrnd : RscPicture {idc = -1; moving = true;x = 0.03125;y = 0.025;w = 0.75;h = 0.625; text = "\ca\ui\data\ui_background_armory_co.paa";};
	class allGearBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.046875;y = 0.175;w = 0.3;h = 0.375;text = "";};
	class boxGearBackground : RscText {idc = -1;moving = true;colorBackground[] = { 0, 0, 0, 0.6 };colorText[] = { 1, 1, 1, 0 };x = 0.45;y = 0.175;w = 0.3;h = 0.375;text = "";};
	class boxGeneratorFrame: RscFrame{idc = -1;x = 0.03125;y = 0.025;w = 0.75;h = 0.625;};
 //========================================= Controls========================================
  	class allGearList: RscListbox {idc = ALLGEAR_IDD;x = 0.046875;y = 0.175;w = 0.3;h = 0.375;sizeEx =0.04;};
	class boxGearList: RscListbox {idc = BOXGEAR_IDD;x = 0.45;y = 0.175;w = 0.3;h = 0.375;sizeEx =0.04;};
	class gearClasCombo: RscComboBox{idc = GEARCLASS_IDD;x = 0.12;y = 0.1;style = ST_LEFT;colorText[] = { 1, 1, 1, 1 };colorSelect[] = { 1.0, 0.35, 0.3, 1 };	colorBackground[] = { 0, 0, 0, 0.6 };
									colorSelectBackground[] = { 0, 0, 0, 1 };font = "BitStream";sizeEx =0.028;w = 0.2; h = 0.032;onLBSelChanged = "gearDialogClassIndex = _this select 1;[0] execVM 'mcc\dialogs\mcc_boxGen_change.sqf'";};
	//Tittles
	class boxGeneratorTittle: RscText {idc = -1;text = "Box Generator:";x = 0.046875;y = 0.05;w = 0.165476;h = 0.0412699;colorText[] = {0,1,1,1};colorBackground[] = {1,1,1,0};};
	class gearClassTitle:RscText{idc = -1;text = "Class:";x = 0.046875;y = 0.1;w = 0.0791664;h = 0.0412699;colorText[] = {1,1,1,1};colorBackground[] = {1,1,1,0};};
	//Buttons
	class addAllButton: RscButton{idc = -1;text = ">>";x = 0.37;y = 0.225;w = 0.0625;h = 0.05;action = "[1] execVM 'mcc\dialogs\mcc_boxGen_change.sqf'";};  
	class addOneButton: RscButton{idc = -1;text = ">";x = 0.37;y = 0.3;w = 0.0625;h = 0.05;action = "[2] execVM 'mcc\dialogs\mcc_boxGen_change.sqf'";};  
	class removeOneButtton: RscButton{idc = -1;text = "Clear";x = 0.37;y = 0.375;w = 0.0625;h = 0.05;action = "[3] execVM 'mcc\dialogs\mcc_boxGen_change.sqf'";};  
	class generateBoxButton: RscButton{idc = -1;text = "Generate";x = 0.6;y = 0.575;w = 0.125;h = 0.05;action = "[4] execVM 'mcc\dialogs\mcc_boxGen_change.sqf'";}; 
	class closeGeneratorButton: RscButton{idc = -1;text = "Close";x = 0.45;y = 0.575;w = 0.125;h = 0.05;action = "closeDialog 0;deleteVehicle tempBox";};
 };
