/*	
	autor: !R	
	
	no more C B A !
*/
	

	
// get new position [x,y,x] from pos in distance and angle.
// [_pos, _distance, _angle] call R_relPos3D;
// [newX,newY,Z]	
R_relPos3D = 
	{
		private["_p","_d","_a","_x","_y","_z","_xout","_yout"];
		_p=_this select 0; 
		_x=_p select 0; 
		_y=_p select 1; 
		_z=_p select 2;
		_d=_this select 1; 
		_a=_this select 2; 
		_xout=_x + sin(_a)*_d; 
		_yout=_y + cos(_a)*_d;
		[_xout,_yout,_z]
	};

	
// [_unit] spawn R_ThrowSmoke;
R_ThrowSmoke = 
	{
		private ["_unit","_shell",
					"_moves","_unitPos","_pos","_flare","_direction"];

		/*
		_stanThrow = ["AwopPercMstpSgthWrflDnon_Start1", "AwopPercMstpSgthWrflDnon_Throw1","AwopPercMstpSgthWrflDnon_End1"];	
		_kneeThrow = ["AwopPknlMstpSgthWrflDnon_Start", "AwopPknlMstpSgthWrflDnon_Throw" ,"AwopPknlMstpSgthWrflDnon_End"];
		_proneThrow= ["AwopPpneMstpSgthWrflDnon_Start", "AwopPpneMstpSgthWrflDnon_Throw" ,"AwopPpneMstpSgthWrflDnon_End"]; 
		*/
		
		_moves = ["AwopPercMstpSgthWrflDnon_Start1","AwopPknlMstpSgthWrflDnon_Start","AwopPpneMstpSgthWrflDnon_Start"];

		_unit = _this select 0;
		_shell = "SmokeShell";
		_unitPos = unitPos _unit; 
		
		//Animation
		switch (_unitPos) do {   
			
			case "Auto":
			{	
				_unit playMove (_moves select 1);	
			};
		
			case "Up":
			{	
				_unit playMove (_moves select 0);	
			};
		
			case "Middle":
			{	
				_unit playMove (_moves select 1);	
			};
			
			case "Down":
			{	
				_unit playMove (_moves select 2);	
			};
		};	
		
		sleep 4;
		_direction = direction _unit;		
		
		// use such bypass as setvelocity does not work in MP
		_pos = position _unit;
		_pos = [(_pos select 0),(_pos select 1),(_pos select 2)+1.5];
		_pos = [_pos, 18, _direction] call R_relPos3D;
				
		if (alive _unit && canmove _unit) then {	
			_flare = _shell createVehicle _pos;
		};
		
		// setvelocity does not work in MP http://dev-heaven.net/issues/17949
		/*
		_vector = [18,direction _unit,0] call C B A_fnc_polar2vect;

		_pos=position _unit;
		_pos=[(_pos select 0),(_pos select 1),(_pos select 2)+2];
		_flare = _shell createVehicle _pos;
		_flare setPos _pos;
		_flare setvelocity _vector;	
		
		*/
	};
	
	
	
	// [_unit] call R_FN_deleteObsoleteWaypoints;
	// leave only the last way point
	R_FN_deleteObsoleteWaypoints = 
	{
		private ["_unit","_grp"];
		
		_unit = _this select 0;
		_grp = group _unit;
		while {(count (waypoints _grp)) > 1} do
		{
			deleteWaypoint ((waypoints _grp) select 0);			
		};
	};	
	
	

	// array = [_npc] call R_FN_vehiclesUsedByGroup;
	// return array of vehicles used by group
	R_FN_vehiclesUsedByGroup =
	{
		private ["_npc","_vehicles"];
		
		_npc = _this select 0;
		_vehicles = [];
		
		if (!alive _npc) exitwith {};
		
		{
			if (( vehicle _x != _x || !(_x iskindof "Man")) && !((vehicle _x) in _vehicles)) then {
					 _vehicles = _vehicles + [vehicle _x];
			};
		} foreach units _npc;			
		
		_vehicles
	};	
	




	// array = [_vehicle]  call R_FN_unitsInCargo;
	// array of units in cargo of the vehicle (not driver, commander or gunner)
	R_FN_unitsInCargo =
	{
		private ["_vehicle","_gunner","_driver","_commander","_unitsInCargo" ]; 
		
		_vehicle = _this select 0;
			
		_unitsInCargo = crew _vehicle;
		_driver = driver _vehicle;
		_gunner = gunner _vehicle;
		_commander = commander _vehicle;
				
		_unitsInCargo = _unitsToGetOut - [_gunner] - [_driver] - [_commander];
	
		_unitsInCargo
	};
	




	// array = [_npc] call R_FN_allUnitsInCargo;
	// array of all units in cargo of the group (not driver, commander or gunner)
	R_FN_allUnitsInCargo =
	{
		private ["_npc","_vehicles","_unitsInCargo","_groupUnitsInCargo"];
		
		_npc = _this select 0;
		if (!alive _npc) exitwith {};
		
		_allUnitsInCargo =[];
		
		_vehicles = [_npc] call R_FN_vehiclesUsedByGroup;
		
		{
			_unitsInCargo = [_x]  call R_FN_unitsInCargo;
			_allUnitsInCargo = _allUnitsInCargo + _unitsInCargo; 		
		
		} foreach _vehicles;
		
		_allUnitsInCargo
	};
	
	
	// old MON_GetOutDist
	// <- _npc
	// <- _targetPos:  position for exiting(if no waypoint used)
	// <- _atdist: minimal dist to the _targetpos do getout 
	// -> nothing
	// nul = [_npc,_targetpos,_atdist] spawn R_SN_GetOutDist;
	R_SN_GetOutDist = {
		private["_vehicle","_npc","_target","_atdist","_getout","_dogetout","_driver","_commander","_targetpos","_dist","_vehpos","_vehicles"];	
	
		_npc = _this select 0;
		_targetpos = _this select 1;
		_atdist = _this select 2; // minimal dist to the target	to do getOut

		_dogetout = []; // units to do getout
		_vehicles = []; // vehs used by the group
	
		if (!alive _npc) exitwith{};	
		
		_vehicle = vehicle _npc;
		_vehpos = getpos _vehicle;
		
		_dist = round([_vehpos,_targetpos] call KRON_distancePosSqr); // dist to the target

		// if (KRON_UPS_Debug>0) then {player sidechat format["%1: Getoutdist dist=%2 atdist=%3 ",typeof _vehicle,_dist, _atdist]}; 		

		// if _npc is in vehicle
		if ( _vehicle != _npc || !(_npc iskindof "Man")) then {
			
			if ( (_dist) <= _atdist ) then {			
				_vehicles = [_npc] call R_FN_vehiclesUsedByGroup; // vehicles use by the group			
				{
					_dogetout = [_x] call R_FN_unitsInCargo; // units cargo in the vehicle
					_driver = driver _x;
					
					if ( count _dogetout > 0 ) then { 	
						//Stop the veh for 5.5 sek		
						nul = [_vehicle,5] spawn MON_doStop;					
						
						sleep 0.8; // give time to actualy stop
						
						{					
							_x spawn MON_GetOut;	
							sleep 0.3;												
						} foreach _dogetout;				

						//We removed the id to the vehicle so it can be reused
						_x setVariable ["UPSMON_grpid", 0, false];	
						_x setVariable ["UPSMON_cargo", [], false];	
						
						[_npc,_x, _driver] spawn MON_checkleaveVehicle; // if every one outside, make sure driver can walk
						sleep 0.01;		
					};
				} foreach _vehicles;
			};
		};
	};
	
	
	// nul = _ npc spawn R_animGoGo; //not used
	R_animGoGo = {	
		if (!alive _this || (vehicle _this) != _this || !canmove _this || !(_this iskindof "Man")) exitwith{};

		if ((random 1)<=.90) then {													
				_this switchmove "AsigPercMstpSlowWrflDnon_GoGo"; 
		};		
	};
	
	
	
	
	