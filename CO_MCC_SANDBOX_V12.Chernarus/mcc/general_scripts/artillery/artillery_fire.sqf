private ["_sound", "_pos", "_shelltype", "_shellspread", "_nshell"];
_pos					 = _this select 0; 
_shelltype 			     = _this select 1; 
_shellspread			 = _this select 2; 
_nshell 				 = _this select 3; 

_sound = true;

ARTY_BOMB = 					//Regular bombs
	{
		private ["_sound", "_pos", "_shelltype", "_shellspread", "_nshell", "_shell"];
		_pos					 = _this select 0; 
		_shelltype 			     = _this select 1; 
		_shellspread			 = _this select 2; 
		_nshell 				 = _this select 3; 
		_sound 					 = _this select 4; 
		
		for [{_i=0},{_i<_nshell},{_i=_i+1}] do
			{
				_shell = _shelltype createVehicle [(_pos select 0) + _shellspread - 2*(random _shellspread) ,(_pos select 1) + _shellspread - 2*(random _shellspread), 100];
				WaitUntil{(position _shell select 2)<35};
				if (_sound) then {[[_shell], [format["bon_Shell_In_v0%1",[1,2,3,4,5,6,7] select round random 6],10]] call CBA_fnc_globalSay;}; 
				sleep 4;
			};
	};
	
ARTY_NUKE =					//Nuclear bomb
	{
		private ["_pos", "_shelltype"];
		_pos					 = _this select 0; 
		_shelltype 			     = _this select 1; 
		[_shelltype, [_pos select 0, _pos select 1,0]] call ACE_fnc_NuclearGroundBurst;
	};

ARTY_NUKE_AIR =					//Air burst nuclear bomb
	{
		private ["_pos", "_shelltype"];
		_pos					 = _this select 0; 
		_shelltype 			     = _this select 1; 
		[_shelltype, [_pos select 0, _pos select 1,0]] call ACE_fnc_NuclearAirBurst;
	};

switch (_shelltype) do
			{
				case "ARTY_Sh_105_HE":	//HE 105mm 
			    { 
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "Sh_85_HE":	//HE 85mm
			    { 
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "G_40mm_HE":	//HE 40mm
			    { 
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "ARTY_Sh_105_WP":	//WP
			    { 
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "Smokeshell":	//Smokeshell White
			    { 
					_sound = false;
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "SmokeShellGreen":	//Smokeshell Green
			    { 
					_sound = false;
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "SmokeShellRed":	//Smokeshell Red
			    { 
					_sound = false;
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "F_40mm_White":	//Flare White
			    { 
					_sound = false;
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "F_40mm_Green":	//Flare Green
			    { 
					_sound = false;
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "F_40mm_Red":	//Flare Red
			    { 
					_sound = false;
					[_pos, _shelltype, _shellspread, _nshell, _sound] spawn ARTY_BOMB;
				};
				
				case "Tactical Nuke(0.3k)":	//Tactical Nuke(0.3k)
			    { 
					_shelltype = "ACE_B61_03";
					[_pos, _shelltype] spawn ARTY_NUKE;					
				};
				
				case "Tactical Nuke(1.5k)":	//Tactical Nuke(1.5k)
			    { 
					_shelltype = "ACE_B61_15";
					[_pos, _shelltype] spawn ARTY_NUKE;				
				};
				
				case "Tactical Nuke(5.0k)":	//"Tactical Nuke(5.0k)"
			    { 
					_shelltype = "ACE_B61_50";
					[_pos, _shelltype] spawn ARTY_NUKE;				
				};
				
				case "Air Burst(0.3k)":	//Tactical Nuke(0.3k) NUKE_AIR
			    { 
					_shelltype = "ACE_B61_03";
					[_pos, _shelltype] spawn ARTY_NUKE_AIR;						
				};
				
				case "Air Burst(1.5k)":	//Tactical Nuke(1.5k) NUKE_AIR
			    { 
					_shelltype = "ACE_B61_15";
					[_pos, _shelltype] spawn ARTY_NUKE_AIR;					
				};
				
				case "Air Burst(5.0k)":	//Tactical Nuke(5.0k) NUKE_AIR
			    { 
					_shelltype = "ACE_B61_50";
					[_pos, _shelltype] spawn ARTY_NUKE_AIR;						
				}
				
			  
			};
		