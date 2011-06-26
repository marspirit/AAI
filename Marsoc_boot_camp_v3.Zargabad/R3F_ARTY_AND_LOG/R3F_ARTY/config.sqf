ee;
		
		_table select 1 select _indice_altitude_impact set [_indice_elevation, floor (_res select 0)];
		
		if ((_indice_elevation%30 == 0 && _indice_elevation != 0) || (_indice_elevation+1 == count _liste_elevations)) then
		{
			if (_indice_elevation+1 == count _liste_elevations) then
			{
				_str_diag_log = _str_diag_log + format ["%1", _table select 1 select _indice_altitude_impact select _indice_elevation];
			}
			else
			{
				_str_diag_log = _str_diag_log + format ["%1,", _table select 1 select _indice_altitude_impact select _indice_elevation];
			};
			
			diag_log text format ["			%1", _str_diag_log];
			_str_diag_log = "";
		}
		else
		{
			_str_diag_log = _str_diag_log + format ["%1,", _table select 1 select _indice_altitude_impact select _indice_elevation];
		};
	};
	
	if (_indice_altitude_impact+1 == count _liste_altitudes_impact) then
	{
		diag_log text "		]";
	}
	else
	{
		diag_log text "		],";
	};
};

// Impression du pied de la table dans le RPT
diag_log text "	]";
diag_log text "]";
diag_log text "/****** FIN DE LA TABLE ******/";

endLoadingScreen;

// Retour
_table/**
 * English and French comments
 * Commentaires anglais et français
 * 
 * This file contains the configuration variables of the realistic artillery system
 * Fichier contenant les variables de configuration du système d'artillerie réaliste
 */

/**
 * Boolean, set to true to enable the "show impact location on map" feature
 * Booléen indiquant s'il faut ou non afficher les marqueurs d'impact sur la carte
 */
R3F_ARTY_CFG_montrer_marqueur_impact = false;

/**
 * Boolean, set to true to enable the feature which permits to get coordinates from the player position
 * Booléen indiquant s'il faut ou non permettre de récupérer des coordonnées à partir de la position du joueur pour définir la position de la batterie
 */
R3F_ARTY_CFG_autoriser_pos_joueur = true;

/**
 * Boolean, set to true to enable the feature which permits to get coordinates by clicking on a map dialog
 * Booléen indiquant s'il faut ou non permettre de récupérer des coordonnées en cliquant sur la carte pour définir la position de la batterie et de la cible
 */
R3F_ARTY_CFG_autoriser_clic_carte = false;


/**
 * List of class names of guns and mortars to manage. The classes which inherits from the ones listed will be also managed.
 * Liste des noms de classes des canons et mortiers à gérer. Les classes dérivant de celles listées seront aussi gérées.
 */
R3F_ARTY_CFG_pieces_artillerie = ["M119", "D30_Base", "M252", "2b14_82mm"];



/**
 * Height of the island in meters (axis north-south)
 * Hauteur de l'île en mètres (axe nord-sud)
 */
R3F_ARTY_CFG_hauteur_ile = 8000; // Chernarus
//R3F_ARTY_CFG_hauteur_ile = 5120; // Utes



/***** ADVANCED CONFIGURATION ABOUT THE BALLISTIC CALCULATIONS (MODIFY IT IS NOT RECOMMANDED) : *****/
/***** CONFIGURATION AVANCEE CONCERNANT LES CALCULS BALISTIQUES (MODIFICATION NON RECOMMANDEE) : *****/

/**
 * Step of time in seconds for the ballistic simulation. A small value gives more precise results but increase the calculation time.
 * Pas de temps en secondes pour la simulation balistique. Une petite valeur calcule des balistiques plus précises mais augmente le temps de calcul.
 */
R3F_ARTY_CFG_deltat = 0.002;

/**
 * Minimal wanted precision in meters for the fire solution computed, when the volunteer dispersion is lower than 10m.
 * A small value gives more precise results but increase the calculation time.
 * 
 * Précision minimale en mètres souhaitée pour les solutions de tir calculées, lorsque la dispersion volontaire souhaitée est inférieure à 10m.
 * Une petite valeur améliore la précision du tir mais augmente le temps de calcul.
 */
R3F_ARTY_CFG_precision = 1.75;

/**
 * List of default impact altitudes to use for the table generation
 * Liste des altitudes d'impact par défaut à utiliser dans la génération de tables
 */
R3F_ARTY_table_altitude_impact_defaut = [-1000,-600,-400,-260,-130,0,130,260,400,600,1000];

/**
 * List of default angles to use for the table generation
 * Liste des angles par défaut à utiliser dans la génération de tables
 */
R3F_ARTY_table_angles_defaut = [
	 0,  0.33,  0.66,  1,  1.33,  1.66,  2,  2.33,  2.66,  3,  3.33,  3.66,  4,  4.33,  4.66,  5,  5.33,  5.66,  6,  6.33,  6.66,  7,  7.33,  7.66,  8,  8.33,  8.66,  9,  9.33,  9.66,
	10, 10.33, 10.66, 11, 11.33, 11.66, 12, 12.33, 12.66, 13, 13.33, 13.66, 14, 14.33, 14.66, 15, 15.33, 15.66, 16, 16.33, 16.66, 17, 17.33, 17.66, 18, 18.33, 18.66, 19, 19.33, 19.66,
	20, 20.33, 20.66, 21, 21.33, 21.66, 22, 22.33, 22.66, 23, 23.33, 23.66, 24, 24.33, 24.66, 25, 2