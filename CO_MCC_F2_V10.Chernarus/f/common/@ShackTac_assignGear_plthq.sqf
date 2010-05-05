// F2A2 - ShackTactical Assign Gear Script
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================
// ====================================================================================

// ERROR CHECKING
// If the script has been called without both required paramaters being passed, it 
// exits immediately.

sleep .1;

if (isNull (_this select 1)) exitwith {};

if (!local (_this select 1)) exitwith {};

waitUntil { !(isnil ("f_var_layout_plthq"))  };

switch (f_var_layout_plthq) do
{
   
   case 0:
   { nul = [(_this select 0),(_this select 1)] execVM "f\common\@ShackTac_assignGear_0.sqf";};
   case 1:
   { nul = [(_this select 0),(_this select 1)] execVM "f\common\@ShackTac_assignGear_1.sqf";};
   case 2:
   { nul = [(_this select 0),(_this select 1)] execVM "f\common\@ShackTac_assignGear_2.sqf";};
   case 3:
   { nul = [(_this select 0),(_this select 1)] execVM "f\common\@ShackTac_assignGear_3.sqf";};   
};
