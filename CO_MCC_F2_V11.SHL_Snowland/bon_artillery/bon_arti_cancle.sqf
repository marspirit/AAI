//by Bon_Inf*

_requestor = _this;

[playerSide,"HQ"] sideChat "Fire Mission canceled";
CloseDialog 0;

// clean up
Server setVariable [format["Arti_%1_requestor",playerSide],ObjNull,true];
_requestor setVariable ["requesting_cannons",nil,true];

for "_i" from 1 to HW_Arti_CannonNumber do {
	_requestor setVariable [format["Arti_%2_Cannon%1",_i,playerSide],nil,true];
	_requestor setVariable [format["Arti_%2_Cannon%1summary",_i,playerSide],nil,false];
};

arty_LastData = nil;


if(true) exitWith{};