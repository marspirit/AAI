//Made by Shay_Gman (c) 09.10
#define ExtrasDialog_IDD 2998

#define LHD_CLASS 3011
#define LHD_TYPE 3012

private ["_type", "_comboBox", "_mccdialog", "_lhdArray"];

disableSerialization;
_mccdialog = findDisplay ExtrasDialog_IDD;	
_type = lbCurSel LHD_CLASS;

switch (_type) do		//Which trap do we want
		{
		   case 0:	
			{
				_lhdArray = U_GEN_CAR;
			};
			
			case 1:	
			{
				_lhdArray = U_GEN_TANK;
			};
			
			case 2:	
			{
				_lhdArray = U_GEN_MOTORCYCLE;
			};
			
			case 3:	
			{
				_lhdArray = U_GEN_HELICOPTER;
			};
			
			case 4:	
			{
				_lhdArray = U_GEN_AIRPLANE;
			};
			
			case 5:	
			{
				_lhdArray = U_GEN_SHIP;
			};
		};
		
_comboBox = _mccdialog displayCtrl LHD_TYPE;		
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach _lhdArray;
_comboBox lbSetCurSel 0;
	