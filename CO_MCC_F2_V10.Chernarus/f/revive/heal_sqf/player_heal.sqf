/*
  PLAYER HEAL SCRIPT - Doc SNKMAN's Amazing Snake Oil Elixir

 All playable units can heal themselves a x number of times

  © JANUARY 2009 - norrin  

*******************************************************************************************************

Based on an idea by SNKMAN

*******************************************************************************************************
Start player_heal.sqf
*/

if (!local player) exitWith {};

_unit = _this select 0;
_no_of_heals = 		NORRN_revive_array select 29;
_lower_bound_heal = 	NORRN_revive_array select 30;
_upper_bound_heal = 	NORRN_revive_array select 31;
_c = 0;
_no_heals_remaining = _no_of_heals;
_remove_heal = false;


//Probably best not to play with the following code unless you know what you are doing
sleep 0.5;
	
//Prompt joining player the number of heals remaining
	_no_heals = format ["Heals remaining: %1", _no_of_heals];
//	hint _no_heals;

//Body of the script
while {true} do
{	
	//While player alive
	if (alive player) then
	{
		//add heal action for players 
		if(_c == 0 && getDammage player >= _lower_bound_heal && getDammage player <= _upper_bound_heal && _no_heals_remaining > 0) then
		{
			NORRN_HealAction = player addAction ["Heal", "f\revive\heal_sqf\heal.sqf","", 0, false, true]; 
			_c = _c + 1;
		};
		if (NORRN_healed) then {_remove_heal = true}; 
			

		if(_remove_heal) then
		{	
			_no_heals_remaining = _no_heals_remaining - 1;
			
			hint format ["Heals remaining: %1", _no_heals_remaining];
			player removeAction NORRN_HealAction;
			
			_c = 0;
			NORRN_healed = false;
			_remove_heal = false;	
			sleep 4;
			hint"";
			sleep 6;
		};
		if (getDammage player > _upper_bound_heal) then 
		{ 
			player removeAction NORRN_HealAction;
			_c = 0;
			sleep 1;
		};	
		sleep 2;
	};
	
	//if player is dead	
	if (!alive player) then 
	{		
		_no_heals_remaining = _no_of_heals;
		_no_left = format ["Heals remaining: %1", _no_heals_remaining];
		//hint _no_left;
		NORRN_healed = false;
		_c = 0;
		sleep 2;
	};	
};
//file last edited 130109