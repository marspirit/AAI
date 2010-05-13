_pos= _this;
_dummy = artysite select artyindex createvehicle _pos;
_dummy setposatl _pos;
if (artyindex==0) then // in case we want a tent 
	{
	_dummy setVehicleInit "nul = [this] execVM ""R3F_ARTY_AND_LOG\create_arty_quarter.sqf"";"; 
	}
	else //in case we want a vehicle
	{
	_dummy setVehicleInit "addAction [(""<t color=""#dddd00"">"" + (localize ""STR_R3F_ARTY_action_ouvrir_dlg_SM"") + ""</t>""), ""R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\ouvrir_dlg_saisie_mission.sqf"", nil, 6, true, true, """",""vehicle player != player""]";
	};
if (artyindex<=2) then //now place some mortars by the side required
	{
	{_arty ="M252" createvehicle _pos} foreach [1,2,3]; //east
	}
	else
	{
	{_arty ="2b14_82mm" createvehicle _pos} foreach [1,2,3];//west
	};
if (artyindex==5) then {_dummy = "hilux1_civil_1_open" createvehicle _pos;};
processInitCommands;
if (true) exitWith {};


	
