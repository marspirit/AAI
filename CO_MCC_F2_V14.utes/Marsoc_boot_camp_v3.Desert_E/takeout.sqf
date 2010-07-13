{
	if (lifestate _x == "UNCONSCIOUS") then {
		dogetout _x;
		_x action ["getout", vehicle _x];
	};
} foreach crew (_this select 0);
