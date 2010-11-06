private ["_unit", "_weapons", "_items", "_magazines", "_currweap", "_hasruck", "_ruckMags", "_ruckWeaps", "_weaponback", "_success", "_muzzles"];

_unit = _this select 0;
_weapons = (weapons _unit) - (items _unit);	
_items = items _unit;		
_magazines = magazines _unit;	
_currweap = currentWeapon _unit;	


	_hasruck = player call ACE_Sys_Ruck_fnc_hasRuck;
	If (_hasruck) then {
		_ruckMags = [_unit] call ACE_fnc_RuckMagazinesList;
		_ruckWeaps = [_unit] call ACE_fnc_RuckWeaponsList;
	};
	_weaponback = _unit getvariable "ACE_weapononback";
	

WaitUntil {alive player};
_unit = player;

removeAllWeapons _unit;
{_unit addMagazine _x} forEach _magazines;
{_unit addWeapon _x} forEach _weapons;
{_unit addWeapon _x} forEach _items;
	If (_hasruck) then {
		{
			_success = [_unit, _x select 0, _x select 1] call ACE_fnc_PackWeapon;
		} forEach _ruckWeaps;
		
		{
			_success = [_unit, _x select 0, _x select 1] call ACE_fnc_PackMagazine;
		} forEach _ruckMags;	
	};
	If (_weaponback != "") then {
		_unit addWeapon _weaponback;
		[_unit, _weaponback] call ACE_fnc_PutWeaponOnBack;
	};

_unit selectWeapon _currweap;
_muzzles = getArray(configFile>>"cfgWeapons" >> _currweap >> "muzzles");
_unit selectWeapon (_muzzles select 0);