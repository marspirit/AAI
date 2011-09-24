#define FLY_HIGHT 6101
#define FAST_ROPE 6102 

private ["_point1","_convoy_wp1","_flyInHight","_landing"];

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	deletemarkerlocal "evac_marker1";
	deletemarkerlocal "evac_marker2";
	deletemarkerlocal "evac_marker3";
	
	_flyInHight =  evacFlyInHight_array select (lbCurSel FLY_HIGHT) select 1;
	evacFlyInHight_index = lbCurSel FLY_HIGHT;
	_landing = lbCurSel FAST_ROPE;  
	hint  "Left click on the map to add one WP";

	onMapSingleClick "point1 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp1 = createMarkerLocal ["evac_marker1",point1];
	_convoy_wp1 setMarkerTypeLocal "Dot";
	_convoy_wp1 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp1 setMarkertextLocal "1";

	_convoy_wp1 setMarkerColorLocal "ColorBlue";
	_point1 =getmarkerpos "evac_marker1";
	
	hint "Markers placed";
	if (mcc_capture_state) then
		{
		mcc_capture_var = mcc_capture_var + FORMAT ['
							["evac_move", [[%1], %2, %3]] call CBA_fnc_globalEvent;'
							,_point1
							,_flyInHight
							,_landing
							];
		} else
			{
			["evac_move", [[_point1], _flyInHight, _landing]] call CBA_fnc_globalEvent;
			};
	}	
		else { player globalchat "Access Denied"};
	};
