#define ExtrasDialog_IDD 2998
#define AIRDROP_AMMOUNT 5507
#define AIRDROP_CAR 5508
#define AIRDROP_TANK 5509 
#define AIRDROP_AMMO 5510 
#define AIRDROP_AAMMO 5511 
#define CAS_PLANE 5512 
#define CAS_TYPE 5513 
#define CAS_AMMOUNT 5514
#define CAS_APPROACH 5515 

disableSerialization;
private ["_type","_dlg"];
_type = _this select 0;
_dlg = findDisplay ExtrasDialog_IDD;
airAmmount =  airDropAmmount select (lbCurSel CAS_AMMOUNT); 
CASApproach =  CASApproach_array select (lbCurSel CAS_APPROACH) select 1;
CASApproach_index =  lbCurSel CAS_APPROACH;

switch (_type) do
	{
	   case 0:	//AirDrop Car
	   { spawnkind = (U_GEN_CAR select (lbCurSel AIRDROP_CAR)) select 1;
		 planeType = "C130J";};
		
	   case 1:	//AirDrop Tank
	    { spawnkind = (U_GEN_TANK select (lbCurSel AIRDROP_TANK)) select 1;
		  planeType = "C130J";};
		
		case 2:	//AirDrop Ammo
	   { spawnkind = (U_AMMO select (lbCurSel AIRDROP_AMMO)) select 1;
	     planeType = "C130J";};
		
		case 3:	//AirDrop Ace Ammo
	   { spawnkind = (U_ACE_AMMO select (lbCurSel AIRDROP_AAMMO)) select 1;
		 planeType = "C130J";};
	
	    case 4:	//CAS 
	   { spawnkind = CASBombs select (lbCurSel CAS_TYPE);
		 planeType = CASPlanes select (lbCurSel CAS_PLANE);};
	 };
	 
hint "Left click on the map to set an Air Drop";
		onMapSingleClick " 	hint 'Air support incomming.'; 
							['airDrop', [airAmmount, spawnkind, _pos, planeType, CASApproach]] call CBA_fnc_globalEvent;
							onMapSingleClick """";";
