 0 select 2) - (boundingBox _objet select 0 select 2) - (getPos _heliporteur select 2) + 0.5
							]];
							
							player globalChat format [localize "STR_R3F_LOG_action_heliporter_fait", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
						}
						else
						{
							player globalChat format [localize "STR_R3F_LOG_action_heliporter_objet_remorque", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
						};
					}
					else
					{
						player globalChat format [localize "STR_R3F_LOG_action_heliporter_deplace_par_joueur", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
					};
				}
				else
				{
					player globalChat format [localize "STR_R3F_LOG_action_heliporter_joueur_dans_objet", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
				};
			}
			else
			{
				player globalChat format [localize "STR_R3F_LOG_action_heliporter_deja_transporte", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
			};
		};
	};
	
	R3F_LOG_mutex_local_