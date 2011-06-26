,3292,3287,3283,3278,3274,3269,3264,3259,3254,3249,3243,3238,
			3232,3227,3221,3215,3209,3203,3196,3190,3184,3177,3170,3163,3157,3149,3142,3135,3128,3120,3113,3105,3097,3089,3081,3073,3065,3057,3048,3040,3031,3022,
			3014,3005,2996,2987,2977,2968,2959,2949,2940,2930,2920,2910,2900,2890,2880,2870,2860,2849,2839,2828,2817,2807,2796,2785,2774,2762,2751,2740,2728,2717,
			2705,2694,2682,2670,2658,2646,2634,2622,2609,2597,2584,2572,2559,2546,2533,2520,2507,2494,2481,2468,2455,2441,2428,2414,2400,2387,2373,2359,2345,2331,
			2316,2302,2288,2273,2259,2244,2229,2215,2200,2185,2170,2155,2140,2124,2109,2094,2078,2063,2047,2031,2015,1999,1983,1967,1951,1935,1919,1902,1886,1869,
			1853,1836,1819,1803,1786,1769,1752,1734,1717,1700,1683,1665,1648,1630,1612,1595,1577,1559,1612,1523,1505,1487,1468,1450,1432,1413,1395,1376,1358,1339,
			1320,1301,1282,1263,1244,1225,1206,1186,1167,1148,1128,1109,1089,1069,1050,1030,1010,990,970,950,930,910,889,869,849,828,808,788,767,746,
			726,705,684,663,643,622,601,580,559,538,516,495,474,453,431,410,389,367,346,324,303,281,260,238,217,195,173,152,130,108
		]
	]
]/**
 * Retourne une position présente dans une zone elliptique déterminée par une position centrale, un rayon dans l'axe X, un rayon dans l'axe Y et un azimut
 * 
 * Note : nous utilisons une représentation cartésienne plutôt que polaire,
 * car en coordonnées polaire, la répartition n'est pas uniforme (le centre est largement favorisé)
 * 
 * @param 0 position [X, Z] du centre de la zone elliptique
 * @param 1 rayon axe X de la zone elliptique
 * @param 2 rayon axe Y de la zone elliptique (optionnel, défaut : même valeur que axe X)
 * @param 3 azimut de la zone elliptique (optionnel, défaut 0)
 * 
 * @return position [X, Z] présente dans une zone elliptique
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
private ["_position_centrale", "_dimension_x", "_dimension_y", "_orientation", "_position_retour", "_nb_iterations", "_cote", "_est_dans_ellispe"];

_position_centrale = + _this select 0;
_dimension_x = _this select 1;
if (count _this >= 3) then {_dimension_y = _this select 2;} else {_dimension_y = _dimension_x;};
if (count _this >= 4) then {_orientation = -(_this select 3);} else {_orientation = 0;};

// Dimension maximale pour considérer une zone carré de centre _position_centrale et de côté suffisamment grand pour contenir l'ellipse 
_cote = 2*(_dimension_x max _dimension_y);

_position_retour = [];
_est_dans_ellispe = false;
// On tire une position dans l'ellipse et hors de l'eau (dans la mesure du possible) au hasard dans la zone