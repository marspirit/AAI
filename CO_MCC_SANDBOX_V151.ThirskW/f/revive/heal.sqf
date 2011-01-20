/*
  HEAL_ACTION SCRIPT

  Causes the player to execute the medic animation when the revive action is chosen

  © JULY 2009 - norrin 

***********************************************************************************************************************
begin heal.sqf
*/
_wounded			= _this select 3;
_name				= player; 				
_QG_animation		= NORRN_revive_array select 54;
_medpacks			= NORRN_revive_array select 80;
_reward_function 	= NORRN_revive_array select 96;

_wounded setVariable ["NORRN_unit_dragged", true, true];
if (_QG_animation == 1) then {_wounded playMoveNow "ainjppnemstpsnonwrfldnon"};
sleep 1; 

if (_QG_animation == 0) then
{
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
} else {
	_wounded attachTo [player,[0,1.1,0]];
	sleep 0.02;
	_wounded setVehicleInit "this setDir 170;";
	processInitCommands;
	player playMoveNow "ainvpknlmstpsnonwnondr_medic3";
};
if (_medpacks == 1) then
{
	_var = _name getVariable "Norrn_medpacks";
	_name setVariable ["Norrn_medpacks", (_var - 1), true];	
	if (_name == player) then
	{
		_med_supplies = format ["Medpacks Remaining: %1\nBandages  Remaining: %2", _name getVariable "Norrn_medpacks", _name getVariable "Norrn_bandages"];
		hint _med_supplies;
	};
};
sleep 2;
if (_reward_function == 1) then
{
	_var = _name getVariable "NORRN_bonus_life";
	_name setVariable ["NORRN_bonus_life", _var + 1, false];
};
if (_QG_animation == 1) then
{
	sleep 9;
	player playMoveNow "ainvpknlmstpsnonwnondr_medic0";
	sleep 9;
	player playMoveNow "ainvpknlmstpslaywrfldnon_1";
	detach _wounded;
};
if (true) exitWith {};

//020709