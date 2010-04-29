// Norrn_LeaderFix
// © AUGUST 2009 - norrin

_group_leader 	= _this select 0;
_my_group		= _this select 1;

call compile format ["_leader = %1", _group_leader]; 
_group = group _leader; 
{call compile format ["if (group %1 != _group  && !(%1 getVariable 'Norrn_dead')) then {[%1] joinsilent _group; %1 doMove (getPos %1)}", _x]} forEach _my_group;
sleep 2;
{call compile format ["if (group %1 != _group  && !(%1 getVariable 'Norrn_dead')) then {[%1] joinsilent _group; %1 doMove (getPos %1)}", _x]} forEach _my_group;  

if (_leader != formleader _name) then
{
	{_x doFollow _leader} forEach units _group;
	{_x doMove getPos _x} forEach units _group;
};

//file modified 170809
