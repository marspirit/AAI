// Desc: A popup menu dialog
// By: Dr Eyeball
// Version: 1.1 (May 2007)
//-----------------------------------------------------------------------------
// Constants
//-----------------------------------------------------------------------------
// The following IDD & IDC variables should match their equivalents for the dialog (from "Dialogs\PopupMenuDialog.hpp")
disableSerialization;

PUM3_IDD_PopupMenuDialog = 390;

PUM3_IDC_Caption0 = 892;
PUM3_IDC_Caption1 = 893;
PUM3_IDC_Caption2 = 894;

PUM3_IDC_Button000 = 870;
PUM3_IDC_Button001 = 871;
PUM3_IDC_Button002 = 872;
PUM3_IDC_Button003 = 873;
PUM3_IDC_Button004 = 874;
PUM3_IDC_Button005 = 875;
PUM3_IDC_Button006 = 876;
PUM3_IDC_Button007 = 877;
PUM3_IDC_Button008 = 878;
PUM3_IDC_Button009 = 879;
PUM3_IDC_Button010 = 880;
PUM3_IDC_Button011 = 881;
PUM3_IDC_Button012 = 882;
PUM3_IDC_Button013 = 883;
PUM3_IDC_Button014 = 884;
PUM3_IDC_Button015 = 885;
PUM3_IDC_Button016 = 886;
PUM3_IDC_Button017 = 887;
PUM3_IDC_Button018 = 888;
PUM3_IDC_Button019 = 889;

PUM3_IDC_Button100 = 1870;
PUM3_IDC_Button101 = 1871;
PUM3_IDC_Button102 = 1872;
PUM3_IDC_Button103 = 1873;
PUM3_IDC_Button104 = 1874;
PUM3_IDC_Button105 = 1875;
PUM3_IDC_Button106 = 1876;
PUM3_IDC_Button107 = 1877;
PUM3_IDC_Button108 = 1878;
PUM3_IDC_Button109 = 1879;
PUM3_IDC_Button110 = 1880;
PUM3_IDC_Button111 = 1881;
PUM3_IDC_Button112 = 1882;
PUM3_IDC_Button113 = 1883;
PUM3_IDC_Button114 = 1884;
PUM3_IDC_Button115 = 1885;
PUM3_IDC_Button116 = 1886;
PUM3_IDC_Button117 = 1887;
PUM3_IDC_Button118 = 1888;
PUM3_IDC_Button119 = 1889;

PUM3_IDC_Button200 = 2870;
PUM3_IDC_Button201 = 2871;
PUM3_IDC_Button202 = 2872;
PUM3_IDC_Button203 = 2873;
PUM3_IDC_Button204 = 2874;
PUM3_IDC_Button205 = 2875;
PUM3_IDC_Button206 = 2876;
PUM3_IDC_Button207 = 2877;
PUM3_IDC_Button208 = 2878;
PUM3_IDC_Button209 = 2879;
PUM3_IDC_Button210 = 2880;
PUM3_IDC_Button211 = 2881;
PUM3_IDC_Button212 = 2882;
PUM3_IDC_Button213 = 2883;
PUM3_IDC_Button214 = 2884;
PUM3_IDC_Button215 = 2885;
PUM3_IDC_Button216 = 2886;
PUM3_IDC_Button217 = 2887;
PUM3_IDC_Button218 = 2888;
PUM3_IDC_Button219 = 2889;

PUM3_MenuControls0 = [
  PUM3_IDC_Caption0, 
  PUM3_IDC_Button000, 
  PUM3_IDC_Button001, 
  PUM3_IDC_Button002, 
  PUM3_IDC_Button003,
  PUM3_IDC_Button004,
  PUM3_IDC_Button005,
  PUM3_IDC_Button006,
  PUM3_IDC_Button007,
  PUM3_IDC_Button008,
  PUM3_IDC_Button009,
  PUM3_IDC_Button010, 
  PUM3_IDC_Button011, 
  PUM3_IDC_Button012, 
  PUM3_IDC_Button013,
  PUM3_IDC_Button014,
  PUM3_IDC_Button015,
  PUM3_IDC_Button016,
  PUM3_IDC_Button017,
  PUM3_IDC_Button018,
  PUM3_IDC_Button019
  ];
