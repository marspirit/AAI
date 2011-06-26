#define COIN_VEHICLE 7050
#define COIN_SIDE 7051
#define COIN_FUNDS 7052
private ["_type", "_funds"];
if !mcc_isloading then 
	{
	coinVehicle = lbCurSel COIN_VEHICLE;
	coinFunds = lbCurSel COIN_FUNDS;
	_type = _this select 0;
	if (coinFunds==0) then {_funds=500} else
			{
			if (coinFunds<=10) then {_funds=coinFunds*1000} else
				{_funds=(coinFunds-9)*10000};
			};
	if (_type ==0) then	//create
		{
		hint "click on map where you want to put the construction vehicle"; 
		if (mcc_capture_state) then
			{
				onMapSingleClick " 	hint ""Construction Set Captured.""; 
									mcc_capture_var=mcc_capture_var + FORMAT ['
									[""coin"", [%1, %2, %3]] call CBA_fnc_globalEvent;'								 
									,_pos
									,coinVehicle
									,coinFunds
									];
									onMapSingleClick """";";
			} else 
			{
				onMapSingleClick " 	hint ""Construction Vehicle Spawned.""; 
									mcc_safe=mcc_safe + FORMAT ['
									[""coin"", [%1, %2, %3]] call CBA_fnc_globalEvent;
									'								 
									,_pos
									,coinVehicle
									,coinFunds
									];
									[""coin"", [_pos, coinVehicle , coinFunds]] call CBA_fnc_globalEvent;
									onMapSingleClick """";";
			}
		};
	if (_type == 1) then
		{
		switch (coinVehicle) do 
			{
			case 0: //West  
				{
					westCoinFunds = westCoinFunds - _funds;
					publicVariable "westCoinFunds";
				};
			case 1: //East  
				{
					eastCoinFunds = eastCoinFunds - _funds;
					publicVariable "eastCoinFunds";
				};
			case 2: //Resistance  
				{
					resistanceCoinFunds = resistanceCoinFunds - _funds;
					publicVariable "resistanceCoinFunds";
				};
			};
		};
		
	if (_type == 2) then
		{
		switch (coinVehicle) do 
			{
			case 0: //West  
				{
					westCoinFunds = westCoinFunds + _funds;
					publicVariable "westCoinFunds";
				};
			case 1: //East  
				{
					eastCoinFunds = eastCoinFunds + _funds;
					publicVariable "eastCoinFunds";
				};
			case 2: //Resistance  
				{
					resistanceCoinFunds = resistanceCoinFunds + _funds;
					publicVariable "resistanceCoinFunds";
				};
			};
		};
	};

