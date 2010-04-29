//by Bon_Inf*
disableSerialization;

private ['_artitype','_artispread_value','_artispread'];

_requestor = player;
_dlg = findDisplay 999900;

// read out the dialog input
_spotter_xpos = (parseNumber ctrlText (_dlg displayCtrl 999905)) mod 100000;
_spotter_ypos = (parseNumber ctrlText (_dlg displayCtrl 999906)) mod 100000;
_degrees = (parseNumber ctrlText (_dlg displayCtrl 999907)) mod 360;
_distance = abs (parseNumber ctrlText (_dlg displayCtrl 999908));
_height_disp = abs sliderPosition 999909;
_firedelay = abs (parseNumber ctrlText (_dlg displayCtrl 999911));

arty_LastData = [_spotter_xpos,_spotter_ypos,_degrees,_distance,_height_disp,_firedelay];


// now we derive the exact target position by doing some simple math....
// using Pythagoras' a^2+b^2=c^2 to compensate height dispersion
_actualdistance = sqrt (_distance^2 - _height_disp^2);
_splash_pos = [_spotter_xpos + _actualdistance*sin(_degrees), _spotter_ypos + _actualdistance*cos(_degrees),0];


// resolve artillery type and -spread
switch arty_Type do {
	case 0 : {_artitype = "ARTY_Sh_105_HE"};	// HE
	case 1 : {_artitype = "Sh_120_SABOT"};	// AT
	case 2 : {_artitype = "ARTI_MIX"};	// AT-HE Mix
	case 3 : {_artitype = "ARTY_Sh_105_WP"};	// DPICM
	case 4 : {_artitype = "Smokeshell"};	// Smoke
	case 5 : {_artitype = "F_40mm_White"};	// Flares
};
switch arty_Spread do {
	case 0 : {_artispread_value = 30; _artispread = "PRECISE";};	// PRECISE
	case 1 : {_artispread_value = 50; _artispread = "TIGHT";};	// TIGHT
	case 2 : {_artispread_value = 70; _artispread = "SCATTERED";};	// SCATTERED
	case 3 : {_artispread_value = 140; _artispread = "WIDE";};	// SCATTERED
};

_arty_cannonsummary = format["\nPosition\nx-ray %1\nyankee %2\ndirection %3\ndistance %4m\nheight dispersion %5m\n\n\nCannon set with:\n\nRounds: %6\nShells: %7\nSpread: %8\n\nSplashdown in %9 seconds",
                           	_spotter_xpos,	// summary[0]
				_spotter_ypos,	// summary[1]
				_degrees,	// summary[2]
				_distance,	// summary[3]
				_height_disp,	// summary[4]
				_artitype,	// summary[5]
				arty_NrShells,	// summary[6]
				_artispread,	// summary[7]
				_firedelay	// summary[8]
];
ctrlSetText [999913,_arty_cannonsummary];

// We reserve the cannons we want to have fired,
// and set the cannonspecific data.
_listbox = _dlg displayCtrl 999904;
_req_cannons = _requestor getVariable "requesting_cannons";
if(isNil "_req_cannons") then{_req_cannons = []};
{
	arty_CurrNrShellsTotal = arty_CurrNrShellsTotal + arty_NrShells;
	_req_cannons = (_req_cannons - [_x+1]) + [_x+1];
	_requestor setVariable ["requesting_cannons",_req_cannons,true];
	_requestor setVariable [format["Cannon%1",_x+1],[_splash_pos,_firedelay,_artitype,arty_NrShells,_artispread_value],true];
	_requestor setVariable [format["Cannon%1Summary",_x+1],_arty_cannonsummary,true];
} foreach lbSelection _listbox;

if(arty_CurrNrShellsTotal > (Server getVariable "arty_shellsleft")) then{
	ctrlEnable [999914,false];
	(_dlg displayCtrl 999901) ctrlSetTextColor [1,0,0,1];
} else{
	ctrlEnable [999914,true];
	(_dlg displayCtrl 999901) ctrlSetTextColor [1,1,1,1];
};

if(true) exitWith{};