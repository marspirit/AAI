#define FLY_HIGHT 6101

private ["_point1","_convoy_wp1","_flyInHight"];

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	deletemarkerlocal "evac_marker1";
	deletemarkerlocal "evac_marker2";
	deletemarkerlocal "evac_marker3";
	
	_flyInHight =  evacFlyInHight_array select (lbCurSel FLY_HIGHT) select 1;
	evacFlyInHight_index = lbCurSel FLY_HIGHT;
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
	["evac_move", [[_point1], _flyInHight, true]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};
