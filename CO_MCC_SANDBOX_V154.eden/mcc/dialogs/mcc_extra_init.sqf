unit_array_ready=false;
#define ExtrasDialog_IDD 2998

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003

#define CAPTURE 3204

#define LHD_CLASS 3011
#define LHD_TYPE 3012

#define IED_TYPE 4500
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

#define AIRDROP_CLASS 5508
#define AIRDROP_ITEMS 5510 

#define CAS_PLANE 5512 
#define CAS_TYPE 5513 
#define CAS_AMMOUNT 5514
#define CAS_APPROACH 5515 

private ["_mccdialog","_comboBox","_displayname","_x"];
disableSerialization;
_mccdialog = findDisplay ExtrasDialog_IDD;
if (!mcc_capture_state) then { ctrlEnable [CAPTURE,false];};

//-----------------------------------------------------Zones & Factions--------------------------------------------
_comboBox = _mccdialog displayCtrl MCC_ZONE_NUMBERS; //fill combobox zone's numbers
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_numbers;
	_comboBox lbSetCurSel zone_index;

_comboBox = _mccdialog displayCtrl MCC_ZONE_X;		//fill combobox X length
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_x;
	_comboBox lbSetCurSel zoneX_index;

_comboBox = _mccdialog displayCtrl MCC_ZONE_Y;		//fill comboboxYlength
	lbClear _comboBox;
	{
		_displayname = _x select 0;
		_comboBox lbAdd _displayname;
	} foreach zones_y;
	_comboBox lbSetCurSel zoneY_index;
	
_comboBox = _mccdialog displayCtrl MCC_FACTION;		//fill combobox CFG factions
	lbClear _comboBox;
	{
		_displayname = format ["%1(%2)",_x select 0,_x select 1];
		_comboBox lbAdd _displayname;
	} foreach U_FACTIONS;
	_comboBox lbSetCurSel faction_index;
//--------------------------------------------------Support-------------------------------------------------------------
	
_comboBox = _mccdialog displayCtrl SUPPORT_UAV;		//fill combobox CFG UAV Site
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach uavSiteArray;
	_comboBox lbSetCurSel 0;

//CAS
_comboBox = _mccdialog displayCtrl CAS_PLANE;		//fill combobox CAS Plane Type
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x];
		_comboBox lbAdd _displayname;
	} foreach CASPlanes;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl CAS_TYPE;		//fill combobox CAS Bomb Type
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x];
		_comboBox lbAdd _displayname;
	} foreach CASBombs;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl CAS_AMMOUNT;		//fill combobox CAS Ammount
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x];
		_comboBox lbAdd _displayname;
	} foreach airDropAmmount;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl CAS_APPROACH;		//fill combobox CAS Approach
	lbClear _comboBox;
	{
		_displayname = _x;
		_comboBox lbAdd _displayname;
	} foreach ["North", "NE", "East", "SE", "South", "SW", "West", "NW"];
	_comboBox lbSetCurSel CASApproach_index;

//Artillery
_comboBox = _mccdialog displayCtrl SUPPORT_ARTY_TYPE;		//fill combobox CFG Artillery Type
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach artilleryTypeArray;
	_comboBox lbSetCurSel 0;
	
_comboBox = _mccdialog displayCtrl SUPPORT_ARTY_SPREAD;		//fill combobox CFG Artillery Spread
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach artillerySpreadArray;
	_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl SUPPORT_ARTY_NUMBER;		//fill combobox CFG Artillery Number
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x];
		_comboBox lbAdd _displayname;
	} foreach artilleryNumberArray;
	_comboBox lbSetCurSel 0;
//--------------------------------------------------------TRAPS Settings---------------------------------------------------------

_comboBox = _mccdialog displayCtrl IED_PROX;		//fill combobox IED Prox
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach ied_prox;
_comboBox lbSetCurSel ied_proxIndex;

