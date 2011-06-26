 vos impressions sur le fil de discussion chez BIS : http://forums.bistudio.com/showthread.php?t=94280

	Copyright (C) 2010 madbull ~R3F~
	
	Ce programme est un logiciel libre ; vous pouvez le redistribuer ou le
	modifier suivant les termes de la "GNU General Public License" telle que
	publiée par la Free Software Foundation : soit la version 3 de cette
	licence, soit (à votre gré) toute version ultérieure.
	
	Ce programme est distribué dans l’espoir qu’il vous sera utile, mais SANS
	AUCUNE GARANTIE : sans même la garantie implicite de COMMERCIALISABILITÉ
	ni d’ADÉQUATION À UN OBJECTIF PARTICULIER. Consultez la Licence Générale
	Publique GNU pour plus de détails.
	
	Vous devriez avoir reçu une copie de la Licence Générale Publique GNU avec
	ce programme ; si ce n’est pas le cas, consultez :
	<http://www.gnu.org/licenses/>.

Contact : madbull@team-r3f.orgï»¿#include "R3F_ARTY_disable_enable.sqf"

#ifdef R3F_ARTY_enable
#include "R3F_ARTY\stringtable.csv"
#endif

#include "R3F_LOG\stringtable.csv"

STR_R3F_ARTY_LOG_nom_produit,	"[R3F] Artillery and Logistic",	"[R3F] Artillery and Logistic"/**
 * Recherche périodiquement les nouveaux objets pour leur ajouter les fonctionnalités d'artillerie et de logistique si besoin
 * Script à faire tourner dans un fil d'exécution dédié
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "R3F_ARTY_disable_enable.sqf"

// Attente fin briefing
sleep 0.1;

private ["_liste_objets_depl_heli_remorq_transp", "_liste_vehicules_connus", "_liste_vehicules", "_count_liste_vehicules", "_i", "_objet"];

// Union des tableaux de types d'objets servant dans un isKindOf
_liste_objets_depl_heli_remorq_transp = R3F_LOG_CFG_objets_deplacables + R3F_LOG_CFG_objets_heliportables +
	R3F_LOG_CFG_objets_remorquables + R3F_LOG_classes_objets_transportables;

// Contiendra la liste des véhicules (et objets) déjà initialisés
_liste_vehicules_connus = [];

while {true} do
{
	// Récupération des tout les nouveaux véhicules de la carte et des nouveaux objets dérivant de "Static" (caisse de mun, drapeau, ...) proches du joueur
	_liste_vehicules = (vehicles + nearestObjects [player, ["Static"], 80]) - _liste_vehicules_connus;
	_count_liste_vehicules = count _liste_vehicules;
	
	if (_count_liste_vehicules > 0) then
	{
		// On parcoure tout les véhicules présents dans le jeu en _tempo secondes
		for [{_i = 0}, {_i < _count_liste_vehicules}, {_i = _i + 1}] do
		{
			_objet = _liste_vehicules select _i;
			
			// Si l'objet est un objet déplaçable/héliportable/remorquable/transportable
			if ({_objet isKindOf _x} count _liste_objets_depl_heli_remorq_transp > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\objet_init.sqf";
			};
			
			// Si l'objet est un véhicule héliporteur
			if ({_objet isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\heliporteur_init