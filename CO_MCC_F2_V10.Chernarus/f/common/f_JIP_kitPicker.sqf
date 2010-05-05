#define DLG (uiNamespace getVariable "KitPick_Dlg")
#define COMBO (uiNamespace getVariable "KitPick_Combo")
#define USEBUTTON (uiNamespace getVariable "KitPick_UseBtn")

KitPickInit =
{
    uiNamespace setVariable ["KitPick_Dlg", _this select 0];
    uiNamespace setVariable ["KitPick_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["KitPick_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;

    private "_idx";
    _idx = COMBO lbAdd "Platoon Commander"; COMBO lbSetData [_idx, "pltco"];
    _idx = COMBO lbAdd "Platoon Sgt."; COMBO lbSetData [_idx, "pltsgt"];
    _idx = COMBO lbAdd "Platoon Medic"; COMBO lbSetData [_idx, "pltm"];
    _idx = COMBO lbAdd "Platoon Rifleman"; COMBO lbSetData [_idx, "pltr"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Squad Leader"; COMBO lbSetData [_idx, "sl"];
    _idx = COMBO lbAdd "Medic"; COMBO lbSetData [_idx, "m"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Fire Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Automatic Rifleman"; COMBO lbSetData [_idx, "ar"];
    _idx = COMBO lbAdd "Asst. Automatic Rifleman"; COMBO lbSetData [_idx, "aar"];
    _idx = COMBO lbAdd "Rifleman"; COMBO lbSetData [_idx, "r"];
    _idx = COMBO lbAdd "Rifleman (AT)"; COMBO lbSetData [_idx, "rat"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Med. MG Gunner"; COMBO lbSetData [_idx, "mmgg"];
    _idx = COMBO lbAdd "Med. MG A-Gunner"; COMBO lbSetData [_idx, "mmgag"];
    _idx = COMBO lbAdd "Med. MG Ammo Man"; COMBO lbSetData [_idx, "mmgam"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Heavy MG Gunner"; COMBO lbSetData [_idx, "hmgg"];
    _idx = COMBO lbAdd "Heavy MG "; COMBO lbSetData [_idx, "hmgag"];
    _idx = COMBO lbAdd "Heavy MG A-Gunner"; COMBO lbSetData [_idx, "hmgam"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Med. AT Gunner"; COMBO lbSetData [_idx, "matg"];
    _idx = COMBO lbAdd "Med. AT A-Gunner"; COMBO lbSetData [_idx, "matag"];
    _idx = COMBO lbAdd "Med. AT Ammo Man"; COMBO lbSetData [_idx, "matam"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Heavy AT Gunner"; COMBO lbSetData [_idx, "hatg"];
    _idx = COMBO lbAdd "Heavy AT A-Gunner"; COMBO lbSetData [_idx, "hatag"];
    _idx = COMBO lbAdd "Heavy AT Ammo Man"; COMBO lbSetData [_idx, "hatam"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Sniper"; COMBO lbSetData [_idx, "sn"];
    _idx = COMBO lbAdd "Spotter"; COMBO lbSetData [_idx, "sp"];

    _sel = player getVariable "KitPicker_Selection";
    if (!isNil '_sel') then
    {
        COMBO lbSetCurSel _sel;
    };
};

KitPicker_Pick =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {};

    _data = COMBO lbData _idx;
    if (_data == "") exitWith {};

    closeDialog 0;
    player setVariable ["f_var_JIP_loadout", _data];
    player setVariable ["KitPicker_Selection", _idx];
    f_var_JIP_state = 3;
};

KitPicker_OnSelChanged =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbData _idx;
    if (_data == "") exitWith
    {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
