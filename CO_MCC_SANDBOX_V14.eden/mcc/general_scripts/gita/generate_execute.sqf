#define ExtrasDialog3_IDD 2996
#define GITA_SIZEX 7010
#define GITA_TEXT 7012
#define GITA_DAMAGE 7013 
#define GITA_STYLE 7014

#define BATTLEFIELD_RADIUS 7025

disableSerialization;
private ["_dlg", "_pos", "_radius", "_townDamage", "_townName", "_townStyle", "_type"];
_dlg = findDisplay ExtrasDialog3_IDD;

_type =  _this select 0; 
_pos =  _this select 1; 
switch (_type) do
	{
	   case 0:	//Gita (Town Generator)
	   { 
			_radius = lbCurSel GITA_SIZEX * 100;
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
				
		};
		
		case 1:	//Battlefield
		{ 
			_radius = zones_x select (lbCurSel BATTLEFIELD_RADIUS) select 1;
			if (mcc_capture_state) then
					{
						mcc_capture_var = mcc_capture_var + FORMAT ["
										[""battlefield"", [%1, %2]] call CBA_fnc_globalEvent;"
										,_pos
										,_radius
										];
					} else {
							["battlefield", [_pos, _radius]] call CBA_fnc_globalEvent;			
							mcc_safe = mcc_safe + FORMAT ["
														[""battlefield"", [%1, %2]] call CBA_fnc_globalEvent;"
														,_pos
														,_radius
														];
							};
		};
	};

