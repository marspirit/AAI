//by Bon_Inf*
#include "dialog\definitions.sqf"
disableSerialization;

private ['_arti_settings'];

_arti_settings = player getVariable format["Arti_%2_Cannon%1Summary",(lbCurSel BON_ARTY_CANNONLIST)+1,playerSide];
if(not isNil "_arti_settings") then{
	ctrlSetText [BON_ARTY_SUMMARY,_arti_settings];
} else {
	ctrlSetText [BON_ARTY_SUMMARY,""];
};

true