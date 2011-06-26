//Initialize
private ["_type", "_ammount", "_spawnkind", "_pos", "_spawn", "_away", "_pilot", "_pilotGroup", "_wp1", "_wp2", "_plane", "_planepos",
		"_planeType", "_target", "_lasertargets", "_nukeType", "_bomb2", "_cas_name", "_poswp", "_targetf", "_targetlist", "_distA",
		"_distB","_nul","_loop","_x"];
_ammount 				= _this select 0;
_spawnkind				= _this select 1 select 0;
_pos					= _this select 2;
_planeType				= _this select 3 select 0;
_planeApproach			= _this select 4;

//drop function (thanks to BIS)
	CreateAmmoDrop=
			{
				private ["_pos","_spawnkind","_pilot","_para", "_drop","_dir"];
				_pos = _this select 0;
				_spawnkind = _this select 1;
				_pilot = _this select 2;
				_para = "ParachuteMediumWest" createVehicle [_pos select 0,_pos select 1,3000];
				_para setpos [_pos select 0,_pos select 1,(_pos select 2) -10];
				_drop = _spawnkind createVehicle [_pos select 0,_pos select 1,3000];
				_drop setdir random 360; 
				_para setdir random 360; 
				
				_drop attachTo [_para, [0,0,1]];
				_para setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)/2];
				sleep 0.02;

				// For some reason, this command is not always performing as it suppose to, therefore, we repeat it to make sure. (network lag?)
				_drop attachTo [_para, [0,0,1]];
				_para setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)/2];
				sleep 0.02;

				_drop attachTo [_para, [0,0,1]];
				_para setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)/2];
				sleep (0.05 + random 0.2);
				
				// If the Drop hits the ground, recreate it over ground
				WaitUntil{(getpos _drop select 2) < 0.02};
				_pos = position _drop;
				_dir = direction _para;
				detach _drop;
				deletevehicle _drop;
				_drop = _spawnkind createVehicle _pos;
				_drop setdir _dir;
				_drop setPos [_pos select 0, _pos select 1,0];
			};
	
	CBU = 
		{
			private ["_bomb","_split", "_vel", "_x","_y","_type"];
			_bomb = _this select 0;
			_type = CBU_type;
			_vel = velocity _bomb;
			for [{_x = 1},{_x <= 4},{_x = _x+1}] do 
				{
					sleep 0.6;
					_para = "ParachuteC" createVehicle [getpos _bomb select 0,getpos _bomb select 1,3000];		//Make the bomb and the parachute
					_para setpos [getpos _bomb select 0,getpos _bomb select 1,(getpos _bomb select 2) -10];
					_skeet = "Barrel4" createvehicle [getpos _bomb select 0,getpos _bomb select 1,3000]; 
						for [{_y = 1},{_y <= 3},{_y = _y+1}] do 
								{
									_skeet attachTo [_para, [0,0,0]];
									_para setVelocity [(_vel select 0)/2, (_vel select 1)/2,(_vel select 2)/2];
									sleep 0.02;
								};
					[_skeet, _para] spawn _type;
				};
			_split = "HelicopterExploBig" createvehicle getpos _bomb; 
			deletevehicle _bomb;
		};
	
	CBU_EXPLOSION =
		{
			private ["_skeet","_para", "_split","_pos","_x"];
			_skeet = _this select 0;
			_para = _this select 1;
			WaitUntil{(getpos _skeet select 2) < 100};
			_pos = getpos _skeet;
			_split = "HelicopterExploSmall" createvehicle _pos;
			deletevehicle _skeet;
			deletevehicle _para;
			for [{_x = 1},{_x <= 20},{_x = _x+1}] do 
				{
					sleep 0.1;
					_skeet = "g_30mm_he" createvehicle _pos; 
					_skeet setVelocity [30-(random 60),30-(random 60),-(random 30)]; 
				};
		};
	
	CBU_MINES =
		{
			private ["_skeet","_para", "_split","_pos","_x","_mine"];
			_skeet = _this select 0;
			_para = _this select 1;
			WaitUntil{(getpos _skeet select 2) < 100};
			_pos = getpos _skeet;
			_split = "HelicopterExploSmall" createvehicle _pos;
			deletevehicle _skeet;
			deletevehicle _para;
			for [{_x = 1},{_x <= 20},{_x = _x+1}] do 
				{
					sleep 0.1;
					_mine = "Mine" createvehicle [(_pos select 0)+100-(random 200),(_pos select 1)+100-(random 200),0]; 
				};
		};
	
	CBU_WP =
		{
			private ["_skeet","_para", "_split","_pos","_x","_mine"];
			_skeet = _this select 0;
			_para = _this select 1;
			WaitUntil{(getpos _skeet select 2) < 100};
			_pos = getpos _skeet;
			_split = "HelicopterExploSmall" createvehicle _pos;
			deletevehicle _skeet;
			deletevehicle _para;
			for [{_x = 1},{_x <= 10},{_x = _x+1}] do 
				{
					sleep 0.1;
					_skeet = "ACE_M34" createvehicle _pos; 
					_skeet setVelocity [30-(random 60),30-(random 60),-(random 30)]; 
				};
		};
	
	CBU_CS =
		{
			private ["_skeet","_para", "_split","_pos","_x","_mine"];
			_skeet = _this select 0;
			_para = _this select 1;
			WaitUntil{(getpos _skeet select 2) < 100};
			_pos = getpos _skeet;
			_split = "HelicopterExploSmall" createvehicle _pos;
			deletevehicle _skeet;
			deletevehicle _para;
			for [{_x = 1},{_x <= 10},{_x = _x+1}] do 
				{
					sleep 0.1;
					_skeet = "ACE_M7A3" createvehicle _pos; 
					_skeet setVelocity [30-(random 60),30-(random 60),-(random 30)]; 
				};
		};
		
	SADARM = 
		{
			private ["_pos","_pilot","_para","_bomb","_split", "_targets", "_targetpos", "_x"];
			_pos = _this select 0;
			_pilot = _this select 1;
			
			_para = "ParachuteC" createVehicle [_pos select 0,_pos select 1,3000];		//Make the bomb and the parachute
			_para setpos [_pos select 0,_pos select 1,(_pos select 2) -10];
			_bomb = "CruiseMissile1" createvehicle [_pos select 0,_pos select 1,3000]; 
			for [{_x = 1},{_x <= 3},{_x = _x+1}] do 
				{
					_bomb attachTo [_para, [0,0,0]];
					_para setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)/2];
					sleep 0.02;
				};
				
			WaitUntil{(getpos _bomb select 2) < 150};
			_targets = nearestObjects [getpos _bomb ,["Car","Tank"],200];	//Find targets: cars or tanks
			_targetpos = [];
			{_targetpos = _targetpos + [getPos _x]} forEach _targets;
			while{count _targetpos <= 6} do 								//If no targets make random pos
				{
					_targetpos = _targetpos + [[(getpos _bomb select 0)+100-(random 200), (getpos _bomb select 1)+100-(random 200), 0]];
				};
			
			WaitUntil{(getpos _bomb select 2) < 100};						//Make the Skeets
			_split = "HelicopterExploSmall" createvehicle getpos _bomb;	
			deletevehicle _bomb;
			deletevehicle _para;
			for [{_x = 0},{_x <= 6},{_x = _x+1}] do 
				{
				_bomb = "ARTY_SADARM_PROJO" createvehicle (_targetpos select _x);
				sleep 0.2;
				};
		};
		
	NUKE = 
		{
			private ["_plane", "_pos", "_nukeType","_x"];
			_plane = _this select 0;
			_pos = _this select 1;
			_nukeType = _this select 2;
			waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 300};
			_planepos = getpos _plane;
			_bomb = "CruiseMissile2" createvehicle [_planepos select 0,_planepos select 1,3000]; 	//make the bomb 
			_bomb setpos [_planepos select 0,_planepos select 1,(_planepos select 2) -10];
			_bomb setDir ((_pos select 0)-(getPos _bomb select 0)) atan2 ((_pos select 1)-(getPos _bomb select 1));
			_hight = sqrt((getPosASL _bomb select 2)/5);
			_XVelocity = ((_pos select 0)-(getPos _bomb select 0))/_hight;
			_YVelocity = ((_pos select 1)-(getPos _bomb select 1))/_hight;
			_bomb setVelocity [_XVelocity,_YVelocity,-10];
			WaitUntil{(getpos _bomb select 2) < 5};
			[_nukeType, (getPosATL _bomb)] call ACE_fnc_NuclearGroundBurst;	
			deletevehicle _bomb;
			for [{_x=0},{_x<3+random 5},{_x=_x+1}] do
			{
				_dummy= "HeliHEmpty" createvehicle [((_pos select 0)+ 200 - random 400),((_pos select 1)+ 200 - random 400), _pos select 2];
				[-2, {[_this,10,time,false,false] spawn BIS_Effects_Burn}, _dummy] call CBA_fnc_globalExecute;
			};
			[0, {30 setOvercast 1;sleep 35 + random 20; setWind [10 - random 20,10 - random 20, true];}] call CBA_fnc_globalExecute; 	
		};
	
	NUKE_AIR = 
		{
			private ["_plane", "_pos", "_nukeType"];
			_plane = _this select 0;
			_pos = _this select 1;
			_nukeType = _this select 2;
			waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 300};
			_planepos = getpos _plane;
			_bomb = "CruiseMissile2" createvehicle [_planepos select 0,_planepos select 1,3000]; 	//make the bomb 
			_bomb setpos [_planepos select 0,_planepos select 1,(_planepos select 2) -10];
			_bomb setDir ((_pos select 0)-(getPos _bomb select 0)) atan2 ((_pos select 1)-(getPos _bomb select 1));
			_hight = sqrt((getPosASL _bomb select 2)/5);
			_XVelocity = ((_pos select 0)-(getPos _bomb select 0))/_hight;
			_YVelocity = ((_pos select 1)-(getPos _bomb select 1))/_hight;
			_bomb setVelocity [_XVelocity,_YVelocity,-10];
			WaitUntil{(getpos _bomb select 2) < 80};
			[_nukeType, (getPos _bomb)] call ACE_fnc_NuclearAirBurst;	
			deletevehicle _bomb;
		};

	CREATE_PLANE =
		{
			// call example: _plane,_pilotGroup,_pilot,_flyHight = [_planeType, civilian, _spawn, _pos, 200, true] spawn CREATE_PLANE
			private ["_planeType", "_pilotSide", "_spawn", "_pos", "_flyHight", "_captive"];
			
			_planeType = _this select 0;
			_pilotSide = _this select 1; //civilian or west, no ""
			_spawn = _this select 2;
			_pos = _this select 3;
			_flyHight = _this select 4; //integer e.g. 100
			_captive = _this select 5; //true or false
			
			_pilotGroup = creategroup _pilotSide;
			_plane= createVehicle [_planeType, _spawn, [], 0, "FLY"];
			_pilot = _pilotGroup createUnit ["Pilot", _spawn, [], 0, "NONE"];
			
			_pilot assignAsDriver _plane;
			_pilot moveindriver _plane;
			_pilot setcaptive _captive; 
			_plane flyInHeight _flyHight;
			
			_pilotGroup move _pos; //Set waypoint
			_pilotGroup setBehaviour "CARELESS";
			
			// set marker on map
			[_plane, "B_AIR", _planeType, "ColorBlack", 99] execVM "mcc\general_scripts\cas\cas_marker.sqf";
			
			sleep 0.3;
			_plane,_pilotGroup,_pilot;
			};
		
	// Call sample: [_pilotGroup, _pilot, _plane, _away] call DELETE_PLANE;
	DELETE_PLANE =
		{
			private ["_pilotGroup", "_pilot", "_plane", "_away"];
			
			_pilotGroup = _this select 0;
			_pilot = _this select 1;
			_plane = _this select 2;
			_away = _this select 3;
			
			_pilotGroup setSpeedMode "FULL";
			
			_pilotGroup move _away;
			_pilot domove _away;
			
			// If plane is far away enough delete it			
			waituntil {sleep 1;((_plane distance _away) < 800);};

			deletevehicle _pilot;
			deletevehicle _plane;
			
			//hint "deleted plane";
		};
		
