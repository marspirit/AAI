vation);
_vitesse_y = _vitesse * (sin _elevation);
_temps_vol = 0;
_altitude_apogee = 0;

// Boucle faisant �voluer le temps de la simulation tant que le projectile peut encore potentiellement atteindre sa cible
while {_pos_y > _altitude_impact || _vitesse_y > 0} do
{
	// Les vitesses changent en fonction des frottements dans l'air et de la gravit�
	_vitesse_x = _vitesse_x - (_coef_frottement * _vitesse_x * _vitesse * _deltat);
	_vitesse_y = _vitesse_y - (_coef_frottement * _vitesse_y * _vitesse * _deltat) - (_gravite * _deltat);
	_vitesse = sqrt ((_vitesse_x * _vitesse_x) + (_vitesse_y * _vitesse_y));
	
	// On fait avance le projectile pour ce pas de simulation en fonction des vitesses actuelles
	_pos_x = _pos_x + (_vitesse_x * _deltat);
	_pos_y = _pos_y + (_vitesse_y * _deltat);
	
	_temps_vol = _temps_vol + _deltat;
	_altitude_apogee = _altitude_apogee max _pos_y;
};

// Si le projectile n'est pas mont� plus haut que la cible (arrive lorsque l'altitude d'impact est positive)
if (_altitude_apogee < _altitude_impact) then
{
	_pos_x = 0;
	_temps_vol = 0;
};

