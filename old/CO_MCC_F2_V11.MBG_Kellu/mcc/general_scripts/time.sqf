_d=date;
_d=[_d select 0, _d select 1, _d select 2, hour, 00];

["cba_network_date", _d] call CBA_fnc_globalEvent;


