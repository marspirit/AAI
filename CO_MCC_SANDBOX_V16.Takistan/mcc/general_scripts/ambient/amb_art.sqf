private ["_arti","_type","_dummypos"];

_type = _this select 0; 

if (!isserver) exitWith {}; 

//Waits until UPSMON is init
waitUntil {!isNil("KRON_UPS_INIT")};
waitUntil {KRON_UPS_INIT==1};

if (_type<4) then
	{
	_arti = _this select 1; 
	_arti addeventhandler["fired", {_null =[4,_this select 0, _this select 4] execVM "mcc\general_scripts\ambient\amb_art.sqf"}]; //Delete the projectile.
	_dummypos = [getpos _arti, 50, getdir _arti] call R_relPos3D;
	sleep 1; 
	(gunner _arti) lookAt [_dummypos select 0, _dummypos select 1,(_dummypos select 2)+100];
	_arti disableAI "AUTOTARGET";
	_arti disableAI "TARGET";
	sleep 10;
	};
switch (_type) do
	{
		case 0:	//Set Cannon
		{ 
		while {alive (gunner _arti) || alive _arti} do
			{
			_arti fire (weapons _arti select 0);
			sleep ((random 5)+5);
			_arti setVehicleAmmo 1;
			};
		_arti removeAllEventHandlers "fired";
		};
		
		case 1:	//Set Rockets
		{ 
		while {alive (gunner _arti) || alive _arti} do
			{
			for [{_i=0}, {_i<12}, {_i=_i+1}] do 
				{ 
				_arti fire (weapons _arti select 0);
				sleep 1.5;
				};
			_arti setVehicleAmmo 1;
			sleep ((random 60)+60);
			_arti removeAllEventHandlers "fired";
			};
		};
		
		case 2:	//Set AA
		{ 
		_arti removeAllEventHandlers "fired";
		while {alive (gunner _arti) || alive _arti} do
			{
			for [{_i=0}, {_i<12}, {_i=_i+1}] do 
				{ 
				_arti fire (weapons _arti select 0);
				_arti fire (weapons _arti select 0);
				sleep 0.5;
				};
			_arti setVehicleAmmo 1;
			sleep ((random 10)+10);
			_dummypos = [getpos _arti, 50, ((getdir _arti)+ 180 - (random 90)) ] call R_relPos3D;
			sleep 1; 
			(gunner _arti) lookAt [_dummypos select 0, _dummypos select 1,(_dummypos select 2)+100];
			};
		};
		
		case 3:	//Set search light AA
		{ 
		_arti removeAllEventHandlers "fired";
		while {alive (gunner _arti) || alive _arti} do
			{
			_dummypos = [(((getpos _arti) select 0) + 100 - (random 200)), (((getpos _arti) select 1) + 100 - (random 200)), (((getpos _arti) select 2) + 100)];
			(gunner _arti) lookAt [_dummypos select 0, _dummypos select 1,(_dummypos select 2)+100];
			sleep 10;
			};
		};
		
		case 4:	//Fire
		{ 
		sleep 0.5;
		deletevehicle (nearestobject[_this select 1, _this select 2]);
		};
	};


