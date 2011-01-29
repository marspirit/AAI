#define ExtrasDialog2_IDD 2997
#define BRIEFINGSBOX 6000
disableSerialization;
private ["_type","_dlg","_string"];
hint "Diary updated";

_type = _this select 0;

_dlg = findDisplay ExtrasDialog2_IDD;
_string = ctrlText (_dlg displayCtrl BRIEFINGSBOX);

mcc_safe=mcc_safe + FORMAT ["_string='%1';
							 _type=%2;
							['briefing', [_string, _type]] call CBA_fnc_globalEvent;
							sleep 1;"								 
							,_string
							,_type
							];
["briefing", [_string, _type]] call CBA_fnc_globalEvent;