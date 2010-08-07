private ["_ied","_men","_id"];
_ied = _this select 0;
_men = _this select 1;
_index = _this select 2;
_rand= random 1;
_randsound = random 10;
_pos=[((getposATL _ied) select 0),(getposATL _ied) select 1,((getPosATL _ied) select 2)];

if (_men distance _ied <=3) then {

_do_kneel = if (((player call CBA_fnc_getUnitAnim) select 0) == "stand") then {true} else {false};
if (_do_kneel) then {
	player playMove "AmovPercMstpSrasWrflDnon_diary";
};
sleep 3;
if (_men iskindof "USMC_SoldierS_Engineer" || _men iskindof "FR_Sapper" || _men iskindof "FR_Assault_GL") then
				{
					if (_rand > 0.30) then {
											if (_randsound > 5) then {_men say ["disarm1",5]} else {_men say ["disarm2",5]};
											sleep 1;
											_ied setvariable ["armed",false,true];
											_ied removeAction _index;
											}
										else {
											if (_rand >0.05) then {
																if (_randsound > 5) then {_men say ["disarmfail1",5]} else {_men say ["disarmfail2",5]};
																}
															else {
																hint "Critical fail start runing";
																_ied setvariable ["armed",false,true];
																_ied removeAction _index;
																if (_randsound > 5) then {_men say ["disarmcrit1",5]} else {_men say ["disarmcrit2",5]};
																sleep 10;
																"GrenadeHand" createVehicle _pos;
																};
				}							}
				else {
					if (_rand > 0.70) then {
											hint "disarmed";
											if (_randsound > 5) then {_men say ["disarm3",5]} else {_men say ["disarm4",5]};
											sleep 1;
											_ied setvariable ["armed",false,true];
											_ied removeAction _index;
											}
										else {
										hint "Fail to disarm";
											if (_rand >0.15) then {
																if (_randsound > 7) then {_men say ["disarmfail1",5]} else {if (_randsound > 3) then {_men say ["disarmfail2",5]};  _men say ["disarmfail3",5]};
																}
															else {
																hint "Critical fail start runing";
																_ied setvariable ["armed",false,true];
																_ied removeAction _index;
																if (_randsound > 5) then {_men say ["disarmcrit1",5]} else {_men say ["disarmcrit2",5]};
																sleep 7;
																"GrenadeHand" createVehicle _pos;
																};
												};
					};
	}
	else {hint "To far to disarm"};
						
																
