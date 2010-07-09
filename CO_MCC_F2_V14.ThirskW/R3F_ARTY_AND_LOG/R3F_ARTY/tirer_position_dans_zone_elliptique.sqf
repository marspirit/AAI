/**
 * Retourne une position pr�sente dans une zone elliptique d�termin�e par une position centrale, un rayon dans l'axe X, un rayon dans l'axe Y et un azimut
 * 
 * Note : nous utilisons une repr�sentation cart�sienne plut�t que polaire,
 * car en coordonn�es polaire, la r�partition n'est pas uniforme (le centre est largement favoris�)
 * 
 * @param 0 position [X, Z] du centre de la zone elliptique
 * @param 1 rayon axe X de la zone elliptique
 * @param 2 rayon axe Y de la zone elliptique (optionnel, d�faut : m�me valeur que axe X)
 * @param 3 azimut de la zone elliptique (optionnel, d�faut 0)
 * 
 * @return position [X, Z] pr�sente dans une zone elliptique
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

// Dimension maximale pour consid�rer une zone carr� de centre _position_centrale et de c�t� suffisamment grand pour contenir l'ellipse 
_cote = 2*(_dimension_x max _dimension_y);

_position_retour = [];
_est_dans_ellispe = false;
// On tire une position dans l'ellipse et hors de l'eau (dans la mesure du possible) au hasard dans la zone
for [{_nb_iterations = 0}, {!_est_dans_ellispe && _nb_iterations < 50}, {_nb_iterations = _nb_iterations+1}] do
{
	private [ "_x", "_y"];
	
	// Tirage d'une position dans notre carr� avec comme origine le centre
	_x = (random _cote) - (_cote/2);
	_y = (random _cote) - (_cote/2);
	
	// Si les coordonn�es (x,y) rentre dans l'ellipse
	if (((_x*_x)/(_dimension_x*_dimension_x)) + ((_y*_y)/(_dimension_y*_dimension_y)) <= 1) then
	{
		private ["_angle_xy", "_distance_xy"];
		
		_angle_xy = _y atan2 _x;
		_distance_xy = sqrt ((_x*_x) + (_y*_y));
		
		// Changement des rep�re cart�sien pour prendre en compte l'orientation de l'ellipse et m�morisation dans la valeur de retour
		_position_retour = [(_position_centrale select 0) + (_distance_xy * (cos (_orientation + _angle_xy))), (_position_centrale select 1) + (_distance_xy * (sin (_orientation + _angle_xy)))];
		
		_est_dans_ellispe = true;
	}
	else
	{
		_est_dans_ellispe = false;
	};
};

// Si on a pas trouv� de point valide � temps, on prend le centre
if (!_est_dans_ellispe) then
{
	_position_retour = + _position_centrale;
};

_position_retour