//=====================================================
// set plane spawn and delete position
	switch (_planeApproach) do		//Plane approach
	{
	   case 0:	//North
	    {
			_spawn = [(_pos select 0),(_pos select 1)+3500,_pos select 2];
			_away  = [(_pos select 0),(_pos select 1)-3500,_pos select 2];
		};
		
	   case 1:	// NE
		{
			_spawn = [(_pos select 0)+3500,(_pos select 1)+3500,_pos select 2];
			_away  = [(_pos select 0)-3500,(_pos select 1)-3500,_pos select 2];
		};
		
		case 2:	// East
	    {
			_spawn = [(_pos select 0)+3500,_pos select 1,_pos select 2];
			_away  = [(_pos select 0)-3500,_pos select 1,_pos select 2];
		};
		
		case 3:	// SE
	    {
			_spawn = [(_pos select 0)+3500,(_pos select 1)-3500,_pos select 2];
			_away  = [(_pos select 0)-3500,(_pos select 1)+3500,_pos select 2];
		};
		
		case 4:	// South
	    {
			_spawn = [(_pos select 0),(_pos select 1)-3500,_pos select 2];
			_away  = [(_pos select 0),(_pos select 1)+3500,_pos select 2];
		};
		
		case 5:	// SW
		{
			_spawn = [(_pos select 0)-3500,(_pos select 1)-3500,_pos select 2];
			_away  = [(_pos select 0)+3500,(_pos select 1)+3500,_pos select 2];
		};
		
		case 6:	//West
	    {
			_spawn = [(_pos select 0)-3500,_pos select 1,_pos select 2];
			_away  = [(_pos select 0)+3500,_pos select 1,_pos select 2];
		};
		
		case 7:	// NW
	    {
			_spawn = [(_pos select 0)-3500,(_pos select 1)+3500,_pos select 2];
			_away  = [(_pos select 0)+3500,(_pos select 1)-3500,_pos select 2];
		};
	};	

