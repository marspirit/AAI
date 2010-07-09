/**
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
			_stop = false;
			_iterateur = _chargeur;
			while {!_stop} do
			{
				_iterateur = inheritsFrom _iterateur;
				
				if (configName _iterateur in _chargeurs_base) then
				{
					if !(configName _chargeur in _chargeurs_compatibles) then
					{
						_chargeurs_compatibles = _chargeurs_compatibles + [configName _chargeur];
					};
					_stop = true;
				}
				else
				{
					// On est remonté à la racine de l'arborescence du configFile
					if (configName _iterateur == "") then {_stop = true;};
				};
			};
		};
	};
};

// On retire les munitions qui nécessitent le module d'ARTY de BIS pour fonctionner
_chargeurs_compatibles = _chargeurs_compatibles - [
	"ARTY_30Rnd_105mmWP_M119",
	"ARTY_30Rnd_105mmSADARM_M119",
	"ARTY_30Rnd_105mmLASER_M119",
	"ARTY_30Rnd_105mmSMOKE_M119",
	"ARTY_30Rnd_105mmILLUM_M119",
	
	"ARTY_30Rnd_122mmWP_D30",
	"ARTY_30Rnd_122mmSADARM_D30",
	"ARTY_30Rnd_122mmLASER_D30",
	"ARTY_30Rnd_122mmSMOKE_D30",
	"ARTY_30Rnd_122mmILLUM_D30",
	
	"ARTY_8Rnd_81mmWP_M252",
	"ARTY_8Rnd_81mmILLUM_M252",
	
	"ARTY_8Rnd_82mmWP_2B14",
	"ARTY_8Rnd_82mmILLUM_2B14"
];

// Retour
_chargeurs_compatibles