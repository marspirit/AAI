//by Bon_Inf*
disableSerialization;

private ['_arti_settings'];

_arti_settings = player getVariable format["Cannon%1Summary",(lbCurSel 999904)+1];
if(not isNil "_arti_settings") then{
	ctrlSetText [999913,_arti_settings];
} else {
	ctrlSetText [999913,""];
};

if(true) exitWith{};