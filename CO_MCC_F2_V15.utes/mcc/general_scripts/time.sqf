_date=date;
_date set [1, month];
_date set [3, hour];
_date set [4, 00];
["cba_network_date", _date] call CBA_fnc_globalEvent;



