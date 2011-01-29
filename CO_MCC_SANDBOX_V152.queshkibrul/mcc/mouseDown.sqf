//Returns the control, the pressed button, the x and y coordinates and the state of Shift, Ctrl and Alt.
private ["_params","_ctrl","_pressed","_posX","_posY","_shift","_ctrlKey","_alt","_nearObjects"];
disableSerialization;
 
_params = _this select 0;

_ctrl = _params select 0;
_pressed = _params select 1;
_posX = _params select 2; 
_posY = _params select 3;
_shift = _params select 4;
_ctrlKey = _params select 5;
_alt = _params select 6;

if (mcc_missionmaker == (name player)) then
	{
	if (rcPlacing && _pressed!=1) then //Road charge placing
		{
			pointA = _ctrl ctrlmapscreentoworld [_posX,_posY];
		};

	if (_ctrlKey && _pressed!=1) then //Manually detonate IED
		{
			pointA = _ctrl ctrlmapscreentoworld [_posX,_posY];
			_nearObjects = pointA nearObjects ["ACE_Target_CInf",20];
			{_x setvariable ["iedTrigered", true, true]} forEach _nearObjects;
		};
		
	if (ambushPlacing && _pressed!=1) then //Sync IED and ambush group
		{
			pointA = _ctrl ctrlmapscreentoworld [_posX,_posY];
		};
	if (_shift && _pressed!=1) then //Sync with shift key
		{
			pointA = _ctrl ctrlmapscreentoworld [_posX,_posY];
		};
	};
