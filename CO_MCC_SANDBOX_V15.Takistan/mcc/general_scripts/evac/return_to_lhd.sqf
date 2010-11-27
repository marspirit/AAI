#define FLY_HIGHT 6101

private ["_point1", "_flyInHight"];

if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	deletemarkerlocal "evac_marker1";
	deletemarkerlocal "evac_marker2";
	deletemarkerlocal "evac_marker3";
	
	_flyInHight =  evacFlyInHight_array select (lbCurSel FLY_HIGHT) select 1;
	evacFlyInHight_index = lbCurSel FLY_HIGHT;
	
	_point1 = getmarkerpos "pos8";
	hint "Returning to LHD";
	["evac_move", [[_point1], _flyInHight, true]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};
