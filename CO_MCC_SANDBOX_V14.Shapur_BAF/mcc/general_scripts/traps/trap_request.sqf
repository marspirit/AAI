//Made by Shay_Gman (c) 09.10
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
private ["_type"];
if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{
		iedside = ied_target select (lbCurSel IED_TARGET);
		_type = _this select 0; 
		trapdistance = ied_prox select (lbCurSel IED_PROX);
		trapsnumber = ied_number select (lbCurSel IED_NUMBER);
		ied_proxIndex = lbCurSel IED_PROX;
		ied_numberIndex = lbCurSel IED_NUMBER;
		ied_targetIndex = lbCurSel IED_TARGET;
		
		switch (_type) do		//Which trap do we want
		{
		   case 0:	//small single
			{
				trapkind = [(ied_small select (lbCurSel SMALL_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
			
			case 1:	//small area
			{
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [0,0]]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [0,0]]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, [0,0]]] call CBA_fnc_globalEvent;
				};
			};
			
			case 2:	//medium single
			{
				trapkind = [(ied_medium select (lbCurSel MEDIUM_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 3:	//medium area
			{
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [1,0]]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [1,0]]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, [1,0]]] call CBA_fnc_globalEvent;
				};
			};
			
			 case 4:	//Conealed IEDs
			{
				trapkind = [(ied_large select (lbCurSel LARGE_OBJECTS)) select 1];
				if (trapkind select 0 == "BAF_ied_v2" || trapkind select 0 == "BAF_ied_v4") then {trapvolume set [0, "ied_medium"]} else {trapvolume set [0, "ied_small"]};
				hint format ["%1", trapvolume];
				//hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 5:	//Conealed IEDs area
			{
				if (mcc_capture_state) then
				{
					trapvolume set [0, "ied_small"];
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [2,0]]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
				} else 
				{
					trapvolume set [0, "ied_small"];
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [2,0]]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, [2,0]]] call CBA_fnc_globalEvent;
				};
			};
			
			case 6:	//Ammoboxes single
			{
				trapkind = [(U_AMMO select (lbCurSel AMMOBOX_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 7:	//Ammoboxes area
			{
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [3,0]]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [3,0]]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, [3,0]]] call CBA_fnc_globalEvent;
				};
			};
			
			case 8:	//Wrecks single
			{
				trapkind = [(ied_wrecks select (lbCurSel WRECKS_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 9:	//Wrecks area
			{
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [4,0]]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [4,0]]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, [4,0]]] call CBA_fnc_globalEvent;
				};
			};
			
			case 10:	//Cars single
			{
				trapkind = [(U_GEN_CAR select (lbCurSel CARS_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 11:	//Cars area
			{
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [5,0]]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [5,0]]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					];
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, [5,0]]] call CBA_fnc_globalEvent;
				};
			};
			
			case 12:	//Mine single
			{
				trapkind = [(ied_mine select (lbCurSel MINES_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 13:	//Mines area
			{
				trapkind = (ied_mine select (lbCurSel MINES_OBJECTS)) select 1;
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [6,"%8"]]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					, trapkind
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_area", [%1,%2,%3, %4, %5, %6, %7 select 0, [6,"%8"]]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					, trapkind
					];
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, [6,trapkind]]] call CBA_fnc_globalEvent;
				};
			};
			
			case 14:	//Road chargs single
			{
				trapkind = [(ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 1];
				trapvolume = [(ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 2];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_rc_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_rc_single"", [%1, %2, %3, %4, %5 select 0 , %6 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, trapdistance
								, trapsnumber
								, iedside
								, trapvolume 
								, trapkind
								];
								[""trap_rc_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 15:	//Roadchargs area
			{
				trapkind = [(ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 1];
				trapvolume = [(ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 2];
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_rc_area", [%1,%2,%3, %4, %5, %6, %7 select 0, %8 select 0]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					, trapkind
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_rc_area", [%1,%2,%3, %4, %5, %6, %7 select 0, %8 select 0]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapdistance
					, trapsnumber
					, iedside
					, trapvolume 
					, trapkind
					];
					["trap_rc_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume select 0, trapkind select 0]] call CBA_fnc_globalEvent;
				};
			};
			
			case 16:	//Armed civilians single
			{
				trapkind = [(U_GEN_SOLDIER select (lbCurSel ARMED_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""trap_cw_single"", [%1,%2,%3 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, iedside
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""trap_cw_single"", [%1,%2,%3 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, iedside
								, trapkind
								];
								[""trap_cw_single"", [_pos,iedside,trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 17:	//Armed civilians area
			{
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["trap_cw_area", [%1,%2,%3,%4, %5]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapsnumber
					, iedside
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["trap_cw_area", [%1,%2,%3,%4, %5]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapsnumber
					, iedside
					];
					["trap_cw_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapsnumber, iedside]] call CBA_fnc_globalEvent;
				};
			};
			
			case 18:	//Suicide Bombers single
			{
				trapkind = [(U_GEN_SOLDIER select (lbCurSel SB_OBJECTS)) select 1];
				hint "click on map"; 
				if (mcc_capture_state) then
					{
						onMapSingleClick " 	hint ""trap captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""sb_bomber"", [%1 ,%2 ,%3 select 0]] call CBA_fnc_globalEvent;'								 
								,_pos
								, iedside
								, trapkind
								];
								onMapSingleClick """";";
					} else 
					{
						onMapSingleClick " 	hint ""trap placed.""; 
								mcc_safe=mcc_safe + FORMAT ['
								[""sb_bomber"", [%1 ,%2 ,%3 select 0]] call CBA_fnc_globalEvent;
								sleep 1;'								 
								,_pos
								, iedside
								, trapkind
								];
								[""sb_bomber"", [_pos,iedside,trapkind select 0]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
			};
						
			case 19:	//Suicide Bombers area
			{
				if (mcc_capture_state) then
				{
					hint "Traps captured";
					mcc_capture_var=mcc_capture_var + FORMAT ['
					["sb_bomber_area", [%1,%2,%3,%4, %5]] call CBA_fnc_globalEvent;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapsnumber
					, iedside
					];
				} else 
				{
					hint "Traps placed";
					mcc_safe=mcc_safe + FORMAT ['
					["sb_bomber_area", [%1,%2,%3,%4, %5]] call CBA_fnc_globalEvent;
					sleep 1;'								 
					,mcc_zone_pos select (mcc_zone_number)
					,mcc_zone_size select (mcc_zone_number) select 0
					,mcc_zone_size select (mcc_zone_number) select 1
					, trapsnumber
					, iedside
					];
					["sb_bomber_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapsnumber, iedside]] call CBA_fnc_globalEvent;
				};
			};
		};
	}	
		else { player globalchat "Access Denied"};
	};	
	



	


