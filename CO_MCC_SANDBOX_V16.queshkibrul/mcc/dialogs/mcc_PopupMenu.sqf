private ["_ok"];
disableSerialization;

switch (mcc_screen) do
{
    case 0:
   {_ok = createDialog "MCC_Sandbox";
 	if !(_ok) exitWith { hint "createDialog failed" };};
   case 1:
   { _ok = createDialog "ExtrasDialog";
	 if !(_ok) exitWith { hint "createDialog failed" };};
   case 2:
   { _ok = createDialog "ExtrasDialog2";
	 if !(_ok) exitWith { hint "createDialog failed" };};
   case 3:
   { _ok = createDialog "ExtrasDialog3";
	 if !(_ok) exitWith { hint "createDialog failed" };};
   case 4:
   { _ok = createDialog "MCC3D_Dialog";
	 if !(_ok) exitWith { hint "createDialog failed" };};
};
