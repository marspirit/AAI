private ["_dummy", "_radius", "_pos", "_wreck", "_tempPos"];

_pos = _this select 0;
_radius = _this select 1;

_debris = ["Dirtmount_EP1", "Land_Dirthump01_EP1", "Land_Misc_Rubble_EP1", "Land_A_Castle_WallS_5_D", "Land_A_Castle_WallS_End","CraterLong"];

[_pos,_radius] call bis_fnc_destroyCity;

for [{_x=0},{_x<1+(floor _radius/40)},{_x=_x+1}] do		//create burning wrecks
			{
				_wreck = (ied_wrecks select (random (count ied_wrecks-1))) select 1;
				_tempPos = [(_pos select 0) + ((random _radius)-(random _radius)) ,(_pos select 1) + ((random _radius)-(random _radius)),_pos select 2];
				_dummy= _wreck createvehicle _tempPos;
				[-2, {[_this,10,time,false,false] spawn BIS_Effects_Burn}, _dummy] call CBA_fnc_globalExecute;
			};

for [{_x=0},{_x<1+(floor _radius/30)},{_x=_x+1}] do		//create  wrecks
			{
				_wreck = (ied_wrecks select (random (count ied_wrecks-1))) select 1;
				_tempPos = [(_pos select 0) + ((random _radius)-(random _radius)) ,(_pos select 1) + ((random _radius)-(random _radius)),_pos select 2];
				_dummy= _wreck createvehicle _tempPos;
			};
			
for [{_x=0},{_x<1+(floor _radius/25)},{_x=_x+1}] do		//create  craters and debris
			{
				_wreck = _debris select (random (count _debris-1));
				_tempPos = [(_pos select 0) + ((random _radius)-(random _radius)) ,(_pos select 1) + ((random _radius)-(random _radius)),_pos select 2];
				_dummy= _wreck createvehicle _tempPos;
			};
