unit_array_ready=false;
#define ExtrasDialog_IDD 2998

#define MCC_ZONE_NUMBERS 3000
#define MCC_ZONE_X 3001
#define MCC_ZONE_Y 3002

#define MCC_FACTION 3003

#define CAPTURE 3204

#define UNIT_CAR 3011
#define UNIT_TANK 3012
#define UNIT_HELI 3014
#define UNIT_AIR 3015
#define UNIT_SHIP 3016


#define SMALL_OBJECTS 4500
#define MEDIUM_OBJECTS 4501
#define LARGE_OBJECTS 4502
#define AMMOBOX_OBJECTS 4503
#define WRECKS_OBJECTS 4504
#define CARS_OBJECTS 4505
#define MINES_OBJECTS 4506
#define ROADSIDE_OBJECTS 4507
#define ARMED_OBJECTS 4508
#define SB_OBJECTS 4509

#define IED_PROX 4510
#define IED_NUMBER 4511
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
	
//Airdrop
_comboBox = _mccdialog displayCtrl AIRDROP_AMMOUNT;		//fill combobox AirDrop Ammount
	lbClear _comboBox;
	{
		_displayname = format ["%1",_x];
		_comboBox lbAdd _displayname;
	} foreach airDropAmmount;
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
		_displayname = format ["%1",_x select 0];
		_comboBox lbAdd _displayname;
	} foreach CASApproach_array;
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
_comboBox lbSetCurSel ied_targetIndex;

	
//--------------------------------------------------------TRAPS Objects---------------------------------------------------------

_comboBox = _mccdialog displayCtrl IED_PROX;		//fill combobox IED Prox
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach ied_prox;
_comboBox lbSetCurSel ied_proxIndex;

_comboBox = _mccdialog displayCtrl IED_NUMBER;		//fill combobox IED number
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach ied_number;
_comboBox lbSetCurSel ied_numberIndex;

_comboBox = _mccdialog displayCtrl IED_TARGET;		//fill combobox IED target
lbClear _comboBox;
{
	_displayname = format ["%1",_x];
	_index = _comboBox lbAdd _displayname;
} foreach ied_target;
_comboBox lbSetCurSel ied_targetIndex;

_comboBox = _mccdialog displayCtrl SMALL_OBJECTS;		//fill combobox IED Small objects
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 0)];
	_index = _comboBox lbAdd _displayname;
} foreach ied_small;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MEDIUM_OBJECTS;		//fill combobox IED Medium objects
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 0)];
	_index = _comboBox lbAdd _displayname;
} foreach ied_medium;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl LARGE_OBJECTS;		//fill combobox IED Large objects
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 0)];
	_index = _comboBox lbAdd _displayname;
} foreach ied_large;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl WRECKS_OBJECTS;		//fill combobox IED Wrecks
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 0)];
	_index = _comboBox lbAdd _displayname;
} foreach ied_wrecks;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl MINES_OBJECTS;		//fill combobox IED Mines
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 0)];
	_index = _comboBox lbAdd _displayname;
} foreach ied_mine;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl ROADSIDE_OBJECTS;		//fill combobox IED Roadside Charges
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 0)];
	_index = _comboBox lbAdd _displayname;
} foreach ied_rc;
_comboBox lbSetCurSel 0;
	
if (faction_choice) then {waituntil {(unit_array_ready)}}; //wait for arrays to build up if faction choice
faction_choice=false; 

_comboBox = _mccdialog displayCtrl AMMOBOX_OBJECTS;		//fill combobox IED Ammoboxes
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3)select 0];
	_index = _comboBox lbAdd _displayname;
} foreach U_AMMO;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl CARS_OBJECTS;		//fill combobox IED Cars
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_comboBox lbSetCurSel 0;	

_comboBox = _mccdialog displayCtrl ARMED_OBJECTS;		//fill combobox IED Armed Civilians
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
} foreach U_GEN_SOLDIER;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl SB_OBJECTS;		//fill combobox IED Suicide Bombers
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
} foreach U_GEN_SOLDIER;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl SUPPORT_HOSTAGES;		//fill combobox SUPPORT Hostages
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
} foreach U_GEN_SOLDIER;
_comboBox lbSetCurSel 0;
//-----------------------------------------------------------------------LHD Spawn-------------------------------------------------------------------
_comboBox = _mccdialog displayCtrl UNIT_AIR;		//fill combobox CFG unit's AIR
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_AIRPLANE;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_CAR;		//fill combobox CFG unit's Car
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_TANK;		//fill combobox CFG unit's TANK
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_TANK;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_HELI;		//fill combobox CFG unit's HELI
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_HELICOPTER;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl UNIT_SHIP;		//fill combobox CFG unit's SHIP
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_SHIP;
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
_comboBox = _mccdialog displayCtrl AIRDROP_CAR;		//fill combobox CFG unit's Car
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_CAR;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl AIRDROP_TANK;		//fill combobox CFG unit's TANK
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_index = _comboBox lbAdd _displayname;
	_comboBox lbsetpicture [_index, (_x select 3) select 1];
} foreach U_GEN_TANK;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl AIRDROP_AMMO;		//fill combobox CFG unit's AMMO
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_comboBox lbAdd _displayname;
} foreach U_AMMO;
_comboBox lbSetCurSel 0;

_comboBox = _mccdialog displayCtrl AIRDROP_AAMMO;		//fill combobox CFG unit's Ace AMMO
lbClear _comboBox;
{
	_displayname = format ["%1",(_x select 3) select 0];
	_comboBox lbAdd _displayname;
} foreach U_ACE_AMMO;
_comboBox lbSetCurSel 0;
