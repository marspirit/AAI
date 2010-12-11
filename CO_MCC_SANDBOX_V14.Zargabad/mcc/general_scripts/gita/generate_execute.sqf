#define ExtrasDialog3_IDD 2996
#define GITA_SIZEX 7010
#define GITA_TEXT 7012
#define GITA_DAMAGE 7013 
#define GITA_STYLE 7014

disableSerialization;
private ["_dlg", "_pos", "_radius", "_townDamage", "_townName", "_townStyle"];
_dlg = findDisplay ExtrasDialog3_IDD;
_pos =  _this select 0; 
_radius = zones_x select (lbCurSel GITA_SIZEX) select 1;
_townDamage = if ((lbCurSel GITA_DAMAGE) > 0) then {((lbCurSel GITA_DAMAGE)+ 1)/10} else {0};
_townStyle = lbCurSel GITA_STYLE;
_townName = ctrlText (_dlg displayCtrl GITA_TEXT);

mcc_safe = mcc_safe + FORMAT ["
[""gita"", [%1, %2, %3, %4, ""%5""]] call CBA_fnc_globalEvent;"
,_pos
,_radius
,_townDamage
,_townStyle
,_townName
];

createmarkerlocal [_townName, _pos];	//create marker for MM
_townName setMarkerColorLocal "ColorBlue";
_townName setMarkerSizeLocal [_radius, _radius];
_townName setMarkerShapeLocal  "ELLIPSE";
_townName setMarkerBrushLocal  "CROSS";
["gita", [_pos, _radius, _townDamage, _townStyle, _townName]] call CBA_fnc_globalEvent;
			