// Retour
[_pos_x, _temps_vol]/**
 * Generate the table of ranges with different elevations and impact altitude.
 * The table is printed in the ARMA2.RPT file, it's also returned by the script.
 * One you generate the table, save it in a text file in the directory "R3F_ARTY_AND_LOG\R3F_ARTY\tables\".
 * Then add an include line in the variable "R3F_ARTY_tables" in the file "R3F_ARTY_AND_LOG\R3F_ARTY\init.sqf".
 * Important : the calculation time is long. It can take up to one hour. The game isn't crashed. Check your ARMA2.RPT, the game is writing in.
 * 
 * G�n�re la table des port�es en fonction de l'angle d'�l�vation et de l'altitude d'impact.
 * La table est imprim�e dans le fichier ARMA2.RPT, en plus d'�tre retourn�e.
 * Une fois que vous avez g�n�rer la table, enregistrez l� dans un fichier texte dans le r�pertoire "R3F_ARTY_AND_LOG\R3F_ARTY\tables\".
 * Ensuite ajoutez une ligne d'inclusion dans la variable "R3F_ARTY_tables" du fichier "R3F_ARTY_AND_LOG\R3F_ARTY\init.sqf".
 * Important : le temps de calcul est long. Cela peut prendre jusqu'� une heure. Le jeu n'est pas plant�. Regardez le ARMA2.RPT, le jeu �crit dedans.
 * 
 * Call example (copy/paste it in the init.sqf, replace "MAGAZINE_NAME" by the good class name) :
 * Exemple d'appel (copiez/collez le dans le init.sqf, remplacez "MAGAZINE_NAME" par le bon nom de classe) :
 * 
 * startLoadingScreen ["Computing..."]; // Permits to compute very faster
 * [
 *     // M�ta-donn�es (meta-data)
 *     [
 *         getNumber (configFile >> "CfgMagazines" >> "MAGAZINE_NAME" >> "initSpeed"),
 *         -(getNumber (configFile >> "CfgAmmo" >> (getText (configFile >> "CfgMagazines" >> "MAGAZINE_NAME" >> "ammo")) >> "airFriction")),
 *         R3F_ARTY_table_altitude_impact_defaut,
 *         R3F_ARTY_table_angles_defaut
 *     ],
 *     // Donn�es  (data)
 *     [] // Vide, sortie (empty, output)
 * ] call compile preprocessFile "R3F_ARTY_AND_LOG\R3F_ARTY\calcul_balistique\generer_table.sqf";
 * endLoadingScreen; // <- DON'T forget this line !
 * 
 * 
 * @param table of ranges, input and output parameter. As input : set the meta-data about the table,
 * in output, the data will be filled (the array is directly modified), the format of table is the following :
 * 
 * @param table des port�es, param�tre d'entr�e et sortie. En entr�e les m�ta-donn�es doivent �tre renseign�es,
 * en sortie, les donn�es sont remplies (le tableau est directement modifi�), le format de table est le suivant :
 * 
 * [
 *     // M�ta-donn�es (meta-data)
 *     [
 *         vitesse initiale, (initial velocity)
 *         coef frottement, (friction coef)
 *         [liste des altitudes d'impact], // ordonn� croissant (list of impact altitudes, ascendant sorted)
 *         [liste des angles correspondants aux indices dans les tableaux qui suivent] // ordonn� croissant (liste of angles, ascendant sorted)
 *     ],
 *     // Donn�es  (data)
 *     [
 *         [port�e arrondie � l'inf�rieur pour chaque angle pour la premi�re altitude d'impact], (floored range for each angle for the first impact altitude)
 *         [port�e arrondie � l'inf�rieur pour chaque angle pour la deuxi�me altitude d'impact], (floored range for each angle for the second impact altitude)
 *         ...
 *     ]
 * ]
 * 
 * You can use the default values for the impact altitudes (R3F_ARTY_table_altitude_impact_defaut) and the elevation angles (R3F_ARTY_table_angles_defaut)
 * Vous pouvez utilisez les valeurs par d�faut pour les liste d'altitudes d'impact (R3F_ARTY_table_altitude_impact_defaut) et pour les angles d'�l�vation (R3F_ARTY_table_angles_defaut)
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
private ["_table", "_vitesse_initiale", "_coef_frottement", "_liste_altitudes_impact", "_liste_elevations", "_indice_elevation", "_indice_altitude_impact", "_str_diag_log"];

_table = _this;

_vitesse_initiale = _table select 0 select 0;
_coef_frottement = _table select 0 select 1;
_liste_altitudes_impact = _table select 0 select 2;
_liste_elevations = _table select 0 select 3;

startLoadingScreen ["Calcul de la table..."];

// Impression de l'ent�te de la table dans le RPT
diag_log text "/****** DEBUT DE LA TABLE ******/";
diag_log text "[";
diag_log text "	// Meta-donnees";
diag_log text "	[";
diag_log text format ["		%1, // Vitesse initiale", _vitesse_initiale];
diag_log text format ["		%1, // Coefficient de frottement", _coef_frottement];
diag_log text "		// Liste des paliers d'altitudes d'impact";
diag_log text format ["		%1,", _table select 0 select 2];
diag_log text "		// Liste des angles d'elevation";
diag_log text "		[";
_str_diag_log = "";
for [{_indice_elevation = 0}, {_indice_elevation < count _liste_elevations}, {_indice_elevation = _indice_elevation+1}] do
{
	if ((_indice_elevation%30 == 0 && _indice_elevation != 0) || (_indice_elevation+1 == count _liste_elevations)) then
	{
		if (_indice_elevation+1 == count _liste_elevations) then
		{
			_str_diag_log = _str_diag_log + format ["%1", _liste_elevations select _indice_elevation];
		}
		else
		{
			_str_diag_log = _str_diag_log + format ["%1,", _liste_elevations select _indice_elevation];
		};
		
		diag_log text format ["			%1", _str_diag_log];
		_str_diag_log = "";
	}
	else
	{
		_str_diag_log = _str_diag_log + format ["%1,", _liste_elevations select _indice_elevation];
	};
};
diag_log text "		]";
diag_log text "	],";
diag_log text "	// Donnees";
diag_log text "	[";

// Parcours des altitudes d'impact
for [{_indice_altitude_impact = 0}, {_indice_altitude_impact < count _liste_altitudes_impact}, {_indice_altitude_impact = _indice_altitude_impact+1}] do
{
	_table select 1 set [_indice_altitude_impact, []];
	
	// Parcours des angles
	diag_log text format ["		// Portees pour chaque elevation pour l'altitude d'impact %1m", _liste_altitudes_impact select _indice_altitude_impact];
	diag_log text "		[";
	for [{_indice_elevation = 0}, {_indice_elevation < count _liste_elevations}, {_indice_elevation = _indice_elevation+1}] do
	{
		_res = [
			_liste_elevations select _indice_elevation,
			_liste_altitudes_impact select _indice_altitude_impact,
			_vitesse_initiale,
			_coef_frottement,
			R3F_ARTY_CFG_deltat
		] call R3F_ARTY_FNCT_calculer_port