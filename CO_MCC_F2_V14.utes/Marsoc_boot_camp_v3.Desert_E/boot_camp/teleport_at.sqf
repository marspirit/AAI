// Who activated the action?
_caller = _this select 1;


_worldPos = at modelToWorld [0,0,0];
_caller setPos [ _worldPos select 0, _worldPos select 1, 0];