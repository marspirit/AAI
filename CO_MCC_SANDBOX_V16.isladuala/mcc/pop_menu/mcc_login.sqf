//(c) 06.11
#define MCC_SANDBOX_IDD 2999

#define LOGOUT 3290
#define LOGIN 3291

#define GROUP_SPAWN_B 3007
#define UNIT_SPAWN_B 3012

#define MCC_MM 2980

private ["_ar", "_mccdialog", "_login"];

disableSerialization;

_mccdialog = findDisplay MCC_SANDBOX_IDD;

//player sidechat format ["Login: %1 - %2 - %3", mcc_resetmissionmaker, mcc_loginmissionmaker, (mcc_missionmaker == '' ) ]; // debug

if ( mcc_resetmissionmaker ) then 
{
	//update request number
	mcc_request=mcc_request+1;

	if ( mcc_loginmissionmaker && (mcc_missionmaker == '' ) ) then // Login Request
	{
		_login = true;
	}
	else
	{
		_login = false;
	};
	
	_ar = [
		player
		, name (player)
		, mcc_resetmissionmaker
		, _login
		, mcc_request
		];

	//player sidechat format ["AR: %1", _ar]; // debug
	
	// Send data over the network, or when on server, execute directly
	if (isServer) then { ["mcc_login", _ar] call CBA_fnc_localEvent } else { ["mcc_login", _ar] call CBA_fnc_remoteEvent };
	
	_mccdialog = findDisplay MCC_SANDBOX_IDD;	
	
	(_mccdialog displayCtrl UNIT_SPAWN_B) ctrlEnable true;
	(_mccdialog displayCtrl GROUP_SPAWN_B) ctrlEnable true;
	(_mccdialog displayCtrl LOGOUT) ctrlEnable true;
	(_mccdialog displayCtrl LOGIN) ctrlEnable false;
};

sleep 3;

//If we came out of here then we need reset some stuff
mcc_resetmissionmaker = false;
mcc_loginmissionmaker = false;
