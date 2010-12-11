#define FLY_HIGHT 6101
#define FAST_ROPE 6102 

private ["_point1", "_point2", "_point3","_convoy_wp1","_convoy_wp2","_convoy_wp3","_flyInHight","_landing"];

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	deletemarkerlocal "evac_marker1";
	deletemarkerlocal "evac_marker2";
	deletemarkerlocal "evac_marker3";
	
	_flyInHight =  evacFlyInHight_array select (lbCurSel FLY_HIGHT) select 1; 
	evacFlyInHight_index = lbCurSel FLY_HIGHT;
	if (lbCurSel FAST_ROPE == 0) then {_landing = true} else {_landing = false}; 
	hint  "Left click on the map to put 1st WP";

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
	sleep 0.5;
	
	hint  "Left click on the map to put 2nd WP";

	onMapSingleClick "point2 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp2 = createMarkerLocal ["evac_marker2",point2];
	_convoy_wp2 setMarkerTypeLocal "Dot";
	_convoy_wp2 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp2 setMarkertextLocal "2";

	_convoy_wp2 setMarkerColorLocal "ColorBlue";
	_point2 =getmarkerpos "evac_marker2";
	sleep 0.5;
	
	hint  "Left click on the map to put 3rd WP";

	onMapSingleClick "point3 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp3 = createMarkerLocal ["evac_marker3",point3];
	_convoy_wp3 setMarkerTypeLocal "Dot";
	_convoy_wp3 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp3 setMarkertextLocal "3";

	_convoy_wp3 setMarkerColorLocal "ColorBlue";
	_point3 =getmarkerpos "evac_marker3";
	sleep 0.5;
		
	hint "Markers placed";
	["evac_move", [[_point1, _point2, _point3], _flyInHight, _landing]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};
