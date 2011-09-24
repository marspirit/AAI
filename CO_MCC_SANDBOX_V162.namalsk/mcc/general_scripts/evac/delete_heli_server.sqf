private ["_option", "_clase", "_lastpos", "_lastdir"];

_option = _this select 0; 

switch (_option) do
	{
   		case 0:
		{
			evac_p action ["eject", vehicle evac_p];
			sleep 2;
			deletegroup evac_group;	//case we want to delete the pilot
			deletevehicle evac_p;
		}; 
		case 1:
		{
		evac_p = evac_group createUnit [evac_p_type, getpos evac, [], 0, "NONE"];		//spawn pilot
		evac_p assignAsDriver evac;
		evac_p moveindriver evac;
		};
		case 2:
		{ 
			{deleteVehicle _x} forEach (crew evac);
			deletegroup evac_group;	//case we want to delete the whole shabang
			deletevehicle evac;
			deletevehicle evac_p;
		};
		
	};


