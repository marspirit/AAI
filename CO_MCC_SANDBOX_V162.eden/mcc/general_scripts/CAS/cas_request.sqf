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
MapClick = false;

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

hint "Left click on the map to call an Air Support";
if (planeType select 0== "AC-130") then 
	{
	LDL_AI_ceaseFire = false;
	if (mcc_capture_state) then
				{
					onMapSingleClick " 	hint 'hint AC-130 captured'; 
										mcc_capture_var=mcc_capture_var + FORMAT ['
										[%1,LDL_AC130_Adjustments select 0,LDL_AC130_Adjustments select 1,LDL_Adjustments select 6, LDL_AC130_Adjustments select 12] call LDL_ac130_rot_setup;'								 
										,airAmmount
										,spawnkind
										,_pos
										,planeType
										,CASApproach];
										onMapSingleClick """";";
				} else 	
				{
					onMapSingleClick " 	hint 'hint AC-130 inbound'; 
											Mpos = _pos;
											MapClick = true; 
											onMapSingleClick """";";
					while {!MapClick} do {sleep 0.5}; 
					[Mpos,LDL_AC130_Adjustments select 0,LDL_AC130_Adjustments select 1,LDL_Adjustments select 9, LDL_AC130_Adjustments select 12]call LDL_ac130_AI_setup;
					[Mpos,LDL_AC130_Adjustments select 0,LDL_AC130_Adjustments select 1,LDL_Adjustments select 6, LDL_AC130_Adjustments select 12] call LDL_ac130_rot_setup;
				};
	} else
		{
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
		};