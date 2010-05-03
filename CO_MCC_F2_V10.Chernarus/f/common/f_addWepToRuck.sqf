// F2A2 - f_AddWepToRuck
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// arguments: [_unit, _weapon, _count] (_count is optional )
// example usage: [player, "Javelin", 1] spawn f_AddWepToRuck;

// requires the following two lines in the INIT.SQF or some other appropriate location
// cfgACE_IsEnabled = isClass (configFile >> "CfgPatches" >> "ace_version");
// f_AddWepToRuck = compile preprocessFileLineNumbers "f\common\f_AddWepToRuck.sqf";

#define __CONF_MAGAZINES configFile >> "CfgMagazines"
#define __CONF_WEAPONS configFile >> "CfgWeapons"

private [
	"_unit",
	"_weapon",
	"_count",
	"_NewCount",
	"_confSize",
	"_newSize",
	"_return",
	"_ErrorReport",
	"_i"
];

If (!cfgACE_IsEnabled) ExitWith {diag_log "WARNING: RuckFunctions Disabled. ACE Mod does not appear to be activated."}; 

_unit = _this select 0;
_weapon = _this select 1;
_count = 1; // Default Count
_return = false; // Initialize with false

If (count _this > 2)  then {
_count = _this select 2;
};

	// Do we have a ruck.
	if ( _unit call ace_sys_ruck_fnc_HasRuck ) then {
		_ruckSize = _unit call ace_sys_ruck_fnc_ruckInventorySize;
		_confSize = __CONF_MAGAZINES >> _weapon >> "ACE_Size";

	// Check for magazine size (above), then weapon size (below)
		if ( isNumber(_confSize) ) then {
			_newSize = _ruckSize - (getNumber(_confSize)* _count);
		} else {
			_confSize = __CONF_WEAPONS >> _weapon >> "ACE_Size";

			if ( isNumber(_confSize) ) then {
				_newSize = _ruckSize - (getNumber(_confSize)* _count);
			};
		};

	// if not full we are good
		if ( _newSize >= 0 ) then {
			_return = true;
		};
	
	_NewCount =  0;
	
	
	// DEBUG
	if (f_var_debugMode == 1) then
	{
		_ErrorReport = Format ["F2 Debug - unit: %1 Count: %2 Weapon: %3 CanFit: %4", _unit, _count,_weapon, _return];
		diag_log _ErrorReport;
		player sideChat _ErrorReport;
	};

	
	If (_return) then {
	_NewCount = _count;
	};
	
	If ( _NewCount > 0) then {
		[_unit,_weapon, _NewCount] call ace_sys_ruck_fnc_AddWepToRuck;
	} else {
		_ErrorReport = format ["F2 Config Error: Attempt to overfill %1's rucksack with %2 of type %3, size %4. CONTACT Mission Maker.", _unit, _count, _weapon, (getNumber(_confSize) * _count)];
		diag_log _ErrorReport;
		Hint _ErrorReport;
	};
	
		 
   } else {
   		_ErrorReport = format ["F2 Config Error: No rusksack available for %1 at this time. Attempted to add %2 of type %3. CONTACT Mission Maker.",_unit,  _count, _weapon];
		diag_log _ErrorReport;
		Hint _ErrorReport;
   };
 
	
	
