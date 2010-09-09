private ["_sound", "_aPos", "_shell"];

_sound = true;
_aPos = _this;

if (shelltype=="F_40mm_White") then {_sound=false};

for [{_i=0},{_i<nshell},{_i=_i+1}] do {
	_shell = shelltype createVehicle [(_aPos select 0) + random shellspread   ,(_aPos select 1) + random shellspread , 100];
	WaitUntil{(position _shell select 2)<35};
	if (_sound) then {[[_shell], [format["bon_Shell_In_v0%1",[1,2,3,4,5,6,7] select round random 6],10]] call CBA_fnc_globalSay;}; 
	sleep 4;
	
};