_comboBox = _mccdialog displayCtrl IED_NUMBER;		//fill combobox IED Numbers
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach ied_number;
_comboBox lbSetCurSel ied_numberIndex;

_comboBox = _mccdialog displayCtrl IED_TARGET;		//fill combobox IED Target
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach ied_target;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_PROX;		//fill combobox IED Prox
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach ied_prox;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_TYPE;		//fill combobox IED Type
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Small objects", "Medium objects", "Hidden IEDs", "Wrecks", "Roadside Charges", "Mines", "Ammoboxes", "Cars", "Armed Civilians","Suicide bombers"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_EXPLOSION;		//fill combobox IED Explosion size
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Small", "Medium", "Large"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_EXPTYPE;		//fill combobox IED Explosion type
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Deadly", "Disabling", "Fake"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_DISARM;		//fill combobox IED Disarm time
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["10 Sec", "20 Sec", "30 Sec", "40 Sec", "50 Sec", "1 Min", "2 Min", "3 Min", "4 Min", "5 Min"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_JAM;		//fill combobox IED Jameable
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["True", "False"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_TRIGGER;		//fill combobox IED Trigger Type
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Proximity", "Mission maker only"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl IED_AMBUSH;		//fill combobox IED Ambush group
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 3];
	_index = _comboBox lbAdd _displayname;
} foreach GEN_INFANTRY;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl SUPPORT_HOSTAGES;		//fill combobox SUPPORT Hostages
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
} foreach U_GEN_SOLDIER;
_comboBox lbSetCurSel 0;
//-----------------------------------------------------------------------LHD Spawn-------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl LHD_CLASS;		//LHD_CLASS
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Vhicles", "Tracked/Static", "Motorcycles", "Helicopters", "Fixed-Wings", "Boats"];
_comboBox lbSetCurSel 0;

//------------------------------------------Convoy Generator--------------------------------------------------------
_comboBox = _mccdialog displayCtrl CONVOY_CAR1;		//fill combobox Car1
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_index = _comboBox lbAdd "None";
_comboBox lbSetCurSel convoyCar1Index;

_comboBox = _mccdialog displayCtrl CONVOY_CAR2;		//fill combobox Car2
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_index = _comboBox lbAdd "None";
_comboBox lbSetCurSel convoyCar2Index;

_comboBox = _mccdialog displayCtrl CONVOY_CAR3;		//fill combobox Car3
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_index = _comboBox lbAdd "None";
_comboBox lbSetCurSel convoyCar3Index;

_comboBox = _mccdialog displayCtrl CONVOY_CAR4;		//fill combobox Car4
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_index = _comboBox lbAdd "None";
_comboBox lbSetCurSel convoyCar4Index;

_comboBox = _mccdialog displayCtrl CONVOY_CAR5;		//fill combobox Car5
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_index = _comboBox lbAdd "None";
_comboBox lbSetCurSel convoyCar5Index;

_comboBox = _mccdialog displayCtrl CONVOY_HVT;		//fill combobox HVT
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_index = _comboBox lbAdd _displayname;
} foreach convoyHVT;
_comboBox lbSetCurSel convoyHVTIndex;

_comboBox = _mccdialog displayCtrl CONVOY_CARHVT;		//fill combobox HVT car
lbClear _comboBox;
{
	_displayname = format ["%1",_x select 0];
	_index = _comboBox lbAdd _displayname;
} foreach convoyHVTcar;
_comboBox lbSetCurSel convoyHVTCarIndex;

//------------------------------------------AirDrop-----------------------------------------------------------------
_comboBox = _mccdialog displayCtrl AIRDROP_CLASS;		
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach ["Vehicles", "Tracked/Static", "Motorcycle", "Ammo", "ACE Ammo"];
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl AIRDROP_ITEMS;		//added objects
lbClear _comboBox;
{
	_displayname = _x;
	_index = _comboBox lbAdd _displayname;
} foreach airDropArray;
_comboBox lbSetCurSel 0;

