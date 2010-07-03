/**
 * Ouvre la boîte de dialogue de l'artilleur et affiche en continu l'orientation du canon (azimut et élévation)
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

terminate R3F_ARTY_fil_exec_affichage_dlg_artilleur;
sleep 0.1;
(uiNamespace getVariable "R3F_ARTY_dlg_artilleur") closeDisplay 0;
uiNamespace setVariable ["R3F_ARTY_dlg_artilleur", displayNull];