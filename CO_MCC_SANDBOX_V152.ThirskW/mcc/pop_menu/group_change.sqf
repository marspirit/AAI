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
					_groupArray = GEN_DOC1;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",_x select 3];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 8:	//Ammo
				{
					_groupArray = U_AMMO;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;	
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;

				};
				
				case 9:	//ACE Ammo
				{
					_groupArray = U_ACE_AMMO;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 10:	//Fortifications
				{
					_groupArray = U_FORT;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;	
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 11:	//Dead Bodies
				{
					_groupArray = U_DEAD_BODIES;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 12:	//Furniture
				{
					_groupArray = U_FURNITURE;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 13:	//Military
				{
					_groupArray = U_MILITARY;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 14:	//Misc
				{
					_groupArray = U_MISC;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 15:	//Sighns
				{
					_groupArray = U_SIGHNS;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
				
				case 16:	//Warefare
				{
					_groupArray = U_WARFARE;
					_comboBox = _mccdialog displayCtrl UNIT_CLASS;		
					lbClear _comboBox;
						{
							_displayname = format ["%1",(_x select 3) select 0];
							_comboBox lbAdd _displayname;
						} foreach _groupArray;
					_comboBox lbSetCurSel 0;
				};
			};
		};
	};
	
					