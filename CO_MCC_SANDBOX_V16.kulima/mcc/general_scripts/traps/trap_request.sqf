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
#define IED_NUMBER 4511
#define IED_TARGET 4512

//Made by Shay_Gman (c) 09.10

disableSerialization;
private ["_spawnType","_IEDtype","_trapsArray","_mccdialog"];
_mccdialog = findDisplay ExtrasDialog_IDD;

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
		{
		_spawnType = _this select 0; 	//Zone or single
		_IEDtype = lbCurSel IED_TYPE;	//Type of IED to spawn
		switch (lbCurSel IED_EXPLOSION) do {case 0:{trapvolume = ["small"];};	case 1:{trapvolume = ["medium"];}; case 2:{trapvolume = ["large"];}; case 3:{trapvolume = ["at"];};};	//Size of the explosion
		IEDExplosionType = lbCurSel IED_EXPTYPE;	//Type of the explosion
		IEDDisarmTime = lbCurSel IED_DISARM;	//Time to disarm the IED
		IEDJammable = lbCurSel IED_JAM;	//Can jam the IED with CREW device
		IEDTriggerType = lbCurSel IED_TRIGGER;	//The type of trigger for the IED
		trapdistance = ied_proxArray select (lbCurSel IED_PROX);	//The minimum distance to activate the IED
		trapsnumber = ied_number select (lbCurSel IED_NUMBER); //The amount of traps to spawn in a zone
		iedside = ied_targetArray select (lbCurSel IED_TARGET);	//The target faction
		IEDCount = IEDCount +1;
	
		switch (_IEDtype) do		//Which trap do we want
		{
			case 0:	
			{
				_trapsArray = ied_small;
			};
			
			case 1:	
			{
				_trapsArray = ied_medium;
			};
			
			case 2:	
			{
				_trapsArray = ied_large;
			};
			
			case 3:	
			{
				_trapsArray = ied_wrecks;
			};
			
			case 4:	
			{
				_trapsArray = ied_rc;
			};
			
			case 5:	
			{
				_trapsArray = ied_mine; 
			};
			
			case 6:	
			{
				_trapsArray = U_AMMO;
			};
			
			case 7:	
			{
				_trapsArray = U_GEN_CAR;
			};
			
			case 8:	
			{
				_trapsArray = U_GEN_SOLDIER;
			};
			
			case 9:	
			{
				_trapsArray = U_GEN_SOLDIER;
			};
		};
		
		if (_spawnType==0) then
			{
				if ((_IEDtype <= 3) || (_IEDtype == 6) || (_IEDtype == 7)) then	//if object
				{
					IedName = [format ["ied_%1", IEDCount]];
					trapkind = [(_trapsArray select (lbCurSel IED_OBJECT)) select 1];
					hint "click on the map to place the trap"; 
					if (mcc_capture_state) then
						{
							onMapSingleClick " 	hint ""trap captured.""; 
									mcc_capture_var=mcc_capture_var + FORMAT ['
									[""trap_single"", [%1 , %2 select 0, %3 select 0, %4, %5 , %6, %7, %8, %9, %10 select 0]] call CBA_fnc_globalEvent;
									_eib_marker = createMarkerlocal [%10 select 0 ,%1];
									_eib_marker setMarkerTypelocal ""selector_selectedMission"";
									_eib_marker setMarkerColorlocal ""ColorRed"";
									_eib_marker setMarkerTextlocal (%10 select 0);
									'								 
									, _pos
									, trapkind
									, trapvolume
									, IEDExplosionType
									, IEDDisarmTime
									, IEDJammable
									, IEDTriggerType 
									, trapdistance
									, iedside
									, IedName
									];
									onMapSingleClick """";";
						} else 
						{
							onMapSingleClick " 	hint ""trap placed.""; 
									_eib_marker = createMarkerlocal [IedName select 0 ,_pos];
									_eib_marker setMarkerTypelocal 'selector_selectedMission';
									_eib_marker setMarkerColorlocal 'ColorRed';
									_eib_marker setMarkerTextlocal (IedName select 0);
									mcc_safe=mcc_safe + FORMAT ['
									[""trap_single"", [%1 , %2 select 0, %3 select 0, %4, %5 , %6, %7, %8, %9, %10 select 0]] call CBA_fnc_globalEvent;
									sleep 1;
									_eib_marker = createMarkerlocal [%10 select 0 ,%1];
									_eib_marker setMarkerTypelocal ""selector_selectedMission"";
									_eib_marker setMarkerColorlocal ""ColorRed"";
									_eib_marker setMarkerTextlocal (%10 select 0);
									'								 
									, _pos
									, trapkind
									, trapvolume
									, IEDExplosionType
									, IEDDisarmTime
									, IEDJammable
									, IEDTriggerType 
									, trapdistance
									, iedside
									, IedName 
									];
									[""trap_single"", [_pos , trapkind select 0, trapvolume select 0, IEDExplosionType, IEDDisarmTime , IEDJammable, IEDTriggerType, trapdistance, iedside, IedName select 0]] call CBA_fnc_globalEvent;
									onMapSingleClick """";";
						};
				};
				
				if (_IEDtype == 5) then	//if Mine
				{
					trapkind = [(_trapsArray select (lbCurSel IED_OBJECT)) select 1];
					if (trapkind select 0=="apv" || trapkind select 0=="ap" ||trapkind select 0=="atv" ||trapkind select 0=="at") then		//If mine field
						{
						IedName = [format ["mine_field_%1", IEDCount]];
						hint format ["Mine Field generated at zone %1",mcc_zone_number]; 
						if (mcc_capture_state) then
							{
							mcc_capture_var=mcc_capture_var + FORMAT ["
							['mine_single', [%1 , %2 select 0, %3 select 0,%4,%5]] call CBA_fnc_globalEvent;
							_eib_marker = createMarkerlocal [%3 select 0 ,mcc_zone_pos select %1];
							_eib_marker setMarkerSizeLocal [mcc_zone_size select (%1) select 0,mcc_zone_size select (%1) select 1];
							_eib_marker setMarkerShapeLocal 'RECTANGLE';
							_eib_marker setMarkerBrushLocal  'GRID';
							_eib_marker setMarkerColorlocal 'ColorBlue';
							"								 
							, mcc_zone_number
							, trapkind
							, IedName
							, mcc_zone_pos select (mcc_zone_number)
							, mcc_zone_size select (mcc_zone_number)
							];
							} else 
								{
								_eib_marker = createMarkerlocal [IedName select 0 ,mcc_zone_pos select mcc_zone_number];
								_eib_marker setMarkerSizeLocal [mcc_zone_size select (mcc_zone_number) select 0,mcc_zone_size select (mcc_zone_number) select 1];
								_eib_marker setMarkerShapeLocal 'RECTANGLE';
								_eib_marker setMarkerBrushLocal  'GRID';
								_eib_marker setMarkerColorlocal 'ColorBlue';
								mcc_safe=mcc_safe + FORMAT ["
								['mine_single', [%1 , %2 select 0, %3 select 0, %4, %5]] call CBA_fnc_globalEvent;
								sleep 1;
								_eib_marker = createMarkerlocal [%3 select 0 ,mcc_zone_pos select %1];
								_eib_marker setMarkerSizeLocal [mcc_zone_size select (%1) select 0,mcc_zone_size select (%1) select 1];
								_eib_marker setMarkerShapeLocal 'RECTANGLE';
								_eib_marker setMarkerBrushLocal  'GRID';
								_eib_marker setMarkerColorlocal 'ColorBlue';
								"								 
								, mcc_zone_number
								, trapkind
								, IedName 
								, mcc_zone_pos select (mcc_zone_number)
								, mcc_zone_size select (mcc_zone_number)
								];
								["mine_single", [mcc_zone_number , trapkind select 0,IedName select 0,mcc_zone_pos select (mcc_zone_number) ,mcc_zone_size select (mcc_zone_number)]] call CBA_fnc_globalEvent;
							};
						} else 	//If single mine
							{
							IedName = [format ["mine_%1", IEDCount]];
							hint "click on the map to place the trap"; 
							if (mcc_capture_state) then
								{
									onMapSingleClick " 	hint ""trap captured.""; 
											mcc_capture_var=mcc_capture_var + FORMAT ['
											[""mine_single"", [%1 , %2 select 0, %3 select 0, %4, %5]] call CBA_fnc_globalEvent;
											_eib_marker = createMarkerlocal [%3 select 0 ,%1];
											_eib_marker setMarkerTypelocal ""selector_selectedMission"";
											_eib_marker setMarkerColorlocal ""ColorBlue"";
											_eib_marker setMarkerTextlocal (%3 select 0);
											'								 
											, _pos
											, trapkind
											, IedName
											, mcc_zone_pos
											, mcc_zone_size
											];
											onMapSingleClick """";";
								} else 
								{
									onMapSingleClick " 	hint ""trap placed.""; 
											_eib_marker = createMarkerlocal [IedName select 0 ,_pos];
											_eib_marker setMarkerTypelocal 'selector_selectedMission';
											_eib_marker setMarkerColorlocal 'ColorBlue';
											_eib_marker setMarkerTextlocal (IedName select 0);
											mcc_safe=mcc_safe + FORMAT ['
											[""mine_single"", [%1 , %2 select 0, %3 select 0, %4, %5]] call CBA_fnc_globalEvent;
											sleep 1;
											_eib_marker = createMarkerlocal [%3 select 0 ,%1];
											_eib_marker setMarkerTypelocal ""selector_selectedMission"";
											_eib_marker setMarkerColorlocal ""ColorBlue"";
											_eib_marker setMarkerTextlocal (%3 select 0);
											'								 
											, _pos
											, trapkind
											, IedName 
											, mcc_zone_pos
											, mcc_zone_size
											];
											[""mine_single"", [_pos , trapkind select 0,IedName select 0,mcc_zone_pos,mcc_zone_size]] call CBA_fnc_globalEvent;
											onMapSingleClick """";";
								};
							};
				};
				
				if (_IEDtype == 4) then	//if Road Charge
				{
					IedName = [format ["RC_%1", IEDCount]];
					trapkind = [(_trapsArray select (lbCurSel IED_OBJECT)) select 1];
					hint "click, hold and then drag the cursor to place the road charge pointing the desired direction"; 
					rcPlacing = true; 
				};
				
				if (_IEDtype == 8) then	//if Armed Civilian
				{
					IedName = [format ["Armed_Civilian_%1", IEDCount]];
					trapkind = [(_trapsArray select (lbCurSel IED_OBJECT)) select 1];
					hint "click on the map to place the trap"; 
					if (mcc_capture_state) then
						{
							onMapSingleClick " 	hint ""trap captured.""; 
									mcc_capture_var=mcc_capture_var + FORMAT ['
									[""AC_single"", [%1 , %2 select 0, %3 , %4 select 0]] call CBA_fnc_globalEvent;
									_eib_marker = createMarkerlocal [%4 select 0 ,%1];
									_eib_marker setMarkerTypelocal ""selector_selectedMission"";
									_eib_marker setMarkerColorlocal ""ColorBlue"";
									_eib_marker setMarkerTextlocal (%4 select 0);
									'								 
									, _pos
									, trapkind
									, iedside
									, IedName
									];
									onMapSingleClick """";";
						} else 
						{
							onMapSingleClick " 	hint ""trap placed.""; 
									_eib_marker = createMarkerlocal [IedName select 0 ,_pos];
									_eib_marker setMarkerTypelocal 'selector_selectedMission';
									_eib_marker setMarkerColorlocal 'ColorBlue';
									_eib_marker setMarkerTextlocal (IedName select 0);
									mcc_safe=mcc_safe + FORMAT ['
									[""AC_single"", [%1 , %2 select 0, %3 , %4 select 0]] call CBA_fnc_globalEvent;
									sleep 1;
									_eib_marker = createMarkerlocal [%4 select 0 ,%1];
									_eib_marker setMarkerTypelocal ""selector_selectedMission"";
									_eib_marker setMarkerColorlocal ""ColorBlue"";
									_eib_marker setMarkerTextlocal (%4 select 0);
									'								 
									, _pos
									, trapkind
									, iedside
									, IedName 
									];
									[""AC_single"", [_pos , trapkind select 0,iedside,IedName select 0]] call CBA_fnc_globalEvent;
									onMapSingleClick """";";
						};
				};
				
				if (_IEDtype == 9) then	//if Suicide bomber
				{
					IedName = [format ["Sucide_Bomber_%1", IEDCount]];
					trapkind = [(_trapsArray select (lbCurSel IED_OBJECT)) select 1];
					hint "click on the map to place the trap"; 
					if (mcc_capture_state) then
						{
							onMapSingleClick " 	hint ""trap captured.""; 
									mcc_capture_var=mcc_capture_var + FORMAT ['
									[""SB_single"", [%1 , %2 select 0, %3 select 0, %4, %5, %6 select 0]] call CBA_fnc_globalEvent;
									_eib_marker = createMarkerlocal [%6 select 0 ,%1];
									_eib_marker setMarkerTypelocal ""selector_selectedMission"";
									_eib_marker setMarkerColorlocal ""ColorRed"";
									_eib_marker setMarkerTextlocal (%6 select 0);
									'								 
									, _pos
									, trapkind
									, trapvolume
									, IEDExplosionType
									, iedside
									, IedName
									];
									onMapSingleClick """";";
						} else 
						{
							onMapSingleClick " 	hint ""trap placed.""; 
									_eib_marker = createMarkerlocal [IedName select 0 ,_pos];
									_eib_marker setMarkerTypelocal 'selector_selectedMission';
									_eib_marker setMarkerColorlocal 'ColorRed';
									_eib_marker setMarkerTextlocal (IedName select 0);
									mcc_safe=mcc_safe + FORMAT ['
									[""SB_single"", [%1 , %2 select 0, %3 select 0, %4, %5, %6 select 0]] call CBA_fnc_globalEvent;
									sleep 1;
									_eib_marker = createMarkerlocal [%6 select 0 ,%1];
									_eib_marker setMarkerTypelocal ""selector_selectedMission"";
									_eib_marker setMarkerColorlocal ""ColorRed"";
									_eib_marker setMarkerTextlocal (%6 select 0);
									'								 
									, _pos
									, trapkind
									, trapvolume
									, IEDExplosionType
									, iedside
									, IedName 
									];
									[""SB_single"", [_pos , trapkind select 0,trapvolume select 0, IEDExplosionType, iedside,IedName select 0]] call CBA_fnc_globalEvent;
									onMapSingleClick """";";
						};
				};
			};
		if (_spawnType==1) then	//Ambush placing
			{
			IedName = [format ["Ambush_Group_%1", IEDCount]];
			IEDAmbushspawnname = (GEN_INFANTRY select (lbCurSel IED_AMBUSH)) select 2;
			hint "click, hold and then drag the cursor to place the ambushe group pointing the desired direction"; 
			ambushPlacing = true;
			};
		if (_spawnType==2) then	//RTE AC
			{
			RTEVariable = "";
			RTEVariable =format ["this setvariable ['armed',true,true];removeallweapons this;_null = [this,%1,25,'M9','15Rnd_9x19_M9'] execVM 'mcc\general_scripts\traps\cw.sqf';removeallweapons this; this setbehaviour 'CARELESS'; this allowfleeing 0; this addaction ['Neutralize Suspect','mcc\general_scripts\traps\neutralize.sqf'];",iedside];
			copytoclipboard RTEVariable;
			hint "SAVED to Clipboard! Now you can paste this code to the init of the spawned unit in RTE (ctrl-V).";
			};
		};
				
	}	
	else { player globalchat "Access Denied"};
	
	



	


