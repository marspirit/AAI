se;
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
_chargeurs_compatibles/**
 * Lancer par une ligne d'initialisation d'une pièce d'artillerie ou d'un mortier
 * 
 * @param 0 la pièce d'artillerie ou le mortier
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

if !(isServer && isDedicated) then
{
	private ["_piece"];
	
	_piece = _this select 0;
	
	// Quand le joueur monte dans la pièce, on lance l'affichage des paramètres de la pièce
	_piece addEventHandler ["GetIn",
	{
		if (_this select 2 == player) then
		{
			_this spawn
			{
				sleep 0.2;
				
				execVM "R3F_ARTY_AND_LOG\R3F_ARTY\dlg_artilleur\afficher_dlg_artilleur.sqf";
			};
		};
	}];
	
	// Surveiller les tirs pour suivre le projectile et marquer le point d'impact
	if (R3F_ARTY_CFG_montrer_marqueur_impact) then
	{
		R3F_ARTY_FNCT_afficheur_marqueur_impact = compile preprocessFile "R3F_ARTY_AND_LOG\R3F_ARTY\afficheur_marqueur_impact.sqf";
	};
	
	_piece addEventHandler ["Fired",
	{
		// Si le joueur qui a tiré
		if (gunner (_this select 0) == player) then
		{
			// Surveiller les tirs pour suivre le projectile et marquer le point d'impact
			if (R3F_ARTY_CFG_montrer_marqueur_impact) then
			{
				private ["_projectile"];
				_projectile = nearestObject [_this select 0, _this select 4];
				
				if (!isNull _projectile) then
				{
					[_projectile] spawn R3F_ARTY_FNCT_afficheur_marqueur_impact;
				}
				else
				{
					player globalChat localize "STR_R3F_ARTY_echec_suivi_projectile";
				};
			};
			
			// Passage automatique à l'ordre suivant à chaque tir
			execVM "R3F_ARTY_AND_LOG\R3F_ARTY\dlg_artilleur\ordre_suivant.sqf";
		};
	}];
	
	// Ajout des actions de menu de gestion des ordres, valide seulement quand on est à bord
	//_piece addAction [("<t color=""#22ee22"">" + (localize "STR_R3F_ARTY_action_ordre_suivant")+ "</t>"), "R3F_ARTY_AND_LOG\R3F_ARTY\dlg_artilleur\ordre_suivant.sqf", nil, 6, false, true, "", "gunner _target == player"];
	_piece addAction [("<t color=""#22ee22"">" + (localize "STR_R3F_ARTY_action_ouvrir_dlg_artilleur")+ "</t>"), "R3F_ARTY_AND_LOG\R3F_