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
	
	private ["_calculateur"];
	
	_calculateur = R3F_LOG_joueur_deplace_objet;
	
	// Relacher le calculateur
	R3F_LOG_joueur_deplace_objet = objNull;
	sleep 3;
	
	// Déployer le poste de commandement d'artillerie là où se trouve le calculateur
	R3F_ARTY_PUBVAR_creer_poste_commandement = _calculateur;
	if (isServer) then
	{
		["R3F_ARTY_PUBVAR_creer_poste_commandement", R3F_ARTY_PUBVAR_creer_poste_commandement] spawn R3F_ARTY_FNCT_PUBVAR_creer_poste_commandement;
	}
	else
	{
		publicVariable "R3F_ARTY_PUBVAR_creer_poste_commandemen