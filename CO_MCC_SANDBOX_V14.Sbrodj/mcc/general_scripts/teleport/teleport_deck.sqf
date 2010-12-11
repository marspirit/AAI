// Who activated the action?
_caller = _this select 1;


_worldPos = deck modelToWorld [0,0,0];
_caller setPosASL [ _worldPos select 0, _worldPos select 1, 15.9];