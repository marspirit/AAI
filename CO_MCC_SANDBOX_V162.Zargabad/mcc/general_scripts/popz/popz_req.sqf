#define POPZ_ACTION 7070 
#define POPZ_INTANSE 7071
private ["_center","_radius","_action","_intanse","_faction","_side"];

if !mcc_isloading then 	{
	_center		= mcc_zone_pos select (mcc_zone_number);
	_radius		= mcc_zone_size select (mcc_zone_number);
	_action 	= lbCurSel POPZ_ACTION;
	_intanse	= (lbCurSel POPZ_INTANSE) + 1;
	_faction	= mcc_faction;
	_side		= mcc_sidename;
	
	if (mcc_capture_state) then	{
							mcc_capture_var=mcc_capture_var + FORMAT ['
								["POPZ", [%1,%2,%3,%4,"%5","%6"]] call CBA_fnc_globalEvent;
								'								 
								, _center
								, _radius
								, _action
								, _intanse
								, _faction
								, _side
							];
			} else	{
				mcc_safe=mcc_safe + FORMAT ["
					['POPZ', [%1,%2,%3,%4,'%5','%6']] call CBA_fnc_globalEvent;
					sleep 1;"								 
					, _center
					, _radius
					, _action
					, _intanse
					, _faction
					, _side
					];
				["POPZ", [_center,_radius,_action,_intanse,_faction,_side]] call CBA_fnc_globalEvent;
				};
	};
 
 

