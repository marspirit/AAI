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

private ["_type","_traparray"];
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
		
		if (_type ==0) then {							//small
					trapkind = (ied_small select (lbCurSel SMALL_OBJECTS)) select 1;
					hint "click on map"; 
					onMapSingleClick " 	hint ""trap placed.""; 
										[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
										onMapSingleClick """";";
							};
		if (_type ==1) then {
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, ied_small]] call CBA_fnc_globalEvent;
							};
		if (_type ==2) then {							//medium
					trapkind = (ied_medium select (lbCurSel MEDIUM_OBJECTS)) select 1;
					hint "click on map"; 
					onMapSingleClick " 	hint ""trap placed.""; 
										[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
										onMapSingleClick """";";
							};
		if (_type ==3) then {
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, ied_medium]] call CBA_fnc_globalEvent;
							};
		if (_type ==4) then {							//Conealed IEDs
					trapkind = (ied_large select (lbCurSel LARGE_OBJECTS)) select 1;
					if (trapkind == "BAF_ied_v2" || trapkind == "BAF_ied_v4") then {trapvolume = "ied_medium"} else {trapvolume = "ied_small"};
					hint "click on map"; 
					onMapSingleClick " 	hint ""trap placed.""; 
										[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
										onMapSingleClick """";";
							};
		if (_type ==5) then {
					trapvolume = "ied_small";
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, ied_large]] call CBA_fnc_globalEvent;
							};
		if (_type ==6) then {							//AmmoBox
					trapkind = (U_AMMO select (lbCurSel AMMOBOX_OBJECTS)) select 1;
					hint "click on map"; 
					onMapSingleClick " 	hint ""trap placed.""; 
										[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
										onMapSingleClick """";";
							};
		if (_type ==7) then {
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, U_AMMO]] call CBA_fnc_globalEvent;
							};
		if (_type ==8) then {							//Wrecks
			trapkind = (ied_wrecks select (lbCurSel WRECKS_OBJECTS)) select 1;
			hint "click on map"; 
			onMapSingleClick " 	hint ""trap placed.""; 
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
		if (_type ==9) then {
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, ied_wrecks]] call CBA_fnc_globalEvent;
							};
		if (_type ==10) then {							//Cars
			trapkind = (U_GEN_CAR select (lbCurSel CARS_OBJECTS)) select 1;
			hint "click on map"; 
			onMapSingleClick " 	hint ""trap placed.""; 
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
		if (_type ==11) then {
					["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, U_GEN_CAR]] call CBA_fnc_globalEvent;
							};
		if (_type ==12) then {							//Mine
			trapkind = (ied_mine select (lbCurSel MINES_OBJECTS)) select 1;
			hint "click on map"; 
			onMapSingleClick " 	hint ""trap placed.""; 
								[""trap_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
		if (_type ==13) then {
			trapkind = (ied_mine select (lbCurSel MINES_OBJECTS)) select 1;
			_traparray =[[trapkind,trapkind]];
			["trap_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, _traparray]] call CBA_fnc_globalEvent;
							};
		if (_type ==14) then {							//Road Charges
			trapkind = (ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 1;
			trapvolume = (ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 2;
			hint "click on map"; 
			onMapSingleClick " 	hint ""trap placed.""; 
								[""trap_rc_single"", [_pos, trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
		if (_type ==15) then {
			trapkind = (ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 1;
			trapvolume = (ied_rc select (lbCurSel ROADSIDE_OBJECTS)) select 2;
			["trap_rc_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1), trapdistance, trapsnumber, iedside, trapvolume, trapkind]] call CBA_fnc_globalEvent;
							};
		if (_type ==16) then {							//Armed civilians
			trapkind = (U_GEN_SOLDIER select (lbCurSel ARMED_OBJECTS)) select 1;
			hint "click on map"; 
			onMapSingleClick " 	hint ""trap placed.""; 
								[""trap_cw_single"", [_pos,iedside,trapkind]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
		if (_type ==17) then {
			["trap_cw_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1),trapsnumber, iedside, U_GEN_SOLDIER]] call CBA_fnc_globalEvent;
							};
		if (_type ==18) then {							//Suicide Bombers
			trapkind = (U_GEN_SOLDIER select (lbCurSel SB_OBJECTS)) select 1;
			hint "click on map"; 
			onMapSingleClick " 	hint ""trap placed.""; 
								[""sb_bomber"", [_pos,iedside,trapkind]] call CBA_fnc_globalEvent;
								onMapSingleClick """";";
					};
		if (_type ==19) then {
			["sb_bomber_area", [(mcc_zone_pos select (mcc_zone_number)),((mcc_zone_size select (mcc_zone_number)) select 0),((mcc_zone_size select (mcc_zone_number)) select 1),trapsnumber, iedside, U_GEN_SOLDIER]] call CBA_fnc_globalEvent;
							};
		
			
	}	
		else { player globalchat "Access Denied"};
	};	
	



	