//Lets Spawn a plane
//=====================================================

	//start the drop
	if (_planeType=="C130J") then 		//If it's an airdrop
	{
		_plane,_pilotGroup,_pilot = [_planeType, civilian, _spawn, _pos, 200, true] call CREATE_PLANE;
	
		waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 100};
		//Make the drop
		for [{_x=0},{_x < count _spawnkind},{_x=_x+1}] do 
			{
			_planepos = getpos _plane;
			[_planepos, _spawnkind select _x, _pilot] spawn CreateAmmoDrop;
			sleep 0.5 + random 0.5;
			};
		//Delete the plane when finished
		[_pilotGroup, _pilot, _plane, _away] call DELETE_PLANE;
	}
	//If it's a CAS
	else 						
	{
		//if A10 gun-run
		if (_planeType=="A10" && ( _spawnkind == "Gun-run short" || _spawnkind == "Gun-run long")) then
		{
			//set CAS name based on plane number
			_cas_name = format ["Warthog %1",_ammount];
			
			if ( (GunRunBusy select _ammount) == 0 ) then
			{
				//if we continue it means not busy, so now set array entry to busy
				GunRunBusy set [_ammount, 1];

				_planeType = "A10_US_EP1";
				_pilotGroup = creategroup west;
				_plane= createVehicle [_planeType, _spawn, [], 0, "FLY"];
				_pilot = _pilotGroup createUnit ["USMC_Soldier_Pilot", _spawn, [], 0, "NONE"];

				_pilot assignAsDriver _plane;
				_pilot moveindriver _plane;
				_plane flyInHeight 100;
				
				//workaround to crash plane in rare case it doesn't return to spawn/end location
				_plane setFuel 0.05;
				
				_pilotGroup move _pos; //Set waypoint
				_pilotGroup setBehaviour "CARELESS";
				
				_poswp = [_pos select 0,_pos select 1,0];
					
				{_plane removemagazine _x;} forEach magazines _plane;	//remove all weapons
				removeAllweapons _plane;
				
				_plane addMagazine "120Rnd_CMFlare_Chaff_Magazine";
				_plane addMagazine "ACE_1350Rnd_30mmAP_A10";
				
				_pilot setskill 1;
				_plane setskill 1;
				
				_wp1 = _pilotGroup addWaypoint [_poswp, 0];
				[_pilotGroup, 1] setWaypointType "MOVE";
				
				sleep 0.1;

				// set marker on map
				[_plane, "B_AIR", _cas_name, "ColorBlue", _ammount] execVM "mcc\general_scripts\cas\cas_marker.sqf";

				[playerSide,'HQ'] sideChat format ["%1 inbound to target area. ETA %2 seconds", _cas_name, round ((_plane distance _pos) / ((speed _plane) * 0.25 ))];
				
				waitUntil {sleep 0.5;(_plane distance _poswp)<1750};
				
				[playerSide,'HQ'] sideChat format ["%1 entering target area, ETA %2 seconds", _cas_name, round ((_plane distance _pos) / ((speed _plane) * 0.25 ))];
				
				_plane disableAI "AUTOTARGET";
				
				//make invisible target primary target
				//ACE_Target_EArm = ACE invisible enemy armor target (http://freeace.wikkii.com/wiki/Class_Lists_for_ACE2)
				_target = "ACE_Target_EArm" createVehicle _pos;
				// add flagpole to target area to visiualize tartget area for debug
				//_targetf = "FlagCarrierWhite_EP1" createVehicle _pos;
				
				sleep 0.5;
				
				// trigger script to cancel attack and collect garbage after x time
				//[_cas_name, _target, _spawnkind, _targetf] execVM "mcc\general_scripts\cas\clear_cas_target.sqf";
				[_cas_name, _target, _spawnkind] execVM "mcc\general_scripts\cas\clear_cas_target.sqf";
				
				// Start actual gun-run
				[_plane, _poswp, _cas_name, _target] execVM "mcc\general_scripts\cas\strafe_cas_target.sqf";
				
				_distA=(_plane distance _pos);
				sleep 0.1;
				_distB=(_plane distance _pos);
				
				// Approaching, if distA > distB plane passed target
				while {_distA>_distB} do {
					_distA=(_plane distance _pos);
					sleep 1;
					_distB=(_plane distance _pos);
					//hint format ["ETA %1 seconds", round ((_plane distance _pos) / ((speed _plane) * 0.2500 ))];
				};

				// If Gun-run long, plane will go for a 2nd strafe run
				if ( _spawnkind == "Gun-run long" ) then
				{	
					// make "away" the spawn position while plane is flying in that direction
					_away = _spawn;
						
					//Plane will return automatically for 2nd approach. When distA < distB plane is returning
					while {_distA<_distB} do {
						_distA=(_plane distance _pos);
						sleep 1;
						_distB=(_plane distance _pos);
						//hint format ["Return ETA %1 seconds", round ((_plane distance _pos) / ((speed _plane) * 0.2500 ))];
					};
						
					[playerSide,'HQ'] sideChat format ["%1 Final approach before RTB", _cas_name];
				};
				
				waitUntil {sleep 0.5;(_plane distance _pos) < 450};
				//let plane pass target before starting RTB
				sleep 0.5;
								
				_pilotGroup setCombatMode "BLUE";
				_pilotGroup setSpeedMode "FULL";
				_pilotGroup setBehaviour "CARELESS";
				_plane enableAI "AUTOTARGET";
				_plane flyInHeight 50;
				
				[playerSide,'HQ'] sideChat format ["%1 Leaving target area", _cas_name, _target];
				
				sleep 0.3;

				_wp2 = _pilotGroup addWaypoint [_away, 0];
				[_pilotGroup, 2] setWaypointType "MOVE";

				_pilotGroup move _away;
				_pilot domove _away;
				
				// If plane is far away enough delete it
				waituntil {sleep 1;((_plane distance _away) < 450);};
				deletevehicle _pilot;
				deletevehicle _plane;
			}
			else
			{
				// if _ammount equals 1 exit
				if ( true ) exitWith {[playerSide,'HQ'] sideChat format ["%1 is already engaged elsewhere", _cas_name]};
			};			
		}
		else
		{
			_plane,_pilotGroup,_pilot = [_planeType, civilian, _spawn, _pos, 200, true] call CREATE_PLANE;
			
			{_plane removemagazine _x;} forEach magazines _plane;	//remove all weapons
			removeAllweapons _plane;
			
			//=====================================================
			
			switch (_spawnkind) do
			{
				case "Gun-run short":	//A10 gun run
				{
					Hint "Gun-run only available for A10";
					//plane has already been created so we will now delete it asap
					_away = _spawn;
				};
				
				case "Gun-run long":	//A10 gun run
				{
					Hint "Gun-run only available for A10";
					//plane has already been created so we will now delete it asap
					_away = _spawn;
				};
				
			   case "JDAM":	//JDAM Bomb
			   { 
			   waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 500};
			   _nul=[_pos, getpos _plane,"Bo_GBU12_LGB",100,false,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf"
				};
				
			   case "LGB":	//LGB
				{ 
				waitUntil {(_plane distance _pos) < 1000};
				_lasertargets = nearestObjects[_pos,["LaserTarget"],1000];
				_pos = getpos (_lasertargets select 0);
				waitUntil {(_plane distance[_pos select 0, _pos select 1, 200]) < 300};
				_nul=[(_lasertargets select 0), getpos _plane,"Bo_GBU12_LGB",100,false,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf"
				};
				
				case "Bombing-run":	//Bombing run
				{ 
					_plane flyInHeight 100;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 500};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_bomb = "Bo_Mk82" createvehicle [getpos _plane select 0,getpos _plane select 1,3000]; 	//make the bomb 
							_bomb setpos [getpos _plane select 0,(getpos _plane select 1)-4,(getpos _plane select 2) -2];
							_bomb setdir getdir _plane;
							[[_bomb], [format["bon_Shell_In_v0%1",[1,2,3,4,5,6,7] select round random 6],10]] call CBA_fnc_globalSay;
							sleep 0.2;
							_bomb setVelocity [((velocity vehicle _pilot) select 0)/3, ((velocity vehicle _pilot) select 1)/3,-30];
							_bomb2 = "Bo_Mk82" createvehicle [getpos _plane select 0,getpos _plane select 1,3000]; 	//make the bomb 
							_bomb2 setpos [getpos _plane select 0,(getpos _plane select 1)+4,(getpos _plane select 2) -2];
							_bomb2 setdir getdir _plane;
							_bomb2 setVelocity [((velocity vehicle _pilot) select 0)/3, ((velocity vehicle _pilot) select 1)/3,-30];
							[[_bomb2], [format["bon_Shell_In_v0%1",[1,2,3,4,5,6,7] select round random 6],10]] call CBA_fnc_globalSay;
							sleep 0.2;
						};
				};
				
				case "Rockets-run":	//Rockets run
				{ 
					_plane flyInHeight 100;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 1200};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_nul=[[(_pos select 0)+50 - random 100,(_pos select 1)+50 - random 100,_pos select 2], getpos _plane,"R_Hydra_HE",200,true,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf";
							sleep 0.2;
							_nul=[[(_pos select 0)+50 - random 100,(_pos select 1)+50 - random 100,_pos select 2], getpos _plane,"R_Hydra_HE",200,true,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf";
							sleep 0.2;
							_nul=[[(_pos select 0)+50 - random 100,(_pos select 1)+50 - random 100,_pos select 2], getpos _plane,"R_Hydra_HE",200,true,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf";
							sleep 0.2;
							_nul=[[(_pos select 0)+50 - random 100,(_pos select 1)+50 - random 100,_pos select 2], getpos _plane,"R_Hydra_HE",200,true,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf";
							sleep 0.2;
						};
				};
				
				case "AT run":	//S&D Armor
				{ 
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 1200};
					_targets = nearestObjects [[_pos select 0,_pos select 1,0] ,["Car","Tank"],200];	//Find targets: cars or tanks
					_x = 0;
					_loop = true; 
					while {_loop} do {
						if (_x<count _targets && _x < _ammount) then {
							_nul=[_targets select _x, getpos _plane,"M_Ch29_AT",200,true,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf";
							sleep 1;
							_x = _x +1;
							} else {_loop = false};
						};
				};
				
				case "AA run":	//S&D Air
				{ 
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 1500};
					_targets = nearestObjects [[_pos select 0,_pos select 1,0] ,["Helicopter","Plane"],1000];	//Find targets: cars or tanks
					_x = 0;
					_loop = true; 
					while {_loop} do {
						if (_x<count _targets && _x < _ammount) then {
							_nul=[_targets select _x, getpos _plane,"M_Sidewinder_AA",200,true,""] execvm "mcc\general_scripts\CAS\missile_guide.sqf";
							sleep 1;
							_x = _x +1;
							} else {_loop = false};
						};
				};
				
				case "CBU-97":	//CBU-97
				{ 
					_plane flyInHeight 150;
					_plane addWeapon "ACE_CBU97_Bomblauncher";
					for [{_i=1},{_i<=_ammount},{_i=_i+1}] do 
						{
							_plane addMagazine "ACE_CBU97";
						};
					_planepos = getpos _plane;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 150]) < 700};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_plane Fire ["ACE_CBU97_Bomblauncher"];
							sleep 1;
						};
				};
				
				case "CBU-87":	//CBU-AP
				{ 
					//CBU_type = CBU_EXPLOSION;
					_plane flyInHeight 100;
					_plane addWeapon "ACE_CBU87_Bomblauncher";
					for [{_i=1},{_i<=_ammount},{_i=_i+1}] do 
						{
							_plane addMagazine "ACE_CBU87";
						};
					_planepos = getpos _plane;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 100]) < 800};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_plane Fire ["ACE_CBU87_Bomblauncher"];
							sleep 1;
						};
				};
			
				case "BLU-107":	//BLU-107
				{ 
					_plane flyInHeight 200;
					_plane addWeapon "ACE_BLU107_Bomblauncher";
					for [{_i=1},{_i<=_ammount},{_i=_i+1}] do 
						{
							_plane addMagazine "ACE_BLU107";
						};
					_planepos = getpos _plane;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 150]) < 800};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_plane Fire ["ACE_BLU107_Bomblauncher"];
							sleep 0.5;
						};
				};
				
				case "SADARM":	//SADARM
				{ 
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 200};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_planepos = getpos _plane;
							[_planepos, _pilot] spawn SADARM;
							sleep 0.5 + random 0.5;
						};
				};
				
				case "CBU-Mines":	//CBU-Mines
				{ 
					CBU_type = CBU_MINES;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 200};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_planepos = getpos _plane;
							_bomb = "CruiseMissile2" createvehicle [_planepos select 0,_planepos select 1,3000]; 	//make the bomb 
							_bomb setpos [_planepos select 0,_planepos select 1,(_planepos select 2) -10];
							_bomb setdir getdir _plane;
							_bomb setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)];
							[_bomb, CBU_type] spawn CBU;
							sleep 0.5 + random 0.5;
						};
				};
				
				case "CBU-WP":	//CBU-Mines
				{ 
					CBU_type = CBU_WP;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 200};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_planepos = getpos _plane;
							_bomb = "CruiseMissile2" createvehicle [_planepos select 0,_planepos select 1,3000]; 	//make the bomb 
							_bomb setpos [_planepos select 0,_planepos select 1,(_planepos select 2) -10];
							_bomb setdir getdir _plane;
							_bomb setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)];
							[_bomb, CBU_type] spawn CBU;
							sleep 0.5 + random 0.5;
						};
				};
				
				case "CBU-CS":	//CBU-Mines
				{ 
					CBU_type = CBU_CS;
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 200};
					//Make the drop
					for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
						{
							_planepos = getpos _plane;
							_bomb = "CruiseMissile2" createvehicle [_planepos select 0,_planepos select 1,3000]; 	//make the bomb 
							_bomb setpos [_planepos select 0,_planepos select 1,(_planepos select 2) -10];
							_bomb setdir getdir _plane;
							_bomb setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)];
							[_bomb, CBU_type] spawn CBU;
							sleep 0.5 + random 0.5;
						};
				};
				
				case "Tactical Nuke(0.3k)":	//Tactical Nuke(0.3k)
				{ 
					_nukeType = "ACE_B61_03";
					[_plane, _pos, _nukeType] spawn NUKE;					
				};
				
				case "Tactical Nuke(1.5k)":	//Tactical Nuke(1.5k)
				{ 
					_nukeType = "ACE_B61_15";
					[_plane, _pos, _nukeType] spawn NUKE;					
				};
				
				case "Tactical Nuke(5.0k)":	//"Tactical Nuke(5.0k)"
				{ 
					_nukeType = "ACE_B61_50";
					[_plane, _pos, _nukeType] spawn NUKE;					
				};
				
				case "Air Burst(0.3k)":	//Tactical Nuke(0.3k) NUKE_AIR
				{ 
					_nukeType = "ACE_B61_03";
					[_plane, _pos, _nukeType] spawn NUKE_AIR;					
				};
				
				case "Air Burst(1.5k)":	//Tactical Nuke(1.5k) NUKE_AIR
				{ 
					_nukeType = "ACE_B61_15";
					[_plane, _pos, _nukeType] spawn NUKE_AIR;					
				};
				
				case "Air Burst(5.0k)":	//Tactical Nuke(5.0k) NUKE_AIR
				{ 
					_nukeType = "ACE_B61_50";
					[_plane, _pos, _nukeType] spawn NUKE_AIR;					
				}			
			};
			
			//Delete the plane when finished
			[_pilotGroup, _pilot, _plane, _away] call DELETE_PLANE;
		};
	};