
//safe the zone size in the array for later use
mcc_zone_size set [mcc_zone_number,[mcc_zone_marker_X,mcc_zone_marker_Y]];

//obviously when we are loading there is no need to safe it again since that will influence the load process by double output
if !mcc_isloading then 
	{
		mcc_safe=mcc_safe + FORMAT ["
								  mcc_zone_number=%1;
								  mcc_zone_marker_X=%2;
								  mcc_zone_marker_Y=%3;
								  mcc_zone_markername='%4';
								  mcc_zone_size set [mcc_zone_number,[mcc_zone_marker_X,mcc_zone_marker_Y]];
								  "
								  
								,mcc_zone_number
								,mcc_zone_marker_X
								,mcc_zone_marker_Y
								,mcc_zone_markername							
								];
		hint format ["Click on map to create/update location of zone: %1....... ",mcc_zone_markername];
		onMapSingleClick "	mcc_markerposition = _pos; 
		                    
					        mcc_safe=mcc_safe +  FORMAT [""				
											  mcc_markerposition=%1;											  
											  script_handler = [0] execVM 'mcc\general_scripts\mcc_make_the_marker.sqf';
											  waitUntil {scriptDone script_handler};
											  ""											 										
											  ,_pos
											  ];
						
							deleteMarkerLocal mcc_zone_markername;					
							_marker = createMarkerLocal [mcc_zone_markername, _pos];
							_marker setMarkerShapeLocal ""RECTANGLE"";
							_marker setMarkerSizeLocal (mcc_zone_size select mcc_zone_number);
							mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";
							
							deleteMarkerLocal (format[""LABEL_%1"",mcc_zone_markername]);
							_markerlabel = createMarkerLocal [(format[""LABEL_%1"",mcc_zone_markername]), _pos];
							_markerlabel   setMarkerShapeLocal ""ICON"";        
							(format[""LABEL_%1"",mcc_zone_markername]) setMarkerTypeLocal ""join"";
							(format[""LABEL_%1"",mcc_zone_markername]) setMarkerTextLocal mcc_zone_markername;
							(format[""LABEL_%1"",mcc_zone_markername]) setMarkerColorLocal ""ColorRed"";

							
							mcc_zone_markposition = (getmarkerpos mcc_zone_markername);					
							mcc_zone_pos  set [mcc_zone_number,mcc_zone_markposition];
							
							mcc_isnewzone   		= true;
							nul=[0] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';
							
						
							
							onMapSingleClick """";
							nul=[0] execVM 'mcc\Pop_menu\mcc_ActivatePopupMenuViaAction.sqf';";
	}
else
	{

							deleteMarkerLocal mcc_zone_markername;					
							_marker = createMarkerLocal [mcc_zone_markername, mcc_markerposition];
							_marker setMarkerShapeLocal "RECTANGLE";
							_marker setMarkerSizeLocal (mcc_zone_size select mcc_zone_number);
							mcc_zone_markername	setMarkerColorLocal "ColorBlack";
							
							deleteMarkerLocal (format["LABEL_%1",mcc_zone_markername]);
							_markerlabel = createMarkerLocal [(format["LABEL_%1",mcc_zone_markername]), mcc_markerposition];
							_markerlabel   setMarkerShapeLocal "ICON";        
							(format["LABEL_%1",mcc_zone_markername]) setMarkerTypeLocal "join";
							(format["LABEL_%1",mcc_zone_markername]) setMarkerTextLocal mcc_zone_markername;
							(format["LABEL_%1",mcc_zone_markername]) setMarkerColorLocal "ColorRed";

							
							mcc_zone_markposition = (getmarkerpos mcc_zone_markername);					
							mcc_zone_pos  set [mcc_zone_number,mcc_zone_markposition];
							
							mcc_isnewzone   		= true;
							
	};

//safe the info cause ups makes marker info not valid because of disappear of marker




