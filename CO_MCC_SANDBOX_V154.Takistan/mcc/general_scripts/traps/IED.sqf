/* 
Advance IED script by Shay_Gman 12.10
*/
private ["_dummy","_trapvolume","_IEDExplosionType","_IEDJammable","_IEDTriggerType","_trapdistance","_iedside",
"_targets", "_loop","_nearObjects","_nearTargets","_nrsd","_count","_target","_dummyMarker","_armed", "_triggered","_pos","_IedExplosion","_wh"];

_dummy = _this select 0;	//the hiden targer
_trapvolume = _this select 1;	//How big the explosion
_IEDExplosionType = _this select 2;	//Deadly/disabling
_IEDJammable = _this select 3;	//Is it jammable?
_IEDTriggerType = _this select 4;	//Proximity or admin
_trapdistance = _this select 5;	//Proximity distance
_iedside = _this select 6;	//targer faction

// Target classes that will triger the IED                                    
_targets = ["Car","Tank","Man"];
_loop=true;	// continue looping?
_armed = _dummy getvariable "armed";	//Is the IED armed?
_triggered = _dummy getvariable "iedTrigered";	//Is the IED triggered
_fakeIed =  _dummy getvariable "fakeIed"; 	//The name of the fake IED object

if (_IEDTriggerType==1) then	
	{
		waituntil {_triggered};	//manual detonation
	} else
		{	//Proximity
			while {alive _fakeIed && _loop && _armed && !_triggered} do 
				{  
					sleep 3;
					_triggered = _dummy getvariable "iedTrigered";
					_nearObjects = (getPos _dummy) nearObjects 150;
					if(_iedside countSide _nearObjects > 0) then 
						{
							while {(alive _fakeIed) && (_loop) && _armed && !_triggered} do
								{
									sleep 1;
									_triggered = _dummy getvariable "iedTrigered";
									_nearTargets = (getPos _dummy) nearObjects (_trapdistance);
									_nrsd = [];
									{if(side _x == _iedside) then {_nrsd = _nrsd + [_x]}} forEach _nearTargets;
									_count=count _nrsd;
									for [{_x=0},{_x<_count},{_x=_x+1}] do
										{
											_target = _nrsd select _x;
											if (_IEDJammable==0) then	//If the IED is jammable
												{
													{if((_target isKindOf _x) && ((_target distance _dummy) <= 80)) then //check if it's a CREW vehicle
														{
															waituntil {((_target distance _dummy) > 80)};
															//if (true) exitWith {_loop=false; _dummy setvariable ["iedTrigered",true,true];}
														}} forEach IEDJammerVehicles; 
												};
											if (_loop) then 
												{
													{if((_target isKindOf _x) && ((_target distance _dummy) <= _trapdistance) && ((speed _target) > 2.5))exitWith {_loop=false;_dummy setvariable ["iedTrigered",true,true]}} forEach _targets;
												};
										};
								_armed = _dummy getvariable "armed";
								};
						};
				};
		};
_dummyMarker = _dummy getvariable "iedMarkerName"; 
[-2, {deletemarkerlocal format ["%1", _this];}, _dummyMarker] call CBA_fnc_globalExecute;	//de;ete IED marker 
_dummy removeaction disarm;
_armed = _dummy getvariable "armed";
_triggered = _dummy getvariable "iedTrigered";

_pos=[((getposATL _dummy) select 0),(getposATL _dummy) select 1,((getPosATL _dummy) select 2)];	//position of the IED

switch (_IEDExplosionType) do
		{
		   case 0:	
			{ 
				_IedExplosion = IedDeadlyExplosion;
			};
			
			case 1:	
			{ 
			   _IedExplosion = IedDisablingExplosion;
			};
			
			case 2:	
			{ 
			   _IedExplosion = IedFakeExplosion;
			};
		};
		
if (_armed && _triggered) then	//If triger epxplosion
	{	
		[_pos,_trapvolume] spawn _IedExplosion; 
	};

if (!alive _fakeIed && _armed ) then	//If IED is destroyed
	{
		[_pos,_trapvolume] spawn _IedExplosion;
	};

if (_triggered && !_armed ) then 	//If IED critical fail while trying to disarm it
	{	
		[_pos,_trapvolume] spawn _IedExplosion;
	};

	
if (_fakeIed isKindOf "Car") then 	//If IED is a car kets make it burn
	{
		_fakeIed setdamage 1;
		[-2, {[_this,5,time,false,true] spawn BIS_Effects_Burn}, _fakeIed] call CBA_fnc_globalExecute;
	} else {deletevehicle _fakeIed};

deletevehicle _dummy;	//Delete the dummyIED
if (true) exitWith {};