""Bargate"", 1]";
			class Effects
			{
			};
		};
	};
};
class Intro
{
	addOns[]=
	{
		"zargabad"
	};
	addOnsAuto[]=
	{
		"zargabad"
	};
	randomSeed=5875250;
	class Intel
	{
		startWeather=0.25;
		forecastWeather=0.25;
		year=2008;
		month=10;
		day=11;
		hour=9;
		minute=20;
	};
};
class OutroWin
{
	addOns[]=
	{
		"zargabad"
	};
	addOnsAuto[]=
	{
		"zargabad"
	};
	randomSeed=15434763;
	class Intel
	{
		startWeather=0.25;
		forecastWeather=0.25;
		year=2008;
		month=10;
		day=11;
		hour=9;
		minute=20;
	};
};
class OutroLoose
{
	addOns[]=
	{
		"zargabad"
	};
	addOnsAuto[]=
	{
		"zargabad"
	};
	randomSeed=477795;
	class Intel
	{
		startWeather=0.25;
		forecastWeather=0.25;
		year=2008;
		month=10;
		day=11;
		hour=9;
		minute=20;
	};
};
; F2 - Kegetys Spectator Script
; Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
; ====================================================================================

; Initialize spectating script when player dies:
_this call ace_fnc_startSpectator;player creatediaryrecord ["diary", ["Factories", "Heavy Factory can produce tracked vehicles such as the M1A1.<br /><br />Light Factory can produce cars like the HMMWV.<br /><br />Aircraft Factory can make helicopters and planes.<br /><br />MTVR (Repair) can make Field Hospitals and fortifications.<br /><br />MTVR (Ammunition) can make ammo crates and guns like the M119.<br /><br />LAV-25 (HQ) can make bikes and ammo crates."]];
//player creatediaryrecord ["diary", ["Revive", "If anyone is incapacitated they will roll in pain on the ground. You can revive them by going up to them and running the action First Aid. If they were hurt inside a vehicle, you can go up to the vehicle and take out injured.<br /><br />If you try to crawl and fight while in this incapacitated state you may risk death if you take any more damage.<br /><br />When someone is revived, they are not healed, only allowed to move around again freely. They should still find an actual medic to heal them."]];
player creatediaryrecord ["diary", ["About", "You can create vehicles from factories by pressing the <execute expression=""[nil, nil, nil, nil] execvm 'dlg.sqf'"">teamswitch button</execute> (default T).<br /><br />If you press the teamswitch key near a flagpole, hospital tent, or LAV-25 (HQ) you can warp to any other on the map.<br /><br />Go to the <execute expression=""if not isnil 'BIS_MENU_GroupCommunication' then {showcommandingmenu '#User:BIS_MENU_GroupCommunication'}"">Communication menu</execute> by pressing 0, then 8 for some extra commands, like the ability to change view distance or tow vehicles.<br /><br />There is a UAV Terminal available at base if a UAV is in the sky. You may need to adjust the brightness by using the mouse wheel.<br /><br />Map by Doolittle<br />For 1st Infantry Division"]];
player setvariable ["BIS_noCoreConversations", true];

