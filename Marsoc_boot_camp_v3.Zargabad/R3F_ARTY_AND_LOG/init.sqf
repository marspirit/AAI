lations (speed and precision)
- The longitude/latitude coordinates format are now in a 4 digits notation
- The fire adjustments is now in a "Add, Drop, Left, Right + Dir. to target" notation
- Add the possibility to close/open the interface in an artillery piece

v1.1
- Fix of a bug with velocity of objects with ACE2
- Add the possibility to have a non-movable artillery command quarter
- Some additionnal precisions in the explanation about the ballistic table generation

v1.0
- First public release/**
 * Redirects to the script creating the artillery command quarter
 * 
 * @param 0 le calculateur du poste de commandement d'artillerie
 */
[_this select 0] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\creer_poste_commandement.sqf";#include "R3F_ARTY_disable_enable.sqf"

#ifdef R3F_ARTY_enable
#include "R3F_ARTY\dlg_chef_batterie\dlg_saisie_mission.h"
#include "R3F_ARTY\dlg_chef_batterie\dlg_clic_carte.h"
#endif

#include "R3F_LOG\transporteur\dlg_contenu_vehicule.h"#include "R3F_ARTY_disable_enable.sqf"

#ifdef R3F_ARTY_enable
#include "R3F_ARTY\dlg_artilleur\dlg_artilleur.h"
#endif/**
 * Script principal qui initialise les systèmes d'artillerie réaliste et de logistique
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Nouveau fil d'exécution pour assurer une compatibilité ascendante (v1.0 à v1.2).
 * Ces versions préconisaient un #include plutôt que execVM pour appeler ce script.
 * A partir de la v1.3 l'exécution par execVM prend l'avantage pour 