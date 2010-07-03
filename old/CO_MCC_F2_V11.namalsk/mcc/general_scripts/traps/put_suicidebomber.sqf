_tpos=_this;
_count = count trapkind;
_random= trapkind select (random (_count-1));
_group = creategroup civilian;
_sb = _random createunit [_tpos, _group,"_null = [this,iedside,trapvolume,10,10] execVM ""mcc\general_scripts\traps\IED_sb.sqf""; this addrating -1; this allowfleeing 0;this setbehaviour ""CARELESS""; group this setSpeedMode ""Full"";",1];
publicvariable "disarm";
_sb setposatl _tpos;
