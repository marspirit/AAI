_this addeventhandler ["hit", "if (_this select 0 animationphase ""terc"" == 0) then {_this select 0 spawn {_this animate [""terc"", 1]; sleep 5; _this animate [""terc"", 0]}}"];
