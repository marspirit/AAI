private ["_mccdialog","_comboBox","_displayname","_pic", "_index", "_array", "_class"];
#define boxGen_IDD 2995

#define ALLGEAR_IDD 8500
#define BOXGEAR_IDD 8501
#define GEARCLASS_IDD 8502
deleteVehicle tempBox;
tempBox = "GuerillaCacheBox_EP1" createvehicle [0,0,200];
clearMagazineCargo tempBox;
clearWeaponCargo tempBox;

disableSerialization;
_mccdialog = findDisplay boxGen_IDD;
_comboBox = _mccdialog displayCtrl GEARCLASS_IDD; 
	lbClear _comboBox;
	{
		_displayname = _x;
		_comboBox lbAdd _displayname;
	} foreach ["Automatic Rifles", "Binoculars", "Items", "Launchers", "Machine Guns", "Pistols", "Rifles", "Sniper Rifles", "Rucks", "Magazines"];
_comboBox lbSetCurSel gearDialogClassIndex;
switch (gearDialogClassIndex) do 
	{
	case 0: //AR
		{
		_array = W_AR;
		}; 
		
	case 1: //Binos
		{
		_array = W_BINOS;
		}; 
		
	case 2: //Items
		{
		_array = W_ITEMS;
		};
		
	case 3: //Launchers
		{
		_array = W_LAUNCHERS;
		};
	
	case 4: //MG
		{
		_array = W_MG;
		};
	
	case 5: //Pistols			
		{
		_array = W_PISTOLS;
		};
		
	case 6: //Rifles			
		{
		_array = W_RIFLES;
		};
		
	case 7: //Snipers			
		{
		_array = W_SNIPER;
		};
	
	case 8: //Rucks			
		{
		_array = W_RUCKS;
		};
	case 9: //Magazines			
		{
		_array = U_MAGAZINES;
		};
	};

_comboBox = _mccdialog displayCtrl ALLGEAR_IDD; 
	lbClear _comboBox;
	{
		_class = _x select 0;
		_displayname = _x select 1;
		_pic = _x select 2;
		_index = _comboBox lbAdd _displayname;
		_comboBox lbSetPicture [_index, _pic];
		_comboBox lbSetData [_index, _class];
	} foreach _array;
_comboBox lbSetCurSel 0;

