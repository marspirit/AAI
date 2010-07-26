// =========================================================================================================
//  Biblioteca de funciones comunes
//  Version: 5.0.7
//  Author: Monsada (smirall@hotmail.com)
//		http://www.simulacion-esp.com/
//		Comunidad Hispana de Simulaci�n
// =========================================================================================================

MON_bugged_vehicles = ["BIS_alice_emptydoor","ACE_Grenade_Geometry"];

// ---------------------------------------------------------------------------------------------------------
//Funci�n que permite posicionar objetos a la altura definida
//param1: objeto
//param2: altura
MON_subir = {
if (!isserver) exitwith{};
private ["_object","_altura","_pos","_x","_y","_z","_bld","_bldpos"];

_object = _this select 0;
_altura = _this select 1;

_x = 0;
_y = 0;
_z = 0;
_pos =0;
_bld = objnull;
_bldpos =0;

_pos = getposasl _object;

_x = _pos select 0;
_y = ( _pos select 1 );
_z = ( _pos select 2 ) + _altura;
_object setposasl [_x,_y ,_z];
};
//Retorna la direcci�n entre dos posiciones
MON_getDirPos = {private["_a","_b","_from","_to","_return"]; _from = _this select 0; _to = _this select 1; _return = 0; _a = ((_to select 0) - (_from select 0)); _b = ((_to select 1) - (_from select 1)); if (_a != 0 || _b != 0) then {_return = _a atan2 _b}; if ( _return < 0 ) then { _return = _return + 360 }; _return};
// ---------------------------------------------------------------------------------------------------------
//Funci�n de borra unidades que han sido matadas
//param1: objeto a borrar cuando muera
//param2: tiempo a esperar antes de borrar el objeto
MON_deleteDead = {private["_u","_s"];_u=_this select 0; _s= _this select 1; _u removeAllEventHandlers "killed"; sleep _s; deletevehicle _u};
MON_deleteDeadDist = {private["_u","_s","_dist","_OCercanos","_cicle","_deleted","_isplayer"];
	_i = 0;
	_cicle = 10;
	_deleted = false;
	_isplayer = false;
	_u = _this select 0; _s = _this select 1; _dist = _this select 2; 	
	_u removeAllEventHandlers "killed"; 
	sleep _s; 
	
	while {!_deleted} do {	
		_isplayer = false;
		//Buscamos objetos cercanos
		_OCercanos = nearestObjects [_u, ["Man"] , _dist];		
		
		//Validamos si alguno de los soldados cerca es un jugador y est� vivo
		{if (isplayer _x && alive _x) exitwith {_isplayer = true;}}foreach _OCercanos;
	
		if (!_isplayer) then {		
			deletevehicle _u;	
			_deleted = true;
		};		
		sleep _cicle; 
	};
};
// ---------------------------------------------------------------------------------------------------------
//Funci�n tomada de UPS, busca el comando en la lista y devuelve el siguiente elemento
//param1: comando a buscar
//param2: valor por defecto del comando
//param3: array con los comandos
//Retorna valor del comando encontrado o valor por defecto
MON_getArg = {private["_cmd","_arg","_list","_a","_v"]; _cmd=_this select 0; _arg=_this select 1; _list=_this select 2; _a=-1; {_a=_a+1; _v=format["%1",_list select _a]; 
if (_v==_cmd) then {_arg=(_list select _a+1)}} foreach _list; _arg};

// ---------------------------------------------------------------------------------------------------------
//Funci�n que devuelve una posici�n en 3D a partir de otra, una direcci�n y una distancia
//param1: posici�n
//param2: direcci�n
//param3: distancia
//Retorna vector de posicion en 3D [0,0,0]
MON_GetPos =
{
	private ["_pos","_dir","_dist","_cosU","_cosT","_relTX","_sinU","_sinT","_relTY","_newPos","_newPosX","_newPosY", "_targetZ" ];
	_pos = _this select 0;
	_dir = _this select 1;
	_dist = _this select 2;
			
			_targetX = _pos select 0; _targetY = _pos select 1; _targetZ = _pos select 2;
			
			//Calculamos posici�n 	
			_cosU = [_dir] call MON_GetCOS;		_sinU = [_dir] call MON_GetSIN;			
			_cosT = abs cos(_dir);				_sinT = abs sin(_dir);
			_relTX = _sinT * _dist * _cosU;  	_relTY = _cosT * _dist * _sinU;
			_newPosX = _targetX + _relTX;		_newPosY = _targetY + _relTY;		
			_newPos = [_newPosX,_newPosY,_targetZ];
			_newPos;
};

// ---------------------------------------------------------------------------------------------------------
//Funci�n que devuelve una posici�n en 2D a partir de otra, una direcci�n y una distancia
//param1: posici�n
//param2: direcci�n
//param3: distancia
//Retorna vector de posicion en 2D [0,0]
MON_GetPos2D =
{
	private ["_pos","_dir","_dist","_cosU","_cosT","_relTX","_sinU","_sinT","_relTY","_newPos","_newPosX","_newPosY" ];
	_pos = _this select 0;
	_dir = _this select 1;
	_dist = _this select 2;
			
			_targetX = _pos select 0; _targetY = _pos select 1; 
			
			//Calculamos posici�n 	
			_cosU = [_dir] call MON_GetCOS;		_sinU = [_dir] call MON_GetSIN;			
			_cosT = abs cos(_dir);				_sinT = abs sin(_dir);
			_relTX = _sinT * _dist * _cosU;  	_relTY = _cosT * _dist * _sinU;
			_newPosX = _targetX + _relTX;		_newPosY = _targetY + _relTY;		
			_newPos = [_newPosX,_newPosY];
			_newPos;
};

// ---------------------------------------------------------------------------------------------------------
//Funci�n que devuelve las posiciones que se pueden ocupar dentro de un edificio
//param1: objeto location
//Retorna numero de posiciones que tiene el edificio
MON_BldPos = {private ["_bld","_bldpos"];
					_bld=_this; _bldpos = 1;
					while {format ["%1", _bld buildingPos _bldpos] != "[0,0,0]"}  do {_bldpos = _bldpos + 1;};
				_bldpos = _bldpos - 1; _bldpos;};
				
// ---------------------------------------------------------------------------------------------------------				
//Funci�n que devuelve la casa que hay m�s cerca del objeto param1 y las posiciones que se pueden ocupar dentro de ella.
//param1: objeto 
//Retorna vector con [objeto location, posiciones que tiene]
MON_PosInfo = {
	private["_obj","_bld","_bldpos"];
	_obj=_this; 
	_bld = nearestbuilding _obj; 
	_bldpos= _bld call MON_BldPos; 
	[_bld,_bldpos];
	};		

// ---------------------------------------------------------------------------------------------------------
//Funci�n que devuelve el valor negativo o positivo del seno en base a un angulo
MON_GetSIN = {
	private["_dir","_sin","_cos"];	
	_dir=_this select 0; 
		 if (_dir<90)  then  
		 {
			_sin=1;
		 } else 
		{ 
			if (_dir<180) then 
			{
				_sin=-1;
			} else 
			{ 
				if (_dir<270) then 
				{
					_sin=-1;
				}
				else 
				{
					_sin=1;
				};				
			};
		};
	_sin
};

// ---------------------------------------------------------------------------------------------------------
//Funci�n que devuelve el valor negativo o positivo del coseno en base a un angulo
MON_GetCOS = {
	private["_dir","_cos"];	
	_dir=_this select 0; 
		 if (_dir<90)  then  
		 {
			_cos=1;
		 } else 
		{ 
			if (_dir<180) then 
			{
				_cos=1;
			} else 
			{ 
				if (_dir<270) then 
				{
					_cos=-1;
				}
				else 
				{
					_cos=-1;
				};				
			};
		};
	_cos
};	

