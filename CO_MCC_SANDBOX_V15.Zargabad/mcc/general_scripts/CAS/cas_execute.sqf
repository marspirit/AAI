//Initialize
private ["_type", "_ammount", "_spawnkind", "_pos", "_spawn", "_away", "_pilot","_pilotGroup",
"_plane", "_planepos", "_planeType", "_target", "_lasertargets", "_nukeType","_bomb2"];
_ammount 				= _this select 0;
_spawnkind				= _this select 1 select 0;
_pos					= _this select 2;
_planeType				= _this select 3 select 0;
_planeApproach				= _this select 4;

//drop function (thanks to BIS)
	CreateAmmoDrop=
			{
				private ["_pos","_spawnkind","_pilot","_para", "_drop","_dir"];
				_pos = _this select 0;
				_spawnkind = _this select 1;
				_pilot = _this select 2;
				_para = "ParachuteBigWest" createVehicle [_pos select 0,_pos select 1,3000];
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

				WaitUntil{(getpos _drop select 2) < 0.05};
				detach _drop;
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
					_mine = "Mine" createvehicle _pos; 
					_mine setpos [(_pos select 0)+100-(random 200),(_pos select 1)+100-(random 200),0];
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

switch (_planeApproach) do		//Plane approach
	{
	   case 0:	//North
	    {
			_spawn = [(_pos select 0),(_pos select 1)+3500,_pos select 2];
			_away  = [(_pos select 0),(_pos select 1)-3500,_pos select 2];
		};
		
	   case 1:	//East
		{
			_spawn = [(_pos select 0)+3500,_pos select 1,_pos select 2];
			_away  = [(_pos select 0)-3500,_pos select 1,_pos select 2];
		};
		
		case 2:	//South
	    {
			_spawn = [(_pos select 0),(_pos select 1)-3500,_pos select 2];
			_away  = [(_pos select 0),(_pos select 1)+3500,_pos select 2];
		};
		
		case 3:	//West
	    {
			_spawn = [(_pos select 0)-3500,_pos select 1,_pos select 2];
			_away  = [(_pos select 0)+3500,_pos select 1,_pos select 2];
		};
	};	


//Lets Spawn a plan
_pilotGroup = creategroup civilian; 
_plane= createVehicle [_planeType, _spawn, [], 0, "FLY"];

_pilot = _pilotGroup createUnit ["Pilot", _spawn, [], 0, "NONE"];
_pilot assignAsDriver _plane;
_pilot moveindriver _plane;
_pilot setcaptive true; 

//Set waypoint
_pilotGroup move _pos;

//Set flyinheight here
_pilotGroup setBehaviour "CARELESS";
_plane flyInHeight 200;

//start the drop
if (_planeType=="C130J") then 		//If it's an airdrop
	{
		waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 100};
		//Make the drop
		for [{_x=1},{_x<=_ammount},{_x=_x+1}] do 
			{
			_planepos = getpos _plane;
			[_planepos, _spawnkind, _pilot] spawn CreateAmmoDrop;
			sleep 0.5 + random 0.5;
			};
	} else 						//If it's a CAS
		{
			{_plane removemagazine _x;} forEach magazines _plane;	//remove all weapons
			removeAllweapons _plane;
			switch (_spawnkind) do
			{
			   case "JDAM":	//JDAM Bomb
			   { 
			   waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 100};
			   "Bo_GBU12_LGB" createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 20];
				};
				
			   case "LGB":	//LGB
				{ 
				waitUntil {(_plane distance _pos) < 1000};
				_lasertargets = nearestObjects[_pos,["LaserTarget"],1000];
				_pos = getpos (_lasertargets select 0);
				waitUntil {(_plane distance[_pos select 0, _pos select 1, 200]) < 300};
				"Bo_GBU12_LGB" createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 10];
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
					waitUntil {(_plane distance [_pos select 0, _pos select 1, 200]) < 100};
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
		};
	
_pilotGroup move _away;
_pilot domove _away;
waituntil {(_plane distance _away) < 200};
deletevehicle _pilot;
deletevehicle _plane;

