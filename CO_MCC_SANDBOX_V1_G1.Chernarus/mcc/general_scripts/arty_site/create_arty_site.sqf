disableSerialization;

_pos = _this select 0; 
_artysite = _this select 1; 
_artyindex = _this select 2;

_dummy = _artysite select _artyindex createvehicle _pos;
_earplugs = "LocalBasicAmmunitionBox" createvehicle _pos;
_earplugs setVehicleInit "clearweaponcargo this; clearmagazinecargo this; this addWeaponCargo [""ACE_Earplugs"",6]";
_dummy setposatl _pos;
if (_artyindex==0) then // in case we want a tent 
	{
	_dummy setVehicleInit "nul = [this] execVM ""R3F_ARTY_AND_LOG\create_arty_quarter.sqf"";"; 
	}
	else //in case we want a vehicle
	{
	_dummy setVehicleInit "this addAction [""Artilley Computer"", ""R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\ouvrir_dlg_saisie_mission.sqf"", nil, 6, true, true, """",""vehicle player != player""]";
	};
if (_artyindex<=2) then //now place some mortars by the side required
	{
	{_arty ="M252" createvehicle _pos} foreach [1,2,3]; //east
	}
	else
	{
	{_arty ="2b14_82mm" createvehicle _pos} foreach [1,2,3];//west
	};
if (_artyindex==5) then {_dummy = "hilux1_civil_1_open" createvehicle _pos;};
processInitCommands;
if (true) exitWith {};


	
