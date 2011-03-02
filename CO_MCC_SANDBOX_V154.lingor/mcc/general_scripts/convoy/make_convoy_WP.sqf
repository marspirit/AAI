#define CONVOY_CAR1 5001
#define CONVOY_CAR2 5002
#define CONVOY_CAR3 5003
#define CONVOY_CAR4 5004
#define CONVOY_CAR5 5005
#define CONVOY_CARHVT 5006
#define CONVOY_HVT 5007
 private ["_convoy_wp1","_point1","_convoy_wp2","_point2","_convoy_wp3","_point3","_convoy_wp4","_point4","_convoy_wp5","_point5"];
if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	deletemarkerlocal "marker1";	//delete precious markers
	deletemarkerlocal "marker2";
	deletemarkerlocal "marker3";
	deletemarkerlocal "marker4";
	deletemarkerlocal "marker5";
	
	convoy_car1 = [(U_GEN_CAR select (lbCurSel CONVOY_CAR1)) select 1];	//first lets read the cars
	convoy_car2 = [(U_GEN_CAR select (lbCurSel CONVOY_CAR2)) select 1];
	convoy_car3 = [(U_GEN_CAR select (lbCurSel CONVOY_CAR3)) select 1];
	convoy_car4 = [(U_GEN_CAR select (lbCurSel CONVOY_CAR4)) select 1];
	convoy_car5 = [(U_GEN_CAR select (lbCurSel CONVOY_CAR5)) select 1];
	vip = [(convoyHVT select (lbCurSel CONVOY_HVT)) select 1];
	vipCar = [(convoyHVTcar select (lbCurSel CONVOY_CARHVT)) select 1];

	convoyCar1Index = lbCurSel CONVOY_CAR1;					//Save the indexes
	convoyCar2Index = lbCurSel CONVOY_CAR2;
	convoyCar3Index = lbCurSel CONVOY_CAR3;
	convoyCar4Index = lbCurSel CONVOY_CAR4;
	convoyCar5Index = lbCurSel CONVOY_CAR5;
	convoyHVTIndex = lbCurSel CONVOY_HVT;
	convoyHVTCarIndex = lbCurSel CONVOY_CARHVT;
	
	hint  "Left click on the map to put start position for the convy";

	onMapSingleClick "point1 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp1 = createMarkerLocal ["marker1",point1];
	_convoy_wp1 setMarkerTypeLocal "Dot";
	_convoy_wp1 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp1 setMarkertextLocal "Start";

	_convoy_wp1 setMarkerColorLocal "ColorredAlpha";
	_point1 =getmarkerpos "marker1";
	sleep 0.5;
	
	hint  "Left click on the map to put first convoy point";

	onMapSingleClick "point2 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp2 = createMarkerLocal ["marker2",point2];
	_convoy_wp2 setMarkerTypeLocal "Dot";
	_convoy_wp2 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp2 setMarkertextLocal "1";

	_convoy_wp2 setMarkerColorLocal "ColorredAlpha";
	_point2 =getmarkerpos "marker2";
	sleep 0.5;
	
	hint  "Left click on the map to put second convoy point";

	onMapSingleClick "point3 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp3 = createMarkerLocal ["marker3",point3];
	_convoy_wp3 setMarkerTypeLocal "Dot";
	_convoy_wp3 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp3 setMarkertextLocal "2";

	_convoy_wp3 setMarkerColorLocal "ColorredAlpha";
	_point3 =getmarkerpos "marker3";
	sleep 0.5;
	
	hint  "Left click on the map to put third convoy point";

	onMapSingleClick "point4 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp4 = createMarkerLocal ["marker4",point4];
	_convoy_wp4 setMarkerTypeLocal "Dot";
	_convoy_wp4 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp4 setMarkertextLocal "3";

	_convoy_wp4 setMarkerColorLocal "ColorredAlpha";
	_point4 =getmarkerpos "marker4";
	sleep 0.5;
	
	hint  "Left click on the map to put the last convoy point";

	onMapSingleClick "point5 = _pos;
	click = true;
	onMapSingleClick """";" ;
		
	waitUntil {(click)};
	click = false;
	_convoy_wp5 = createMarkerLocal ["marker5",point5];
	_convoy_wp5 setMarkerTypeLocal "Dot";
	_convoy_wp5 setMarkerSizeLocal [0.5, 0.5];
	_convoy_wp5 setMarkertextLocal "End";

	_convoy_wp5 setMarkerColorLocal "ColorredAlpha";
	_point5 =getmarkerpos "marker5";
	sleep 0.5;
	
	if (mcc_capture_state) then
		{
		hint "Convoy captured";
		mcc_capture_var = mcc_capture_var + FORMAT ["
								point2 =%7;
								point3 =%8;
								point4 =%9;
								point5 =%10;
								vip = %12;
							  [""place_convoy"", [%1 select 0, %2 select 0, %3 select 0, %4 select 0, %5 select 0, %6, %7, %8, %9, %10, %11 select 0, %12 select 0, %13 select 0]] call CBA_fnc_globalEvent;
							   "								 
							  , convoy_car1
							  , convoy_car2
							  , convoy_car3
							  , convoy_car4
							  , convoy_car5
							  , _point1
							  , _point2
							  , _point3
							  , _point4
							  , _point5
							  , [mcc_faction]
							  , vip
							  , vipCar
							  ];
		} else {
			hint "Convoy placed";
			["place_convoy", [convoy_car1 select 0, convoy_car2 select 0, convoy_car3 select 0, convoy_car4 select 0, convoy_car5 select 0, _point1, _point2, _point3, _point4, _point5, [mcc_faction] select 0, vip select 0, vipCar select 0]] call CBA_fnc_globalEvent;
			mcc_safe = mcc_safe + FORMAT ["
									point2 =%7;
									point3 =%8;
									point4 =%9;
									point5 =%10;
									vip = %12;
								    [""place_convoy"", [%1 select 0, %2 select 0, %3 select 0, %4 select 0, %5 select 0, %6, %7, %8, %9, %10, %11 select 0, %12 select 0, %13 select 0]] call CBA_fnc_globalEvent;
								   sleep 1;
								  "								 
								  , convoy_car1
								  , convoy_car2
								  , convoy_car3
								  , convoy_car4
								  , convoy_car5
								  , _point1
								  , _point2
								  , _point3
								  , _point4
								  , _point5
								  , [mcc_faction]
								  , vip
								  , vipCar
								  ];
					};
	}	
		else { player globalchat "Access Denied"};
	};