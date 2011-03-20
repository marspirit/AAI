// mobile_Marker.sqf
// © APRIL 2009 - norrin 

_Base_1 	= NORRN_revive_array select 13;
_mrker_pos 	= [];

if (isServer) then
{	
	_mrker_pos = getMarkerPos "base";
	sleep 1;
	_mrkr_ex = _Base_1;
	createMarker [_mrkr_ex, _mrker_pos];
	_mrkr_ex setMarkerColor "ColorBlue";
	_mrkr_ex setMarkerType "Empty";
	_mrkr_ex setMarkerText "";
	_mrkr_ex setMarkerSize [0.4, 0.4];
	 
} else {
	
	if (!NORRN_camo_net) then
	{
		_mrker_pos = getMarkerPos "base";
		sleep 1;
		_mrkr_ex = _Base_1;
		createMarker [_mrkr_ex, _mrker_pos];
		_mrkr_ex setMarkerColor "ColorBlue";
		_mrkr_ex setMarkerType "Empty";
		_mrkr_ex setMarkerText "";
		_mrkr_ex setMarkerSize [0.4, 0.4];
	} else{
	 	
	 	if (!isNull r_mobile_spawn_vcl) then
	 	{
		 	_mrker_pos = [(getPos r_mobile_spawn_vcl) select 0,(getPos r_mobile_spawn_vcl) select 1]; 
		};	
	 
	 	if (!isNull norrn_mob_mash) then
	 	{
	 		_mrker_pos = [(getPos norrn_mob_mash) select 0,(getPos norrn_mob_mash) select 1];
	 	};
		sleep 1;
		_mrkr_ex = _Base_1;
		createMarker [_mrkr_ex, _mrker_pos];
		_mrkr_ex setMarkerColor "ColorBlue";
		_mrkr_ex setMarkerType "Flag1";
		_mrkr_ex setMarkerText "Mobile Respawn";
		_mrkr_ex setMarkerSize [0.4, 0.4];
	};
};
		
if (true) exitWith {}; 

//050409
