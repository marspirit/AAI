//Made by Shay_Gman (c) 09.10
#define MCC_SANDBOX_IDD 2999

#define GROUP_TYPE 3005
#define GROUP_CLASS 3006

#define UNIT_TYPE 3010
#define UNIT_CLASS 3011

private ["_group", "_type", "_comboBox", "_mccdialog", "_groupArray","_displayname","_index"];
disableSerialization;

_group =_this select 0;
_mccdialog = findDisplay MCC_SANDBOX_IDD;	

if (_group==0) then 
	{
	_type = lbCurSel GROUP_TYPE;
	switch (_type) do		//Which unit do we want
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
	if (_type ==5) then 
		{
		_comboBox = _mccdialog displayCtrl GROUP_CLASS;		
		lbClear _comboBox;
			{
				_displayname =  _x;
				_comboBox lbAdd _displayname;
			} foreach ["Small (Helicopter)", "Large (C-130)"];
		_comboBox lbSetCurSel 0;
		} else
		{
		_comboBox = _mccdialog displayCtrl GROUP_CLASS;		
		lbClear _comboBox;
			{
				_displayname = format ["%1",_x select 3];
				_comboBox lbAdd _displayname;
			} foreach _groupArray;
		_comboBox lbSetCurSel 0;
		};
	};

if (_group==1) then 
	{
	_type = lbCurSel UNIT_TYPE;
	class_index = lbCurSel UNIT_TYPE;
	if (_type<=6) then 	//If not doc or object
		{
		switch (_type) do		//Which unit do we want
				{
				   case 0:	//Infantry
					{
						_groupArray = U_GEN_SOLDIER;
					};
					
					case 1:	//Car
					{
						_groupArray = U_GEN_CAR;
					};
					
					case 2:	//Tank
					{
						_groupArray = U_GEN_TANK;
					};
					
					case 3:	//Motorcycle
					{
						_groupArray = U_GEN_MOTORCYCLE;
					};
					
					case 4:	//Helicopter
					{
						_groupArray = U_GEN_HELICOPTER;
					};
					
					case 5:	//Aircraft
					{
						_groupArray = U_GEN_AIRPLANE;
					};
					
					case 6:	//Ship
					{
						_groupArray = U_GEN_SHIP;
					};
				};

		_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
			lbClear _comboBox;
				{
					_displayname = format ["%1",(_x select 3) select 0];
					_index = _comboBox lbAdd _displayname;
					_comboBox lbsetpicture [_index, (_x select 3) select 1];
				} foreach _groupArray;
			_comboBox lbSetCurSel 0;
		} else 
		{
		switch (_type) do		//Which unit do we want
			{
				case 7:	//DOC
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",_x select 3];
							_comboBox lbAdd _displayname;
						} foreach GEN_DOC1;
					_comboBox lbSetCurSel 0;
				};
				
				case 8:	//Ammo
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;	
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_AMMO;
					_comboBox lbSetCurSel 0;

				};
				
				case 9:	//ACE Ammo
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_ACE_AMMO;
					_comboBox lbSetCurSel 0;
				};
				
				case 10:	//Fortifications
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;	
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_FORT;
					_comboBox lbSetCurSel 0;
				};
				
				case 11:	//Dead Bodies
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_DEAD_BODIES;
					_comboBox lbSetCurSel 0;
				};
				
				case 12:	//Furniture
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_FURNITURE;
					_comboBox lbSetCurSel 0;
				};
				
				case 13:	//Military
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_MILITARY;
					_comboBox lbSetCurSel 0;
				};
				
				case 14:	//Misc
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_MISC;
					_comboBox lbSetCurSel 0;
				};
				
				case 15:	//Sighns
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_SIGHNS;
					_comboBox lbSetCurSel 0;
				};
				
				case 16:	//Warefare
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_WARFARE;
					_comboBox lbSetCurSel 0;
				};
				
				case 17:	//Wrecks
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach U_WRECKS;
					_comboBox lbSetCurSel 0;
				};
				
				case 18:	//Houses
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",_x select 1];
							_comboBox lbAdd _displayname;
						} foreach U_HOUSES;
					_comboBox lbSetCurSel 0;
				};
				
				case 19:	//Ruins
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",_x select 1];
							_comboBox lbAdd _displayname;
						} foreach U_RUINS;
					_comboBox lbSetCurSel 0;
				};
				
				case 20:	//Fire
				{
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = _x;
							_comboBox lbAdd _displayname;
						} foreach ["Small", "Medium", "Large"];
					_comboBox lbSetCurSel 0;
				};
			};
		};
	};
	
					