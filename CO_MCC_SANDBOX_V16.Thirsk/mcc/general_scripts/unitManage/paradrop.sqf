private ["_pos", "_units", "_spawn","_away","_plane","_pilot","_pilot1","_group","_count","_dropPos","_UMUnit", "_jumpers", "_i"];
_pos 	= _this select 0;
_units 	= _this select 1;
_UMUnit	= _this select 2;
		
_spawn = [(_pos select 0)+3500,_pos select 1,_pos select 2];
_away  = [(_pos select 0)-3500,_pos select 1,_pos select 2];
_dropPos = [_pos select 0, _pos select 1, (_pos select 2)+ 200];
_group = creategroup civilian;
_plane = createVehicle ["C130J", [_spawn select 0, _spawn select 1, 1000], [], 0, "FLY"];
_pilot = _group createUnit ["Pilot", _spawn, [], 0, "NONE"];
_pilot assignAsDriver _plane;
_pilot moveindriver _plane;
_pilot1 = _group createUnit ["Pilot", _spawn, [], 0, "NONE"];
_pilot1 assignAsCargo _plane;
_pilot1 MoveInCargo [_plane,0];
_plane setVehicleInit "	this setBehaviour 'CARELESS';
						this flyInHeight 200;";
processInitCommands;
if (_UMUnit==0) then 
	{
	_count = 1;
		{
		if ((isPlayer _x) && (alive _x)) then	//player
			{
			[-1, 	{	if (name player == name (_this select 2)) then
						{
						player assignAsCargo (_this select 0);
						player MoveInCargo [(_this select 0),(_this select 1)];
						};
					}, [_plane,_count, _x]] call CBA_fnc_globalExecute;
			} else
				{
				_x assignAsCargo _plane;
				_x MoveInCargo [_plane,_count];
				};
		_count = _count + 1;
		} foreach _units;
	} else 
		{
		_count = 0;
			{
				{
					if ((isPlayer _x) && (alive _x)) then	//player
						{
						[-1, 	{	if (name player == name (_this select 2)) then
									{
									player assignAsCargo (_this select 0);
									player MoveInCargo [(_this select 0),(_this select 1)];
									};
								}, [_plane,_count, _x]] call CBA_fnc_globalExecute;
						} else
							{
							_x assignAsCargo _plane;
							_x MoveInCargo [_plane,_count];
							};
					_count = _count + 1;
				} foreach (units _x)
			} foreach _units;
		};

//Set waypoint
_plane move _dropPos;

while {(_plane distance _dropPos) > 600} do {sleep 1;_plane flyInHeight 200;}; 

if (_UMUnit==0) then 
	{
		{
		if ((isPlayer _x) && (alive _x)) then	//player
			{
			[-1, 	{	if (name player == name _this) then
							{
							unassignvehicle player;
							player action ["EJECT",vehicle player]
							}
					}, _x] call CBA_fnc_globalExecute;
			} else
				{
				unassignvehicle _x;
				_x action ["EJECT",_plane];
				};
		sleep ((random 0.3)+0.2);
		} foreach _units;
	} else 
		{
			{
				{
					if ((isPlayer _x) && (alive _x)) then	//player
						{
						[-1, 	{	if (name player == name _this) then
									{
									unassignvehicle player;
									player action ["EJECT",vehicle player]
									}
								}, _x] call CBA_fnc_globalExecute;
						} else
							{
							unassignvehicle _x;
							_x action ["EJECT",_plane];
							};
					sleep ((random 0.3)+0.2);
				} foreach (units _x)
			} foreach _units;
		};
/*
_jumpers = assignedCargo _plane;
[-2, {hint format ["%1", _this]}, _jumpers] call CBA_fnc_globalExecute;
for [{_i=1},{_i< (count (_jumpers))},{_i=_i+1}] do 
	{
		if (isPlayer (_jumpers select _i)) then	//player
			{
				server globalchat "is player";
				
			} else
				{
				unassignvehicle (_jumpers select _i);
				(_jumpers select _i) action ["EJECT",_plane];
				};
		sleep ((random 0.3)+0.2);
	};*/
	
_plane move _away;
_pilot domove _away;
while {(_plane distance _away) > 600} do {sleep 1}; 
deletevehicle _pilot;
deletevehicle _plane;