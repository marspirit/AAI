/*
rPRN - Prevents players from standing once they have been revived

revised AUGUST 2009 

written by HulkingUnicorn modified by norrin and alef
**************************************************************************************
start rPrn.sqf
*/

_name = _this select 0;

HULK_UprightAnims = ["amovpercmstpsraswrfldnon","amovpercmstpsnonwnondnon","amovpercmstpsraswpstdnon","amovpknlmstpsraswrfldnon","amovpknlmstpsraswpstdnon",
  "AmovPknlMstpSrasWlnrDnon","amovpercmevaslowwrfldf","amovpercmevasnonwnondf","amovpercmevaslowwpstdf","amovpknlmstpsraswlnrdnon","amovpknlmstpsraswrfldnon_amovpercmstpsraswrfldnon",
  "aidlpknlmstpslowwrfldnon_idlesteady02","aidlpknlmstpslowwrfldnon_idlesteady03","aidlpknlmstpslowwrfldnon_idlesteady04","aidlpknlmstpsraswrfldnon_player_idlesteady01",
  "aidlpknlmstpsraswrfldnon_player_idlesteady02","aidlpknlmstpsraswrfldnon_player_idlesteady03","aidlpknlmstpsraswrfldnon_player_idlesteady04","aidlpknlmstpsraswlnrdnon_player_0s",
  "aidlpercmstpsraswrfldnon_idlesteady01","aidlpercmstpsraswrfldnon_idlesteady02","aidlpercmstpsraswrfldnon_idlesteady03","aidlpercmstpsraswrfldnon_idlesteady04",
  "aidlpercmstpsraswrfldnon_aiming01","aidlpercmstpsraswrfldnon_aiming02","aidlpercmstpsraswrfldnon_aiming03","aidlpercmstpsraswrfldnon_aiming04"];
  
HULK_TrbleAn =["amovpercmevaslowwrfldf","amovpercmevasnonwnondf","amovpercmevaslowwpstdf","amovpknlmstpsraswlnrdnon"];
//hint "hack running";

while {damage _name >= 0.7 && alive _name} do
{	
	_an = animationState _name;
	if (_an == "AmovPknlMstpSrasWlnrDnon" || _an == "aidlpknlmstpsraswlnrdnon_player_0s") then {_name selectWeapon (primaryWeapon _name)};
	//hint format ["%1", _an];
	if (_an in HULK_UprightAnims) then
	{	
		if (_an in HULK_TrbleAn) then 
		{	
			disableUserInput true;
			waitUntil {speed player == 0};
			_name playMove "amovppnemstpsraswrfldnon";
			if (_name == player) then {titleText ["You are seriously wounded and can't stand!", "black out"]};
			sleep 8;
			titleText ["Go see a medic!", "black in"];
			disableUserInput false; 
		} else
		{	
			_name playMove "amovppnemstpsraswrfldnon";
			if (_name == player) then {titleText ["You are seriously wounded and can't stand!", "black out"]};
			sleep 5;
			if (_name == player) then {titleText ["Go see a medic!", "black in"]};

		};
	};
	sleep 1;
};

if (true) exitWith {};

//AmovPpneMstpSnonWnonDnon_AmovPknlMstpSrasWlnrDnon