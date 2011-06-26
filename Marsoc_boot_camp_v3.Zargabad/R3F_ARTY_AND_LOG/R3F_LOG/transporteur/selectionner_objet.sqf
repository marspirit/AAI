acite_vehicule : R3F_LOG_dlg_CV_texte
	{
		idc = R3F_LOG_IDC_dlg_CV_capacite_vehicule;
		x = 0.255; w = 0.4;
		y = 0.185; h = 0.03;
		sizeEx = 0.03;
		text = "$STR_R3F_LOG_dlg_CV_capacite_vehicule";
	};
	
	class R3F_LOG_dlg_CV_liste_contenu : R3F_LOG_dlg_CV_liste
	{
		idc = R3F_LOG_IDC_dlg_CV_liste_contenu;
		x = 0.26; w = 0.45;
		y = 0.22; h = 0.44;
		onLBDblClick = "execVM ""R3F_ARTY_AND_LOG\R3F_LOG\transporteur\decharger.sqf"";";
	};
	
	class R3F_LOG_dlg_CV_credits : R3F_LOG_dlg_CV_texte
	{
		x = 0.250; w = 0.19;
		