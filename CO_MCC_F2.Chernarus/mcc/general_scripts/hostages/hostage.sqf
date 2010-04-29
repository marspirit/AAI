// Who activated the action?
_caller = _this select 1;
_hostage = _this select 0;
[_hostage] join _caller;
_hostage setcaptive false;
