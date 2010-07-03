/**
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
R3F_ARTY_CFG_hauteur_ile = 5120; // japahto


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
	20, 20.33, 20.66, 21, 21.33, 21.66, 22, 22.33, 22.66, 23, 23.33, 23.66, 24, 24.33, 24.66, 25, 25.33, 25.66, 26, 26.33, 26.66, 27, 27.33, 27.66, 28, 28.33, 28.66, 29, 29.33, 29.66,
	30, 30.33, 30.66, 31, 31.33, 31.66, 32, 32.33, 32.66, 33, 33.33, 33.66, 34, 34.33, 34.66, 35, 35.33, 35.66, 36, 36.33, 36.66, 37, 37.33, 37.66, 38, 38.33, 38.66, 39, 39.33, 39.66,
	40, 40.33, 40.66, 41, 41.33, 41.66, 42, 42.33, 42.66, 43, 43.33, 43.66, 44, 44.33, 44.66, 45, 45.33, 45.66, 46, 46.33, 46.66, 47, 47.33, 47.66, 48, 48.33, 48.66, 49, 49.33, 49.66,
	50, 50.33, 50.66, 51, 51.33, 51.66, 52, 52.33, 52.66, 53, 53.33, 53.66, 54, 54.33, 54.66, 55, 55.33, 55.66, 56, 56.33, 56.66, 57, 57.33, 57.66, 58, 58.33, 58.66, 59, 59.33, 59.66,
	60, 60.33, 60.66, 61, 61.33, 61.66, 62, 62.33, 62.66, 63, 63.33, 63.66, 64, 64.33, 64.66, 65, 65.33, 65.66, 66, 66.33, 66.66, 67, 67.33, 67.66, 68, 68.33, 68.66, 69, 69.33, 69.66,
	70, 70.33, 70.66, 71, 71.33, 71.66, 72, 72.33, 72.66, 73, 73.33, 73.66, 74, 74.33, 74.66, 75, 75.33, 75.66, 76, 76.33, 76.66, 77, 77.33, 77.66, 78, 78.33, 78.66, 79, 79.33, 79.66,
	80, 80.33, 80.66, 81, 81.33, 81.66, 82, 82.33, 82.66, 83, 83.33, 83.66, 84, 84.33, 84.66, 85, 85.33, 85.66, 86
];