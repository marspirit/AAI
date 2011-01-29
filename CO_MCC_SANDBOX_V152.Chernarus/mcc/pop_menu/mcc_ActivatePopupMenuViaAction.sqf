// Desc: Activate popup menu via Action menu
//-----------------------------------------------------------------------------
nul=[
  ["ActionParams", 
    [
      ["Unit", _this select 0],
      ["Caller", _this select 1],
      ["ID", _this select 2],
      ["Params", _this select 3]
    ]
  ] 
] execVM "mcc\pop_menu\mcc_CreatePopupMenu.sqf";