PUM3_MenuControls1 = [      
  PUM3_IDC_Caption1, 
  PUM3_IDC_Button100, 
  PUM3_IDC_Button101, 
  PUM3_IDC_Button102, 
  PUM3_IDC_Button103,
  PUM3_IDC_Button104,
  PUM3_IDC_Button105,
  PUM3_IDC_Button106,
  PUM3_IDC_Button107,
  PUM3_IDC_Button108,
  PUM3_IDC_Button109,
  PUM3_IDC_Button110, 
  PUM3_IDC_Button111, 
  PUM3_IDC_Button112, 
  PUM3_IDC_Button113,
  PUM3_IDC_Button114,
  PUM3_IDC_Button115,
  PUM3_IDC_Button116,
  PUM3_IDC_Button117,
  PUM3_IDC_Button118,
  PUM3_IDC_Button119
  ];
PUM3_MenuControls2 = [    
  PUM3_IDC_Caption2, 
  PUM3_IDC_Button200, 
  PUM3_IDC_Button201, 
  PUM3_IDC_Button202, 
  PUM3_IDC_Button203,
  PUM3_IDC_Button204,
  PUM3_IDC_Button205,
  PUM3_IDC_Button206,
  PUM3_IDC_Button207,
  PUM3_IDC_Button208,
  PUM3_IDC_Button209,
  PUM3_IDC_Button210, 
  PUM3_IDC_Button211, 
  PUM3_IDC_Button212, 
  PUM3_IDC_Button213,
  PUM3_IDC_Button214,
  PUM3_IDC_Button215,
  PUM3_IDC_Button216,
  PUM3_IDC_Button217,
  PUM3_IDC_Button218,
  PUM3_IDC_Button219
  ];
PUM3_MenuControlsList = [PUM3_MenuControls0, PUM3_MenuControls1, PUM3_MenuControls2];

PUM3_dlg_x = 0.05;
PUM3_dlg_y = 0.20;
PUM3_dlg_wid = 0.30;
PUM3_dlg_hgt = 0.9;

