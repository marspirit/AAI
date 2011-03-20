private ["_unit", "_man","_index","_type","_pistolMags","_smokeGrenads","_fragGrenades","_magazines","_countS","_countF","_countM"];
_unit =  _this select 0; 
_man = _this select 1;
_index = _this select 2;
_type = _this select 3;

if (_unit!=_man)  exitwith {}; 
if (drawGunIsRuning)  exitwith {}; 
drawGunIsRuning = true; 

switch (_type) do		
		{
			case 0:	
			{
			_pistolMags = _unit getvariable "uc_gunMags";
			_smokeGrenads = _unit getvariable "uc_smoke";
			_fragGrenades = _unit getvariable "uc_frag";

			_unit addweapon "glock17_EP1";
			for [{_x=1},{_x<=_pistolMags},{_x=_x+1}] do
				{
				_unit addmagazine "17Rnd_9x19_glock17";
				};
			for [{_x=1},{_x<=_smokeGrenads},{_x=_x+1}] do
				{
				_unit addmagazine "SmokeShell";
				};
			for [{_x=1},{_x<=_fragGrenades},{_x=_x+1}] do
				{
				_unit addmagazine "HandGrenade_West";
				};
			_unit selectweapon primaryweapon _unit;
			drawGunIsRuning = false; 
			_unit removeaction _index;
			_null = _unit addaction ["Holster Weapon", "mcc\general_scripts\undercover\fnc_handle_gun.sqf",1];
			};
			
			case 1:	
			{
			_magazines = magazines _unit;
			_countS = 0;
			_countF = 0; 
			_countM = 0; 
			_unit removeweapon "glock17_EP1";
			for [{_x=0},{_x< count _magazines},{_x=_x+1}] do
				{
				if ((_magazines select _x) == "SmokeShell") then {_countS= _countS+1; _unit removemagazine "SmokeShell";};
				if ((_magazines select _x) == "HandGrenade_West") then {_countF= _countF+1; _unit removemagazine "HandGrenade_West";};
				if ((_magazines select _x) == "17Rnd_9x19_glock17") then {_countM= _countM+1; _unit removemagazine "17Rnd_9x19_glock17";};
				};
			_unit setvariable ["uc_gunMags",_countM, true];
			_unit setvariable ["uc_smoke",_countS, true];
			_unit setvariable ["uc_frag",_countF, true];
			
			drawGunIsRuning = false; 
			_unit removeaction _index;
			_null = _unit addaction ["Draw Weapon", "mcc\general_scripts\undercover\fnc_handle_gun.sqf",0];
			};
		};

		








