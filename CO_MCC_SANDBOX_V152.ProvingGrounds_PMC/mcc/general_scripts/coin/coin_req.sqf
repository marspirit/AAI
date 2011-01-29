#define COIN_VEHICLE 7050
#define COIN_SIDE 7051
#define COIN_FUNDS 7052

if !mcc_isloading then 
	{
	coinVehicle = lbCurSel COIN_VEHICLE;
	coinRadius = lbCurSel COIN_SIDE;
	coinFunds = lbCurSel COIN_FUNDS;
	hint "click on map where you want to put the construction vehicle"; 
	if (mcc_capture_state) then
		{
			onMapSingleClick " 	hint ""Construction Set Captured.""; 
								mcc_capture_var=mcc_capture_var + FORMAT ['
								[""coin"", [%1, %2, %3, %4]] call CBA_fnc_globalEvent;'								 
								,_pos
								,coinVehicle
								,coinRadius
								,coinFunds
								];
								onMapSingleClick """";";
		} else 
		{
			onMapSingleClick " 	hint ""Construction Vehicle Spawned.""; 
								[_pos, coinVehicle, coinRadius, coinFunds] execVm 'mcc\general_scripts\coin\coin_spawn.sqf';
								mcc_safe=mcc_safe + FORMAT ['
								[""coin"", [%1, %2, %3, %4]] call CBA_fnc_globalEvent;'								 
								,_pos
								,coinVehicle
								,coinRadius
								,coinFunds
								];
								onMapSingleClick """";";
		}
	};
	
	////[""coin"", [_pos, coinVehicle, coinRadius, coinFunds]] call CBA_fnc_globalEvent;