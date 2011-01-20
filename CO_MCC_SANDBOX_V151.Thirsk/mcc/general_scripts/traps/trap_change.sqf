//Made by Shay_Gman (c) 09.10
#define ExtrasDialog_IDD 2998

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

private ["_type", "_comboBox", "_mccdialog", "_trapsArray"];

disableSerialization;
_mccdialog = findDisplay ExtrasDialog_IDD;	

_type = lbCurSel IED_TYPE;

switch (_type) do		//Which trap do we want
		{
		   case 0:	
			{
				_trapsArray = ied_small;
				ctrlShow [IED_EXPLOSION,true];
				ctrlShow [IED_EXPTYPE,true];
				ctrlShow [IED_DISARM,true];
				ctrlShow [IED_JAM,true];
				ctrlShow [IED_TRIGGER,true];
				ctrlShow [IED_PROX,true];
				ctrlShow [IED_TARGET,true];
			};
			
			case 1:	
			{
				_trapsArray = ied_medium;
				ctrlShow [IED_EXPLOSION,true];
				ctrlShow [IED_EXPTYPE,true];
				ctrlShow [IED_DISARM,true];
				ctrlShow [IED_JAM,true];
				ctrlShow [IED_TRIGGER,true];
				ctrlShow [IED_PROX,true];
				ctrlShow [IED_TARGET,true];
			};
			
			case 2:	
			{
				_trapsArray = ied_large;
				ctrlShow [IED_EXPLOSION,true];
				ctrlShow [IED_EXPTYPE,true];
				ctrlShow [IED_DISARM,true];
				ctrlShow [IED_JAM,true];
				ctrlShow [IED_TRIGGER,true];
				ctrlShow [IED_PROX,true];
				ctrlShow [IED_TARGET,true];
			};
			
			case 3:	
			{
				_trapsArray = ied_wrecks;
				ctrlShow [IED_EXPLOSION,true];
				ctrlShow [IED_EXPTYPE,true];
				ctrlShow [IED_DISARM,true];
				ctrlShow [IED_JAM,true];
				ctrlShow [IED_TRIGGER,true];
				ctrlShow [IED_PROX,true];
				ctrlShow [IED_TARGET,true];
			};
			
			case 4:	
			{
				_trapsArray = ied_rc; 
				ctrlShow [IED_EXPLOSION,false];
				ctrlShow [IED_EXPTYPE,false];
				ctrlShow [IED_DISARM,false];
				ctrlShow [IED_JAM,false];
				ctrlShow [IED_TRIGGER,false];
				ctrlShow [IED_PROX,false];
				ctrlShow [IED_TARGET,false];
			};
			
			case 5:	
			{
				_trapsArray = ied_mine; 
				ctrlShow [IED_EXPLOSION,false];
				ctrlShow [IED_EXPTYPE,false];
				ctrlShow [IED_DISARM,false];
				ctrlShow [IED_JAM,false];
				ctrlShow [IED_TRIGGER,false];
				ctrlShow [IED_PROX,false];
				ctrlShow [IED_TARGET,false];
			};
			
			case 6:	
			{
				_trapsArray = U_AMMO;
				ctrlShow [IED_EXPLOSION,true];
				ctrlShow [IED_EXPTYPE,true];
				ctrlShow [IED_DISARM,true];
				ctrlShow [IED_JAM,true];
				ctrlShow [IED_TRIGGER,true];
				ctrlShow [IED_PROX,true];
				ctrlShow [IED_TARGET,true];
			};
			
			case 7:	
			{
				_trapsArray = U_GEN_CAR;
				ctrlShow [IED_EXPLOSION,true];
				ctrlShow [IED_EXPTYPE,true];
				ctrlShow [IED_DISARM,true];
				ctrlShow [IED_JAM,true];
				ctrlShow [IED_TRIGGER,true];
				ctrlShow [IED_PROX,true];
				ctrlShow [IED_TARGET,true];
			};
			
			case 8:	
			{
				_trapsArray = U_GEN_SOLDIER;
				ctrlShow [IED_EXPLOSION,false];
				ctrlShow [IED_EXPTYPE,false];
				ctrlShow [IED_DISARM,false];
				ctrlShow [IED_JAM,false];
				ctrlShow [IED_TRIGGER,false];
				ctrlShow [IED_PROX,false];
				ctrlShow [IED_TARGET,true];
			};
			
			case 9:	
			{
				_trapsArray = U_GEN_SOLDIER;
				ctrlShow [IED_EXPLOSION,true];
				ctrlShow [IED_EXPTYPE,true];
				ctrlShow [IED_DISARM,false];
				ctrlShow [IED_JAM,false];
				ctrlShow [IED_TRIGGER,false];
				ctrlShow [IED_PROX,false];
				ctrlShow [IED_TARGET,true];
			};
		};
		
_comboBox = _mccdialog displayCtrl IED_OBJECT;
lbClear _comboBox;		

if (_type<6) then	//if object
	{
		{
			_displayname = format ["%1",(_x select 0)];
			_index = _comboBox lbAdd _displayname;
		} foreach _trapsArray;
	} else	//If unit or vehicle
	{
		{
			_displayname = format ["%1",(_x select 3)select 0];	
			_index = _comboBox lbAdd _displayname;
			if (_type!=6) then {_comboBox lbsetpicture [_index, (_x select 3) select 1];};	//No pic for ammoboxes
		} foreach _trapsArray;
	};
	
_comboBox lbSetCurSel 0;
	