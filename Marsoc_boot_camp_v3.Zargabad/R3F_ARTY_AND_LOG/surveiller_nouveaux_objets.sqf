 vos impressions sur le fil de discussion chez BIS : http://forums.bistudio.com/showthread.php?t=94280

	Copyright (C) 2010 madbull ~R3F~
	
	Ce programme est un logiciel libre ; vous pouvez le redistribuer ou le
	modifier suivant les termes de la "GNU General Public License" telle que
	publi�e par la Free Software Foundation : soit la version 3 de cette
	licence, soit (� votre gr�) toute version ult�rieure.
	
	Ce programme est distribu� dans l�espoir qu�il vous sera utile, mais SANS
	AUCUNE GARANTIE : sans m�me la garantie implicite de COMMERCIALISABILIT�
	ni d�AD�QUATION � UN OBJECTIF PARTICULIER. Consultez la Licence G�n�rale
	Publique GNU pour plus de d�tails.
	
	Vous devriez avoir re�u une copie de la Licence G�n�rale Publique GNU avec
	ce programme ; si ce n�est pas le cas, consultez :
	<http://www.gnu.org/licenses/>.

Contact : madbull@team-r3f.org﻿#include "R3F_ARTY_disable_enable.sqf"

#ifdef R3F_ARTY_enable
#include "R3F_ARTY\stringtable.csv"
#endif

#include "R3F_LOG\stringtable.csv"

STR_R3F_ARTY_LOG_nom_produit,	"[R3F] Artillery and Logistic",	"[R3F] Artillery and Logistic"/**
 * Recherche p�riodiquement les nouveaux objets pour leur ajouter les fonctionnalit�s d'artillerie et de logistique si besoin
 * Script � faire tourner dans un fil d'ex�cution d�di�
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

// Contiendra la liste des v�hicules (et objets) d�j� initialis�s
_liste_vehicules_connus = [];

while {true} do
{
	// R�cup�ration des tout les nouveaux v�hicules de la carte et des nouveaux objets d�rivant de "Static" (caisse de mun, drapeau, ...) proches du joueur
	_liste_vehicules = (vehicles + nearestObjects [player, ["Static"], 80]) - _liste_vehicules_connus;
	_count_liste_vehicules = count _liste_vehicules;
	
	if (_count_liste_vehicules > 0) then
	{
		// On parcoure tout les v�hicules pr�sents dans le jeu en _tempo secondes
		for [{_i = 0}, {_i < _count_liste_vehicules}, {_i = _i + 1}] do
		{
			_objet = _liste_vehicules select _i;
			
			// Si l'objet est un objet d�pla�able/h�liportable/remorquable/transportable
			if ({_objet isKindOf _x} count _liste_objets_depl_heli_remorq_transp > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\objet_init.sqf";
			};
			
			// Si l'objet est un v�hicule h�liporteur
			if ({_objet isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\heliporteur_init