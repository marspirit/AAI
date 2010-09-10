//ILS Pro II 1.0 (by TiGGa)

sleep 0.1;
_unit = _this select 0;
_caller = _this select 1;
_array = _this select 3;
_loc = _array select 0;
_glideslope = _array select 1;
_airportname = _array select 2;
_runwayname = _array select 3;
_actionname = _array select 4;
_vectorglide = vectordir _glideslope;
_id = _this select 2;
_angle = 3; //approach angle
_numberofcircles = 30;
_distanceofcircles = 100;
_ringarray=[];

if (_caller != driver _unit) exitWith {hint "No pilot."};

_rwydirection = direction _loc;
_rwydirection2 = 0;
_devhor=0;
if ((_rwydirection >= 0) and (_rwydirection <= 45)) then
{
	_rwydirection2 = _rwydirection;
};
if ((_rwydirection > 45) and (_rwydirection <= 135)) then
{
	_rwydirection2 = _rwydirection - 90;
};
if ((_rwydirection > 135) and (_rwydirection <= 225)) then
{
	_rwydirection2 = _rwydirection - 180;
};
if ((_rwydirection > 225) and (_rwydirection <= 315)) then
{
	_rwydirection2 = _rwydirection - 270;
};
if ((_rwydirection > 315) and (_rwydirection <= 360)) then
{
	_rwydirection2 = _rwydirection - 360;
};
_ycord = (getpos _loc) select 1;
_xcord = (getpos _loc) select 0;
_zcord = (getposASL _loc) select 2;
_unit removeAction _id;
hint "NavCom activated.";
_horizontal = "-----o-----";
_vertical = "| \n| \n| \n| \n| \no \n| \n| \n| \n| \n|";

for [{_i=1},{_i<=_numberofcircles},{_i=_i+1}] do
{
  _circlepos=[(getposasl _glideslope select 0) + (_vectorglide select 0) *_distanceofcircles*_i, (getposasl _glideslope select 1) + (_vectorglide select 1) *_distanceofcircles*_i,((getposasl _glideslope select 2)+(tan _angle)*_distanceofcircles*_i)-12];
  _ring="sign_circle" createVehiclelocal _circlepos;
  _ring setposasl _circlepos;
  _ring setdir getdir _glideslope;
  _ringarray set [_i-1, _ring];
};

