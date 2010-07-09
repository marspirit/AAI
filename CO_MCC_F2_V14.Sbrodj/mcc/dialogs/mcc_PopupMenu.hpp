// Desc: A popup menu dialog
// By: Dr Eyeball
// Version: 1.1 (May 2007)
//-----------------------------------------------------------------------------
// PUM3_ is the unique prefix associated with all unique classes for this dialog.

//-----------------------------------------------------------------------------
// IDD's & IDC's
//-----------------------------------------------------------------------------

#define PUM3_IDD_PopupMenuDialog 390

#define PUM3_IDC_Caption0 892
#define PUM3_IDC_Caption1 893
#define PUM3_IDC_Caption2 894

#define PUM3_IDC_Button000 870
#define PUM3_IDC_Button001 871
#define PUM3_IDC_Button002 872
#define PUM3_IDC_Button003 873
#define PUM3_IDC_Button004 874
#define PUM3_IDC_Button005 875
#define PUM3_IDC_Button006 876
#define PUM3_IDC_Button007 877
#define PUM3_IDC_Button008 878
#define PUM3_IDC_Button009 879
#define PUM3_IDC_Button010 880
#define PUM3_IDC_Button011 881
#define PUM3_IDC_Button012 882
#define PUM3_IDC_Button013 883
#define PUM3_IDC_Button014 884
#define PUM3_IDC_Button015 885
#define PUM3_IDC_Button016 886
#define PUM3_IDC_Button017 887
#define PUM3_IDC_Button018 888
#define PUM3_IDC_Button019 889

#define PUM3_IDC_Button100 1870
#define PUM3_IDC_Button101 1871
#define PUM3_IDC_Button102 1872
#define PUM3_IDC_Button103 1873
#define PUM3_IDC_Button104 1874
#define PUM3_IDC_Button105 1875
#define PUM3_IDC_Button106 1876
#define PUM3_IDC_Button107 1877
#define PUM3_IDC_Button108 1878
#define PUM3_IDC_Button109 1879
#define PUM3_IDC_Button110 1880
#define PUM3_IDC_Button111 1881
#define PUM3_IDC_Button112 1882
#define PUM3_IDC_Button113 1883
#define PUM3_IDC_Button114 1884
#define PUM3_IDC_Button115 1885
#define PUM3_IDC_Button116 1886
#define PUM3_IDC_Button117 1887
#define PUM3_IDC_Button118 1888
#define PUM3_IDC_Button119 1889

#define PUM3_IDC_Button200 2870
#define PUM3_IDC_Button201 2871
#define PUM3_IDC_Button202 2872
#define PUM3_IDC_Button203 2873
#define PUM3_IDC_Button204 2874
#define PUM3_IDC_Button205 2875
#define PUM3_IDC_Button206 2876
#define PUM3_IDC_Button207 2877
#define PUM3_IDC_Button208 2878
#define PUM3_IDC_Button209 2879
#define PUM3_IDC_Button210 2880
#define PUM3_IDC_Button211 2881
#define PUM3_IDC_Button212 2882
#define PUM3_IDC_Button213 2883
#define PUM3_IDC_Button214 2884
#define PUM3_IDC_Button215 2885
#define PUM3_IDC_Button216 2886
#define PUM3_IDC_Button217 2887
#define PUM3_IDC_Button218 2888
#define PUM3_IDC_Button219 2889

#define PUM3_dlg_x 0.05
#define PUM3_dlg_y 0.20
#define PUM3_dlg_wid 0.30
#define PUM3_dlg_hgt 0.9

//-----------------------------------------------------------------------------
// Personalisation - Custom modifications to the standard control classes
//-----------------------------------------------------------------------------

class PUM3_Caption: Dlg_Caption
{
  y = PUM3_dlg_y;
  w = PUM3_dlg_wid;
  text = "Popup Menu";
};

class PUM3_MenuItem: RscButton
{
  style = ST_LEFT;

  sizeEx = Dlg_TEXTHGT * PUM3_dlg_hgt;
  //size = Dlg_TEXTHGT;
  font = "Zeppelin32";
  //colorDisabled[] = {Dlg_Color_Gray_7, 0.7};
  colorBackgroundDisabled[] = {Dlg_ColorScheme_3DControlBackground,1};

  x = PUM3_dlg_x;
  y = PUM3_dlg_y;
  w = PUM3_dlg_wid;
  h = Dlg_TEXTHGT * PUM3_dlg_hgt;

  text = "";
  action = "";
};
class PUM3_MenuItem0: PUM3_MenuItem
{
  x = PUM3_dlg_x;
};
class PUM3_MenuItem1: PUM3_MenuItem
{
  x = PUM3_dlg_x + (PUM3_dlg_wid * 1);
};
class PUM3_MenuItem2: PUM3_MenuItem
{
  x = PUM3_dlg_x + (PUM3_dlg_wid * 2);
};

