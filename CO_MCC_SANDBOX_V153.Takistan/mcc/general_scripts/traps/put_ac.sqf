//Made by Shay_Gman (c) 09.10
private ["_pos", "_trapkind","_iedside", "_iedMarkerName", "_weaponList", "_randWeapon", "_weapon", "_mag", "_group", "_sb", "_eib_marker"]; 
disableSerialization;

_pos = _this select 0; 
_trapkind = _this select 1; 
_iedside = _this select 2; 
_iedMarkerName = _this select 3;

_weaponList = [["Makarov", "8Rnd_9x18_Makarov"],["Colt1911", "7Rnd_45ACP_1911"],["M9", "15Rnd_9x19_M9"],["Sa61_EP1", "20Rnd_B_765x17_Ball"],["UZI_EP1", "30Rnd_9x19_UZI"],["glock17_EP1", "17Rnd_9x19_glock17"],["revolver_EP1", "6Rnd_45ACP"]];
_randWeapon = floor random (count _weaponList);
_weapon = (_weaponList select _randWeapon) select 0;
_mag = (_weaponList select _randWeapon) select 1;

_eib_marker = createMarkerlocal ["traps",_pos];
_pos= getMarkerPos "traps";

_group = creategroup civilian;
_sb = _trapkind createunit [_pos, _group,";removeallweapons this;_null = [this,_iedside,25,_weapon,_mag] execVM 'mcc\general_scripts\traps\cw.sqf';removeallweapons this; this setbehaviour 'CARELESS'; this allowfleeing 0; this addaction ['Neutralize Suspect','mcc\general_scripts\traps\neutralize.sqf'];",0.5];
_sb addrating -1;

_sb setvariable ["armed",true,true];
_sb setvariable ["iedTrigered", false, true]; 

[_sb, _iedMarkerName] spawn
	{
	private ["_fakeIedS", "_iedMarkerNameS"];
	_fakeIedS = _this select 0;
	_iedMarkerNameS = _this select 1;
	waituntil {!alive _fakeIedS};
	[-2, {deletemarkerlocal format ["%1", _this];}, _iedMarkerNameS] call CBA_fnc_globalExecute;	//delete IED marker 
	_fakeIedS setvariable ["iedTrigered", true, true]; 
	};

processInitCommands;

sleep 0.01;
deletemarker "traps";