//-----------------------------------------------------------------------------
// Functions
//-----------------------------------------------------------------------------
PUM3_Exit =
{
  closeDialog PUM3_IDD_PopupMenuDialog;
};
//----------------------
PUM3_OnClose =
{
  _MarkerName = "m_MapClickCommandMenu";
  _MarkerName setMarkerType "Empty";
};
//----------------------
PUM3_MenuItem00 =
{
  call PUM3_Exit;
};
//----------------------
PUM3_MenuItem01 =
{
  call PUM3_Exit;
};
//----------------------
PUM3_MenuItem02 =
{
  call PUM3_Exit;
};
//----------------------
PUM3_MenuItem03 =
{
  call PUM3_Exit;
};
//----------------------
PUM3_HideMenus =
{
  _level = _this select 0;
  
  switch (_level) do
  {
    case 0: { { ctrlShow [_x, false] } forEach PUM3_MenuControls0+PUM3_MenuControls1+PUM3_MenuControls2 };
    case 1: { { ctrlShow [_x, false] } forEach PUM3_MenuControls1+PUM3_MenuControls2 };
    case 2: { { ctrlShow [_x, false] } forEach PUM3_MenuControls2 };
  };  
};
//----------------------
PUM3_ShowMenu =
{
  [
    _this,
    ["_Params", PUM3_Params]
  ] call PUM3_ProcessMenu;
};
//----------------------
PUM3_ClickButton =
{
  _IDC = _this select 0;  
  
  
  _MenuControls = [];
  if (_IDC in PUM3_MenuControls0) then { PUM3_Level = 1 };
  if (_IDC in PUM3_MenuControls1) then { PUM3_Level = 2 };
  if (_IDC in PUM3_MenuControls2) then { PUM3_Level = 3 };
  
  _MenuControls = PUM3_MenuControlsList select (PUM3_Level-1);
  [PUM3_Level] call PUM3_HideMenus;
    
  // restore color of all menu items in selected menu back to default text color
  {
    _ctrl = PUM3_display displayCtrl _x;
    _ctrl ctrlSetTextColor [1,1,1,1]; // Dlg_Color_white // Dlg_ColorScheme_3DControlText;
  } forEach _MenuControls;
  
  // mark selected menu item in special color
  _ctrl = PUM3_display displayCtrl _IDC;
  _ctrl ctrlSetTextColor [0.253906,0.410156,0.878906,1]; // Dlg_Color_RoyalBlue // Dlg_ColorScheme_CaptionBackground;
  //_ctrl ctrlSetBackgroundColor [1, 0, 0, 1]; // doesn't work
};
//----------------------
PUM3_ReplaceCommonParams =
{
  _action = _this select 0;

  _MapClickParams = ["MapClickParams", PUM3_Params, []] call fn_GetParamByName;
  //player sidechat format["MapClickParams=%1", _MapClickParams]; // debug

  _MapClickPos = ["Pos", _MapClickParams, [0,0,0]] call fn_GetParamByName;
  _MapClickUnits = ["Units", _MapClickParams, []] call fn_GetParamByName;
  _MapClickShift = ["Shift", _MapClickParams, false] call fn_GetParamByName;
  _MapClickAlt = ["Alt", _MapClickParams, false] call fn_GetParamByName;
  _MapClickPosGridRef = [_MapClickPos] call fn_GridRefCoords;

  _CurrentWaypoints = waypoints player;
  _CurrentWaypointPos = [0,0,0];
  // TODO: Since there is no GetCurrentWaypoint command yet, we'll have to assume which one is the current one.
  if (count _CurrentWaypoints > 1) then 
  {
    _CurrentWaypoint = _CurrentWaypoints select 1; // TODO: Change this to GetCurrentWaypoint when available or manually maintained global variable.
    _CurrentWaypointPos = WaypointPosition _CurrentWaypoint;
    //player groupChat format["Curr WP=%1", _CurrentWaypointPos]; // debug
  };
  _CurrentWaypointGridRef = [_CurrentWaypointPos] call fn_GridRefCoords;
  
  _MapOrPlayerPos = _MapClickPos;
  if (format["%1", _MapOrPlayerPos] == "[0,0,0]") then { _MapOrPlayerPos = position player };
  _MapOrPlayerGridRef = [_MapOrPlayerPos] call fn_GridRefCoords;

  _action = format[_action, 
    /* %1 */ position player,
    /* %2 */ [position player] call fn_GridRefCoords,
    /* %3 */ _MapClickPos, 
    /* %4 */ _MapClickPosGridRef,
    /* %5 */ _MapOrPlayerPos,
    /* %6 */ _MapOrPlayerGridRef,
    /* %7 */ _CurrentWaypointPos,
    /* %8 */ _CurrentWaypointGridRef,
    ""
  ];
  if (_action == "-") then {
    _action = "------------------------------------------------------------" };
  _action;
};
//----------------------
PUM3_ProcessMenu =
{
  _MenuName = ["MenuName", _this, "MainMenu"] call fn_GetParamByName;
  _Params = ["_Params", _this, []] call fn_GetParamByName;
  //player sidechat format["ProcessMenu params=%1", _Params]; // debug
  
  _Menu = [_MenuName, _Params, []] call fn_GetParamByName;

  _MenuControls = PUM3_MenuControlsList select PUM3_Level;

  // Setup caption
  _IDC_CaptionControl = _MenuControls select 0;
  _caption = ["Caption", _Menu, "Menu"] call fn_GetParamByName;
  _caption = [_caption] call PUM3_ReplaceCommonParams;
  ctrlSetText [_IDC_CaptionControl, _caption];
  ctrlShow [_IDC_CaptionControl, true];

  // Setup menu items
  _items = ["Items", _Menu, "Menu"] call fn_GetParamByName;
  _i = 0;
  {
    _IDC = _x;
    _ctrl = PUM3_display displayCtrl _IDC;

    /*
    // set new X offset pos
    _pos = ctrlPosition _ctrl;
    _newX = PUM3_dlg_x + (PUM3_dlg_wid * PUM3_Level);
    _ctrl ctrlSetPosition [_newX, _pos select 1, _pos select 2, _pos select 3];
    //player sidechat format["_x=%1 %2", _i, _items];
    */

    if (_i > 0) then
    {
      ctrlShow [_IDC, false];
      _ctrl ctrlSetTextColor [1,1,1,1]; // Dlg_Color_white // Dlg_ColorScheme_3DControlText;
    };
    
    // set menu item caption and action
    if (typeName _items == "ARRAY") then
    {
      if (_i > 0 && count _items >= _i) then
      {
        _item = _items select (_i - 1);
        //player sidechat format["_Item %1=%2", _i, _Item]; // debug
        
        if (count _item > 0) then
        {
          //if (_i == 1) then { ctrlSetFocus _ctrl };
        
          _caption = ["Item", _item, ""] call fn_GetParamByName;
          _separator = (_caption == "-");
          _caption = [_caption] call PUM3_ReplaceCommonParams;
          ctrlSetText [_IDC, _caption];
          //player sidechat format["_cap %1=%2", _i, _caption]; // debug

          _SubMenuName = ["SubMenu", _item, ""] call fn_GetParamByName;
          //player sidechat format["_SubMenuName %1='%2'=%3", _i, _SubMenuName, _Item]; // debug
          _Close = false;//["Close", _item, true] call fn_GetParamByName;
          if (_SubMenuName != "") then // SubMenu overrides Close
          { 
            _Close = false 
          };

          _action = ["Action", _item, ""] call fn_GetParamByName;
          if (typeName _action == "CODE") then
          {
            _action = format["%1", _action];
          };
          _action = format["[%1] call PUM3_ClickButton; %2", _IDC, _action];
          if (_SubMenuName != "") then 
          {
            _action = format["%2; ['MenuName', '%1'] call PUM3_ShowMenu", _SubMenuName, _action];
            //player sidechat format["_SubMenuName=%1; %2", _SubMenuName, _action]; // debug
          };
          if (_Close) then
          {
            _action = format["%1; [] call PUM3_Exit", _action];
          };

          _action = [_action] call PUM3_ReplaceCommonParams;

          buttonSetAction [_IDC, _action];

          //player sidechat format["_act %1=%2=%3", _i, typeName _action, _action]; // debug

          _Default = ["Default", _item, false] call fn_GetParamByName;
          if (_Default) then
          {
            ctrlSetFocus _ctrl; // doesn't work for buttons?
          };
          
          ctrlShow [_IDC, true];
          ctrlEnable [_IDC, true];
          
          _Enabled = ["Enabled", _item, true] call fn_GetParamByName;
          if (_separator) then { _Enabled = false };
          ctrlEnable [_IDC, _Enabled];

          _Hint = ["Hint", _item, ""] call fn_GetParamByName;
          if (_Hint != "") then 
          {
            _ctrl ctrlSetToolTip _Hint;
          };
        };
      };
    };
    _i = _i + 1;

    _ctrl ctrlCommit 0; // commits ctrlSetPosition
  } forEach _MenuControls;
};
//----------------------
PUM3_Main =
{
  //_Params = _this;
  //player sidechat format["Start params=%1", _Params]; // debug
  PUM3_Level = 0;
  [0] call PUM3_HideMenus;

  ["MenuName", "MainMenu"] call PUM3_ShowMenu;

  PUM3_display displaySetEventHandler["Unload", "call PUM3_OnClose"];

  _MapClickParams = ["MapClickParams", PUM3_Params, []] call fn_GetParamByName;
  _MapClickPos = ["Pos", _MapClickParams, position player] call fn_GetParamByName;
  _MarkerName = "m_MapClickCommandMenu";

  _marker = createMarkerLocal [_MarkerName, _MapClickPos];
  _MarkerName setMarkerShape "ICON";
  _MarkerName setMarkerType "dot";
  _MarkerName setMarkerText "";
  _MarkerName setMarkerColor "ColorBlue";
  _MarkerName setMarkerSize [0.3, 0.3];
  _MarkerName setMarkerPos _MapClickPos;
};
//-----------------------------------------------------------------------------
// Init
//-----------------------------------------------------------------------------

_ok = createDialog "PUM3_PopupMenuDialog";
if !(_ok) exitWith { hint "createDialog failed" };

//PUM3_display = findDisplay PUM3_IDD_PopupMenuDialog;
_closeDialog = format["closeDialog %1", PUM3_IDD_PopupMenuDialog];

PUM3_Params = _this;
//["PopupMenu.sqf", PUM3_Params] call fn_DebugAppend; // debug
PUM3_Params call PUM3_Main;
