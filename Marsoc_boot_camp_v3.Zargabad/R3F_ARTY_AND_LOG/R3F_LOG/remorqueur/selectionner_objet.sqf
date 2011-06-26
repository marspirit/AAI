* Initialise un véhicule remorqueur
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

// Définition locale de la variable si elle n'est pas définie sur le réseau
_remorque = _remorqueur getVariable "R3F_LOG_remorque";
if (isNil "_remorque") then
{
	_remorqueur setVariable ["R3F_L