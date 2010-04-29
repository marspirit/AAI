//by Bon_Inf*

_requestor = _this;

[WEST,"HQ"] sideChat "Fire Mission canceled";
CloseDialog 0;

// clean up
Server setVariable ['arty_requestor',ObjNull,true];
_requestor setVariable ["requesting_cannons",nil,true];

for "_i" from 1 to HW_Arti_CannonNumber do {
	_requestor setVariable [format["Cannon%1",_i],nil,true];
	_requestor setVariable [format["Cannon%1summary",_i],nil,true];
};

arty_LastData = nil;


if(true) exitWith{};