waitUntil {((getPos _unit) select 2) > 20};
for [{_loop=0}, {(((getPos _unit) select 2) > 20) and (_caller == driver _unit)}, {_loop=_loop}] do
{
	_xplane = (getPos _unit) select 0;
	_yplane = (getPos _unit) select 1;
	_zplane = (getPosASL _unit) select 2;
	_aslheight=((getposASL _unit) select 2) - _zcord;
	_locdistance = (getPosASL _loc) distance [_xplane,_yplane,_zcord];
	_glideslopedistance = (getPosASL _glideslope) distance [_xplane,_yplane,_zcord];
	if (((_rwydirection > 315) and (_rwydirection <= 360)) or ((_rwydirection >= 0) and (_rwydirection <= 45))) then
	{
		_devhor = asin ((_xplane-_xcord)/_locdistance) + _rwydirection2;
	};
	if ((_rwydirection > 45) and (_rwydirection <= 135)) then
	{
		_devhor = asin ((-(_yplane-_ycord))/_locdistance) + _rwydirection2;
	};
	if ((_rwydirection > 135) and (_rwydirection <= 225)) then
	{
		_devhor = asin ((-(_xplane-_xcord))/_locdistance) + _rwydirection2;
	};
	if ((_rwydirection > 225) and (_rwydirection <= 315)) then
	{
		_devhor = asin ((_yplane-_ycord)/_locdistance) + _rwydirection2;
	};
	_devver = atan (_aslheight/_glideslopedistance) - _angle;
	_abshor = sin (_devhor) * _locdistance;
	_absver = _glideslopedistance * tan _devver;

	if (_devhor < -2.5) then
	{
		_horizontal="-----o----|";
	}
	else
	{
		if ((_devhor >= -2.5) and (_devhor < -2)) then
		{
			_horizontal="-----o---|-";
		}
		else
		{
			if ((_devhor >= -2) and (_devhor < -1.5)) then
			{
				_horizontal="-----x--|--";
			}
			else
			{
				if ((_devhor >= -1.5) and (_devhor < -1)) then
				{
					_horizontal="-----o-|---";
				}
				else
				{
					if ((_devhor >= -1) and (_devhor < -0.5)) then
					{
						_horizontal="-----o|----";
					}
					else
					{
						if ((_devhor >= -0.5) and (_devhor <= 0.5)) then
						{
							_horizontal="-----x-----";
						}
						else
						{
							if ((_devhor > 0.5) and (_devhor <= 1)) then
							{
								_horizontal="----|o-----";
							}
							else
							{
								if ((_devhor > 1) and (_devhor <= 1.5)) then
								{
									_horizontal="---|-o-----";
								}
								else
								{
									if ((_devhor > 1.5) and (_devhor <= 2)) then
									{
										_horizontal="--|--o-----";
									}
									else
									{
										if ((_devhor > 2) and (_devhor <= 2.5)) then
										{
											_horizontal="-|---o-----";
										}
										else
										{
											_horizontal="|----o-----";
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};

	if (_devver < -0.7) then
	{
		_vertical = "-- \n| \n| \n| \n| \no \n| \n| \n| \n| \n|";
	}
	else
	{
		if ((_devver >= -0.7) and (_devver < -0.56)) then
		{
			_vertical = "| \n-- \n| \n| \n| \no \n| \n| \n| \n| \n|";
		}
		else
		{
			if ((_devver >= -0.56) and (_devver < -0.42)) then
			{
				_vertical = "| \n| \n-- \n| \n| \no \n| \n| \n| \n| \n|";
			}
			else
			{
				if ((_devver >= -0.42) and (_devver < -0.28)) then
				{
					_vertical = "| \n| \n| \n-- \n| \no \n| \n| \n| \n| \n|";
				}
				else
				{
					if ((_devver >= -0.28) and (_devver < -0.14)) then
					{
						_vertical = "| \n| \n| \n| \n-- \no \n| \n| \n| \n| \n|";
					}
					else
					{
						if ((_devver >= -0.14) and (_devver <= 0.14)) then
						{
							_vertical = "| \n| \n| \n| \n| \nx \n| \n| \n| \n| \n|";
						}
						else
						{
							if ((_devver > 0.14) and (_devver <= 0.28)) then
							{
								_vertical = "| \n| \n| \n| \n| \no \n-- \n| \n| \n| \n|";
							}
							else
							{
								if ((_devver > 0.28) and (_devver <= 0.42)) then
								{
									_vertical = "| \n| \n| \n| \n| \no \n| \n-- \n| \n| \n|";
								}
								else
								{
									if ((_devver > 0.42) and (_devver <= 0.56)) then
									{
										_vertical = "| \n| \n| \n| \n| \no \n| \n| \n-- \n| \n|";
									}
									else
									{
										if ((_devver > 0.56) and (_devver <= 0.7)) then
										{
											_vertical = "| \n| \n| \n| \n| \no \n| \n| \n| \n-- \n|";
										}
										else
										{
											_vertical = "| \n| \n| \n| \n| \no \n| \n| \n| \n| \n--";
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
	
	hintsilent format ["%1 \n%2 \n \n%3 \n \n%4 \n \nDeviation in m \nHorizontal: %5 \nVertical: %6 \n \nDistance: %7 \nHeight: %8",_airportname,_runwayname,_horizontal,_vertical,_abshor,_absver,_glideslopedistance,_aslheight];
	sleep 0.5;
};
{deletevehicle _x} foreach _ringarray;
_ringarray=[];
_unit addAction [_actionname,"mcc\general_scripts\LHD\ilsproII.sqf",[_loc,_glideslope,_airportname,_runwayname,_actionname]];