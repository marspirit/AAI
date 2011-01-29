private ["_ied","_men","_index","_rand","_randsound","_disarmTime", "_footer", "_html", "_break","_dummyMarker"];
_ied = _this select 0;
_men = _this select 1;
_index = _this select 2;
_rand= random 1;
_randsound = random 10;

_disarmTime =  IEDDisarmTimeArray select (_ied getvariable "disarmTime"); 
_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];

if (_men distance _ied <5) then 
	{
		player playMove "RepairingKneel";
		_break = false; 
		for [{_x=1},{_x<_disarmTime},{_x=_x+1}]  do //Create progress bar
			{
				_footer = [_x,_disarmTime] call BIS_AdvHints_createCountdownLine;
				//add header
				_html = "<t color='#818960' size='0.85' shadow='0' align='left'>" + "Disarm Timer" + "</t><br/><br/>";
				//add _text
				_html = _html + "<t color='#a9b08e' size='1' shadow='0' shadowColor='#312100' align='left'>" + "Do not move while attempting to disarm" + "</t>";
				//add _footer
				_html = _html + "<br/><br/><t color='#818960' size='0.85' shadow='0' align='right'>" + _footer + "</t>";
				sleep 1; 
				hintsilent parseText(_html);
				if ((_ied distance _men) > 5) then {_x = _disarmTime; _break = true}; //check if still close to the IED
			};
		player switchMove "";	//Stop the animation
		player playMoveNow "AmovPercMstpSlowWrflDnon";	

		if (_break) exitwith{};	//If moved to far from the IED

		if (_men iskindof "USMC_SoldierS_Engineer" || _men iskindof "FR_Sapper" || _men iskindof "FR_Assault_GL") then	//If it is a bomb expert ;)
						{
							if (_rand > 0.30) then {
													if (_randsound > 5) then {[[_men], ["disarm1",5]] call CBA_fnc_globalSay} else {[[_men], ["disarm2",5]] call CBA_fnc_globalSay};
													sleep 1;
													_ied setvariable ["armed",false,true];
													_ied removeAction _index;
													_dummyMarker = _ied getvariable "iedMarkerName"; 
													[-2, {deletemarkerlocal format ["%1", _this];}, _dummyMarker] call CBA_fnc_globalExecute;	//delete IED marker 
													deletevehicle _ied;
													}
												else {
													if (_rand >0.05) then {
																		if (_randsound > 5) then {[[_men], ["disarmfail1",5]] call CBA_fnc_globalSay} else {[[_men], ["disarmfail2",5]]  call CBA_fnc_globalSay};
																		}
																	else {
																		hint "Critical fail start runing";
																		_ied removeAction _index;
																		if (_randsound > 5) then {[[_men], ["disarmcrit1",5]] call CBA_fnc_globalSay} else {[[_men], ["disarmcrit2",5]] call CBA_fnc_globalSay};
																		_ied setvariable ["armed",false,true];
																		sleep 8;
																		"GrenadeHand" createVehicle _pos;
																		sleep random 5; 
																		_ied setvariable ["iedTrigered",true,true];
																		};
						}							}
						else {
							if (_rand > 0.70) then {	//If it isn't a bomb expert <*Kaboom*>
													hint "disarmed";
													if (_randsound > 5) then {[[_men], ["disarm3",5]] call CBA_fnc_globalSay} else {[[_men], ["disarm4",5]] call CBA_fnc_globalSay};
													sleep 1;
													_ied setvariable ["armed",false,true];
													_ied removeAction _index;
													_dummyMarker = _ied getvariable "iedMarkerName"; 
													[-2, {deletemarkerlocal format ["%1", _this];}, _dummyMarker] call CBA_fnc_globalExecute;	//delete IED marker 
													deletevehicle _ied;
													}
												else {
												hint "Fail to disarm";
													if (_rand >0.3) then {
																		if (_randsound > 7) then {[[_men], ["disarmfail1",5]] call CBA_fnc_globalSay} else {[[_men], ["disarmfail2",5]] call CBA_fnc_globalSay}}
																	else {
																		hint "Critical fail start runing";
																		_ied removeAction _index;
																		if (_randsound > 5) then {[[_men], ["disarmcrit1",5]] call CBA_fnc_globalSay} else {[[_men], ["disarmcrit2",5]] call CBA_fnc_globalSay};
																		_ied setvariable ["armed",false,true];
																		sleep 5;
																		"GrenadeHand" createVehicle _pos;
																		sleep random 5; 
																		_ied setvariable ["iedTrigered",true,true];
																		};
																		 
													};
							};
	}
	else {hint "To far to disarm"};
						
																
