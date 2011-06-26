* Initialise un v�hicule remorqueur
 * 
 * @param 0 le remorqueur
 */

private ["_remorqueur", "_est_desactive", "_remorque"];

_remorqueur = _this select 0;

_est_desactive = _remorqueur getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then
{
	_remorqueur setVariable ["R3F_LOG_disabled", false];
};

// D�finition locale de la variable si elle n'est pas d�finie sur le r�seau
_remorque = _remorqueur getVariable "R3F_LOG_remorque";
if (isNil "_remorque") then
{
	_remorqueur setVariable ["R3F_L