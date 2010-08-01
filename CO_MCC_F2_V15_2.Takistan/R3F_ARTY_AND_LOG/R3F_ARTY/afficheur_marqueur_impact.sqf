/**
 * Suit un projectile et met un marqueur sur la carte au lieu de l'impact
 * 
 * @param 0 le projectile à suivre
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_projectile", "_pos_impact", "_marqueur"];

_projectile = _this select 0;

// Tant que le projectile n'a pas explosé
while {alive _projectile} do
{
	// Mise à jour de la position
	_pos_impact = getPos _projectile;
	
	sleep 0.0075;
};

// On crée un marqueur sur la dernière position du projectile
_marqueur = createMarker [format ["impact%1%2%3", _pos_impact select 0, _pos_impact select 1, _pos_impact select 2], _pos_impact];
_marqueur setMarkerType "Dot";
_marqueur setMarkerColor "colorRed";