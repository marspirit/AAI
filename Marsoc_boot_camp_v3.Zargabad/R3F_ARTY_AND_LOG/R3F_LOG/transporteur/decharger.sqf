 + (random 3000))];
					_nb_tirage_pos = 1;
					while {(!isNull (nearestObject _position_attache)) && (_nb_tirage_pos < 25)} do
					{
						_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
						_nb_tirage_pos = _nb_tirage_pos + 1;
					};
					
					_objet attachTo [R3F_LOG_PUBVAR_point_attache, _position_attache];
					
					R3F_LOG_objet_selectionne = objNull;
					
					player globalChat format [localize "STR_R3F_LOG_action_charger_selection_fait", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
				}
				else
				{
					player globalChat format [localize "STR_R3F_LOG_action_charger_selection_trop_loin", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
				};
			}
			else
			{
				player globalChat localize "STR_R3F_LOG_action_charger_selection_pas_assez_de_place";
			};
		}
		else
		{
			player globalChat format [localize "STR_R3F_LOG_action_charger_selection_objet_transporte", getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
		};
	};
	
	R3F_LOG_mutex_local_verrou = false;
};/**
 * D�charger un objet d'un transporteur - appel� deuis l'interface listant le contenu du transporteur
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat localize "STR_R3F_LOG_mutex_action_en_cours";
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	
	#include "dlg_constantes.h"
	private ["_transporteur", "_objets_charges", "_type_objet_a_decharger", "_objet_a_decharger", "_i"];
	
	_transporteur = uiNamespace getVariable "R3F_LOG_dlg_CV_transporteur";
	_objets_charges = _transporteur getVariable "R3F_LOG_objets_charges";
	
	_type_objet_a_decharger = lbData [R3F_LOG_IDC_dlg_CV_liste_contenu, lbCurSel R3F_LOG_IDC_dlg_CV_liste_contenu];
	
	closeDialog 0;
	
	// Recherche d'un objet du type demand�
	_objet_a_decharger = objNull;
	for [{_i = 0}, {_i < count _objets_charges}, {_i = _i + 1}] do
	{
		if (typeOf (_objets_charges select _i) == _type_objet_a_decharger) exitWith
		{
			_objet_a_decharger = _objets_charges select _i;
		};
	};
	
	if !(isNull _objet_a_decharger) then
	{
		// On m�morise sur le r�seau le nouveau contenu du transporteur (c�d avec cet objet en moins)
		_objets_charges = _objets_charges - [_objet_a_decharger];
		_transporteur setVariable ["R3F_LOG_objets_charges", _objets_charges, true];
		
		detach _objet_a_decharger;
		
		if ({_objet_a_decharger isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
		{
			[_objet_a_decharger] execVM "R3F_ARTY_AND_LOG\R3F