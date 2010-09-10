private ["_pos","_trapsx","_trapsy","_trapsnumber","_iedside",
"_trapkind","_eib_marker","_group","_random","_rpos","_sb","_safeTrapKind"];

//markers for first GUI
_pos = _this select 0; 
_trapsx = _this select 1; 
_trapsy = _this select 2; 
_trapsnumber = _this select 3; 
_iedside = _this select 4; 
_trapkind = _this select 5;
_safeTrapKind =[]; 

_eib_marker = createMarkerLocal ["traps",_pos];
_eib_marker setMarkerShapeLocal "RECTANGLE";
_eib_marker setMarkerSizeLocal [_trapsx, _trapsy];
_eib_marker setMarkerDirLocal 0;
_eib_marker setMarkerColorLocal "ColorBlue";
_eib_marker setMarkertext "traps";
			
	
_pos= getMarkerPos "traps";


  for [{_i=0},{_i<_trapsnumber},{_i=_i+1}] do {
	_group = creategroup civilian;
	_random= _trapkind select (random (count _trapkind-1))select 1;
	_rpos = [(_pos select 0) + ((random _trapsx)-(random _trapsx)) ,(_pos select 1) + ((random _trapsy)-(random _trapsy)),_pos select 2];
	_sb = _random createunit [_pos, _group,"removeallweapons this; _null = [this,_iedside] execVM 'mcc\general_scripts\traps\IED_sb.sqf'",1];
	_sb setposatl pos;
	_sb setdir random 360;
	_safeTrapKind set [count _safeTrapKind, [_random,_random]];
	sleep 0.5;
   };
sleep 1;
deletemarker "traps";

mcc_safe=mcc_safe + FORMAT ["
						  _pos=%1;
						  _trapsx = %2;
						  _trapsy = %3;
						  _trapsnumber=%4;
						  _iedside=%5;
						  _safeTrapKind=%6;
						 [""sb_bomber_area"", [_pos, _trapsx, _trapsy, _trapsnumber, _iedside, _safeTrapKind]] call CBA_fnc_globalEvent;
						   sleep 1;
						  "								 
						  , _pos
						  , _trapsx
						  , _trapsy
						  , _trapsnumber
						  , _iedside
						  , _safeTrapKind
						  ];



	
