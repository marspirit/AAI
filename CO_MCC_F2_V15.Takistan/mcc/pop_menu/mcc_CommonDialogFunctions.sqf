// Desc: Common dialog scripts functions (especially for controls).
// By: Dr Eyeball
// Version: 1.1 (May 2007)
//-----------------------------------------------------------------------------
// Constants

//-----------------------------------------------------------------------------
// Control functions
//-----------------------------------------------------------------------------
/* 
disableSerialization;
Usage:
  _MyList =
  [
    ["Item 1", "Item Data 1"],
    ["Item 2", "Item Data 2"]
  ];
  -or-
  _MyList =
  [
    "Item 1",
    "Item 2"
  ];

  [IDC_ListBox1, _MyList] call Dlg_FillListBoxLists;
  [IDC_ListBox1, _MyList] call Dlg_FillListBoxLists;
*/
Dlg_FillListBoxLists =
{
  _idc2 = _this select 0;
  _DualList = _this select 1;
  
  lbClear _idc2;
  {
    _typeName = typeName _x;
    if (_typeName == "ARRAY") then
    {    
      _Item = _x select 0;
      _Data = _x select 1;
      
      _index = lbAdd [_idc2, _Item];
      lbSetData [_idc2, _index, _Data];
    }
    else
    {
      if (_typeName == "STRING") then
      {
        _Item = _x;
        
        _index = lbAdd [_idc2, _Item];
      };
    };
  } forEach _DualList;
  
  lbSetCurSel [_idc2, 0];
};
//-----------------------------------------------------------------------------
Dlg_PanMapBetweenTwoPositions =
{
  _IDD_display = _this select 0;
  _IDC_Map = _this select 1;
  _startPos1 = _this select 2;
  _endPos2 = _this select 3;
  
  _ctrl = _IDD_display displayctrl _IDC_Map;
  ctrlMapAnimClear _ctrl; // stops previous panning

  // [duration, zoom, pos]
  _ctrl ctrlmapanimadd [0.0, 1.00, _startPos1]; // show home base
  _ctrl ctrlmapanimadd [1.2, 1.00, _endPos2]; // show map location
  _ctrl ctrlmapanimadd [0.2, 0.30, _endPos2]; // zoom map location
  ctrlmapanimcommit _ctrl;
};
//-----------------------------------------------------------------------------
