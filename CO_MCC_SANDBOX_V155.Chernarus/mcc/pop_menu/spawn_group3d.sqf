#define MCC3D_IDD 100
#define UNIT_TYPE 3010
#define UNIT_CLASS 3011
#define INITBOX 88555

#define SETTING_EMPTY 3020
private ["_type","_groupArray","_3d", "_dlg"];

_3d = _this select 0;

if (_3d == 0) then //Case we are opening the 3D
	{
	hint "click on map"; 
	onMapSingleClick "_nul=["""",_pos] call MCC_3D_PLACER;closeDialog 0;onMapSingleClick """";";	
	MCC3DRuning = true;
	while {MCC3DRuning} do
		{
		MCC3DgotValue = false; 
		while {!MCC3DgotValue && MCC3DRuning} do {sleep 0.2};
		if (MCC3DRuning) then 
			{
			if (mcc_capture_state) then
				{
				 mcc_capture_var = mcc_capture_var + FORMAT ["['simpleSpawn', [%1, %2, '%3', '%4', '%5', %6, '%7']] call CBA_fnc_globalEvent;
									"
									,MCC3DValue select 0
									,MCC3DValue select 1
									,mcc_spawnname
									,mcc_spawntype
									,mcc_spawnfaction
									,mcc_spawnwithcrew
									,mcc_unitInit
									];
				}	else
					{
					 mcc_safe = mcc_safe + FORMAT ["['simpleSpawn', [%1, %2, '%3', '%4', '%5', %6, '%7']] call CBA_fnc_globalEvent;
									"
									,MCC3DValue select 0
									,MCC3DValue select 1
									,mcc_spawnname
									,mcc_spawntype
									,mcc_spawnfaction
									,mcc_spawnwithcrew
									,mcc_unitInit
									];
					["simpleSpawn", [MCC3DValue select 0, MCC3DValue select 1, mcc_spawnname, mcc_spawntype, mcc_spawnfaction, mcc_spawnwithcrew,mcc_unitInit]] call CBA_fnc_globalEvent;
					};
			};
		sleep 0.1;
		};
	mcc_isnewzone = false;	//reset stuff
	mcc_grouptype = "";
	mcc_spawntype = "";
	mcc_classtype = "";
	mcc_spawnname = "";
	mcc_spawnfaction ="";
	mcc_resetmissionmaker = false;
	mcc_unitInit ="";
	};
	
if (_3d == 1) then //Case we are changing the object
	{		
	_type = lbCurSel UNIT_TYPE;
	switch (_type) do	
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
	mcc_unitInit = ctrlText INITBOX;
	
	mcc_spawnwithcrew = (spawn_empty select (lbCurSel SETTING_EMPTY)) select 1;	//let's add the behavior/awerness
	empty_index = (lbCurSel SETTING_EMPTY);
	
	deletevehicle Object3D;
	Object3D = mcc_spawnname createvehicle [0,0,500];	
	Object3D enableSimulation false;
	};
		
	
	


 
		