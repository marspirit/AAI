// Who activated the action?
_caller = _this select 1;
_worldPos = td modelToWorld [0,0,0];
_caller setPos [ _worldPos select 0, _worldPos select 1, 0];

