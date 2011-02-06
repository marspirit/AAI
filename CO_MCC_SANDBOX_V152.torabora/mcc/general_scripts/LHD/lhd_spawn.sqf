#define LHD_CLASS 3011
#define LHD_TYPE 3012

private ["_spawnType", "_pos", "_lhdtype", "_dummy", "_dirlhd", "_latitude"];

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	_spawnType = lbCurSel LHD_CLASS; //what are we spawning?
	_pos = getmarkerpos lhdpos; //Where are we spawning it?
	if ((_this select 0) == 0) then {_latitude = 0} else {_latitude = 17};
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
	
	switch (_spawnType) do			
		{
			case 0:	//If it's a Car
			{	
			_lhdtype = (U_GEN_CAR select (lbCurSel LHD_TYPE)) select 1;
			};
			
			case 1:	//Tanks
			{	
			_lhdtype = (U_GEN_TANK select (lbCurSel LHD_TYPE)) select 1;
			};
			
			case 2:	//Motorcycle
			{	
			_lhdtype = (U_GEN_MOTORCYCLE select (lbCurSel LHD_TYPE)) select 1;
			};
			
			case 3:	//Helicopters
			{	
			_lhdtype = (U_GEN_HELICOPTER select (lbCurSel LHD_TYPE)) select 1;
			};
			
			case 4:	//planes
			{	
			_lhdtype = (U_GEN_AIRPLANE select (lbCurSel LHD_TYPE)) select 1;
			};
			
			case 5:	//Ships
			{
			_lhdtype = (U_GEN_SHIP select (lbCurSel LHD_TYPE)) select 1;
			};	
		};
	
	_dummy = _lhdtype createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 116]; 
	_dummy setposasl [_pos select 0, _pos select 1, _latitude];
	_dummy setdir _dirlhd;
	if (_spawnType == 4) then //ILS for planes
		{
		_dummy setVehicleInit "this addaction [""Taxi to takeoff"",""mcc\general_scripts\lhd_take_off\lhd_take_off.sqf""];this addAction [""ILS"",""mcc\general_scripts\LHD\ilsproII.sqf"",[loc,airport,""LHD"",""Rwy 1"",""ILS""]];";
		};
	processInitCommands;
	}	
		else { player globalchat "Access Denied"};
	};
