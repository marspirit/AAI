// Who activated the action?
_hostage = _this select 0;
_caller = _this select 1;
_index = _this select 2; 
_hostage removeAction _index;
[_hostage] join _caller;
_hostage setcaptive false;
