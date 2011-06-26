 sélectionné lors de la validation
	uiNamespace setVariable ["R3F_ARTY_table_correspondance_index_munition", + _table_correspondance_index_munition];
	uiNamespace setVariable ["R3F_ARTY_table_correspondance_index_nom_munition", + _table_correspondance_index_nom_munition];
};

if (isServer) then
{
	// Service offert par le serveur : créer un poste de commandement d'artillerie (valeur = calculateur associé)
	R3F_ARTY_FNCT_PUBVAR_creer_poste_commandement =
	{
		[_this select 1] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\creer_poste_commandement.sqf";
	};
	"R3F_ARTY_PUBVAR_creer_poste_commandement" addPublicVariableEventHandler R3F_ARTY_FNCT_PUBVAR_creer_poste_commandement;
	
	// Service offert par le serveur : supprimer un poste de commandement d'artillerie (valeur = calculateur associé)
	R3F_ARTY_FNCT_PUBVAR_supprimer_poste_commandement =
	{
		[_this select 1] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\supprimer_poste_commandement.sqf";
	};
	"R3F_ARTY_PUBVAR_supprimer_poste_commandement" addPublicVariableEventHandler R3F_ARTY_FNCT_PUBVAR_supprimer_poste_commandement;
};/**
 * Récupère tous les noms de classes des chargeurs compatibles avec un pièce
 * 
 * @param 0 le nom de classe de la pièce
 * 
 * @return tableau contenant les noms de classes des chargeurs compatibles
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_piece", "_chargeurs_compatibles", "_chargeurs_base", "_chargeurs_CfgVehicles", "_i", "_nb_chargeurs_CfgMagazines"];

_piece = _this select 0;

/** Liste des munitions d'artillerie, c'est ce qu'on cherche au final */
_chargeurs_compatibles = [];
/** Liste des chargeurs inscrits dans les pièces du CfgVehicles */
_chargeurs_base = [];

// Pour chaque chargeur directement compatible avec la pièce
_chargeurs_CfgVehicles = getArray (configFile >> "CfgVehicles" >> _piece >> "Turrets" >> "MainTurret" >> "magazines");
for [{_i = 0}, {_i < count _chargeurs_CfgVehicles}, {_i = _i + 1}] do
{
	if !(_chargeurs_CfgVehicles select _i in _chargeurs_base) then
	{
		_chargeurs_base = _chargeurs_base + [_chargeurs_CfgVehicles select _i];
	};
};

// On parcours tout les chargeurs de CfgMagazines et si c'est un dérivé d'un chargeur de base ou un chargeur de base, on l'ajoute dans la liste des chargeurs à retourner
_nb_chargeurs_CfgMagazines = count (configFile >> "CfgMagazines");
for [{_i = 0}, {_i < _nb_chargeurs_CfgMagazines}, {_i = _i + 1}] do
{
	private ["_chargeur"];
	
	_chargeur = (configFile >> "CfgMagazines") select _i;
	
	if (isClass _chargeur) then
	{
		// Si le chargeur est déjà un chargeur de base, on ajoute d'office son type de munition
		if ((configName _chargeur) in _chargeurs_base) then
		{
			if !(configName _chargeur in _chargeurs_compatibles) then
			{
				_chargeurs_compatibles = _chargeurs_compatibles + [configName _chargeur];
			};
		}
		// Si ce n'est pas un chargeur de base, on regarde si il est dérivé d'un chargeur de base
		else
		{
			private ["_stop", "_iterateur"];
			_stop = fal