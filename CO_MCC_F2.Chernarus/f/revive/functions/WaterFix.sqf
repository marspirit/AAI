// Norrn_WaterFix - AI disabled
// © NOVEMBER 2009 - norrin

_body 		= _this select 0;
_unit 		= _this select 1;
_pos 		= _this select 2;
_water_dialog	= NORRN_revive_array select 45;

_body allowDamage false;

if (surfaceIsWater getPos _body) then
{	
	waitUntil{alive call compile format["%1",_unit]};
	_name = call compile format["%1",_unit];
	{_name removeMagazine _x} forEach magazines _name;
	_name setPosASL _pos;
	deleteVehicle _body;
	_name setCaptive true;
	if (_water_dialog == 1 && _name == player) then 
	{
		titleText ["Choose wash ashore or press escape to close dialog and start at current position","PLAIN", 0.4]; 
		_dialog_1 = createDialog "respawn_button_1c";
	};
	if (_name == player) then {titlecut [" ","BLACK IN", 0.4]};	
}; 

while {surfaceIsWater getPos _name} do
{		
	disableUserInput false;
	if(!alive player) then 
	{
		_body = player; 
		_pos = getPos _body; 
		waitUntil{alive call compile format["%1",player]};
		_name = call compile format["%1",player];
		_name setPos _pos;
		deleteVehicle _body;
		_name setCaptive true;
	};
	_name setdammage 0;
	if (vehicle _name != _name && _name == driver (vehicle _name)) then {_name action ["GETOUT", vehicle _name]};
	if (vehicle _name != _name && _name == gunner vehicle _name) then {_name action ["GETOUT", vehicle _name]};
	_water = true;
	sleep 1;
};

sleep 0.1;

if (!surfaceIsWater getPos _name && _water) then
{
	if (vehicle _name != _name) then {_name action ["GETOUT", vehicle _name]};
	_name setCaptive false;
	if (_name == player) then {titlecut [" ","BLACK OUT",10]};
	_pos = getPos _name;
	_dir = getDir _name;
	_Offset = 0;
	_name switchMove r_unc_animation;
	sleep 1;
	//player setVariable ["NORRN_pos_x", _pos select 0, true];
	//player setVariable ["NORRN_pos_y", _pos select 1, true];
	_name setVariable ["NORRN_uncPos", [(_pos select 0),(_pos select 1), 0], true];
	_name setPos NORRN_respawn_mrkr;
	sleep 0.1;
	_water = false;
	if (_name == player) then {disableUserInput true};
};

_name;
