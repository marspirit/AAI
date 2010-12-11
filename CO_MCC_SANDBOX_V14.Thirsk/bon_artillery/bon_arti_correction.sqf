//by Bon_Inf*
#include "dialog\definitions.sqf"
disableSerialization;

_correctionunit = 1;  // amount of metres set by clicking on the arrows

switch _this do {
	case "Left" : {
		arty_xcorrection = arty_xcorrection - _correctionunit;
		ctrlSetText [BON_ARTY_XCORRECTION, str arty_xcorrection];
	};
	case "Right" : {
		arty_xcorrection = arty_xcorrection + _correctionunit;
		ctrlSetText [BON_ARTY_XCORRECTION, str arty_xcorrection];
	};
	case "Down" : {
		arty_ycorrection = arty_ycorrection - _correctionunit;
		ctrlSetText [BON_ARTY_YCORRECTION, str arty_ycorrection];
	};
	case "Up" : {
		arty_ycorrection = arty_ycorrection + _correctionunit;
		ctrlSetText [BON_ARTY_YCORRECTION, str arty_ycorrection];
	};
};


if(true) exitWith{};