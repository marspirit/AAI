{_i < _nb_tirs}, {_i = _i + 1}] do
{
	private ["_coordonnees_choisies", "_joueur_choisi"];
	
	if (_amplitude_azimut > 0 && _amplitude_elevation > 0) then
	{
		// On tire une position dans l'ellipse
		_coordonnees_choisies = [[_milieu_azimut, _milieu_elevation], _amplitude_azimut, _amplitude_elevation] call R3F_ARTY_FNCT_tirer_position_dans_zone_elliptique;
	}
	else
	{
		_coordonnees_choisies = [_milieu_azimut - _amplitude_azimut + 2*(random _amplitude_azimut), _milieu_elevation - _amplitude_elevation + 2*(random _amplitude_elevation)];
	};
	
	_joueur_choisi = _table_correspondance_index_artilleur select (_liste_artilleurs select (_i mod (count _liste_artilleurs)));
	
	_table_ordres_tirs = _table_ordres_tirs + [[name player, _joueur_choisi, _coordonnees_choisies select 0, _coordonnees_choisies select 1, _index_munition]];
};

R3F_ARTY_table_ordres_tirs = + _table_ordres_tirs;
publicVariable "R3F_ARTY_table_ordres_tirs";
["R3F_ARTY_table_ordres_tirs", R3F_ARTY_table_ordres_tirs] spawn R3F_ARTY_FNCT_PUBVAR_table_ordres_tirs;

player globalChat localize "STR_R3F_ARTY_dlg_SM_ordres_transmis";/**
 * Récupère les coordonnées du joueur et préremplie les champs correspondant à la position de la batterie
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_pos", "_x_grille", "_y_grille", "_longitude", "_latitude", "_dlg_saisie_mission"];

// Récupération de la position 2D
_pos = getPosASL player;

// Conversion de la po