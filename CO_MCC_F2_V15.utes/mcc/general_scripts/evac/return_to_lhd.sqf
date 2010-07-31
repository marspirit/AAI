private ["_point1", "_point2", "_point3"];
if !mcc_isloading then 
	{
	if (mcc_missionmaker == (name player)) then
	{	
	deletemarkerlocal "evac_marker1";
	deletemarkerlocal "evac_marker2";
	deletemarkerlocal "evac_marker3";
	
	_point1 = getmarkerpos "pos8";
	//_point1 = [	(_point1 select 0), (_point1 select 1), (_point1 select 2) + 17]; 
	hint "Returning to LHD";
	["evac_move", [evac,[_point1], fly_in_hight, true]] call CBA_fnc_globalEvent;
	}	
		else { player globalchat "Access Denied"};
	};
