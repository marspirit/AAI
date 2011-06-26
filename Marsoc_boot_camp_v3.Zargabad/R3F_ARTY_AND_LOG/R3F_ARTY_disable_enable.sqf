
for [{_nb_iterations = 0}, {!_est_dans_ellispe && _nb_iterations < 50}, {_nb_iterations = _nb_iterations+1}] do
{
	private [ "_x", "_y"];
	
	// Tirage d'une position dans notre carré avec comme origine le centre
	_x = (random _cote) - (_cote/2);
	_y = (random _cote) - (_cote/2);
	
	// Si les coordonnées (x,y) rentre dans l'ellipse
	if (((_x*_x)/(_dimension_x*_dimension_x)) + ((_y*_y)/(_dimension_y*_dimension_y)) <= 1) then
	{
		private ["_angle_xy", "_distance_xy"];
		
		_angle_xy = _y atan2 _x;
		_distance_xy = sqrt ((_x*_x) + (_y*_y));
		
		// Changement des repère cartésien pour prendre en compte l'orientation de l'ellipse et mémorisati