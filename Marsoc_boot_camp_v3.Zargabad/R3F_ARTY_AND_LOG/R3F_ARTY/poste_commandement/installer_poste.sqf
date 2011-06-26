alChat localize "STR_R3F_LOG_ne_pas_monter_dans_vehicule";
			player action ["eject", vehicle player];
			sleep 1;
		};
		
		if ([0,0,0] distance (velocity player) > 2.8) then
		{
			player globalChat localize "STR_R3F_LOG_courir_trop_vite";
			player playMove "AmovPpneMstpSnonWnonDnon";
			sleep 1;
		};
		
		sleep 0.25;
	};
	
	// L'objet n'est plus porté, on le repose
	detach _calculateur;
	_calculateur setPos [getPos _calculateur select 0, getPos _calculateur select 1, 0];
	_calculateur setVelocity [0, 0, 0];
	
	player removeAction _action_menu;
	R3F_LOG_joueur_deplace_objet = objNull;
	
	_calculateur setVariable ["R3F_LOG_est_deplace_par", objNull, true];
	
	if (!alive player) then
	{
		R3F_LOG_joueur_deplace_objet = _calculateur;
		execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\installer_poste.sqf";
	};
	
	// Restauration de l'arme primaire
	if (alive player && _arme_principale != "") then
	{
		player addWeapon _arme_principale;
		player selectWeapon _arme_principale;
		player selectWeapon (getArray (configFile >> "cfgWeapons" >> _arme_principale >> "muzzles") select 0);
	};
};/**
 * Installe un poste de commadement d'artillerie à partir du calculateur
 * Passe la variable R3F_LOG_joueur_deplace_objet à objNull pour informer le scr