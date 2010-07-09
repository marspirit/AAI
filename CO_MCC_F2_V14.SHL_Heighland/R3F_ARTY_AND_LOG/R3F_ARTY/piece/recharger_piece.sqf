/**
 * Recharge une pi�ce d'artillerie avec le type de chargeur donn� en param�tre
 * 
 * @param 3 select 0 la pi�ce � recharger
 * @param 3 select 1 le nom de classe du chargeur
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_piece", "_chargeur"];

_piece = _this select 3 select 0;
_chargeur = _this select 3 select 1;

if (count nearestObjects [_piece, ["SatPhone", "HMMWV", "UAZ_CDF", "UAZ_RU", "UAZ_INS", "hilux1_civil_1_open"], 50] > 0) then
{
	_piece removeMagazines (magazines _piece select 0);
	_piece addMagazine _chargeur;
}
else
{
	player globalChat localize "STR_R3F_ARTY_recharger_trop_loin_poste_commandement";
};