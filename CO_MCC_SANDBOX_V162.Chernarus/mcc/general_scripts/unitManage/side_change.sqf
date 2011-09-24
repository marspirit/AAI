#define ExtrasDialog3_IDD 2996
#define MCC_PLAYERS 7060
disableSerialization;

private ["_type","_mccdialog", "_name", "_worldPos"];

UMunitsNames = [];
UMgroupNames = [];
UMstatus = _this select 0;

_mccdialog = findDisplay ExtrasDialog3_IDD;
_comboBox = _mccdialog displayCtrl MCC_PLAYERS;
lbClear _comboBox;
if (UMstatus == 0) then //player
	{
		if (UMUnit==0) then 
			{
				{
				if ((isPlayer _x) && (alive _x)) then	//unit
					{
						_displayname = name _x;
						_comboBox lbAdd _displayname;
						UMunitsNames = UMunitsNames + [_x];
					};
				} forEach  allUnits;
			} else
				{
					{
					if (isPlayer (leader _x)) then	//group
						{
							_displayname =  format ["%1", _x];
							_comboBox lbAdd _displayname;
							UMgroupNames = UMgroupNames + [_x];
						};
					} forEach  allgroups;
				};
	};
	
if (UMstatus == 1) then 	//East
	{	
		if (UMUnit==0) then 
			{
				{
				if (alive _x && side _x == east && !(isPlayer _x)) then	//Unit
					{
						_displayname =  format ["%1",typeOf (vehicle _x)];
						if ((_x != vehicle _x) && ((driver (vehicle _x))==_x)) then {_displayname = format ["%1 (Driver)",_displayname]};
						if ((_x != vehicle _x) && ((gunner (vehicle _x))==_x)) then {_displayname =  format ["%1 (Gunner)",_displayname]};
						if ((_x != vehicle _x) && ((commander (vehicle _x))==_x)) then {_displayname =  format ["%1 (Commander)",_displayname]};
						_comboBox lbAdd _displayname;
						UMunitsNames = UMunitsNames + [_x];
					};
				} forEach allUnits;
			} else
				{
					{
					if ((side (leader _x) == east) && !(isPlayer leader _x)) then	//group
						{
							_displayname =  format ["%1", _x];
							_comboBox lbAdd _displayname;
							UMgroupNames = UMgroupNames + [_x];
						};
					} forEach  allgroups;
				};
	};

if (UMstatus == 2) then 	//West
	{	
		if (UMUnit==0) then 
			{
				{
				if (alive _x && side _x == west && !(isPlayer _x)) then
					{
						_displayname =  format ["%1",typeOf (vehicle _x)];
						if ((_x != vehicle _x) && ((driver (vehicle _x))==_x)) then {_displayname = format ["%1 (Driver)",_displayname]};
						if ((_x != vehicle _x) && ((gunner (vehicle _x))==_x)) then {_displayname =  format ["%1 (Gunner)",_displayname]};
						if ((_x != vehicle _x) && ((commander (vehicle _x))==_x)) then {_displayname =  format ["%1 (Commander)",_displayname]};
						_comboBox lbAdd _displayname;
						UMunitsNames = UMunitsNames + [_x];
					};
				} forEach allUnits;
			} else
				{
					{
					if ((side (leader _x) == west) && !(isPlayer leader _x)) then	//group
						{
							_displayname =  format ["%1", _x];
							_comboBox lbAdd _displayname;
							UMgroupNames = UMgroupNames + [_x];
						};
					} forEach  allgroups;
				};
	};

if (UMstatus == 3) then 
	{	
		if (UMUnit==0) then 
			{
				{
				if (alive _x && side _x == resistance && !(isPlayer _x)) then
					{
						_displayname =  format ["%1",typeOf (vehicle _x)];
						if ((_x != vehicle _x) && ((driver (vehicle _x))==_x)) then {_displayname = format ["%1 (Driver)",_displayname]};
						if ((_x != vehicle _x) && ((gunner (vehicle _x))==_x)) then {_displayname =  format ["%1 (Gunner)",_displayname]};
						if ((_x != vehicle _x) && ((commander (vehicle _x))==_x)) then {_displayname =  format ["%1 (Commander)",_displayname]};
						_comboBox lbAdd _displayname;
						UMunitsNames = UMunitsNames + [_x];
					};
				} forEach allUnits;
			} else
				{
					{
					if ((side (leader _x) == resistance) && !(isPlayer leader _x)) then	//group
						{
							_displayname =  format ["%1", _x];
							_comboBox lbAdd _displayname;
							UMgroupNames = UMgroupNames + [_x];
						};
					} forEach  allgroups;
				};
	};	
_comboBox lbSetCurSel 0;
