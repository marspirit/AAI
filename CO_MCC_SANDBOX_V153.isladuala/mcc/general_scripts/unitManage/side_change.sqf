#define ExtrasDialog3_IDD 2996
#define MCC_PLAYERS 7060
disableSerialization;

private ["_type","_mccdialog", "_name", "_worldPos"];

UMunitsNames = [];
UMstatus = _this select 0;

_mccdialog = findDisplay ExtrasDialog3_IDD;
_comboBox = _mccdialog displayCtrl MCC_PLAYERS;
	lbClear _comboBox;
if (UMstatus == 0) then 
	{
		{
		if ((isPlayer _x) && (alive _x)) then
			{
				_displayname = name _x;
				_comboBox lbAdd _displayname;
				UMunitsNames = UMunitsNames + [_x];
			};
		} forEach  (switchableUnits + playableUnits);
	};
	
if (UMstatus == 1) then 
	{	
		{
		if (alive _x && side _x == east && !(isPlayer _x)) then
			{
				_displayname = name _x;
				_comboBox lbAdd _displayname;
				UMunitsNames = UMunitsNames + [_x];
			};
		} forEach allUnits;
	};

if (UMstatus == 2) then 
	{	
		{
		if (alive _x && side _x == west && !(isPlayer _x)) then
			{
				_displayname = name _x;
				_comboBox lbAdd _displayname;
				UMunitsNames = UMunitsNames + [_x];
			};
		} forEach allUnits;
	};

if (UMstatus == 3) then 
	{	
		{
		if (alive _x && side _x == resistance && !(isPlayer _x)) then
			{
				_displayname = name _x;
				_comboBox lbAdd _displayname;
				UMunitsNames = UMunitsNames + [_x];
			};
		} forEach allUnits;
	};	
_comboBox lbSetCurSel 0;
