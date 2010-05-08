//by Bon_Inf*

/**************************************************************************************************************/

BON_ARTI_PATH = "bon_artillery\";


// Call sign for imaginary Artillery Operator
HW_Arti_CallSign = "Steel Rain";

// Number cannons
HW_Arti_CannonNumber = 5;

// Number rounds per hour
//HW_arti_number_shells_per_hour = 24; //Init by init.sqf

// element: [displayname,config type-entry]
HW_arti_types = [["HE 105mm","ARTY_Sh_105_HE"],["HE 85mm","Sh_85_HE"],["HE 40mm","G_40mm_HE"],["SADARM","ARTY_Sh_105_SADARM"],["Smoke","SmokeShell"],["Illumination","F_40mm_White"]];

// max. nr. shells each cannon can fire in one fire mission
HW_arti_maxnrshells = 5;

// element: [displayname,splashdown dispersion in meters]; LASER must have dispersion < 0 to work
HW_arti_spreads = [["PRECISE",0],["TIGHT",25],["SCATTERED",50],["WIDE",100],["LASER",-1]];

// if true each player can see his/her position when opening the map
HW_arti_show_pos_on_map = false;


/****************************** RESTRICTIONS ******************************************************************/

//### Specify classes artillery should be restricted to, or leave the array empty
_arti_cond_classes = [];

//### Specify sides artillery should be restricted to (either WEST, EAST, GUER, CIVILIAN), or leave the array empty
_arti_cond_sides = [];

//### Specify weapons player must have to call in artillery, or leave the array empty
_arti_cond_weapons = ["ACE_P159_RD90"];

//### define own conditions by replacing the 'true', ( e.g. _arti_cond_other = "!alive tank1 && !alive tank2"; )
_arti_cond_other = "true";

/**************************************************************************************************************/

// you are finished here

/*************************************************************************************************************/
/*************************************************************************************************************/
/*************************************************************************************************************/

[] spawn {
	if(isServer) then{
		for "_i" from 1 to HW_Arti_CannonNumber do{
			Server setVariable [format["Arti_WEST_Cannon%1_available",_i],true,true];
			Server setVariable [format["Arti_EAST_Cannon%1_available",_i],true,true];
			Server setVariable [format["Arti_GUER_Cannon%1_available",_i],true,true];
			Server setVariable [format["Arti_CIV_Cannon%1_available",_i],true,true];
		};
		Server setVariable ["Arti_WEST_requestor",ObjNull,true];
		Server setVariable ["Arti_EAST_requestor",ObjNull,true];
		Server setVariable ["Arti_GUER_requestor",ObjNull,true];
		Server setVariable ["Arti_CIV_requestor",ObjNull,true];
		[] spawn {
			while{true} do {
				Server setVariable ["Arti_WEST_shellsleft",HW_arti_number_shells_per_hour,true];
				Server setVariable ["Arti_EAST_shellsleft",HW_arti_number_shells_per_hour,true];
				Server setVariable ["Arti_GUER_shellsleft",HW_arti_number_shells_per_hour,true];
				Server setVariable ["Arti_CIV_shellsleft",HW_arti_number_shells_per_hour,true];
				if(time>10) then{
					Server setVehicleInit "
						[playerSide,'HQ'] sideChat format['Artillery operator: %1 Rounds available.',HW_arti_number_shells_per_hour];
					"; processInitCommands;
				};
				sleep 3600;
			};
		};
	};
};
if(isDedicated) exitWith{};
WaitUntil{not isNull player};

_arti_cond_class = "false";
if(count _arti_cond_classes > 0) then {
	{_arti_cond_class = _arti_cond_class + " || typeOf player == " + str _x } foreach _arti_cond_classes;
} else{_arti_cond_class = "true"};

_arti_cond_side = "false";
if(count _arti_cond_sides > 0) then {
	{_arti_cond_side = _arti_cond_side + " || playerSide == " + str _x} foreach _arti_cond_sides;
} else{_arti_cond_side = "true"};

_arti_cond_weapon = "false";
if(count _arti_cond_weapons > 0) then {
	{_arti_cond_weapon = _arti_cond_weapon + " || player hasWeapon " + str _x} foreach _arti_cond_weapons;
} else{_arti_cond_weapon = "true"};

bon_arti_condition = _arti_cond_weapon + " && " + _arti_cond_other;

arti_dlgUpdate = compile (preprocessFileLineNumbers (BON_ARTI_PATH+"bon_arti_func_dlgUpdate.sqf"));
arti_func_keyspressed = compile (preprocessFileLineNumbers (BON_ARTI_PATH+"bon_arti_func_keyspressed.sqf"));
arti_func_getSplashPos = compile (preprocessFileLineNumbers (BON_ARTI_PATH+"bon_arti_func_getSplashPos.sqf"));
arti_func_getLaser = compile (preprocessFileLineNumbers (BON_ARTI_PATH+"bon_arti_func_getlaser.sqf"));
sleep 0.1;

if(local player && call compile _arti_cond_side && call compile _arti_cond_class) then {
	if(HW_arti_show_pos_on_map) then{
		(findDisplay 46) displayAddEventHandler ["KeyDown","_this call arti_func_keyspressed"];
	};
	player addAction ["<t color='#FFCC00'>Call Artillery</t>",(BON_ARTI_PATH+"dialog\openMenu.sqf"),["Arti_dlg"],-1,false,true,"",bon_arti_condition];
	player addEventHandler ["Killed",{
		[] spawn {
			player removeAction bon_arti_action;
			WaitUntil{alive player};
			bon_arti_action = player addAction ["<t color='#FFCC00'>Call Artillery</t>",(BON_ARTI_PATH+"dialog\openMenu.sqf"),["Arti_dlg"],-1,false,true,"",bon_arti_condition];
		};
	}];
};

if(isNil "bon_arti_registration_message") then{bon_arti_registration_message = ["your mom",playerSide]};
"bon_arti_registration_message" addPublicVariableEventHandler {
	_name = (_this select 1) select 0;
	_side = (_this select 1) select 1;
	[_side,"HQ"] sideChat format["%1 registered for Fire Mission.",_name];
};

if(true) exitWith{};