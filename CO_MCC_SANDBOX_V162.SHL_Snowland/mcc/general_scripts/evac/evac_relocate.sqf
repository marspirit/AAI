private ["_pos"];
_pos = _this select 0; 	//position to relocate
waituntil {alive evac};
evac setpos _pos; //relocate
	