if (count units player > 1) then {
	[player] joinsilent creategroup west;
};
doosmoke = {
	_found = false;
	{
		if (_x in ["SmokeShell", "SmokeShellRed", "SmokeShellGreen", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"]) exitwith {
			_found = true;
			player removemagazine _x;
			_v = _x createvehicle getpos vehicle player;
			_v attachto [vehicle player, [random 0.1, random 0.1, random 0.1]];
			hint "Smoke out";
		};
	} foreach magazines player;
	if not _found then {hint "No smokeshell found in gear"};
};
/*
doointeract = {
	_v = nearestobjects [vehicle player, ["C130J", "MV22", "AH1Z"], 15];
	if (count _v == 0) exitwith {hint "No C-130J, MV-22, or AH-1Z nearby"};
	{
		if (typeof _x == "C130J") exitwith {
			vehicle player say "Doors";
			if (_x animationphase "ramp_bottom" != 0) then {
				_x animate ["ramp_top", 0];
				_x animate ["ramp_bottom", 0];
			} else {
				_x animate ["ramp_top", 1];
				_x animate ["ramp_bottom", 1];
			};
		};
		if (count crew _x == 0 and typeof _x == "MV22") exitwith {
			vehicle player say "Doors";
			if (_x animationphase "pack_engine_1" != 0) then {
				_x animate ["engine_prop_1_1_turn", 0];
				_x animate ["engine_prop_1_2_turn", 0];
				_x animate ["engine_prop_1_3_turn", 0];
				_x animate ["engine_prop_2_1_turn", 0];
				_x animate ["engine_prop_2_2_turn", 0];
				_x animate ["engine_prop_2_3_turn", 0];
				_x animate ["engine_prop_1_1_close", 0];
				_x animate ["engine_prop_1_3_close", 0];
				_x animate ["engine_prop_2_1_close", 0];
				_x animate ["engine_prop_2_2_close", 0];
				_x animate ["pack_engine_1", 0];
				_x animate ["pack_engine_2", 0];
				_x animate ["turn_wing", 0];
			} else {
				_x animate ["engine_prop_1_1_turn", 1];
				_x animate ["engine_prop_1_2_turn", 1];
				_x animate ["engine_prop_1_3_turn", 1];
				_x animate ["engine_prop_2_1_turn", 1];
				_x animate ["engine_prop_2_2_turn", 1];
				_x animate ["engine_prop_2_3_turn", 1];
				_x animate ["engine_prop_1_1_close", 1];
				_x animate ["engine_prop_1_3_close", 1];
				_x animate ["engine_prop_2_1_close", 1];
				_x animate ["engine_prop_2_2_close", 1];
				_x animate ["pack_engine_1", 1];
				_x animate ["pack_engine_2", 1];
				_x animate ["turn_wing", 1];
			};
		};
		if (count crew _x == 0 and typeof _x == "AH1Z") exitwith {
			vehicle player say "Doors";
			if (_x animationphase "mainRotor_folded" != 0) then {
				_x animate ["mainRotor_folded", 0];
				_x animate ["mainRotor_unfolded", 1];
			} else {
				_x animate ["mainRotor_folded", 1];
				_x animate ["mainRotor_unfolded", 0];
			};
		};
	} foreach _v;
};
*/
BIS_MENU_GroupCommunication = [
	["User menu", false],
	["View distance up", [2], "", -5, [["expression", "if (viewdistance + 300 <= 7000) then {setviewdistance (viewdistance + 300)}; hint (""View distance set to "" + str viewdistance)"]], "1", "1"],
	["View distance down", [3], "", -5, [["expression", "if (viewdistance - 300 >= 700) then {setviewdistance (viewdistance - 300)}; hint (""View distance set to "" + str viewdistance)"]], "1", "1"],
	["Grass on", [4], "", -5, [["expression", "setterraingrid 12.5; hint ""Grass on"""]], "1", "1"],
	["Grass off", [5], "", -5, [["expression", "setterraingrid 50; hint ""Grass off"""]], "1", "1"],
	["Attach smoke", [6], "", -5, [["expression", "[] call doosmoke"]], "1", "1"]
	//["Interact with vehicle", [7], "", -5, [["expression", "[] call doointeract"]], "1", "1"],
	//["Attach or detach vehicle", [8], "", -5, [["expression", "[] call doodraggercheck"]], "1", "1"]
];

if isnil "doojiptaskarray" then {
	doojiptaskarray = [];
} else {
	{
		_loc = _x call doogetloc;
		_task = player createsimpletask ["Secure " + _loc];
		_task setsimpletaskdescription ["Eliminate enemy forces near " + _loc, "Secure " + _loc, "Secure"];
		_task setsimpletaskdestination _x;
	} foreach doojiptaskarray;
};
dooaddtask = {
	private ["_loc", "_task"];
	_loc = _this call doogetloc;
	_task = player createsimpletask ["Secure " + _loc];
	_task setsimpletaskdescription ["Eliminate enemy forces near " + _loc, "Secure " + _loc, "Secure"];
	_task setsimpletaskdestination _this;
	[nil, nil, _task, "created"] execvm "\ca\modules\mp\data\scriptcommands\taskhint.sqf";
};
"dootask" addpublicvariableeventhandler {_this select 1 call dooaddtask};

if isnil "doojipsucceededarray" then {
	doojipsucceededarray = [];
} else {
	{
		if (taskstate _x != "Succeeded") then {
			_pos = taskdestination _x;
			_task = _x;
			{
				if (_x select 0 == _pos select 0 and _x select 1 == _pos select 1) exitwith {
					_task settaskstate "Succeeded";
				};
			} foreach doojipsucceededarray;
		};
	} foreach simpletasks player;
};
dooaddsucceeded = {
	private "_pos";
	{
		if (taskstate _x != "Succeeded") then {
			_pos = taskdestination _x;
			if (_this select 0 == _pos select 0 and _this select 1 == _pos select 1) exitwith {
				_x settaskstate "Succeeded";
				[nil, nil, _x, "succeeded"] execvm "\ca\modules\mp\data\scriptcommands\taskhint.sqf";
			};
		};
	} foreach simpletasks player;
};
"doosucceeded" addpublicvariableeventhandler {_this select 1 call dooaddsucceeded};

dooplayerweap = ["ACE_Map_Tools", "ACE_GlassesLHD_glasses", "ACE_Earplugs", "m16a4", "Colt1911", "Binocular", "NVGoggles", "ACE_M136_CSRS"];
dooplayerammo = ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "SmokeShellGreen", "SmokeShellGreen"];
dooplayerruckweap = [];
dooplayerruckammo = [["ACE_Bandage", 3], ["ACE_Morphine", 2], ["ACE_Knicklicht_G", 1]];
dooplayerweapback = "ACE_Rucksack_MOLLE_ACU";
[] spawn {
	while {true} do {
		if (alive player and vehicle player == player) then {
			if (count nearestobjects [player, ["USVehicleBox", "USBasicWeaponsBox"], 5] != 0) then {
				dooplayerweap = weapons player - ["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "ItemGPS"];
				dooplayerammo = magazines player;
				if dooace then {
					dooplayerruckweap = player getvariable "ACE_RuckWepContents";
					dooplayerruckammo = player getvariable "ACE_RuckMagContents";
					dooplayerweapback = player getvariable "ACE_weapononback";
				};
			};
		};
		sleep 3;
	};
};
[] spawn {
	private "_muz";
	while {true} do {
		waituntil {alive player};
		titletext ["", "black in"];
		removeallweapons player;
		{player addmagazine _x} foreach dooplayerammo;
		{if not (player hasweapon _x) then {player addweapon _x}} foreach dooplayerweap;
		if dooace then {
			player setvariable ["ACE_RuckWepContents", dooplayerruckweap];
			player setvariable ["ACE_RuckMagContents", dooplayerruckammo];
			player setvariable ["ACE_weapononback", dooplayerweapback];
		};
		if not (player hasweapon "ItemGPS") then {player addweapon "ItemGPS"};
		_muz = getarray (configfile >> "CfgWeapons" >> primaryweapon player >> "muzzles");
		if (count _muz > 0) then {
			if (_muz select 0 == "this") then {
				player selectweapon primaryweapon player;
			} else {
				player selectweapon (_muz select 0);
			};
		} else {
			player selectweapon primaryweapon player;
		};
		player setcaptive false;
		if ({alive _x} count doorespawnarray > 1) then {
			if createdialog "doodialog" then {
				uinamespace setvariable ["doolb", finddisplay 3000 displayctrl 3002];
				if not isnull (uinamespace getvariable "doolb") then {
					{
						if (alive _x) then {
							_index = (uinamespace getvariable "doolb") lbadd (gettext (configfile >> "CfgVehicles" >> typeof _x >> "displayName") + " at " + (getpos _x call doogetloc));
							(uinamespace getvariable "doolb") lbsetdata [_index, str _x];
						};
					} foreach doorespawnarray;
					buytype = "respawn";
				};
			};
		};
		sleep 5;
		waituntil {not alive player};
		if dialog then {closedialog 3000};
		sleep (playerrespawntime - 2);
		titletext ["", "black out"];
	};
};
[] spawn {
	while {not dooace} do {
		waituntil {vehicle player != player};
		if (typeof vehicle player == "ParachuteWest" and lifestate player != "UNCONSCIOUS") then {
			deletevehicle vehicle player;
			titletext ["", "black faded"];
			sleep 1;
			titletext ["", "black in"];
			[player] exec "\ca\air2\halo\data\scripts\halo.sqs";
		};
/*
		if (isnil {vehicle player getvariable "fastropeaction"} and typeof vehicle player in ["MH60S", "ACE_UH60M", "ACE_MH6"]) then {
			vehicle player setvariable ["fastropeaction", true];
			vehicle player addaction ["Deploy ropes", "fastrope.sqf", "Deploy", 0, true, true, "", "driver _target == _this and isnil {_target getvariable ""fastrope""}"];
			vehicle player addaction ["Recover ropes", "fastrope.sqf", "Recover", 0, true, true, "", "driver _target == _this and not isnil {_target getvariable ""fastrope""}"];
			vehicle player addaction ["Fast rope out", "fastrope.sqf", "Out", 0, true, true, "", "driver _target != _this and not isnil {_target getvariable ""fastrope""} and _target == vehicle _this and speed _target < 20"];
		};
*/
		sleep 1;
	};
};

/*
[] spawn {
	_pprb = 170;
	_ppcc = 1580;
	while {isnil "doounconsciouspp"} do {
		doounconsciouspp = ppeffectcreate [["radialblur", _pprb], ["colorcorrections", _ppcc]];
		_pprb = _pprb + 1;
		_ppcc = _ppcc + 1;
	};
	while {true} do {
		waituntil {lifestate player == "UNCONSCIOUS"};
		if dialog then {closedialog 3000};
		{_x ppeffectenable true} foreach doounconsciouspp;
		while {alive player and lifestate player == "UNCONSCIOUS"} do {
			sleep 0.5;
			doounconsciouspp select 0 ppeffectadjust [random 0.005 + 0.0025, random 0.005 + 0.0025, 0.0, 0.0];
			doounconsciouspp select 0 ppeffectcommit 0.5;
			doounconsciouspp select 1 ppeffectadjust [1.0, 1.0, 0.0, random 0.6, 0.0, 0.0, random 0.6, 0.0, 1.0, 1.0, 1.0, 0.199, 0.587, 0.114, 0.0];
			doounconsciouspp select 1 ppeffectcommit 0.5;
		};
		{_x ppeffectenable false} foreach doounconsciouspp;
	};
};
player removealleventhandlers "handledamage";
player addeventhandler ["handledamage", "_this call doohandledamage"];
*/

if (count actionkeys "teamswitch" == 0) then {[playerside, "hq"] sidechat "Please bind a key to teamswitch (default T) to use the menus"};
doodlg = compile preprocessfile "dlg.sqf";
waituntil {not isnull finddisplay 46};
finddisplay 46 displayaddeventhandler ["keyup", "_this call doodlg"];
doobuy = compile preprocessfile "buy.sqf";
"launchskeet" addpublicvariableeventhandler {skeetmachine say "LaunchSkeet"};

_v = "#lightpoint" createvehiclelocal [(getmarkerpos "respawn_west") select 0, (getmarkerpos "respawn_west") select 1, -20];
_v setlightbrightness 0.1;
_v setlightambient [1, 1, 1];
_v setlightcolor [1, 1, 1];
_v = "#lightpoint" createvehiclelocal [(getpos skeetmachine) select 0, (getpos skeetmachine) select 1, -20];
_v setlightbrightness 0.1;
_v setlightambient [1, 1, 1];
_v setlightcolor [1, 1, 1];

[] spawn {
	doounitsmarker = -1;
	doorespawnmarker = -1;
	while {true} do {
		_u = playableunits + [doouav] - [objnull];
		if not (player hasweapon "ItemGPS") then {
			_u = [];
		};
		for [{_i = 0}, {_i < count _u}, {_i = _i + 1}] do {
			_o = _u select _i;
			_m = format ["icon%1", _i];
			if (doounitsmarker < _i) then {
				doounitsmarker = doounitsmarker + 1;
				createmarkerlocal [_m, [0, 0]];
			};
			_m setmarkerposlocal getposasl _o;
			if (_o == player) then {
				_m setmarkercolorlocal "ColorRed";
			} else {
				//if (lifestate _o == "UNCONSCIOUS") then {
				//	_m setmarkercolorlocal "ColorOrange";
				//} else {
					_m setmarkercolorlocal "ColorBlue";
				//};
			};
			if (vehicle _o == _o) then {
				if (_o iskindof "UAV") then {
					_m setmarkertypelocal "b_uav";
				} else {
					_m setmarkertypelocal "b_inf";
				};
			} else {
				if (vehicle _o iskindof "Car") then {
					_m setmarkertypelocal "b_motor_inf";
				} else {
					if (vehicle _o iskindof "Tank") then {
						_m setmarkertypelocal "b_armor";
					} else {
						if (vehicle _o iskindof "Helicopter") then {
							_m setmarkertypelocal "b_air";
						} else {
							if (vehicle _o iskindof "Plane") then {
								_m setmarkertypelocal "b_plane";
							} else {
								_m setmarkertypelocal "b_inf";
							};
						};
					};
				};
			};
		};
		for [{_i = count _u}, {_i <= doounitsmarker}, {_i = _i + 1}] do {
			_m = format ["icon%1", _i];
			_m setmarkertypelocal "Empty";
		};

		doorespawnarray = doorespawnarray - [objnull];
		{
			if not (alive _x) then {
				doorespawnarray = doorespawnarray - [_x];
			};
		} foreach doorespawnarray;
		for [{_i = 0}, {_i < count doorespawnarray}, {_i = _i + 1}] do {
			_o = doorespawnarray select _i;
			_m = format ["respawn%1", _i];
			if (doorespawnmarker < _i) then {
				doorespawnmarker = doorespawnmarker + 1;
				createmarkerlocal [_m, [0, 0]];
				_m setmarkercolorlocal "ColorGreen";
			};
			_m setmarkerposlocal getposasl _o;
			_m setmarkertypelocal "b_hq";
		};
		for [{_i = count doorespawnarray}, {_i <= doorespawnmarker}, {_i = _i + 1}] do {
			_m = format ["respawn%1", _i];
			_m setmarkertypelocal "Empty";
		};
		sleep 1;
	};
};

if (isclass (configfile >> "CfgPatches" >> "JTD_FireAndSmoke")) exitwith {
	[playerside, "hq"] sidechat "Disable JTD_FireAndSmoke to play this mission";
	diag_log "Disable JTD_FireAndSmoke to play this mission";
	sleep 5;
	endmission "end1";
};
if not isnil "GL4_Chatter" then {
	if (count GL4_Chatter > 1) then {
		GL4_Chatter set [1, false];
	};
};
if not isnil "GL4_Local" then {
	if (count GL4_Local > 23) then {
		GL4_Local set [23, false];
	};
	if (count GL4_Local > 28) then {
		GL4_Local set [28, 0];
	};
};

if not (paramsarray select 0 == 1 or isnil "loc0") exitwith {};
player creatediaryrecord ["diary", ["Drill Instructor", "Drill Instructor can spawn enemies by clicking and dragging the mouse on the map.<br /><br />There are several preset options. For example, if you select ""Spawn as Insurgents"" and then pick BRDM2, the vehicles will belong to Insurgents. If you then pick ""Waypoint is Guard"" and do Mi17, the helicopter will belong to Insurgents and it will hold at the mouse release point until the player is detected."]];
if not (typeof player in ["FR_Commander", "ACE_usarmy_squadleader"] or name player == "CPT. RockSteel CO") exitwith {};

doomousedown = {
	if (_this select 1 == 1) exitwith {};
	doomousedownpos = _this select 0 ctrlmapscreentoworld [_this select 2, _this select 3];
};
doomouseup = {
	if (_this select 1 == 1) exitwith {};
	doomouseuppos = _this select 0 ctrlmapscreentoworld [_this select 2, _this select 3];
	if not alive player exitwith {};
	if (doomousedownpos distance doomouseuppos < 5) exitwith {};
	if not (createdialog "doodialog") exitwith {};
	"spawnmarker" setmarkerposlocal [((doomousedownpos select 0) + (doomouseuppos select 0)) / 2, ((doomousedownpos select 1) + (doomouseuppos select 1)) / 2];
	"spawnmarker" setmarkerdirlocal ((doomousedownpos select 0) - (doomouseuppos select 0)) atan2 ((doomousedownpos select 1) - (doomouseupp