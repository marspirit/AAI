/*

Usage: [unitToWatchFor, sideThatWatchesForUnit] execVM "nearTargets.sqf";
  replace unitToWatch with the unit object


Notes:
  nearTargets returns (example); [[[2555.33,2535.33,1.32708],"SoldierEB",EAST,214222,EAST 1-1-A:1],[[2550.39,2482.5,1.32696],"SoldierWB",WEST,0,WEST 1-1-A:2]]
*/

#define DEBUG_MODE_FULL
#define LEGAL_WEAPON_TYPES [4096,131072]

#include "\x\cba\addons\main\script_component.hpp"

private ["_group", "_unit", "_spotted", "_spottedWithWeapon", "_weapons", "_nearTargets", "_count", "_nearCount"];

PARAMS_2(_target,_side);

_spottedWithWeapon = false;
_count = 0; 
_nearCount = 0;
while { true } do
{
	_spotted = false;
	{
		_group = _x;
		if (side _group == _side) then
		{
			_weapons = weapons _target;
			_nearTargets = (leader _group) nearTargets 500;
			//TRACE_1("",_nearTargets);
			{
				_unit = _x select 4;
				if (_unit == _target) then
				{
					_spotted = true;
					if ((count _weapons) > 0) then
					{
						{
							if !(getNumber(configFile >> "CfgWeapons" >> _x >> "type") in LEGAL_WEAPON_TYPES) exitWith
							{
								TRACE_2("Found Illegal weapon",_target,_weapons);
								_spottedWithWeapon = true;
								_unit setCaptive false;
							};
						 } forEach _weapons;
					};
				};
				if (_spotted) exitWith {}; // quit the nearTargets loop if _target was spotted
			} forEach _nearTargets;
		};
		if (_spotted) exitWith {}; // quit the groups loop if _target was spotted
	} forEach allGroups;

	// Set unit to captive status when he was not spotted anymore, while he was spottedWithWeapon before
	if (_spottedWithWeapon && !_spotted) then
	{
		_count = _count +1;
		if (_count>20) then //if unit is hidden more then 2 minutes it will be captive again. 
			{
			_count = 0;
			TRACE_2("Forgot about unit while he was spotted with weapons earlier",_target,_weapons);
			_spottedWithWeapon = false;
			_target setCaptive true;
			hint "Your are no longer suspicious"; 
			};
	};
	
	if (_spotted && !_spottedWithWeapon) then	//Cover blown when standing too close to enemy unit
		{
			{
			_group = _x;
			if (side _group == _side) then
				{
					{
					if ((_target distance _x) < 10 && ((_x knowsabout _target)>0.6)) then
						{
						_nearCount = _nearCount +1;
						hintsilent "Enemy units are near"; 
						if (_nearCount>1) then
							{
							_spottedWithWeapon = true;
							_unit setCaptive false;
							_nearCount = 0;
							};
						} else {_nearCount = 0};
					} foreach units _group;
				};
			} foreach allgroups;
		};
	sleep 6;
};