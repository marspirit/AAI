private ["_pos", "_dir", "_weapons", "_magazines", "_box", "_count"];
_pos = _this select 0;
_dir = _this select 1;
_weapons = _this select 2;
_magazines = _this select 3;

_box = "GuerillaCacheBox_EP1" createvehicle _pos;
_box setpos _pos;
_box setpos _pos;
_box setdir _dir;
clearMagazineCargo _box;
clearWeaponCargo _box;
sleep 2;
_count = 0;
{
	_box addWeaponCargoGlobal [_x,(_weapons select 1) select _count];
	_count = _count+ 1;
} foreach (_weapons select 0);

_count = 0;
{
	_box addMagazineCargoGlobal [_x,(_magazines select 1) select _count];
	_count = _count+ 1;
} foreach (_magazines select 0);