//-----------------------------------------------------------------------------
// Main dialog
//-----------------------------------------------------------------------------
class PUM3_PopupMenuDialog
{
  idd = PUM3_IDD_PopupMenuDialog;

  movingEnable = true;
  controlsBackground[] = { };

  //---------------------------------------------
  objects[] = 
  { 
  };
  
  controls[] = 
  {
    PUM3_Caption0,
    PUM3_Caption1,
    PUM3_Caption2,
    
    PUM3_MenuItem000,
    PUM3_MenuItem001,
    PUM3_MenuItem002,
    PUM3_MenuItem003,
    PUM3_MenuItem004,
    PUM3_MenuItem005,
    PUM3_MenuItem006,
    PUM3_MenuItem007,
    PUM3_MenuItem008,
    PUM3_MenuItem009,
    PUM3_MenuItem010,
    PUM3_MenuItem011,
    PUM3_MenuItem012,
    PUM3_MenuItem013,
    PUM3_MenuItem014,
    PUM3_MenuItem015,
    PUM3_MenuItem016,
    PUM3_MenuItem017,
    PUM3_MenuItem018,
    PUM3_MenuItem019,
    
    PUM3_MenuItem100,
    PUM3_MenuItem101,
    PUM3_MenuItem102,
    PUM3_MenuItem103,
    PUM3_MenuItem104,
    PUM3_MenuItem105,
    PUM3_MenuItem106,
    PUM3_MenuItem107,
    PUM3_MenuItem108,
    PUM3_MenuItem109,
    PUM3_MenuItem110,
    PUM3_MenuItem111,
    PUM3_MenuItem112,
    PUM3_MenuItem113,
    PUM3_MenuItem114,
    PUM3_MenuItem115,
    PUM3_MenuItem116,
    PUM3_MenuItem117,
    PUM3_MenuItem118,
    PUM3_MenuItem119,
    
    PUM3_MenuItem200,
    PUM3_MenuItem201,
    PUM3_MenuItem202,
    PUM3_MenuItem203,
    PUM3_MenuItem204,
    PUM3_MenuItem205,
    PUM3_MenuItem206,
    PUM3_MenuItem207,
    PUM3_MenuItem208,
    PUM3_MenuItem209,
    PUM3_MenuItem210,
    PUM3_MenuItem211,
    PUM3_MenuItem212,
    PUM3_MenuItem213,
    PUM3_MenuItem214,
    PUM3_MenuItem215,
    PUM3_MenuItem216,
    PUM3_MenuItem217,
    PUM3_MenuItem218,
    PUM3_MenuItem219
  };
  //---------------------------------------------
  // Controls
  class PUM3_Caption0: PUM3_Caption { idc = PUM3_IDC_Caption0; x	= PUM3_dlg_x; y = PUM3_dlg_y; };
  class PUM3_Caption1: PUM3_Caption { idc = PUM3_IDC_Caption1; x = PUM3_dlg_x + (PUM3_dlg_wid * 1); y = PUM3_dlg_y+Dlg_CONTROLHGT; };
  class PUM3_Caption2: PUM3_Caption { idc = PUM3_IDC_Caption2; x = PUM3_dlg_x + (PUM3_dlg_wid * 2); y = PUM3_dlg_y+(2*Dlg_CONTROLHGT); };
  //---------------------------------------------
  // buttons - menu 0
  class PUM3_MenuItem000: PUM3_MenuItem0 { idc = PUM3_IDC_Button000; y = 0*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem001: PUM3_MenuItem0 { idc = PUM3_IDC_Button001; y = 1*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem002: PUM3_MenuItem0 { idc = PUM3_IDC_Button002; y = 2*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem003: PUM3_MenuItem0 { idc = PUM3_IDC_Button003; y = 3*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem004: PUM3_MenuItem0 { idc = PUM3_IDC_Button004; y = 4*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem005: PUM3_MenuItem0 { idc = PUM3_IDC_Button005; y = 5*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem006: PUM3_MenuItem0 { idc = PUM3_IDC_Button006; y = 6*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem007: PUM3_MenuItem0 { idc = PUM3_IDC_Button007; y = 7*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem008: PUM3_MenuItem0 { idc = PUM3_IDC_Button008; y = 8*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem009: PUM3_MenuItem0 { idc = PUM3_IDC_Button009; y = 9*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem010: PUM3_MenuItem0 { idc = PUM3_IDC_Button010; y = 10*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem011: PUM3_MenuItem0 { idc = PUM3_IDC_Button011; y = 11*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem012: PUM3_MenuItem0 { idc = PUM3_IDC_Button012; y = 12*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem013: PUM3_MenuItem0 { idc = PUM3_IDC_Button013; y = 13*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem014: PUM3_MenuItem0 { idc = PUM3_IDC_Button014; y = 14*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem015: PUM3_MenuItem0 { idc = PUM3_IDC_Button015; y = 15*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem016: PUM3_MenuItem0 { idc = PUM3_IDC_Button016; y = 16*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem017: PUM3_MenuItem0 { idc = PUM3_IDC_Button017; y = 17*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem018: PUM3_MenuItem0 { idc = PUM3_IDC_Button018; y = 18*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  class PUM3_MenuItem019: PUM3_MenuItem0 { idc = PUM3_IDC_Button019; y = 19*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + Dlg_CONTROLHGT; };
  //---------------------------------------------
  // buttons - menu 1
  class PUM3_MenuItem100: PUM3_MenuItem1 { idc = PUM3_IDC_Button100; y = 0*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem101: PUM3_MenuItem1 { idc = PUM3_IDC_Button101; y = 1*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem102: PUM3_MenuItem1 { idc = PUM3_IDC_Button102; y = 2*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem103: PUM3_MenuItem1 { idc = PUM3_IDC_Button103; y = 3*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem104: PUM3_MenuItem1 { idc = PUM3_IDC_Button104; y = 4*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem105: PUM3_MenuItem1 { idc = PUM3_IDC_Button105; y = 5*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem106: PUM3_MenuItem1 { idc = PUM3_IDC_Button106; y = 6*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem107: PUM3_MenuItem1 { idc = PUM3_IDC_Button107; y = 7*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem108: PUM3_MenuItem1 { idc = PUM3_IDC_Button108; y = 8*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem109: PUM3_MenuItem1 { idc = PUM3_IDC_Button109; y = 9*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem110: PUM3_MenuItem1 { idc = PUM3_IDC_Button110; y = 10*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem111: PUM3_MenuItem1 { idc = PUM3_IDC_Button111; y = 11*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem112: PUM3_MenuItem1 { idc = PUM3_IDC_Button112; y = 12*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem113: PUM3_MenuItem1 { idc = PUM3_IDC_Button113; y = 13*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem114: PUM3_MenuItem1 { idc = PUM3_IDC_Button114; y = 14*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem115: PUM3_MenuItem1 { idc = PUM3_IDC_Button115; y = 15*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem116: PUM3_MenuItem1 { idc = PUM3_IDC_Button116; y = 16*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem117: PUM3_MenuItem1 { idc = PUM3_IDC_Button117; y = 17*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem118: PUM3_MenuItem1 { idc = PUM3_IDC_Button118; y = 18*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  class PUM3_MenuItem119: PUM3_MenuItem1 { idc = PUM3_IDC_Button119; y = 19*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (2*Dlg_CONTROLHGT); };
  //---------------------------------------------
  // buttons - menu 2
  class PUM3_MenuItem200: PUM3_MenuItem2 { idc = PUM3_IDC_Button200; y = 0*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem201: PUM3_MenuItem2 { idc = PUM3_IDC_Button201; y = 1*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem202: PUM3_MenuItem2 { idc = PUM3_IDC_Button202; y = 2*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem203: PUM3_MenuItem2 { idc = PUM3_IDC_Button203; y = 3*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem204: PUM3_MenuItem2 { idc = PUM3_IDC_Button204; y = 4*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem205: PUM3_MenuItem2 { idc = PUM3_IDC_Button205; y = 5*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem206: PUM3_MenuItem2 { idc = PUM3_IDC_Button206; y = 6*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem207: PUM3_MenuItem2 { idc = PUM3_IDC_Button207; y = 7*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem208: PUM3_MenuItem2 { idc = PUM3_IDC_Button208; y = 8*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem209: PUM3_MenuItem2 { idc = PUM3_IDC_Button209; y = 9*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem210: PUM3_MenuItem2 { idc = PUM3_IDC_Button210; y = 10*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem211: PUM3_MenuItem2 { idc = PUM3_IDC_Button211; y = 11*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem212: PUM3_MenuItem2 { idc = PUM3_IDC_Button212; y = 12*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem213: PUM3_MenuItem2 { idc = PUM3_IDC_Button213; y = 13*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem214: PUM3_MenuItem2 { idc = PUM3_IDC_Button214; y = 14*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem215: PUM3_MenuItem2 { idc = PUM3_IDC_Button215; y = 15*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem216: PUM3_MenuItem2 { idc = PUM3_IDC_Button216; y = 16*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem217: PUM3_MenuItem2 { idc = PUM3_IDC_Button217; y = 17*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem218: PUM3_MenuItem2 { idc = PUM3_IDC_Button218; y = 18*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  class PUM3_MenuItem219: PUM3_MenuItem2 { idc = PUM3_IDC_Button219; y = 19*(Dlg_TEXTHGT * PUM3_dlg_hgt) + PUM3_dlg_y + (3*Dlg_CONTROLHGT); };
  //---------------------------------------------
};
