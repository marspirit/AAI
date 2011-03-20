private ["_dummyGroup", "_dummy", "_module", "_pos"];

_pos = _this select 0;
_module = _this select 1;

_dummyGroup = creategroup civilian; 
_dummy = _module createunit [_pos, _dummyGroup, "",0,"PRIVATE"];




