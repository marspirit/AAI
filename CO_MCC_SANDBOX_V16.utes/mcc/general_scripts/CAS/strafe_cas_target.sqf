private ["_plane", "_pos", "_target", "_cas_name"];

_plane = _this select 0;
_pos = _this select 1;
_cas_name = _this select 2;
_target = _this select 3;

while {(_plane distance _pos < 2000) && (damage _target < 0.8)} do 
{	
	[playerSide,'HQ'] sideChat format ["%1 Engaging target", _cas_name];

	_plane doTarget _target;

	waitUntil { sleep 0.6; ( damage _target > 0.8 )};
};

//server globalChat format ["%1 Mission accomplished RTB", _cas_name];
