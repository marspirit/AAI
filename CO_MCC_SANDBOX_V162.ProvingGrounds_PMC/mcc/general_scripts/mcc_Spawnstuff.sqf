#define DEBUG
private ["_ar","_diaryrecord","_behavior"];

//time to request something so lets number it
mcc_request=mcc_request+1;

//safe that string man!
if (mcc_capture_state) then
	{
		hint "Action captured";
		if (mcc_spawntype == "GROUP") then 
			{
				mcc_capture_var=mcc_capture_var + FORMAT ["
								  mcc_spawntype='%1';
								  mcc_classtype='%2';
								  mcc_isnewzone=%3;
								  mcc_spawnwithcrew=%4;
								  mcc_spawnname='%5';
								  mcc_spawnfaction='%6';
								  mcc_zone_number=%7;
								  mcc_zoneinform='%8';
								  mcc_zone_markername='%9';
								  mcc_spawnbehavior='%10';
								  mcc_grouptype     ='%11';
								  mcc_spawndisplayname ='%12';
								  mcc_track_units = %13;
								  mcc_awareness = '%14';
								  mcc_sidename = '%15';
								  script_handler = [0] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';"								 
								  ,mcc_spawntype
								  , mcc_classtype
								  , mcc_isnewzone
								  , mcc_spawnwithcrew
								  , mcc_spawnname
								  , mcc_spawnfaction
								  , mcc_zone_number
								  , mcc_zoneinform
								  , mcc_zone_markername
								  , mcc_spawnbehavior
								  , mcc_grouptype 
								  , mcc_spawndisplayname
								  , mcc_track_units
								  , mcc_awareness
								  , mcc_sidename
								  ];
			} else
				{
					mcc_capture_var=mcc_capture_var + FORMAT ['
								  mcc_spawntype=["%1"] select 0;
								  mcc_classtype=["%2"] select 0;
								  mcc_isnewzone=%3;
								  mcc_spawnwithcrew=%4;
								  mcc_spawnname=["%5"] select 0;
								  mcc_spawnfaction=["%6"] select 0;
								  mcc_zone_number=%7;
								  mcc_zoneinform=["%8"] select 0;
								  mcc_zone_markername=["%9"] select 0;
								  mcc_spawnbehavior=["%10"] select 0;
								  mcc_grouptype     =["%11"] select 0;
								  mcc_spawndisplayname =[%12] select 0;
								  mcc_track_units = %13;
								  mcc_awareness = ["%14"] select 0;
								  mcc_sidename = ["%15"] select 0;
								  script_handler = [0] execVM "mcc\general_scripts\mcc_SpawnStuff.sqf";'								 
								  ,mcc_spawntype
								  , mcc_classtype
								  , mcc_isnewzone
								  , mcc_spawnwithcrew
								  , mcc_spawnname
								  , mcc_spawnfaction
								  , mcc_zone_number
								  , mcc_zoneinform
								  , mcc_zone_markername
								  , mcc_spawnbehavior
								  , mcc_grouptype 
								  , mcc_spawndisplayname
								  , mcc_track_units
								  , mcc_awareness
								  , mcc_sidename
								  ];
				};
	} else 
		{
		if !mcc_isloading then 
			{
				mcc_safe=mcc_safe + FORMAT ["
										  mcc_spawntype='%1';
										  mcc_classtype='%2';
										  mcc_isnewzone=%3;
										  mcc_spawnwithcrew=%4;
										  mcc_spawnname='%5';
										  mcc_spawnfaction='%6';
										  mcc_zone_number=%7;
										  mcc_zoneinform='%8';
										  mcc_zone_markername='%9';
										  mcc_spawnbehavior='%10';
										  mcc_grouptype     ='%11';
										  mcc_spawndisplayname ='%12';
										  mcc_track_units = %13;
										  mcc_awareness = '%14';
										  mcc_sidename = '%15';
										  script_handler = [0] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';
										   waitUntil {scriptDone script_handler};
										  "								 
										  ,mcc_spawntype
										  , mcc_classtype
										  , mcc_isnewzone
										  , mcc_spawnwithcrew
										  , mcc_spawnname
										  , mcc_spawnfaction
										  , mcc_zone_number
										  , mcc_zoneinform
										  , mcc_zone_markername
										  , mcc_spawnbehavior
										  , mcc_grouptype 
										  , mcc_spawndisplayname
										  , mcc_track_units
										  , mcc_awareness
										  , mcc_sidename
										  ];
			};
	
			#ifdef DEBUG
			if !mcc_resetmissionmaker then
				{
					if !mcc_isnewzone then {				// Allright we are doing something else then making / updating zones, report that by hint
															hint format["Request ID: %3
															 
															 Spawn %1 in zone %2.
															 Contacting server......", mcc_spawnname , mcc_zone_markername,mcc_request];
															 
															//Set the behavior back from script understanding to human readable again											
															switch (mcc_spawnbehavior) do
																{
																	case "MOVE":
																	{
																		_behavior = "Agressive";
																	};

																	case "NOFOLLOW":
																	{
																		_behavior = "Defensive";
																	};

																	case "NOMOVE":
																	{					
																		_behavior = "Passive";
																	};
																	
																	case "FORTIFY":
																	{					
																		_behavior = "Fortify";
																	};
																	
																	case "AMBUSH":
																	{					
																		_behavior = "Ambush";
																	};
																};												
															// Lets find out what you want and put that in our diary on the right zone
															switch (mcc_spawntype) do
																	{
																		case "MAN":
																		{
																			
																			_diaryrecord = format ["Spawned (Man) %1, with behavior %2.",mcc_spawndisplayname, _behavior] ;				
																		};

																		case "VEHICLE":
																		{
																			
																			if mcc_spawnwithcrew then 
																				{ 
																					_diaryrecord = format ["Spawned (Vehicle) %1, with behavior %2.",mcc_spawndisplayname, _behavior];
																				}
																			else
																				{ 
																					_diaryrecord = format ["Spawned (Vehicle) empty %1.",mcc_spawndisplayname, _behavior];
																				};
																		};
																		
																		
																		case "AMMO":
																		{
																			
																			
																					_diaryrecord = format ["Spawned %1.",mcc_spawndisplayname, _behavior];
																			
																		};

																		case "DOC":
																		{					
																			
																			if mcc_spawnwithcrew then 
																				{ 
																					_diaryrecord = format ["Spawned (DOC) %1 with defensive units.",mcc_spawndisplayname, _behavior];
																				}
																			else
																				{ 
																					_diaryrecord = format ["Spawned (doc) %1 with no units in it.",mcc_spawndisplayname, _behavior];
																				};																
																		};
																		
																		case "GROUP":
																		{					
																				
																				_diaryrecord = format ["Spawned (Group) %1, with behavior %2.",mcc_spawndisplayname, _behavior] ;							
																		};
																		
																		case "PARATROOPER":
																		{					
																				
																				_diaryrecord = "Spawned paratroopers";
																		};
																	}; //switch (mcc_spawntype) do
																	
																	
															
															player createDiaryRecord ["MCCZones", [mcc_zone_markername, _diaryrecord]];
											}
									  else {
															// We are creating/updating a zone, lets report that by hint
															hint format["Request ID: %2
															 
															Update zone %1.
															Contacting server......",  mcc_zone_markername,mcc_request];
															
														

										   };
				}
				else
				{
					hint format["Request ID: %2
					 
					Requesting to logout %1.
					Contacting server......",  player,mcc_request];
					ace_sys_spectator_can_exit_spectator = false;
				
				};
			#endif
			//obviously when we are loading there is no need to safe it again since that will influence the load process by double output


			// Save data in my_pv variable
			_ar =	[ mcc_spawntype
					, mcc_classtype
					, mcc_isnewzone
					, mcc_spawnwithcrew
					, mcc_spawnname
					, mcc_spawnfaction
					, mcc_zone_number
					, mcc_zoneinform
					, mcc_zone_markername
					, mcc_spawnbehavior
					, (mcc_zone_pos select (mcc_zone_number))
					, (mcc_zone_size select (mcc_zone_number))
					, ((mcc_zone_size select (mcc_zone_number)) select 1)
					, mcc_sidename
					, player
					, mcc_request
					, mcc_track_units
					, mcc_resetmissionmaker
					, (name player)
					, mcc_awareness
					];

			// Send data over the network, or when on server, execute directly

			if (isServer) then { ["mcc_setup", _ar] call CBA_fnc_localEvent } else { ["mcc_setup", _ar] call CBA_fnc_remoteEvent };



			//If we came out of here then we need reset some stuff empty
			mcc_isnewzone = false;
			mcc_grouptype = "";
			mcc_spawntype = "";
			mcc_classtype = "";
			mcc_spawnname = "";
			mcc_spawnfaction ="";
			mcc_resetmissionmaker = false;
		};