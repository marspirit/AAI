/*
Drop - drops ammo when a player respawns - AI_enabled

gets called on _drop_weapons || _cadaver
Check root revive_init.sqf for additional parameters

written by alef modified by norrin
**************************************************************************************
start drop.sqf
*/

private ["_drop_weapons","_cadaver","_bury_timeout","_body","_safec","_max_timeout","_wep","_mag","_timeout"];

_drop_weapons			= NORRN_revive_array select 93;
_cadaver				= NORRN_revive_array select 94;
_bury_timeout			= NORRN_revive_array select 95;
_body 					= _this select 0;
_timeout				= 0;

_max_timeout 			= 1200; // maximum allowed

_wep 					= weapons _body;
_mag 					= magazines _body;

// Get body's current position			
_pos = getPos _body;
_offset = _name distance _pos;
_upos = [_pos select 0, _pos select 1, _Offset];

if (_bury_timeout > 0 && _bury_timeout < _max_timeout) then 
{
    _timeout = time + _bury_timeout;
}else{
    _timeout = time + _max_timeout;
};

if (_cadaver == 0) then
{	
	waitUntil{time > _timeout};
	if (_drop_weapons == 1) then
	{
		_holder = "WeaponHolder" createVehicle _upos;
		_holder setPos _upos;
		sleep 1;
		{_body action ["DropMagazine",_holder, _x];sleep 0.6;} forEach _mag; 
   		{_body action ["DropWeapon",_holder, _x];sleep 0.7;} forEach _wep; 
	};
	clearVehicleInit _body;
	deleteVehicle _body;
	_body = objNull;
}else{
	if (_drop_weapons == 1) then
	{
		_holder = "WeaponHolder" createVehicle _upos;
		_holder setPos _upos;
		sleep 1;
		{_body action ["DropMagazine",_holder, _x];sleep 0.6;} forEach _mag; 
   		{_body action ["DropWeapon",_holder, _x];sleep 0.7;} forEach _wep; 
	};
	clearVehicleInit _body;
	sleep 2;
};

if (true) exitWith {};
