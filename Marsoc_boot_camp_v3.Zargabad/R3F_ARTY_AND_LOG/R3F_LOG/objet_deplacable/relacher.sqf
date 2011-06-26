e et on interdit de monter dans un véhicule tant que l'objet est porté
	while {!isNull R3F_LOG_joueur_deplace_objet && alive player} do
	{
		if (vehicle player != player) then
		{
			player globalChat localize "STR_R3F_LOG_ne_pas_monter_dans_vehicule";
			player action ["eject", vehicle player];
			sleep 1;
		};
		
		if ([0,0,0] distance (velocity player) > 2.8) then
		{
			