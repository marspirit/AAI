/**
 * Marque l'ordre actuel comme accompli et raffraichit la bo�te de dialogue de l'artilleur
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// On marque l'ordre actuel comme accompli
private ["_index_premier_ordre"];
_index_premier_ordre = 0;
while {count (R3F_ARTY_ordres_recus select _index_premier_ordre) == 0} do
{
	_index_premier_ordre = _index_premier_ordre + 1
};

R3F_ARTY_ordres_recus set [_index_premier_ordre, []];

// On raffraichit la bo�te de dialogue de l'artilleur
if (!isNull (uiNamespace getVariable "R3F_ARTY_dlg_artilleur")) then
{
	execVM "R3F_ARTY_AND_LOG\R3F_ARTY\dlg_artilleur\afficher_ordre.sqf";
};