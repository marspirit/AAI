private ["_dummyGroup", "_dummy", "_commander", "_type", "_side", "_sync", "_controller","_hc"];
_commander = _this select 0;
_type = _this select 1;

if (_type ==0) then 
	{
	if (isnil {_commander getvariable "commander"}) then //if the unit isn't the commander
		{	
		if !((name _commander) == mcc_missionmaker) then 
			{[-2, {hint format ["%1 assigned as %2 commander",name _this, side _this]},_commander] call CBA_fnc_globalExecute;};
		_commander setvariable ["commander", true, true];
		_dummyGroup = creategroup civilian; 
		switch (format ["%1", side _commander]) do 
			{
			case "EAST": //East
				{
				_sync = synchronizedObjects HCEast;
				HCEast synchronizeObjectsRemove _sync;
				hcRemoveAllGroups HCEast;
				deletevehicle HCEast;
				HCEast = _dummyGroup createunit ["HighCommand", getpos _commander,[],0,"NONE"];
				HCEast synchronizeObjectsAdd [_commander];
				_hc = HCEast;
				}; 
				
			case "WEST": //West
				{
				_sync = synchronizedObjects HCWest;
				HCWest synchronizeObjectsRemove _sync;
				hcRemoveAllGroups HCWest;
				deletevehicle HCWest;
				HCWest = _dummyGroup createunit ["HighCommand", getpos _commander,[],0,"NONE"];
				HCWest synchronizeObjectsAdd [_commander];
				_hc = HCWest;
				};
				
			case "GUER": //Resistance
				{
				_sync = synchronizedObjects HCGuer;
				HCGuer synchronizeObjectsRemove _sync;
				hcRemoveAllGroups HCGuer;
				deletevehicle HCGuer;
				HCGuer = _dummyGroup createunit ["HighCommand", getpos _commander,[],0,"NONE"];
				HCGuer synchronizeObjectsAdd [_commander];
				_hc = HCGuer;
				};
			{if ((alive _x) && (side _x == side _commander)) then		//add all player from the same faction as subordante
				{
					_commander hcSetGroup [group _x];
				};
			} forEach  (switchableUnits + playableUnits);
			};
		} else {[-2, {hint format ["%1 is allready assigned as %2 commander",name _this, side _this]},_commander] call CBA_fnc_globalExecute};
	};

if (_type == 1) then 	//Remove all
	{
	hcRemoveAllGroups _commander;
	};
	
if (_type == 2) then 	//Add Group
	{
	switch (format ["%1", side  _commander]) do 
		{
		case "EAST": //East
			{
			_controller = (synchronizedObjects HCEast) select 0;
			}; 
			
		case "WEST": //West
			{
			_controller = (synchronizedObjects HCWest) select 0;
			};
			
		case "GUER": //Resistance
			{
			_controller = (synchronizedObjects HCGuer) select 0;
			};
		};
	_controller hcSetGroup [group _commander];
	};
