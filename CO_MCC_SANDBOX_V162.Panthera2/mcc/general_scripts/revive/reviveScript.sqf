private ["_player","_pos"];
_player = _this select 0;

if (livesRemains>0) then
	{
	livesRemains = livesRemains -1;
	hint format ["You have %1 lifes left",livesRemains];
	//Body Removel
	if (isPlayer _player) then {
		waitUntil {alive player}; 
		hideBody _player;
		sleep 10;
		deleteVehicle _player;
		}
		else {
			sleep 30;
			hideBody _player;
			sleep 10;
			deleteVehicle _player;
			};
	} else {
		ace_wounds_prevtime = 0;
		MCC_TRAINING = false;
		waitUntil {alive player}; 
		player setPos [0,0,0];
		};