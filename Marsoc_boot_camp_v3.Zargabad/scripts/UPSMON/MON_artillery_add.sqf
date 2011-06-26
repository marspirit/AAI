,"_distance","_side"];	
					
	_npc = _this select 0;	
	_distance = _this select 1;					
	//_side = _this select 2;	
		
		_OCercanos = [];
		_bodies = [];
		
		//Buscamos objetos cercanos
		_OCercanos = nearestObjects [_npc, ["Man"] , _distance];
			
		{			
			if (_npc knowsabout _x >0.5 && (!canmove _x || !alive _x)) then { _bodies = _bodies + [_x];};
		}foreach _OCercanos;
		
		_bodies;
	};	

//Función que devuelve un array con los vehiculos terrestres más cercanos
//Parámeters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_nearestSoldiers = {
	private["_vehicles","_npc","_soldiers","_OCercanos","_distance","_side"];	
				
	_npc = _this select 0;	
	_distance = _this select 1;					
	
	if (isnull _npc) exitwith {};
	
	_OCercanos = [];
	_soldiers = [];
	
	//Buscamos objetos cercanos
	_OCercanos = nearestObjects [_npc, ["Man"] , _distance];					
	_OCercanos = _OCercanos - [_npc];			
	
	{			
		if ( alive _x && canmove _x ) then { _soldiers = _soldiers + [_x];};
	}foreach _OCercanos;
	
	_soldiers;
};		/*  =====================================================================================================
	MON_spawn.sqf
	Author: Monsada (chs.monsada@gmail.com) 
		Comunidad Hispana de Simulación: 
		http://www.simulacion-esp.com
 =====================================================================================================		
	Parámeters: [_artillery,(_range,_rounds,_area,_cadence,_mincadence)] execvm "scripts\UPSMON\MON_artillery_add.sqf";	
		<- _artillery 		object to attach artillery script, must be an object with gunner.
		<- ( _rounds ) 		rounds to fire each time, default 1
		<- ( _range ) 		range of artillery, default 800
		<- ( _area ) 		Dispersion area, 150m by default
		<- ( _maxcadence ) 	Cadence of fire, is random between min, default 10s
		<- ( _mincadence )	Minimum cadence, default 5s
		<- ( _bullet )		Class of bullet to fire, default ARTY_Sh_81_HE
 =====================================================================================================
	1.  Place a static weapon on map.
	2. Exec module in int of static weapon

		nul=[this] execVM "scripts\UPSMON\MON_artillery_add.sqf";

	1. Be sure static weapon has a gunner or place a "fortify" squad near, this will make squad to take static weapon.
	2. Create a trigger in your mission for setting when to fire. Set side artillery variable to true:

		KRON_UPS_ARTILLERY_EAST_FIRE = true;

	This sample will do east artilleries to fire on known enemies position, when you want to stop fire set to false.

	For more info:
	http://dev-heaven.net/projects/upsmon/wiki/Artillery_module
 =====================================================================================================*/
if (!isserver) exitWith {}; 

//Waits until UPSMON is init
waitUntil {!isNil("KRON_UPS_INIT")};
waitUntil {KRON_