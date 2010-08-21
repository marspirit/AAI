disableSerialization;
_pos = _this select 0; 
_iedside = _this select 1; 
_trapkind = _this select 2;

mcc_safe=mcc_safe + FORMAT ["
						  _pos=%1;
						  _iedside=%2;
						  _trapkind='%3';
						  [""sb_bomber"", [_pos, _iedside, _trapkind]] call CBA_fnc_globalEvent;
						   sleep 1;
						  "								 
						  ,_pos
						  , _iedside
						  , _trapkind
						   ];

						   
_group = creategroup civilian;
_sb = _trapkind createunit [_pos, _group,"removeallweapons this; _null = [this,_iedside] execVM 'mcc\general_scripts\traps\IED_sb.sqf'",1];
_sb setposatl pos;


