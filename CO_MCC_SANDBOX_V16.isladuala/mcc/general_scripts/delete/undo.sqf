 if !mcc_isloading then 
			{
			mcc_safe = mcc_safe + FORMAT ["script_handler = [1] execVM 'mcc\general_scripts\delete\undo.sqf';
								waitUntil {scriptDone script_handler};
								"
								];									
			};
[-2, {
if ((count lastSpawn)>0) then
	{
	if (typeName (lastSpawn select ((count lastSpawn)-1)) == "ARRAY") then
		{
		deleteVehicle ((lastSpawn select ((count lastSpawn)-1)) select 0);
		{deleteVehicle _x} forEach ((lastSpawn select ((count lastSpawn)-1)) select 1);
		lastSpawn resize ((count lastSpawn)-1); 
		}else
			{
			deleteVehicle (lastSpawn select ((count lastSpawn)-1));
			lastSpawn resize ((count lastSpawn)-1); 
			}
		};
	}] call CBA_fnc_globalExecute;
	
 
 

