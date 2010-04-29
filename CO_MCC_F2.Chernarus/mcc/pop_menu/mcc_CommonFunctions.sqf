// Desc: A group of common generic script functions
// By: Dr Eyeball
// Version: 1.1 (May 2007)
//-----------------------------------------------------------------------------
// Constants

G_TriggerActivationRepeatedly=true;
G_TriggerActivationSingle=false;

G_TriggerAreaRectangle=true;
G_TriggerAreaEllipse=false;

//-----------------------------------------------------------------------------
// Functions
//-----------------------------------------------------------------------------
// 3rd party scripts
//fn_GridRefCoords = compile preprocessFile "mcc\pop_menu\GridRefCoords.sqf";
//-----------------------------------------------------------------------------
fn_IsVehicle =
{
  _unit = _this select 0;

  _result = false;
  if (typeName _unit == "OBJECT") then {
    _result = ((_unit isKindOf "LandVehicle") || (_unit isKindOf "Air") || (_unit isKindOf "Ship")) };
  _result;
};
//-----------------------------------------------------------------------------
fn_IsPerson =
{
  _unit = _this select 0;

  _result = false;
  if (typeName _unit == "OBJECT") then {
    _result = (_unit isKindOf "CAManBase") };
  _result;
};
//-----------------------------------------------------------------------------
// ArraysAreEqual function - returns true if arrays are identicle
fn_ArraysAreEqual =
{
  _Array1 = _this select 0;
  _Array2 = _this select 1;

  _Result = true;
  if (count _Array1 != count _Array2) then
  {
    _Result = false
  }
  else
  {
    for "_i" from 0 to (count _Array1 - 1) do
    {
      if (_Array1 select _i != _Array2 select _i) then 
      {
      _Result = false 
      };
    };  
  };
  _Result;
};
//-----------------------------------------------------------------------------
// _p1, _p2: position
fn_DistanceBetweenPositions =
{
  _p1 = _this select 0;
  _p2 = _this select 1;

  _x1 = _p1 select 0;
  _y1 = _p1 select 1;
  _x2 = _p2 select 0;
  _y2 = _p2 select 1;
  
  _dx = abs(_x2 - _x1);
  _dy = abs(_y2 - _y1);
  _dist = sqrt((_dx * _dx)+(_dy * _dy));
  _dist;
};
//-----------------------------------------------------------------------------
// IsServer function - replace with official isServer function once 1.07 is out
fn_isServer =
{
  _result = false;
  if (local server) then { _result = true };
  _result;
};
//-----------------------------------------------------------------------------
// hint function - only display the action hint for the caller, who is not necessarily the player if (eg: A.I.) instructed to perform action
HintCaller =
{
  _Caller = _this select 0;
  _Message = _this select 1;
  
  if (_Caller == player) then
  {
    hint _Message
  };
};
//-----------------------------------------------------------------------------
// OffsetPos function - offset a position by a certain amount
fn_OffsetPos =
{
  _pos = _this select 0;
  _offset = _this select 1;
  
  _x = (_offset select 0);
  _y = (_offset select 1);
  _z = (_offset select 2);

  _newPos = [
    (_pos select 0)+_x,
    (_pos select 1)+_y,
    (_pos select 2)+_z
  ];
  _newPos;
};
//-----------------------------------------------------------------------------
// RandomOffsetPos function - offset a position by a random +/- amount based on given ranges
fn_RandomOffsetPos =
{
  _pos = _this select 0;
  _offset = _this select 1;
  
  _x = (_offset select 0);
  _y = (_offset select 1);
  _z = (_offset select 2);

  _newPos = [_pos, 
    [
      (-_x)+floor(random (2 * _x)),
      (-_y)+floor(random (2 * _y)),
      (-_z)+floor(random (2 * _z))
    ]
  ] call fn_OffsetPos;
  _newPos;
};
//-----------------------------------------------------------------------------
// _dualParamArray = [ ["Item1", [1,[a,b],3]], ["Item2", "hello"] ]
fn_GetParamByName =
{
  _paramName = _this select 0; // this is case sensitive
  _dualParamArray = _this select 1;
  _default = _this select 2;

  result = _default;
  if (typeName _dualParamArray != "ARRAY") exitWith
  {
    //hint format["Error: fn_GetParamByName[""%1"", ...]: param 1 must be an array of paired arrays", _paramName]; // debug
    //player groupChat format["Error: fn_GetParamByName[""%1"", %2, %3]", _paramName, _dualParamArray, _default]; // debug
    //["fn_GetParamByName", _dualParamArray] call fn_DebugAppend; // debug
    result;
  };
  
  //player groupChat format["Ok: fn_GetParamByName[""%1"", %2, %3]", _paramName, _dualParamArray, _default]; // debug
  {
    if (typeName _x != "ARRAY") exitWith
    {
      //hint format["Warning: fn_GetParamByName[""%1"", ...]: param 1 array must contain named arrays not %2\n%3", _paramName, typeName _x, _x]; // debug
      //player groupChat format["Warning: fn_GetParamByName[""%1"", %2, %3]", _paramName, _dualParamArray, _default]; // debug
      //["fn_GetParamByName", _dualParamArray] call fn_DebugAppend;
      result;
    };
    
    if (count _x > 0 && _x select 0 == _paramName) then
    {
      result = _x select 1;
    };
  } forEach _dualParamArray;
  
  result;
};
//-----------------------------------------------------------------------------
