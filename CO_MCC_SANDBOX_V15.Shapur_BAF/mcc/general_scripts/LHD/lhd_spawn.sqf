#define UNIT_CAR 3011
#define UNIT_TANK 3012
#define UNIT_HELI 3014
#define UNIT_AIR 3015
#define UNIT_SHIP 3016

private ["_spawnType", "_pos", "_lhdtype", "_dummy", "_dirlhd"];

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	_spawnType = _this select 0; //what are we spawning?
	_pos = getmarkerpos lhdpos; //Where are we spawning it?
	if (count (nearestObjects [[_pos select 0, _pos select 1, 17], ["Land","Air"], 10]) > 0) exitwith {hint "Spawn point is occupied"};
	switch (lhdpos) do			//Which direction should it face
		{
			case "pos1":
			{if (((getdir deck) + 180) > 360) then {_dirlhd = (getdir deck + 180)- 360;} else {_dirlhd = getdir deck + 180};};
			case "pos2":
			{if (((getdir deck) + 180) > 360) then {_dirlhd = (getdir deck + 180)- 360;} else {_dirlhd = getdir deck + 180};};
			case "pos3":
			{if (((getdir deck) + 180) > 360) then {_dirlhd = (getdir deck + 180)- 360;} else {_dirlhd = getdir deck + 180};};
			case "pos5":
			{if (((getdir deck) + 180) > 360) then {_dirlhd = (getdir deck + 180)- 360;} else {_dirlhd = getdir deck + 180};};
			case "pos6":
			{if (((getdir deck) + 180) > 360) then {_dirlhd = (getdir deck + 180)- 360;} else {_dirlhd = getdir deck + 180};};
			case "pos7":
			{if (((getdir deck) + 180) > 360) then {_dirlhd = (getdir deck + 180)- 360;} else {_dirlhd = getdir deck + 180};};
			case "pos8":
			{if (((getdir deck) +90) > 360) then {_dirlhd = (getdir deck +90)- 360;} else {_dirlhd = getdir deck +90};};
			case "pos9":
			{_dirlhd = getdir deck};
			case "pos10":
			{_dirlhd = getdir deck};
			case "pos11":
			{_dirlhd = getdir deck};
		};
		
	if (_spawnType==0) then {	//If it's a plane
			_lhdtype = (U_GEN_AIRPLANE select (lbCurSel UNIT_AIR)) select 1;
			//hint format ["%1", _lhdtype];
			_dummy = _lhdtype createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 116]; 
			_dummy setposasl [_pos select 0, _pos select 1, 17];
			_dummy setdir _dirlhd;
			_dummy setVehicleInit "this addaction [""Taxi to takeoff"",""mcc\general_scripts\lhd_take_off\lhd_take_off.sqf""];this addAction [""ILS"",""mcc\general_scripts\LHD\ilsproII.sqf"",[loc,airport,""LHD"",""Rwy 1"",""ILS""]];";
			};
	if (_spawnType==1) then {	//If it's a heli
			_lhdtype = (U_GEN_HELICOPTER select (lbCurSel UNIT_HELI)) select 1;
			_dummy = _lhdtype createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 116]; 
			_dummy setposasl [_pos select 0, _pos select 1, 17];
			_dummy setdir _dirlhd;
			};
	if (_spawnType==2) then {	//If it's a Car
			_lhdtype = (U_GEN_CAR select (lbCurSel UNIT_CAR)) select 1;
			_dummy = _lhdtype createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 116]; 
			_dummy setposasl [_pos select 0, _pos select 1, 17];
			_dummy setdir _dirlhd;
			};
	if (_spawnType==3) then {	//If it's a Tank
			_lhdtype = (U_GEN_TANK select (lbCurSel UNIT_TANK)) select 1;
			_dummy = _lhdtype createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 116]; 
			_dummy setposasl [_pos select 0, _pos select 1, 17];
			_dummy setdir _dirlhd;
			};
	if (_spawnType==4) then {	//If it's a Ship
			_lhdtype = (U_GEN_SHIP select (lbCurSel UNIT_SHIP)) select 1;
			_dummy = _lhdtype createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 116]; 
			_dummy setposasl _pos;
			_dummy setdir _dirlhd;
			};
	processInitCommands;
			
	}	
		else { player globalchat "Access Denied"};
	};
