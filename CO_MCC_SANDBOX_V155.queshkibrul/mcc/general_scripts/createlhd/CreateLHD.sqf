if (isServer) then {
	_LHDspawn = _this select 0;
	_LHDdir = getdir LHD_Center;
	_LHDspawnpoint = [getposasl LHD_Center select 0, getposasl LHD_Center select 1, 0];
	deletevehicle _LHDspawn;

	_parts = 
	[
		"Land_LHD_house_1",
		"Land_LHD_house_2",
		"Land_LHD_elev_R",
		"Land_LHD_1",
		"Land_LHD_2",
		"Land_LHD_3",
		"Land_LHD_4",
		"Land_LHD_5",
		"Land_LHD_6"
	];
	{
		_dummy = _x createvehicle _LHDspawnpoint;
		_dummy setdir _LHDdir;
		_dummy setpos _LHDspawnpoint;
		_dummy setPosasl  [getPosasl _dummy select 0, getPosasl _dummy select 1, 0];
	} foreach _parts;
};