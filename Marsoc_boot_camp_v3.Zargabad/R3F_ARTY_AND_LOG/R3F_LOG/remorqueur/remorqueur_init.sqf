et select 0)) select 0) atan2 ((_objet weaponDirection (weapons _objet select 0)) select 1);
					
					// Seul le D30 a le canon pointant vers le véhicule
					if !(_objet isKindOf "D30_Base") then
					{
						_azimut_canon = _azimut_canon + 180;
					};
					
					// On est obligé de demander au serveur de tourner l'objet pour nous
					R3F_ARTY_AND_LOG_PUBVAR_setDir = [_objet, (getDir _objet)-_azimut_canon];
					if (isServer) then
					{
						["R3F_ARTY_AND_LOG_PUBVAR_setDir", R3F_ARTY_AND_LOG_PUBVAR_setDir] spawn R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
					}
					else
					{
						publicVariable "R3F_ARTY_AND_LOG_PUBVAR_setDir";
					};
				};
				
				sleep 5;
			}
			else
			{
				player globalChat format [localize "STR_R3F_LOG_action_remorquer_selection_trop_loin", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
			};
		}
		else
		{
			player globalChat format [localize "STR_R3F_LOG_action_remorquer_selection_objet_transporte", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
		};
	};
	
	R3F_LOG_mutex_local_verrou = false;
};/**
 