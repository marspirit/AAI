private ["_vehicle", "_caller", "_coinVehicleType", "_coinFunds", "_pos", "_footer", "_html", "_break"];
_vehicle = _this select 0;
_caller = _this select 1;
_coinVehicleType = (_this select 3) select 0; 
if (((_this select 3) select 1)==0) then {_coinFunds=500} else
	{
	if (((_this select 3) select 1)<=10) then {_coinFunds=((_this select 3) select 1)*1000} else
		{_coinFunds=(((_this select 3) select 1)-9)*10000};
	};
	
_break = false; 
if (isEngineOn _vehicle) exitWith{server globalchat "Can't deploy HQ while engine is on"};
if (_caller != driver _vehicle) exitWith {server globalchat "Only the vehicle's driver can deploy the HQ"};	
_pos = getpos _vehicle;

for [{_x=1},{_x<15},{_x=_x+1}]  do //Create progress bar
	{
		_footer = [_x,15] call BIS_AdvHints_createCountdownLine;
		//add header
		_html = "<t color='#818960' size='0.85' shadow='0' align='left'>" + "Deploying HQ" + "</t><br/><br/>";
		//add _text
		_html = _html + "<t color='#a9b08e' size='1' shadow='0' shadowColor='#312100' align='left'>" + "Keep the engine off and don't get out of the vehicle while deploying HQ" + "</t>";
		//add _footer
		_html = _html + "<br/><br/><t color='#818960' size='0.85' shadow='0' align='right'>" + _footer + "</t>";
		sleep 1; 
		hintsilent parseText(_html);
		if ((isEngineOn _vehicle) || (_caller != driver _vehicle)) then {_x = 15; _break = true}; //check if still close to the IED
	};
if (_break) exitWith {server globalchat "Deploy progress interrupted"};	
hint "Deploying Process Complete"; 	
_caller action ["EJECT",_vehicle];	
deletevehicle _vehicle;

[0, {_this execvm "mcc\general_scripts\coin\coin_exec_srvr.sqf";}, [_pos, 300, _caller, _coinVehicleType, _coinFunds]] call CBA_fnc_globalExecute;

