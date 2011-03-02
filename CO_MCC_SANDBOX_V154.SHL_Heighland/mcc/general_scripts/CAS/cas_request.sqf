#define ExtrasDialog_IDD 2998

#define AIRDROP_CLASS 5508
#define AIRDROP_TYPE 5509 

#define CAS_PLANE 5512 
#define CAS_TYPE 5513 
#define CAS_AMMOUNT 5514
#define CAS_APPROACH 5515 

disableSerialization;
private ["_type","_dlg"];
_type = _this select 0;
_dlg = findDisplay ExtrasDialog_IDD;
airAmmount =  airDropAmmount select (lbCurSel AIRDROP_AMMOUNT); 
CASApproach = lbCurSel CAS_APPROACH;
CASApproach_index =  lbCurSel CAS_APPROACH;

switch (_type) do
	{
	   case 0:	//AirDrop Car
		{
			spawnkind = [airDropArray];
			planeType = ["C130J"];
		};
		
	    case 4:	//CAS 
		{
			airAmmount =  airDropAmmount select (lbCurSel CAS_AMMOUNT); 
			spawnkind = [CASBombs select (lbCurSel CAS_TYPE)];
			planeType = [CASPlanes select (lbCurSel CAS_PLANE)];};
		};
	 
hint "Left click on the map to set an Air Drop";
if (mcc_capture_state) then
		{
			onMapSingleClick " 	hint 'Air support captured.'; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""airDrop"", [%1, %2 , %3, %4, %5]] call CBA_fnc_globalEvent;'								 
								,airAmmount
								,spawnkind
								,_pos
								,planeType
								,CASApproach];
								onMapSingleClick """";";
		} else 	
		{
			onMapSingleClick " 	hint 'Air support incomming.'; 
									['airDrop', [airAmmount, spawnkind , _pos, planeType, CASApproach]] call CBA_fnc_globalEvent;
									onMapSingleClick """";";
		};