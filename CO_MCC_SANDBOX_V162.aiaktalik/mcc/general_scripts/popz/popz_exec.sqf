disableSerialization;
private ["_center","_radius","_action","_intanse","_faction","_unitsArray","_vehiclesArray","_SpawnUnit","_SpawnVehicle","_group",
		"_unitsCount","_vehiclesCount","_buildingsArray","_buildingscount","_side","_spawnBuilding","_spawnPos","_unit","_type"];

_center			= _this select 0;
_radius			= _this select 1;
_action 		= _this select 2;
_intanse		= _this select 3;
_faction		= _this select 4;
_side			= _this select 5;

_unitsArray 	= [_faction,"soldier"] call FNC_MAKE_UNITS_ARRAY;	//Let's build the faction unit's array
_vehiclesArray	= [_faction,"car"] call FNC_MAKE_UNITS_ARRAY;		//Let's build the faction vehicles's array
_buildingsArray	= nearestObjects  [_center,["House","Ruins","Church","FuelStation"],_radius select 0];	//Let's find the buildings in the area

_unitsCount		= count _unitsArray;
_vehiclesCount	= count _vehiclesArray;
_buildingscount	= count _buildingsArray;

switch (toLower _side) do	{
	case "west": {_side =  west};
	case "east": {_side =  east};
	case "gue": {_side =  resistance};
	case "civ": {_side =  civilian};
	};
		
if (_action == 0) then	{	//Garisson
	if (_buildingscount < 1) exitwith {hint "No buildings found"};	//No available buildings? stop the script!
	{
		_buildingPos = _x call FNC_BUILDING_POS_COUNT;
		if (_buildingPos > 0) then	{	//If the building have an interrior positions
			for [{_i=0},{_i<_buildingPos},{_i=_i+1}] do {
				_spawnPos	= _x buildingPos _i; 
				if (random 10 < _intanse/2) then	{	//Let's roll the dice 
					if (count (nearestObjects [_spawnPos, ["Man"], 1])<1) then	{ 	//No other unit in the spawn position?
						_type = _unitsArray select (round (random (_unitsCount-1)));
						_group = creategroup _side; 
						_unit = _group createUnit [_type select 0,_spawnPos,[],0.5,"NONE"];
						sleep 0.5;
						_unit setBehaviour "SAFE";
						_unit setpos _spawnPos;
						_unit setpos _spawnPos;
						_group setFormDir  (round(random 360));
					};
				}
			};
		};
	} foreach _buildingsArray;
};
/*        
        //Vehicles population
        if (_SpawnVehicle) then
        {
           _numofvehicletospawn=round(_buildingscount*(_vehiclepercent/100));
           _roadlist = _pos nearRoads _areasize;
           
          for "_x" from 1 to _numofvehicletospawn do
          {        
            _roadnum = count _roadlist;
            _road = _roadlist select round(random (_roadnum-1));
            _roadlist = _roadlist - [_road];
            _validpos=getpos _road;
            _vehicle= _vehiclestospawn select (round(random(_vehiclesnum-1))) createVehicle _validpos;
            //Random direction on the road
            if (round(random 1)>0) then {_dir=0} else {_dir=180};
            _vehicle setDir (direction _road)+_dir;
            //Put the vehicle on the right of the road
            _Offset = [3.5,0,0];
            _validpos = _vehicle modelToWorld _Offset;
            //Make sure the vehicle is not in a wall on the road side
            _validpos = _validpos findEmptyPosition [0.1,10];
            _vehicle setpos _validpos;
            //Velocity to make sur the vehicle follow the slope
            _vehicle setvelocity [0,0,1];
          
    				_marker_testv = createMarkerLocal ["testmarkerv",_validpos];
    				_marker_testv setMarkerShapeLocal "ELLIPSE";
    				_marker_testv setMarkerSizeLocal [5, 5];
    				_marker_testv setMarkerDirLocal 0;
    				_marker_testv setMarkerColorLocal "ColorredAlpha";
    				sleep 0.1;
    				deletemarker "testmarkerv";
          };
        };
   
	      
        hint format["Spawned : %2 unit(s) ( %4 moving and %5 inside buildings) and %3 vehicle(s) for %1 building(s)",_buildingscount,_numofunittospawn,_numofvehicletospawn,_unitstomove,_unitspawnedinside];


//******************************
//******************************
//******************************
*/			

	