//Funci�n que busca vehiculos cercanos y hace entrar a las unidades del lider
//Par�meters: [_grpid,_npc]
//	<-	_grpid: id of group to assign to vehicle
//	<-	_npc: lider
//	->	_getin: true if any getin
MON_GetIn_NearestVehicles = {
	private["_vehicles","_npc","_units","_unitsIn","_grpid","_getin"];
	_grpid = _this select 0;	
	_npc = _this select 1;				
	
	_vehicles=[[]];
	_air=[[]];
	_units = [];
	_unitsIn = [];
	_getin=false;
	
	if (leader _npc == _npc) then {
		_units = units _npc;
	} else
	{
		_units = _units + [_npc];
	};
	
	{
		if ( (_x!= vehicle _x && !((vehicle _x) iskindof "StaticWeapon" )) || !(_x iskindof "Man") || !alive _x || !canmove _x || !canstand _x) then {_units = _units-[_x];};
	}foreach _units;
	
	_unitsIn = _units;
	//if (KRON_UPS_Debug>0) then {diag_log format["%1 _units=%2",_grpid, count _units]};
	
	//First catch combat vehicles
	if ( (count _units) > 0) then {	
		_air = [_npc,200] call MON_NearestsAirTransports;
		{if (_npc knowsabout (_x select 0) <= 0.5) then{ _air = _air - [_x]};}foreach _air;
		_units = [_grpid, _units, _air, false] call MON_selectvehicles;				
	};	
	sleep 0.05;
	if ( (count _units) > 1) then {	
		_vehicles = [_npc,200,true] call MON_NearestsLandCombat;
		{if (_npc knowsabout(_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
		_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;		
	};		
	sleep 0.05;
	
	if ( (count _units) > 0) then {	
		_vehicles = [_npc,200] call MON_NearestsLandTransports;
		{if (_npc knowsabout (_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
		_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;		
	};	
	sleep 5;
	
	if ( (count _units) > 0 &&  (count _vehicles) > 0) then {
		sleep 1;
		_vehicles = _vehicles + _air;
		_units = [_grpid, _units, _vehicles, true] call MON_selectvehicles;
	};	
	sleep 0.05;
	_unitsIn = _unitsIn - _units;

	_unitsIn;	
};

//Funci�n que busca vehiculos cercanos y hace entrar a las unidades del lider
//Par�meters: [_grpid,_npc]
//	<-	_grpid: id of group to assign to vehicle
//	<-	_npc: lider
//	->	_getin: true if any getin
MON_GetIn_NearestCombat = {
	private["_vehicles","_npc","_units","_unitsIn","_grpid","_getin","_dist","_all"];
	_grpid = _this select 0;	
	_npc = _this select 1;		
	_dist = _this select 2;	
	_all = _this select 3;	
	
	_vehicles=[[]];
	_units = [];
	_unitsIn = [];
	_getin=false;
	
	if (leader _npc == _npc) then {
		_units = units _npc;
	} else
	{
		_units = _units + [_npc];
	};
	
	{
		if ( (_x!= vehicle _x && !((vehicle _x) iskindof "StaticWeapon" )) || !(_x iskindof "Man") || !alive _x || !canmove _x || !canstand _x) then {_units = _units-[_x];};
	}foreach _units;
	
	//If suficient units leader will not get in
	if (!all) then {
		if (count _units > 2 ) then {_units = _units - [leader _npc]};	
	};
	
	_unitsIn = _units;
	
	//We need 2 units available if not any leave vehicle to another squad	
	if ( (count _units) > 1) then {	
		_vehicles = [_npc,_dist,_all] call MON_NearestsAirCombat;
		{if (_npc knowsabout (_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
		_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;				
	};
	sleep 0.05;
	
	if ( (count _units) > 1) then {	
		_vehicles = [_npc,_dist,_all] call MON_NearestsLandCombat;
		{if (_npc knowsabout(_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
		_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;		
	};
	
	_unitsIn = _unitsIn - _units;

	 _unitsIn;
};

//Funci�n que busca vehiculos cercanos y hace entrar a las unidades del lider
//Par�meters: [_grpid,_npc]
//	<-	_grpid: id of group to assign to vehicle
//	<-	_npc: lider
//	->	_getin: true if any getin
MON_GetIn_NearestBoat = {
	private["_vehicles","_npc","_units","_unitsIn","_grpid","_getin","_dist"];
	_grpid = _this select 0;	
	_npc = _this select 1;		
	_dist = _this select 2;		
	
	_vehicles=[[]];
	_units = [];
	_unitsIn = [];
	_getin=false;
	
	if (leader _npc == _npc) then {
		_units = units _npc;
	} else
	{
		_units = _units + [_npc];
	};
	
	{
		if ( (_x!= vehicle _x && !((vehicle _x) iskindof "StaticWeapon" )) || !(_x iskindof "Man") || !alive _x || !canmove _x || !canstand _x) then {_units = _units-[_x];};
	}foreach _units;
	
	_unitsIn = _units;
	
	//We need 2 units available if not any leave vehicle to another squad	
	if ( (count _units) > 0) then {			
		_vehicles = [_npc,_dist] call MON_Nearestsboats;
		{if (_npc knowsabout (_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
		_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;			
	};
	
	if ( (count _units) > 1 &&  (count _vehicles) > 0) then {
		sleep 1;
		_units = [_grpid, _units, _vehicles, true] call MON_selectvehicles;
	};
	
	_unitsIn = _unitsIn - _units;
	_unitsIn;
};

//Funci�n que busca staticos cercanos y hace entrar a las unidades del lider
//Par�meters: [_grpid,_npc]
//	<-	_grpid: id of group to assign to vehicle
//	<-	_npc: lider
//	->	_getin: true if any getin
MON_GetIn_NearestStatic = {
	private["_vehicles","_npc","_units","_unitsIn","_grpid","_getin","_count"];
	_grpid = _this select 0;	
	_npc = _this select 1;	
	_count = 0;
	_distance = 100;		
	if ((count _this) > 2) then {_distance = _this select 2;};	
	
	_vehicles=[];
	_units = [];
	_unitsIn = [];
	_getin=false;
	
	//Buscamos staticos cerca
	_vehicles = [_npc,_distance] call MON_NearestsStaticWeapons;

	if ( count _vehicles == 0) exitwith {_unitsIn;};	
	
	if (leader _npc == _npc) then {
		_units = (units _npc) - [_npc];
	} else
	{
		_units = _units + [_npc];
	};
	
	//Solo tomamos las unidades vivas y que no est�n en vehiculo
	{
		if ( (_x iskindof "Man") && _x == vehicle _x && alive _x && canmove _x && canstand _x) then {
			_unitsIn = _unitsIn + [_x];			
		};
	}foreach _units;
	
	//Intentamos tomar solo las que est�n disponibles
	_units = [];
	{
		if (unitready _x) then {
			_units = _units + [_x];			
		};
	}foreach _unitsin;	
	
	//Si hay unidades disponibles las usamos
	if (count _units > 0) then {
		_unitsIn = _units;
	};
	
	//if (KRON_UPS_Debug>0 ) then {player sidechat format["%1: Found %2 estatic weapons %3 men available",_grpid,count _vehicles, count _unitsIn]}; 
	
	 _units = _unitsIn;
	if ( count _unitsIn > 0) then {		
		_units = [_grpid, _units, _vehicles, true] call MON_selectvehicles;				
	};
	
	_unitsIn = _unitsIn - _units;

	_unitsIn;
};

//Function to assign units to vehicles
//Par�meters: [_grpid,_unitsin,_vehicle]
//	<-	_grpid: id of group to assign to vehicle
//	<-	_units: array of units to getin
//	<-	_vehicles: array of vehicles to use
//	->	_untis:  array of units getin
 MON_selectvehicles = {
	private["_vehicles","_emptypositions","_units","_unitsIn","_i","_grpid","_vehgrpid","_unit","_wp","_any","_index","_cargo"];
	_grpid = _this select 0;	
	_units = _this select 1;
	_vehicles = _this select 2;	
	_any = _this select 3;	//meter en cualquier vehiculo
	
	_wp = [];	
	_vehicle = [];
	_unitsIn = [];
	_emptypositions = 0;
	_i = 0;
	_vehgrpid = 0;
	_unit = objnull;
	_index = 0;
	_cargo = [];	
	
  	{
		if ((count _units) == 0 )  exitwith {};
		
		_vehicle = _x select 0 ;
		_emptypositions = _x select 1;		
		_unitsIn = [];
		_i = 0;
		_vehgrpid = _vehicle getvariable ("UPSMON_grpid");
		_cargo = _vehicle getvariable ("UPSMON_cargo");
		if ( isNil("_vehgrpid") ) then {_vehgrpid = 0;};	
		if ( isNil("_cargo") ) then {_cargo = [];};		

		//Asignamos el vehiculo a a la escuadra si contiene las posiciones justas
		if (_vehgrpid == 0) then {
			_vehicle setVariable ["UPSMON_grpid", _grpid, false];		
			_vehicle setVariable ["UPSMON_cargo", _units, false];						
			_vehgrpid = _grpid;				
		};	
		
		{
			if (!alive _x || !canmove _x) then {_cargo = _cargo - [_x]; };
		}foreach _cargo;
		
		_emptypositions = _emptypositions - (count _cargo - count ( crew _vehicle) );		

						
		//ahora buscamos en cualquier vehiculo
		if ( _vehgrpid == _grpid || (_emptypositions > 0 && _any)) then {

			while {_i < _emptypositions && _i < count _units} do
			{
				_unit = _units select _i;		
				_unitsIn = _unitsIn + [_unit];				
				_i = _i + 1;
			};
			
			{
				_units = _units - [_x];
			}foreach _unitsIn;
			
			if ( (count _unitsIn) > 0) then {			
				//Asignamos el vehiculo a a la escuadra si contiene las posiciones justas
				if (_vehgrpid == _grpid) then {
					_vehicle setVariable ["UPSMON_cargo", _units, false];								
				};	
				
				//Metemos las unidades en el vehiculo				
				[_grpid,_unitsIn,_vehicle] spawn MON_UnitsGetIn;	
				if (KRON_UPS_Debug>0 ) then {player sidechat format["%1: Get in %2 %3 units of %4 available",_grpid,typeof _vehicle,count _unitsIn,_emptypositions]}; 								
				//if (KRON_UPS_Debug>0) then {diag_log format["%1 getin %2 id=%7 any=%8 unitsin=%9 quedan=%6 emptypositions=%3 cargo=%4 crew=%5",_grpid, typeof _vehicle, _emptypositions, count _cargo,count (crew _vehicle),count _units,_vehgrpid,_any, count _unitsIn]};
			};
		};		
		_index 	= _index  + 1;
		sleep 0.05;
	} foreach _vehicles;
	
	_units;
 };


//Funcion que mete la tropa en el vehiculo
//Par�meters: [_grpid,_unitsin,_vehicle]
//	<-	_grpid: id of group to assign to vehicle
//	<-	_unitsin: array of units to getin
//	<-	_vehicle
MON_UnitsGetIn = {
	private["_grpid","_vehicle","_npc","_driver","_gunner", "_unitsin", "_units" , "_Commandercount","_Drivercount","_Gunnercount","_cargo",
			"_Cargocount","_emptypositions","_Commander","_vehgrpid","_cargo"];	
			
	_grpid = _this select 0;
	_unitsin = _this select 1;
	_vehicle = _this select 2;
	
	_units = _unitsin;				
	_driver = objnull;
	_gunner = objnull;	
	_Commander	= objnull;
	_Cargocount = 0;
	_Gunnercount = 0;
	_Commandercount = 0;
	_Drivercount = 0;
	_cargo = [];
	
	_Cargocount = (_vehicle) emptyPositions "Cargo";
	_Gunnercount = (_vehicle) emptyPositions "Gunner"; 
	_Commandercount = (_vehicle) emptyPositions "Commander"; 
	_Drivercount = (_vehicle) emptyPositions "Driver"; 					

	//Obtenemos el identificador del vehiculo
	_vehgrpid = _vehicle getvariable ("UPSMON_grpid");
	_cargo = _vehicle getvariable ("UPSMON_cargo");
	if ( isNil("_vehgrpid") ) then {_vehgrpid = 0;};	
	if ( isNil("_cargo") ) then {_cargo = [];};			

	_cargo = _cargo - _unitsin; //Para evitar duplicados
	_cargo = _cargo + _unitsin; //A�adimos a la carga
	_vehicle setVariable ["UPSMON_cargo", _cargo, false];			

	//Hablitamos a la IA para entrar en el vehiculo		
	{		
		[_x,0] call MON_dostop;
		
		if ("StaticWeapon" countType [vehicle (_x)]>0) then 
		{
			_x spawn MON_doGetOut;
		};			

		unassignVehicle _x;				
		_x spawn MON_Allowgetin;						
	}foreach _units;				
	
	//Asignamos al lider como comandante o carga		
	{
		if ( _vehgrpid == _grpid && _x == leader _x && _Commandercount > 0 ) exitwith
		{
			_Commandercount = 0;
			_Commander = _x;		
			_Commander assignAsCommander _vehicle;			
			_units = _units - [_x];
			[_x] orderGetIn true;
		};

		if ( _x == leader _x && _Cargocount > 0 ) exitwith
		{
			_x assignAsCargo _vehicle;	
			_units = _units - [_x];
			_Cargocount = _Cargocount - 1;
			[_x] orderGetIn true;
		};
	}foreach _units;			
	//if (KRON_UPS_Debug>0 ) then {player sidechat format["%1: _vehgrpid %2 ,_Gunnercount %3, %4",_grpid,_vehgrpid,_Gunnercount,count _units]}; 	
				
	//Si el vehiculo pertenece al grupo asignamos posiciones de piloto, sin� solo de carga
	if ( _vehgrpid == _grpid ) then {
		
		//Asignamos el conductor
		if ( _Drivercount > 0 && count (_units) > 0 ) then { 
			_driver =  _units  select (count _units - 1);									
			[_driver,_vehicle,0] spawn MON_assignasdriver;	
			_units = _units - [_driver];
		};
		
		//Asignamos el artillero
		if ( _Gunnercount > 0 && count (_units) > 0 ) then { 				
			_gunner = [_vehicle,_units] call MON_getNearestSoldier;				
			[_gunner,_vehicle] spawn MON_assignasgunner;					
			_units = _units - [_gunner];
		};					
	};
	
	//if (KRON_UPS_Debug>0 ) then {player sidechat format["%1: _vehgrpid=%2 units=%4",_grpid,_vehgrpid,_cargocount,count _units]}; 	
	//Movemos el resto como carga
	if ( _Cargocount > 0 && count (_units) > 0 ) then { 	
		{			 
			_x assignAsCargo _vehicle;				
			[_x] orderGetIn true;		
			sleep 0.05;			
		} forEach _units;  
	};	
	
	{						
		[_x] spawn MON_avoidDissembark;				
	} forEach (_unitsin - [_driver]) - [_gunner]; 
	
};	

MON_getNearestSoldier = {
	private["_units","_obj","_near"];
		
	_obj = _this select 0;
	_units = _this select 1;
	
	_near = objnull;
	
	{
		if (isnull _near) then {
			_near = _x;
		} else {
			if ( _x distance _obj < _near distance _obj ) then {_near = _x;};
		};
	}foreach _units;
	_near;
};
	
MON_avoidDissembark = {
	private["_npc","_vehicle","_timeout"];
	
	_npc = _this select 0;
	_vehicle = vehicle _npc ;
	
	_timeout = 120;
	_timeout = time + _timeout;
	
	while {_npc == vehicle _npc && alive _npc && canmove _npc && time < _timeout} do {
		sleep 1;
	};
		
	if (!alive _npc || !canmove _npc || time >= _timeout || driver vehicle _npc == _npc) exitwith{};	
	_npc stop true;
	
	while {_npc != vehicle _npc && alive _npc && canmove _npc} do {sleep 1;};
	if (!alive _npc || !canmove _npc) exitwith{};				
	
	_npc stop false;
	//sleep 0.5;		
	
	if (!isnull (assignedVehicle player)) then {
		[_npc]	ordergetin true;
		[_npc] spawn MON_avoidDissembark;	
	};	
};


//Funci�n que devuelve un vehiculo de transporte cercano	
//Par�meters: [_npc]
//	<-	_npc: object for  position search
//	->	_vehicle:  vehicle
MON_NearestLandTransport = {
	private["_vehicle","_npc","_transportSoldier","_OCercanos","_driver", "_Commandercount","_Drivercount","_Gunnercount","_Cargocount"];	
	
	_npc = _this;				

	_OCercanos = [];
	_transportSoldier = 0;
	_vehicle = objnull;
	_Cargocount = 0;
	_Gunnercount = 0;
	_Commandercount = 0;
	_Drivercount = 0;
		
	
	//Buscamos objetos cercanos
	_OCercanos = nearestObjects [_npc, ["Car","TANK","Truck","Motorcycle"] , 150];		
	
	{
		_Cargocount = (_x) emptyPositions "Cargo";
		_Gunnercount = (_x) emptyPositions "Gunner"; 
		_Commandercount = (_x) emptyPositions "Commander"; 
		_Drivercount = (_x) emptyPositions "Driver"; 
		
		_transportSoldier = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
		
		if (!locked _x  && canMove _x && _transportSoldier >= count (units _npc) && !(typeof _x in MON_bugged_vehicles)
			&& (_drivercount > 0 || side _npc == side _x )) exitwith {_vehicle = _x;};
	}foreach _OCercanos;
	
	_vehicle;
};	
	
//Funci�n que devuelve un array con los vehiculos terrestres m�s cercanos
//Par�meters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_NearestsLandTransports = {
		private["_vehicles","_npc","_emptypositions","_OCercanos","_driver", "_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance"];	
					
	_npc = _this select 0;	
	_distance = _this select 1;					
		
	_OCercanos = [];
	_emptypositions = 0;
	_vehicles = [];
	_Cargocount = 0;
	_Gunnercount = 0;
	_Commandercount = 0;
	_Drivercount = 0;
	
	//Buscamos objetos cercanos
	_OCercanos = nearestObjects [_npc, ["Car","TANK","Truck","Motorcycle"] , _distance];
		
	{
		_Cargocount = (_x) emptyPositions "Cargo";
		_Gunnercount = (_x) emptyPositions "Gunner"; 
		_Commandercount = (_x) emptyPositions "Commander"; 
		_Drivercount = (_x) emptyPositions "Driver"; 
		
		_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
		
		if (!locked _x && _emptypositions > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
			&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
	}foreach _OCercanos;
	
	_vehicles;
};	

//Funci�n que devuelve un array con los vehiculos terrestres m�s cercanos
//Par�meters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_NearestsLandCombat = {
		private["_vehicles","_npc","_emptypositions","_OCercanos","_driver", "_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance","_all"];	
					
	_npc = _this select 0;	
	_distance = _this select 1;		
	_all = _this select 2;		
		
	_OCercanos = [];
	_emptypositions = 0;
	_vehicles = [];
	_Cargocount = 0;
	_Gunnercount = 0;
	_Commandercount = 0;
	_Drivercount = 0;
	
	//Buscamos objetos cercanos
	_OCercanos = nearestObjects [_npc, ["Car","TANK","Truck","Motorcycle"] , _distance];
		
	{
		if (_all) then {
			_Cargocount = (_x) emptyPositions "Cargo";
		};
		_Gunnercount = (_x) emptyPositions "Gunner"; 
		_Drivercount = (_x) emptyPositions "Driver"; 
		_Commandercount = (_x) emptyPositions "Commander"; 
		
		_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
		
		if (!locked _x && _Gunnercount > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
			&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
	}foreach _OCercanos;
	
	_vehicles;
};		

//Funci�n que devuelve un array con los vehiculos aereos m�s cercanos
//Par�meters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_NearestsAirTransports = {
		private["_vehicles","_npc","_emptypositions","_OCercanos","_driver", "_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance"];	
					
	_npc = _this select 0;	
	_distance = _this select 1;					
		
	_OCercanos = [];
	_emptypositions = 0;
	_vehicles = [];
	_Cargocount = 0;
	_Gunnercount = 0;
	_Commandercount = 0;
	_Drivercount = 0;
	
	//Buscamos objetos cercanos
	_OCercanos = nearestObjects [_npc, ["Helicopter"] , _distance];
		
	{
		_Cargocount = (_x) emptyPositions "Cargo";
		_Gunnercount = (_x) emptyPositions "Gunner"; 
		_Commandercount = (_x) emptyPositions "Commander"; 
		_Drivercount = (_x) emptyPositions "Driver"; 
		
		_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
		
		if (!locked _x && _emptypositions > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
			&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
	}foreach _OCercanos;
	
	_vehicles;
};	
	
//Funci�n que devuelve un array con los vehiculos aereos m�s cercanos
//Par�meters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_NearestsAirCombat = {
		private["_vehicles","_npc","_emptypositions","_OCercanos","_driver", "_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance","_all"];	
					
	_npc = _this select 0;	
	_distance = _this select 1;		
	_all  = _this select 2;	
		
	_OCercanos = [];
	_emptypositions = 0;
	_vehicles = [];
	_Cargocount = 0;
	_Gunnercount = 0;
	_Commandercount = 0;
	_Drivercount = 0;
	
	//Buscamos objetos cercanos
	_OCercanos = nearestObjects [_npc, ["Helicopter"] , _distance];
		
	{
		if (_all) then {
			_Cargocount = (_x) emptyPositions "Cargo";
		};
		_Gunnercount = (_x) emptyPositions "Gunner"; 
		_Drivercount = (_x) emptyPositions "Driver"; 
		_Commandercount = (_x) emptyPositions "Commander"; 
		
		_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
		
		if (!locked _x && _Gunnercount > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
			&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
	}foreach _OCercanos;
	
	_vehicles;
};		

//Funci�n que devuelve un array con los vehiculos staticos m�s cercanos
//Par�meters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_NearestsStaticWeapons = {
		private["_vehicles","_npc","_emptypositions","_OCercanos","_driver", "_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance"];	
					
	_npc = _this select 0;	
	_distance = _this select 1;					
		
		_OCercanos = [];
		_emptypositions = 0;
		_vehicles = [];
		_Cargocount = 0;
		_Gunnercount = 0;
		_Commandercount = 0;
		_Drivercount = 0;
		
		//Buscamos objetos cercanos
		_OCercanos = nearestObjects [_npc, ["StaticWeapon"] , _distance];
			
		{
			_Gunnercount = (_x) emptyPositions "Gunner"; 			
			_emptypositions = _Gunnercount;
			if (!locked _x && alive _x && _emptypositions > 0 && !(typeof _x in MON_bugged_vehicles) ) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
		}foreach _OCercanos;
		
		_vehicles;
	};		
	
//Funci�n que devuelve un array con los vehiculos marinos m�s cercanos
//Par�meters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_Nearestsboats = {
		private["_vehicles","_npc","_emptypositions","_OCercanos","_driver", "_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance"];	
					
	_npc = _this select 0;	
	_distance = _this select 1;					
		
		_OCercanos = [];
		_emptypositions = 0;
		_vehicles = [];
		_Cargocount = 0;
		_Gunnercount = 0;
		_Commandercount = 0;
		_Drivercount = 0;
		
		//Buscamos objetos cercanos
		_OCercanos = nearestObjects [_npc, ["Ship"] , _distance];
			
		{
			_Cargocount = (_x) emptyPositions "Cargo";
			_Gunnercount = (_x) emptyPositions "Gunner"; 
			_Commandercount = (_x) emptyPositions "Commander"; 
			_Drivercount = (_x) emptyPositions "Driver"; 
			
			_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
			
			if (!locked _x && _emptypositions > 0 && canMove _x && (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
		}foreach _OCercanos;
		
		_vehicles;
	};
	
//Funci�n para retardar la toma del volante, as� no se va el vehiculo y da tiempo a subir	
MON_assignasdriver = {
	private["_vehicle","_driver","_wait"];	
	_driver =  _this  select 0;
	_vehicle = _this select 1;		
	_wait = _this select 2;		
	
	[_driver,_wait] spawn MON_dostop;
	
	unassignVehicle _driver;
	_driver assignasdriver _vehicle;
	[_driver] orderGetIn true;	

	//if (KRON_UPS_Debug>0) then {player sidechat format["%1: assigning to driver of %2 ",_driver,  typeof _vehicle]}; 
};

MON_assignasgunner = {
	private["_vehicle","_gunner","_dist"];	
	_gunner =  _this  select 0;
	_vehicle = _this select 1;	
	_dist=0;
	
	_gunner assignasgunner _vehicle;
	[_gunner] orderGetIn true;	
	
	waituntil  { _gunner != vehicle _gunner || !alive _gunner || !canmove _gunner ||!alive _vehicle || !canfire _vehicle};
	
	if ( alive _gunner && alive _vehicle && canmove _gunner && canfire _vehicle) then {				
		_dist = _gunner distance _vehicle;
		if (_dist < 3) then {
			_gunner moveInTurret [_vehicle, [0,0]] ;	
		};		
	};
};


//Allow getin
MON_Allowgetin = {
	//Hablitamos a la IA para entrar en el vehiculo		
	[_this] allowGetIn true;		
};
	


//Funci�n que ordena al soldado salir si se encuentra en un vehiculo y a la distancia indicada
//Par�meters: [_heli,_targetPos,_atdist]
//	<-	_npc: unit in vehicle
//	<-	_targetPos:  position for exiting(if no waypoint used)
//	<- 	_atdist:  distance for doing paradrop or landing
//	->	_getout:  true if getout
MON_GetOutDist = {
	private["_vehicle","_npc","_target","_atdist","_getout","_dogetout","_driver","_commander","_targetpos","_dist","_vehpos","_vehicles"];	
	
	_npc = _this select 0;
	_targetpos = _this select 1;
	_atdist = _this select 2;	
	_getout = false;	
	_dogetout = [];
	_vehicles = [];
	
	sleep 0.05;	
	if (!alive _npc) exitwith{};	
	_vehicle = vehicle _npc;
	_vehpos = getpos _vehicle;
	
	_dist = round([_vehpos,_targetpos] call KRON_distancePosSqr);
	//if (KRON_UPS_Debug>0) then {player sidechat format["%1: Getoutdist dist=%2 atdist=%3 ",typeof _vehicle,_dist, _atdist]}; 		
		
	if ( _vehicle != _npc || !(_npc iskindof "Man")) then {
		if ( (_dist) <= _atdist ) then {	
			
			{
				if (( vehicle _x != _x || !(_x iskindof "Man")) && !((vehicle _x) in _vehicles)) then {
					 _vehicles = _vehicles + [vehicle _x];
				};
			}foreach units _npc;			
			
			{
				_vehicle = _x;
				_dogetout = crew _vehicle;
				_driver = driver _vehicle;
				_gunner = gunner _vehicle;
				
				//Si hay artillero no sacarenos ni al piloto ni al artillero ni al comandante
				if ( alive _gunner && canmove _gunner ) then { 	
					_dogetout = _dogetout - [_gunner] - [_driver];
				};
				
				if ( count _dogetout > 0 ) then { 	
					
					_getout	= true;				

					//Paramos el vehiculo y esperamos 5 segundos		
					[_vehicle,10] spawn MON_doStop;	
					
					//if (KRON_UPS_Debug>0) then {player sidechat format["%1: Getoutdist dist=%2 atdist=%3 ",typeof _vehicle,_dist, _atdist]}; 
					{					
						_x spawn MON_GetOut;	
						sleep 0.5;						
					}foreach _dogetout;				
					
					//Quitamos el id al vehiculo para que pueda ser reutilizado
					_vehicle setVariable ["UPSMON_grpid", 0, false];	
					_vehicle setVariable ["UPSMON_cargo", [], false];	
					
					[_npc,_vehicle, _driver] spawn MON_checkleaveVehicle;				
				};
			} foreach _vehicles;
		};
	};
	_dogetout;	
};

//Evalua si han salido todas las unidades para abandonar el vehiculo
 MON_checkleaveVehicle={
	_npc = _this select 0;
	_vehicle = _this select 1;
	_driver = _this select 2;
	_in = false;
	
	//Damos tiempo a que todas las unidades salgan
	sleep 10;
	{
		if (_x != vehicle _x) then {_in = true};
	}foreach units _npc;
	
	if (!_in) then {
		_driver enableAI "MOVE"; 
		sleep 1;
		_driver stop false;
		sleep 1;
		_driver leaveVehicle _vehicle; 
		sleep 1;
 	};
 };

 
//Function for order a unit to exit if no gunner
//Par�meters: [_npc]
//	<-	_npc: 
MON_GetOut = {
		private["_vehicle","_npc","_getout" ,"_gunner"];	
				
		_npc = _this;
		_vehicle = vehicle (_npc);	
		_gunner = objnull;
		_gunner = gunner _vehicle;	
		
		sleep 0.05;	
		if (!alive _npc) exitwith{};
		
		//Si no hay artillero abandonamos el vehiculo
		if ( isnull _gunner || !alive _gunner  || !canmove _gunner || (_gunner != _npc && driver _vehicle != _npc && commander _vehicle != _npc) ) then { 			
			[_npc] allowGetIn false;
			unassignVehicle _npc;
			_npc spawn MON_doGetOut;										 						
		};	
	};	

//Function for order a unit to exit
//Par�meters: [_npc]
//	<-	_npc: 	
MON_doGetOut = {	
	private["_vehicle","_npc","_getout" ,"_gunner","_groupOne","_timeout","_dir"];	
			
	_npc = _this;
	_vehicle = vehicle (_npc);		
	sleep 0.05;	
	
	if (_vehicle != _npc) then {	
		//Wait until vehicle is stopped
		waituntil {!alive _npc || !canmove _npc || !alive _vehicle || ((velocity _vehicle select 0) <= 0 && (velocity _vehicle select 1) <= 0 )
								 || ( _vehicle iskindof "Air" && ((position _vehicle) select 2) <= 1)};	

		if (!alive _npc || !canmove _npc) exitwith{};	
		unassignVehicle _npc;	
		_npc action ["getOut", _vehicle];
		doGetOut _npc;	
		[_npc] spawn MON_cancelstop;
		
		waituntil {!alive _npc || !canmove _npc || vehicle _npc == _npc};		
	};
	
	if (!alive _npc || !canmove _npc) exitwith{};
	
	if (leader _npc != _npc) then {
		//Moves out with dispersion of 45�
		_dir = getDir _npc;	
		_dir = _dir + 45 - (random 90);
		[_npc,25,_dir] spawn MON_domove;
		//if (KRON_UPS_Debug>0 ) then { player globalchat format["%1 Moving away from %2 %3�",_npc, typeof _vehicle,_dir];};	
	};
};
	
//Function for exiting of heli	
//Par�meters: [_heli,_targetPos,_atdist]
//	<-	_heli: 
//	<-	_targetPos:  position for exiting(if no waypoint used)
//	<- 	_atdist:  distance for doing paradrop or landing
MON_doParadrop = {
	private["_heli","_npc","_getout" ,"_gunner","_targetpos","_helipos","_dist","_index","_grp","_wp","_targetPosWp","_targetP","_units","_crew","_timeout","_firstTime","_NearestEnemy"];				
	_heli = _this select 0;
	_targetPos = [0,0];
	_atdist = 250;
	_flyingheigh =  90;	
	_landonBeh = ["CARELESS","SAFE"];
	_timeout=0;
	_firstTime = true;
	
	//Gets optional parameters
	if ((count _this) > 1) then {_targetPos = _this select 1;};
	if ((count _this) > 2) then {_atdist = _this select 2;};
	if ((count _this) > 3) then {_flyingheigh = _this select 3;};		

	_helipos = [0,0];
	_targetposWp = [0,0];
	_gunner = objnull;
	_gunner = gunner _heli;		
	_dist = 1000000;
	_index = 0;
	_grp = GRPNULL;
	_wp = [];
	_units =[];
	_crew =[];
	if (_flyingheigh < 90) then {_flyingheigh = 90};
	
	waituntil {count crew _heli > 0 || !alive _heli || !canmove _heli};
	_grp = group ((crew _heli) select 0);
	_npc = leader ((crew _heli) select 0);
	_units = units _npc;
	
	if (KRON_UPS_Debug>0 ) then { player globalchat format["%1 do paradrop at dist %2 ",typeof _heli, _atdist];};	
	
	while { (_dist >= _atdist || _dist < 10) && alive _heli && canmove _heli && count crew _heli > 0} do {			
		_heli flyInHeight _flyingheigh;
		
		//Take last waypoint
		_index = (count waypoints _grp) - 1;	
		_wp = [_grp,_index];
		_targetPosWp = waypointPosition _wp;
		if (format ["%1", _targetPosWp] == "[0,0,0]") then {_targetPosWp = _targetPos};
		
		_helipos = position _heli;	
		_dist = round([_helipos,_targetPosWp] call KRON_distancePosSqr);
		
		if (_firstTime) then  {
			_firstTime = false;
			if (_dist <= _atdist ) then  {
				_targetPosWp = _targetPos;
				_dist = round([_helipos,_targetPosWp] call KRON_distancePosSqr);
			};			
		};
		//if (KRON_UPS_Debug>0 ) then {hintsilent format["flying heigh=%1 dist=%2 jump at=%3",(position _heli) select 2,_dist,_atdist];};
		sleep 1;
	};
	
	if (!alive _heli || count crew _heli == 0 || (count (assignedCargo _heli) == 0 && !isnull (gunner _heli))) exitwith{};
	_crew = crew _heli;

	_NearestEnemy = _heli findnearestenemy _heli;
	
	//Jump
	if (((position _heli) select 2) >= 55 && !surfaceIsWater position _heli && (!(toupper (behaviour _npc) IN _landonBeh) || !isnull _NearestEnemy || random 100 <= 50)) then { 				
		//moving hely for avoiding stuck
		[_heli,1000] spawn MON_domove;	
		sleep 3;
		
		if (KRON_UPS_Debug>0 ) then {_heli globalchat format["doing paradrop high %1 dist=%2",(position _heli) select 2,_dist,_atdist];};
		//Do paradrop
		{
			if( (assignedVehicleRole _x) select 0 == "Cargo")then
			{
				unassignVehicle _x;				
				_x action ["EJECT", _heli] ;			
				_x stop false;				
				[_x] spawn MON_ACE_Watersurvival;				
			};				
			sleep 0.5;
		} forEach crew _heli - [gunner _heli] - [driver _heli];	
		
		//Clear Hely vars
		_heli setVariable ["UPSMON_grpid", 0, false];			
		_heli setVariable ["UPSMON_cargo", [], false];	
		
		//Waits until all units are down				
		_timeout = time + 60;
		{
			waituntil {(_x == vehicle _x ) || !alive _x || !canmove _x || isnull _x || time > _timeout};
			//Fix bug of ACE that sometimes AI gets in stand animation
			//_x switchMove "AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon_2";
		}foreach (_crew - [driver _heli]) - [gunner _heli];		
					
		//if (KRON_UPS_Debug>0) then {player globalchat format["%1 after paradrop",_npc]};	
			
		if (alive _npc && canmove _npc) then {
			_npc move _targetPosWp;	
		}else{
			{if (alive _x && canmove _x) exitwith { _x move _targetPosWp;}}foreach _crew;
		};
		
		//If only pilot land heli
		if (count crew _heli <=1) then {		
			[_heli] spawn MON_landHely;	
		};
	} else {
		//land
		if ( !surfaceIsWater _helipos && ((random 100)<20 || !canmove _heli || (!isnull _NearestEnemy && (toupper (behaviour _npc) IN _landonBeh) && random 100 <= 50))) then {						
			[_heli] spawn MON_landHely;				
		} else {				
			If (alive _heli && canmove _heli && count crew _heli > 0) then {
				if (KRON_UPS_Debug>0 ) then {_heli globalchat format["%1 failed paradrop, trying another time",typeof _heli];};
				//Try another time
				_heli flyInHeight _flyingheigh;
				sleep 3;
				[_heli, _targetPos, _atdist*1.5,_flyingheigh] spawn MON_doParadrop; 
			};
		};
	};	
	//if (KRON_UPS_Debug>0 ) then { player globalchat format["%1 exit do paradrop %2 ",_npc, _atdist];};	
};		
	
//Lands hely	
MON_landHely = {
	private["_heli","_npc","_crew","_NearestEnemy","_timeout","_landing","_targetpos"];				
	_heli = _this select 0;
	_crew =[];
	_targetpos=[0,0];
	_timeout = 0;
	_landing = false;
	
	sleep 0.05;	
	if (!alive _heli  || !canmove _heli ) exitwith{};
	_crew = crew _heli;
	_npc = leader (_crew select 0);	

	//Checks hely is already landing
	_landing = _heli getVariable "UPSMON_landing";	
	if (isnil ("_landing")) then {_landing=false;};
	if (_landing) exitwith {};
	
	//Orders to land heli	
	_heli land "LAND";
	if (KRON_UPS_Debug>0 ) then {player globalchat format["%1 is trying to land, altitude=%2 %3",typeof _heli,(position _heli) select 2,behaviour _npc];};
	
	//Puts a mark for knowing hely is landing
	_heli setVariable ["UPSMON_landing", true, false];	
	
	//Waits for land position	
	waituntil {!alive _heli || toUpper(landResult _heli) != "NOTREADY" };	
	if (alive _heli && (toUpper(landResult _heli) == "NOTFOUND")) exitwith { 
		if (KRON_UPS_Debug>0 ) then { player globalchat format["%1 no landing zone, doing paradrop",typeof _heli];};
		_heli setVariable ["UPSMON_landing", false, false];	
		[_heli] spawn MON_doparadrop;
	};		
	
	//1rt try-Waits until velocity and heigh are good for getting out
	_timeout = 30 + time;
	waituntil {!alive _heli || time > _timeout || ((velocity _heli select 2) <= 1 && ((position _heli) select 2) <= 2)};
		
	//2nd try-Waits until velocity and heigh are good for getting out
	if (((position _heli) select 2) > 2 && ((position _heli) select 2) < 50 && !surfaceiswater position _heli) then { 		
		_heli land "LAND";
		_timeout = 30 + time;
		if (KRON_UPS_Debug>0 ) then {player globalchat format["%1 trying another time to land",typeof _heli,(position _heli) select 2,behaviour _npc];};
		waituntil {!alive _heli || time > _timeout || ((position _heli) select 2) > 30 || ((velocity _heli select 2) <= 1 && ((position _heli) select 2) <= 2)};				
	};	
	
	//Chechs if alive before continuing
	if (!alive _heli) exitwith {};
	
	if (((position _heli) select 2) >= 3) exitwith {
		if (KRON_UPS_Debug>0 ) then { player globalchat format["%1 landing timeout, doing paradrop",typeof _heli];};
		_heli setVariable ["UPSMON_landing", false, false];	
		//[_heli,1000] spawn MON_domove;	
		sleep 5;
		[_heli] spawn MON_doparadrop;
	};
	
	//dogetout each soldier
	{
		_x spawn MON_doGetOut;	
		sleep 0.2;
	}forEach crew _heli;	
	
	_timeout = 30 + time;
	//Waits until all getout of heli
	{
		waituntil {vehicle _x == _x || !canmove _x || !alive _x || movetofailed _x  || time > _timeout }; 	
	}forEach _crew;	
	
	// If leader alive sets combat mode							
	if (alive _npc && canmove _npc) then {	
		//Gets nearest known enemy for putting in combat mode
		_NearestEnemy = _npc findNearestEnemy _npc;
		if (!isnull _NearestEnemy ) then {
			_npc setBehaviour "AWARE"; 
			_groupOne = group _npc;
			_groupOne setFormation "DIAMOND";			
		};	
		
		//Moves to current target Position
		_grpid = _npc getvariable "UPSMON_grpid";
		if !(isnil "_grpid") then {
			_targetpos =(KRON_targetsPos select _grpid);
			_npc move _targetpos;
			if (KRON_UPS_Debug>0 ) then { player globalchat format["%1 landed",_grpid,count KRON_targetsPos];};
		};			
	};
	
	//Quitamos el id al vehiculo para que pueda ser reutilizado
	_heli setVariable ["UPSMON_grpid", 0, false];	
	_heli setVariable ["UPSMON_cargo", [], false];	
	_heli setVariable ["UPSMON_landing", false, false];	
};

//Controls that heli not stoped flying
MON_HeliStuckcontrol = {
	private["_heli","_landing","_stuckcontrol","_dir1","_targetPos","_lastpos"];				
	_heli = _this select 0;
	
	_landing = false;
	_stuckcontrol = false;
	_targetPos=[0,0,0];
	_dir1 = 0;
	
	sleep 0.05;	
	if ( !alive _heli  || !canmove _heli ) exitwith{};
	
	//Checks stuckcontrol not active
	_stuckcontrol = _heli getVariable "UPSMON_stuckcontrol";
	if (isnil ("_stuckcontrol")) then {_stuckcontrol=false};	
	if (_stuckcontrol) exitwith {};
	
	_heli setVariable ["UPSMON_stuckcontrol", true, false];													
	if (KRON_UPS_Debug>0 ) then {player globalchat format["%1 stuck control begins",typeof _heli];};
	
	//Stuck loop control
	while {	alive _heli } do {	
		sleep 5;		
		if ((velocity _heli select 0) <= 3 && (velocity _heli select 1) <= 3 && (velocity _heli select 2) <= 3 && ((position _heli) select 2) >= 30) then {
		
			_landing = _heli getVariable "UPSMON_landing";	
			if (isnil ("_landing")) then {_landing=false;};
			
			if (!_landing) then {		
				//moving hely for avoiding stuck
				[_heli,1000] spawn MON_domove;					
				if (KRON_UPS_Debug>0 ) then {player GLOBALCHAT format["%1 stucked at %2m altitude, moving",typeof _heli,(position _heli) select 2];};
				sleep 30;			
			};			
		};
	};	
	//if (KRON_UPS_Debug>0 ) then {player globalchat format["%1 exits from stuck control",typeof _heli];};
	_heli setVariable ["UPSMON_stuckcontrol", false, false];
};

//Function that checks is gunner is alive, if not moves a cargo
MON_Gunnercontrol = {
	private["_vehicle","_gunnercontrol","_hasgunner","_crew","_crew2"];				
	_vehicle = _this select 0;

	_targetPos=[0,0,0];
	_dir1 = 0;
	_gunnercontrol = false;
	_hasgunner = (_vehicle) emptyPositions "Gunner" > 0 || !isnull gunner _vehicle; 
	_crew = [];
	_crew2 = []; //Without driver and gunner
	
	sleep 0.05;	
	if ( !alive _vehicle  || !canmove _vehicle ) exitwith{};
	
	//Checks stuckcontrol not active
	_gunnercontrol = _vehicle getVariable "UPSMON_gunnercontrol";
	if (isnil ("_gunnercontrol")) then {_gunnercontrol=false};	
	if (_gunnercontrol) exitwith {};
	
	_vehicle setVariable ["UPSMON_gunnercontrol", true, false];													
	
	_crew = crew _vehicle;
	//gunner and driver loop control
	while {	alive _vehicle && canmove _vehicle && count _crew > 0} do {
		_crew = crew _vehicle;
		{
			if (!canmove _x || !alive _x) then {_crew = _crew -[_x];};
		}foreach _crew;
		
		//Driver control	
		if ((isnull (driver _vehicle) || !alive (driver _vehicle) || !canmove (driver _vehicle)) && count _crew > 0) then {
			_crew2 = _crew - [gunner _vehicle];
			if (count _crew2 > 0) then {
				(_crew2 select (count _crew2 - 1)) spawn MON_movetodriver;
			};
		};	
		
		//Gunner control	
		if ( _hasgunner && (isnull (gunner _vehicle) || !alive (gunner _vehicle) || !canmove (gunner _vehicle)) && count _crew > 1) then {
			_crew2 = _crew - [driver _vehicle];
			if (count _crew2 > 0) then {
				(_crew2 select (count _crew2 - 1)) spawn MON_movetogunner;
			}else{
				(_crew select 0) spawn MON_movetogunner;
			};
		};
		sleep 20;		
		//if (KRON_UPS_Debug>0 ) then {player globalchat format["%1 crew=%2",typeof _vehicle, count _crew];};		
	};	
	//if (KRON_UPS_Debug>0 ) then {player globalchat format["%1 exits from gunner control",typeof _vehicle];};
	_vehicle setVariable ["UPSMON_gunnercontrol", false, false];
};


//Mueve a todo el grupo adelante
MON_move = {
	private["_npc","_dir1","_targetPos","_dist"];	
	_npc = _this select 0;
	_dist = _this select 1;

	sleep 0.05;	
	if (!alive _npc  || !canmove _npc ) exitwith{};
	
	_dir1 = getDir _npc;
	_targetPos = [position _npc,_dir1, _dist] call MON_GetPos2D;	
	_npc move _targetPos;	
};	

//Mueve al soldado adelante
MON_domove = {
	private["_npc","_dir1","_targetPos","_dist"];	
	_npc = _this select 0;
	_dist = _this select 1;
	if ((count _this) > 2) then {_dir1 = _this select 2;} else{_dir1 = getDir _npc;};
	
	sleep 0.05;	
	if (!alive _npc  || !canmove _npc ) exitwith{};
	
	_targetPos = [position _npc,_dir1, _dist] call MON_GetPos2D;		
	//If position water and not boat not go
	if (surfaceIsWater _targetPos && !(_npc iskindof "boat" || _npc iskindof "air") ) exitwith {};	
	_npc domove _targetPos;	
};	

//Funci�n que detiene al soldado y lo hace esperar x segundos
MON_doStop = {
	private["_sleep","_npc"];	
	
	_npc = _this select 0;
	_sleep = _this select 1;		
	
	sleep 0.05;	
	if (!alive _npc  || !canmove _npc ) exitwith{};
	if 	( _sleep == 0 ) then {_sleep = 0.001};	
	
	//Restauramos valores por defecto de movimiento
	//_npc disableAI "MOVE"; 
	dostop _npc ; 
	sleep _sleep;	
	[_npc] spawn MON_cancelstop;
};

//Funci�n que detiene al soldado y lo hace esperar x segundos
MON_cancelstop = {
	private["_npc"];	
	
	_npc = _this select 0;
	_npc stop false;

};

//Realiza la animaci�n de esquivar granada
MON_evadeGrenade = {	
	if (!alive _this || (vehicle _this) != _this  || !canmove _this) exitwith{};
	
	_this playmovenow "AmovPercMstpSlowWrflDnon_ActsPpneMstpSlowWrflDr_GrenadeEscape";							
	sleep 8;
	if (!alive _this || (vehicle _this) != _this  || !canmove _this) exitwith{};
	_this switchmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"; //croqueta														
	_this playmovenow "AmovPpneMstpSrasWrflDnon"; //prone							
};

//Realiza la animaci�n de la croqueta
MON_animCroqueta = {	
	if (!alive _this || (vehicle _this) != _this || !canmove _this || !(_this iskindof "Man")) exitwith{};
		
	if ((random 1)<=.50) then {													
		_x switchmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl"; //croqueta																														
	} else {
		_x switchmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"; //croqueta																				
	};		
};

//Lanza una granada
MON_throw_grenade = {
	private["_target","_npc"];	
	_npc = _this select 0;
	_target = _this select 1;		
	
	sleep 0.5;
	if (!alive _npc || (vehicle _npc) != _npc || !canmove _npc) exitwith{};	
	_npc addMagazine "SmokeShell";
	[_npc,_target] spawn MON_dowatch;
	
	_npc selectWeapon "throw";     
	sleep .1;
	_npc fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"];
	sleep 4;
};

//Establece el tipo de posici�n
MON_setUnitPos = {
	private["_pos","_npc"];	
	_npc = _this select 0;
	_pos = _this select 1;	
	
	sleep 0.5;
	if (!alive _npc || !canmove _npc || _npc != vehicle _npc || !(_npc iskindof "Man")) exitwith{};
	_npc setUnitPos _pos;
	sleep 1;
};
//Establece el tipo de posici�n
MON_setUnitPosTime = {
	private["_pos","_npc"];	
	_npc = _this select 0;
	_pos = _this select 1;	
	_time = _this select 2;
	
	if (!alive _npc || !canmove _npc) exitwith{};
	_npc setUnitPos _pos;
	sleep _time;
	_npc setUnitPos "AUTO";
	sleep 1;
};

// Funci�n para  mirar en una direcci�n
MON_dowatch = {
	private["_target","_npc"];		
	_npc = _this select 0;
	_target = _this select 1;	

	if (!alive _npc) exitwith{};		
	_npc dowatch _target; 
	sleep 1;
};

//Funci�n que mueve al soldado a la posici�n de conductor
//Par�meters: [_npc,_vehicle]
//	<-	 _npc: unit to move to driver pos
//	<-	 _vehicle
MON_movetoDriver = {
	private["_vehicle","_npc"];		
	_npc = _this ;
	_vehicle = vehicle _npc;

	//Si est� muerto
	if (vehicle _npc == _npc || !alive _npc || !canmove _npc || !(_npc iskindof "Man")) exitwith{};
	
	if (isnull(driver _vehicle) || !alive(driver _vehicle) || !canmove(driver _vehicle)) then { 	
		//if (KRON_UPS_Debug>0) then {player sidechat format["%1: Moving to driver of %2 ",_npc,typeof _vehicle]}; 	
		 _npc action ["getOut", _vehicle];
		 doGetOut _npc;
		WaitUntil {vehicle _npc==_npc || !alive _npc || !canmove _npc};
		//Si est� muerto
		if (!alive _npc || !canmove _npc) exitwith{};		
		unassignVehicle _npc;
		_npc assignasdriver _vehicle;
		_npc moveindriver _vehicle;
	};
};

//Funci�n que mueve al soldado a la posici�n de conductor
//Par�meters: [_npc,_vehicle]
//	<-	 _npc: unit to move to driver pos
//	<-	 _vehicle
MON_movetogunner = {
	private["_vehicle","_npc"];		
	_npc = _this ;
	_vehicle = vehicle _npc;
	
	sleep 0.05;
	//Si est� muerto
	if (vehicle _npc == _npc || !alive _npc || !canmove _npc || !(_npc iskindof "Man")) exitwith{};
	
	if (isnull(gunner _vehicle) || !alive(gunner _vehicle) || !canmove(gunner _vehicle)) then { 	
		if (KRON_UPS_Debug>0) then {player sidechat format["%1: Moving to gunner of %2 ",_npc,typeof _vehicle]}; 	
		 _npc action ["getOut", _vehicle];
		 doGetOut _npc;
		WaitUntil {vehicle _npc==_npc || !alive _npc || !canmove _npc};
		//Si est� muerto
		if (!alive _npc || !canmove _npc) exitwith{};		
		unassignVehicle _npc;
		_npc assignasgunner _vehicle;
		_npc moveingunner _vehicle;
	};
};

//Funci�n que retorna array de arrays con edificios y sus plantas
//Par�meters: [_object,(_distance,_minfloors)]
//	<-	_object: soldier to get near buildings 
//	<-	_distance: distance to search buildings (optional, 25 by default)
//	<- 	_minfloors:  min floors of building (optional) if not especified  min floors is 2
// 	->	 [_bld,_bldpos] 
MON_GetNearestBuildings = {
	private ["_object","_altura","_pos","_bld","_bldpos","_posinfo","_minfloors","_OCercanos","_distance","_blds"];
	_distance = 25;
	_minfloors = 2;
	_altura = 0;
	_blds = [];

	_object = _this select 0;
	if ((count _this) > 1) then {_distance = _this select 1;};
	if ((count _this) > 2) then {_minfloors = _this select 2;};	
 
	_pos =0;
	_bld = objnull;
	_bldpos =0;
	_posinfo=[];

	//La altura m�nima es 2 porque hay muchos edificios q devuelven 2 de altura pero no se puede entrar en ellos.
	if ( minfloors == 0  ) then {
		minfloors = 2;
	 };	
	
	// _posinfo: [0,0]=no house near, [obj,0]=house near, but no roof positions, [obj,pos]=house near, with roof pos
	//_posinfo= _object call MON_PosInfo;										
	_OCercanos = nearestObjects [_object, ["house","building"] , _distance];
	
	{
		_bldpos = _x call MON_BldPos; 
		if ( _bldpos >= _minfloors && damage _x <= 0 ) then { _blds = _blds + [[_x,_bldpos]];};
		//player sidechat format["%1 cerca de edificio con %2 plantas %5",typeof _object,_bldpos];	
	}foreach _OCercanos;
		
	_blds;
};

//Function to move al units of squad to near buildings
//Par�meters: [_npc,(_patrol,_minfloors)]
//	<-	 _npc: lider
//	<-	 _distance: distance to search buildings (optional, 25 by default)
//	<-	 _patrol: wheter must patrol or not
MON_moveNearestBuildings = {
	private ["_npc","_altura","_pos","_bld","_bldpos","_posinfo","_blds","_distance","_cntobjs1","_bldunitin","_blddist","_patrol","_wait","_all"];
	_distance = 30;
	_altura = 0;
	_patrol = false;	
	_wait=60;
	_all = false;

	_npc = _this select 0;
	if ((count _this) > 1) then {_distance = _this select 1;};
	if ((count _this) > 2) then {_patrol = _this select 2;};
	if ((count _this) > 3) then {_wait = _this select 3;};
	if ((count _this) > 4) then {_all = _this select 4;};

 
	_pos =0;
	_bld = objnull;
	_bldpos =0;
	_cntobjs1=0;
	_bldunitsin=[];
	_units=[];
	_blds=[];
	
	//If all soldiers move leader too
	if (_all) then {
		_units = (units _npc);
	}else{
		_units = (units _npc) - [_npc];
	}; 
	
	sleep 0.05;
	{
		if (_x iskindof "Man" && unitReady _x && _x == vehicle _x && canmove _x && alive _x && canstand _x) then {_bldunitsin = _bldunitsin + [_x]}
	}foreach _units;
	
	if (count _bldunitsin == 0) exitwith {};		
	
	//Obtenemos los edificios cercanos al lider
	_blds = [_npc,_distance] call MON_GetNearestBuildings;		
	
	if (count _blds==0) exitwith {};
	
	//Movemos a la unidades a los edificios cercanos.
	[_bldunitsin, _blds, _patrol,_wait,_all] spawn MON_moveBuildings;	

};


//Function to move al units of squad to near buildings
//Par�meters: [_npc,(_patrol,_minfloors)]
//	<-	 _units: array of units
//	<-	 _blds: array of buildingsinfo [_bld,pos]
//	<-	 _patrol: wheter must patrol or not
//	->	_bldunitsin: array of units moved to builidings
MON_moveBuildings = {
	private ["_npc","_altura","_pos","_bld","_bldpos","_posinfo","_blds","_cntobjs1","_bldunitin","_blddist","_i","_patrol","_wait","_all","_minpos","_blds2"];
	_patrol = false;
	_wait = 60;
	_minpos  = 2;
	_all = false;

	_units = _this select 0;
	_blds = _this select 1;
	if ((count _this) > 2) then {_patrol = _this select 2;};
	if ((count _this) > 3) then {_wait = _this select 3;};
	if ((count _this) > 4) then {_all = _this select 4;};
	if ((count _this) > 5) then {_minpos = _this select 5;};
	
	_altura = 0;
	_pos =0;
	_bld = objnull;
	_bldpos =0;
	_cntobjs1=0;
	_bldunitsin=[];
	_movein=[];
	_blds2 =[];

	//if (KRON_UPS_Debug>0) then {player globalchat format["MON_moveBuildings _units=%1 _blds=%2",count _units, count _blds];	};	
	//if (KRON_UPS_Debug>0) then {diag_log format["MON_moveBuildings _units=%1 _blds=%2",count _units, count _blds];};	
	
	{
		_bld 		= _x select 0;
		_bldpos 	= _x select 1; 
		
		if ( _bldpos >= _minpos ) then {
			_cntobjs1 = 1;		
			_movein = [];
			_i = 0;		
			
			if (_patrol) then {
				if (_bldpos >= 8) then { _cntobjs1 =  2 };
			} else {	
				if (_bldpos >= 8) then { _cntobjs1 =   round(random 3)  + 1;};				
			};					
		
			//Buscamos una unidad cercana para recorrerlo
			{							
				if (_x iskindof "Man" && unitReady _x && canmove _x && alive _x && vehicle _x == _x && _i < _cntobjs1) then{
					_movein = _movein + [_x];
					_i = _i + 1;						
				};
			} foreach  _units;		
			
			//if (KRON_UPS_Debug>0) then {player globalchat format["_units=%3 _bldunitsin %4 _movein=%1",_movein, typeof _bld, count _units, count _bldunitsin];}
			//if (KRON_UPS_Debug>0) then {diag_log format["_units=%3 _bldunitsin %4 _movein=%1 %2 %5",_movein, typeof _bld, count _units, count _bldunitsin,_x];};	
						
			if (count _movein > 0) then {
				_bldunitsin = _bldunitsin + _movein;	
				_units = _units - _bldunitsin;					
				if (_patrol) then {
					{
						[_x,_bld,_bldpos] spawn MON_patrolBuilding;	
					}foreach _movein;
				} else {
					{			
						_altura = floor(random(_bldpos));
						if (_altura<2) then {_altura = _minpos};
						[_x,_bld,_altura,_wait] spawn MON_movetoBuilding;						
					}foreach _movein;
				};								
			};	
		};
		
		if (count _units == 0) exitwith {};
	}foreach _blds;	
	
	//If need to enter all units in building and rest try with a superior lvl
	if ( _all && count _units > 0 ) then {
		_blds2 = [];
		_minpos = _minpos + 3;
		{
			if ( (_x select 1) >= _minpos) then {
				_blds2 = _blds2 + [_x];
			};
		}foreach _blds;
		
		//if (KRON_UPS_Debug>0) then {player globalchat format["MON_moveBuildings exit _units=%1 _blds=%2",count _units, count _blds2];	};	
		//if (KRON_UPS_Debug>0) then {diag_log format["MON_moveBuildings exit _units=%1 _blds=%2",count _units, count _blds2];};			
		
		if (count _blds2 > 0 ) then {
			[_units, _blds2, _patrol,_wait,_all,_minpos] call MON_moveBuildings;	
		};
		_bldunitsin = _bldunitsin + _units;
	};
	_bldunitsin;
};

//Function to move a unit to a position in a building
//Par�meters: [_npc,(_patrol,_minfloors)]
//	<-	 _npc: soldier
//	<-	 _bld: building
//	<-	 _altura: building
//	<-	 _wait: time to wait in position
MON_movetoBuilding = {

	private ["_npc","_altura","_bld","_wait","_dist","_retry","_soldiers"];
	_wait = 60;
	_timeout = 120;
	_dist = 0;
	_retry = false;	
		
	_npc = _this select 0;
	_bld = _this select 1;
	_altura = _this select 2;
	if ((count _this) > 3) then {_wait = _this select 3;};

	//Si est� en un vehiculo ignoramos la orden
	if (vehicle _npc != _npc || !alive _npc || !canmove _npc) exitwith{};
	
	//Si ya est� en un edificio ignoramos la orden
	_inbuilding = _npc getvariable ("UPSMON_inbuilding");
	if ( isNil("_inbuilding") ) then {_inbuilding = false;};	
	if (_inbuilding)  exitwith{};

	_npc domove (_bld buildingPos _altura); 	
	_npc setVariable ["UPSMON_inbuilding", _inbuilding, false];		
	_npc setvariable ["UPSMON_buildingpos", nil, false];	
	_timeout = time + _timeout;

	//if (KRON_UPS_Debug>0) then {player globalchat format["%4|_bld=%1 | %2 | %3",typeof _bld, _npc, typeof _npc ,_altura];};	
	//if (KRON_UPS_Debug>0) then {diag_log format["%4|_bld=%1 | %2 | %3",typeof _bld, _npc, typeof _npc ,_altura];};
	
	waitUntil {moveToCompleted _npc || moveToFailed _npc || !alive _npc || !canmove _npc || _timeout < time};
	
	if (moveToCompleted _npc && alive _npc && canmove _npc) then {			
		_dist = [position _npc,_bld buildingPos _altura] call KRON_distancePosSqr;		
		
		_soldiers = [_npc,1] call MON_nearestSoldiers;		
				
		//If more soldiers in same floor see to keep or goout.
		if (count _soldiers > 0) then {					
			{
				if (!isnil{_x getvariable ("UPSMON_buildingpos")}) exitwith {_retry = true};								
			}foreach _soldiers;				
		};		
			
		if (!_retry && _dist <= 2) then {
			_npc setvariable ["UPSMON_buildingpos", _altura, false];	
			sleep 0.1;
			[_npc,_wait] spawn MON_dostop;			
		};	
	};
	
	if (!alive _npc || !canmove _npc) exitwith{};	
	_npc setVariable ["UPSMON_inbuilding", false, false];			
	
	
	//Down one position.
	if (_retry ) then {		
		_altura = _altura + 1;
		_bldpos = _bld call MON_BldPos; 
				
		if (_altura <= _bldpos) then {			
			[_npc,_bld,_altura] spawn MON_movetoBuilding;
		};
	};
};


//Funci�n para mover a una unidad al edificio m�s cercano
//Par�meters: [_npc,_bld,(_BldPos)]
//	<-	 _npc: soldier to move
// 	<-	 _bld:building to patrol
//	<-	 _BldPos: positions of builiding (optional)
MON_patrolBuilding = {
	private ["_npc","_bld","_bldpos","_posinfo","_minfloors","_OCercanos","_distance","_timeout","_pos","_inbuilding","_rnd","_NearestEnemy","_patrolto","_time"];
	_bldpos = 0;
	_pos = 0;
	_timeout = 0;
	_i = 1;
	_inbuilding = false;
	_rnd = 0;
	_patrolto = 0;
	_NearestEnemy = objnull;
	_time = 0;

	_npc = _this select 0;
	_bld = _this select 1;
	if ((count _this) > 2) then {_bldpos = _this select 2;} else {_bldpos = _x call MON_BldPos;};
	
	if (_i > _bldpos) then {_i = _bldpos};
	_patrolto = round ( 10 + random (_bldpos) );
	
	if (_patrolto > _bldpos) then {_patrolto = _bldpos};
	
	//Si ya est�  muerto o no se puede mover se ignora
	if (!(_npc iskindof "Man") || !alive _npc || !canmove _npc) exitwith{};
	
	//Si ya est� en un edificio ignoramos la orden
	_inbuilding = _npc getvariable ("UPSMON_inbuilding");
	if ( isNil("_inbuilding") ) then {_inbuilding = false;};	
	
	//Asignamos el vehiculo a a la escuadra si contiene las posiciones justas
	if (!_inbuilding) then {
		_inbuilding	 = true;
		_npc setVariable ["UPSMON_inbuilding", _inbuilding, false];	
		[_npc,"Middle"] spawn MON_setUnitPos;
		_timeout = time + 60;
		
		//player sidechat format["%1 patrol building %2 from %3 to %4",typeof _npc, typeof _bld,_i, _patrolto];					
		
		while { _i <= _patrolto && alive _npc && canmove _npc} do{

			_npc domove (_bld buildingPos _i); 	
					
			
			_time = time + 30;			
			waitUntil {moveToCompleted _npc or moveToFailed _npc or !alive _npc or _time < time};
			
			if (moveToCompleted _npc) then {
				_timeout = time + 60;
				_i = _i + 1;
			} else {
				if (moveToFailed _npc  || !canmove _npc || !alive _npc || _timeout < time) then {
					//player sidechat format["%1 Cancelando patrulla en %2",_npc, typeof _bld];					
					_i = _patrolto + 1;
				};		
			};			
			sleep 0.05;
		};
		
		//Si est� en un vehiculo ignoramos la orden
		if (!alive _npc || !canmove _npc) exitwith{};
		
		//Volvemos con el lider
		_npc domove	(position leader _npc);
		
		//Marcamos que ya hemos finalizado
		sleep 60; //Damos tiempo para salir del edificio
		_npc setVariable ["UPSMON_inbuilding", false, false];			
	};		
};

//Function to put a mine
//Par�meters: [_npc,(_position)]
//	<-	 _npc: leader
// 	<-	 _position:location for mine (optional)
MON_CreateMine = {
	private ["_npc","_rnd","_soldier","_mine","_dir","_position"];
	_soldier = _this select 0;
	 if ((count _this) > 1) then {_position = _this select 1;} else {_position = [0,0];};
		
	_mine = objnull;
	_rnd = 0;
	_dir = 0;
	_npc = leader _soldier;
	
	if (_soldier == _npc ) then {
		_rnd = round (random ( count ((units _npc))));		
		_soldier = (units _npc) select _rnd;
	};
	
	//leader only control not work
	//Si est� en un vehiculo ignoramos la orden
	if (!(_x iskindof "Man" ) || _soldier == _npc || _soldier!=vehicle _soldier || !alive _soldier || !canmove _soldier) exitwith {false};		
	
	//Animaci�n para montar el arma
	if ((count _this) > 1) then {
		[_soldier,_position] spawn MON_doCreateMine;
	}else{
		[_soldier] spawn MON_doCreateMine;
	};
	true;
};

MON_doCreateMine = {
	private ["_npc","_rnd","_soldier","_mine","_dir","_position"];
	_position = [0,0];
	 
	_soldier = _this select 0;
	if ((count _this) > 1) then {_position = _this select 1;};
	
	//If not is Man or dead exit
	if (!(_x iskindof "Man" ) || _soldier!=vehicle _soldier || !alive _soldier || !canmove _soldier) exitwith {false};		
	
	_soldier stop false;
	[_soldier,"AUTO"] spawn MON_setUnitPos;	
	
	if ((count _this) > 1) then {
		_soldier domove _position;
		waituntil {unitReady _soldier || moveToCompleted _soldier || moveToFailed _soldier || !alive _soldier || !canmove _soldier};
	};

	if (moveToFailed _soldier || !alive _soldier || _soldier != vehicle _soldier || !canmove _soldier) exitwith {false};	
	
	 //Crouche
	_soldier playMovenow "ainvpknlmstpslaywrfldnon_1";
	sleep 1;
	
	if (!alive _soldier || !canmove _soldier) exitwith{};
	_dir = getdir _soldier;	
	_position = [position _soldier,_dir, 0.5] call MON_GetPos2D;	
	_mine = createMine ["MineMine", _position , [], 0];	

	//Prepare mine
	_soldier playMoveNow "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	
	//Return to formation
	_soldier domove position ( leader _soldier );
};

//Function to surrender AI soldier
//Par�meters: [_npc]
//	<-	 _npc: soldier to surrender
MON_surrender = {
	private ["_npc","_vehicle"];
	_npc = _this select 0;

	if (!alive _npc || !canmove _npc) exitwith {};
	
	_npc addrating -1000;
	_npc setcaptive true;	
	sleep 0.5;
	
	_vehicle = vehicle _npc;
	
	if ( _npc != _vehicle || !(_npc iskindof "Man" )) then {		
		_vehicle setcaptive true;	
		
		if ( "Air" countType [_vehicle]>0) then {											
			
			//Si acaba de entrar en el heli se define punto de aterrizaje
			if (_npc == driver _vehicle ) then { 
				[_vehicle] call MON_landHely;							
			};				
		} else {			
			_npc spawn MON_doGetOut;			
		};	
		
		//Esperamos a que est� parado		
		waituntil {_npc == vehicle _npc || !alive _npc};
	};	
	
	if (!alive _npc || !canmove _npc) exitwith {};
	_npc setcaptive true;
	_npc stop true;

	[_npc,"UP"] call MON_setUnitPos;	
	removeAllWeapons _npc;	
	sleep 1;
	_npc playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";

};

//Returns leader if was dead
MON_getleader = {
	private ["_npc","_members"];
	_npc = _this select 0;	
	_members = _this select 1;	
	
	sleep 0.05;
	if (!alive _npc ) then {		
	
		//takes commder a soldier not in vehicle
		{
			if (alive _x && canmove _x && _x == vehicle _x && !isplayer _x) exitwith {				
				_npc = _x;				
			};			
		}foreach _members;					
		
		//if no soldier out of vehicle takes any
		if (!alive _npc ) then {
			{
				if (alive _x && canmove _x) exitwith {_npc = _x;};
			}foreach _members;	
		};

		//If not alive or already leader or is player exits
		if (isPlayer _npc || !alive _npc || !canmove _npc ) then 
		{
			{
				if (alive _x && !isPlayer _x) exitwith {_npc = [_npc, _members] call MON_getleader;};
			}foreach _members;	
			_npc;
		};	

		if (leader _npc == _npc) exitwith {_npc};			
		
		//Set new _npc as leader		
		group _npc selectLeader _npc;					
	};	
	_npc;		
};				

MON_ACE_Watersurvival = {
	private ["_lb","_pos","_ejector","_in","_grpid","_rnd"];
	_in =[];
	_rnd = 0;
	_ejector = _this select 0;
	//if (KRON_UPS_Debug>0) then {player globalchat format["MON_ACE_Watersurvival %1",typeof _ejector]};							
	
	waitUntil { !canmove _ejector || !alive _ejector || isnull (_ejector) || ((getPos vehicle _ejector) select 2 < 1) };
	if ( !surfaceIsWater (getpos _ejector) || !canmove _ejector || !alive _ejector || isnull (_ejector) ) exitWith {};
	
	//Miramos de entrar en un barco cercano
	_grpid = _ejector getvariable "UPSMON_grpid";
	if (isnil "_grpid") then {_grpid = 0};		
	_in = [_grpid,_ejector,30] call MON_GetIn_NearestBoat;
	
	//If no boat near creates a zodiac	
	if (count _in <= 0) then {
		if (!(isNil "ace_main")) then {
			_lb = "ACE_Lifeboat_US" createVehicle getposASL _ejector;
		}else{
			_lb = "Zodiac" createVehicle getposASL _ejector;		
		};
		_pos = getposASL _ejector;
		_pos set [0, ((_pos select 0) + 2)];
		_pos set [1, ((_pos select 1) + 2)];
		//_pos set [2, 0];
		_lb setPos _pos;
		
		//Moves in boat
		if !(isPlayer _ejector) then {
			[_ejector,_lb,0] call MON_assignasdriver;						
		};				
	};

	//Wait until reached eart
	waitUntil { !canmove _ejector || !alive _ejector || isnull (_ejector) || !surfaceIsWater (position _ejector) };	
	if (KRON_UPS_Debug>0) then {player globalchat format["Exit from boat%1",typeof _lb]};	
	_ejector spawn MON_dogetout;
};	

//Function to do artillery
//Par�meters: [_position,(_rounds,_area,_cadence,_mincadence)]
//	<-	 _position: center of fire create artillery
//	<-	 _rounds: rounds of fire
//	<-	 _area: Dispersion area
//	<-	 _maxcadence: Cadence of fire, is random between min 
//	<-	 _mincadence: Minimum cadence
//	<-	 _bullet: class of bullet to fire, default ARTY_Sh_81_HE
MON_artillery_dofire = {
	if (!isserver) exitWith {}; 
	private ["_smoke1","_i","_area","_position","_maxcadence","_mincadence","_sleep","_rounds"];
	_area = 150;
	_maxcadence = 10;
	_mincadence = 5;
	_sleep = 0;
	_rounds = 5;
	_bullet = "ARTY_Sh_81_HE";	
	_position =[];
	//_bullet = "ARTY_Sh_105_HE";
	//_bullet = "ARTY_Sh_122_HE";
	
	_position  = _this select 0;
	if ((count _this) > 1) then {_rounds = _this select 1;};	
	if ((count _this) > 2) then {_area = _this select 2;};	
	if ((count _this) > 3) then {_maxcadence = _this select 3;};	
	if ((count _this) > 4) then {_mincadence = _this select 4;};	
	if ((count _this) > 5) then {_bullet = _this select 5;};	
	
	_area2 = _area * 2;
	if (KRON_UPS_Debug>0) then {player globalchat format["artillery doing fire on %1",_position]};	
	for [{_i=0}, {_i<_rounds}, {_i=_i+1}] do  { 		
		_sleep = random _maxcadence;
		if (_sleep < _mincadence) then {_sleep = _mincadence};
		sleep _sleep;    
		_smoke1 = _bullet createVehicle [(_position select 0)+ random _area2 - _area, (_position select 1)+ random  _area2 - _area, (_position select 2)+ 20];    
	};
};

//Funci�n que devuelve un array con los vehiculos terrestres m�s cercanos
//Par�meters: [_npc,_distance]
//	<-	_npc: object for  position search
//	<-	_distance:  max distance from npc
//	->	_vehicles:  array of vehicles
MON_deadbodies = {
		private["_vehicles","_npc","_bodies","_OCercanos","_distance","_side"];	
					
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

//Funci�n que devuelve un array con los vehiculos terrestres m�s cercanos
//Par�meters: [_npc,_distance]
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
};		