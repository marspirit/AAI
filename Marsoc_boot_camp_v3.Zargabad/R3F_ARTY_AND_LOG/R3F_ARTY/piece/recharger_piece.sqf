ARTY\dlg_artilleur\afficher_dlg_artilleur.sqf", nil, 6, false, true, "", "gunner _target == player && (isNull (uiNamespace getVariable ""R3F_ARTY_dlg_artilleur""))"];
	_piece addAction [localize "STR_R3F_ARTY_action_fermer_dlg_artilleur", "R3F_ARTY_AND_LOG\R3F_ARTY\dlg_artilleur\fermer_dlg_artilleur.sqf", nil, 0, false, true, "", "gunner _target == player && (!isNull (uiNamespace getVariable ""R3F_ARTY_dlg_artilleur""))"];
	_piece addAction [("<t color=""#22ee22"">" + (localize "STR_R3F_ARTY_action_purger_ordres")+ "</t>"), "R3F_ARTY_AND_LOG\R3F_ARTY\dlg_artilleur\purger_ordres.sqf", nil, 6, false, true, "", "gunner _target == player"];
	
	// On ajoute une action de rechargement pour chaque type de munition compatible
	{
		_piece addAction [("<t color=""#aa0000"">" + (localize "STR_R3F_ARTY_action_recharger_piece") + getText (configFile >> "CfgMagazines" >> _x >> 