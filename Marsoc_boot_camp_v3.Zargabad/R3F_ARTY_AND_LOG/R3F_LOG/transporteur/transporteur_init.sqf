y = 0.737; h = 0.02;
		sizeEx = 0.02;
		colorText[] = {0.5, 0.5, 0.5, 0.75};
		text = "$STR_R3F_ARTY_LOG_nom_produit";
	};
	
	class R3F_LOG_dlg_CV_btn_decharger : R3F_LOG_dlg_CV_btn
	{
		idc = R3F_LOG_IDC_dlg_CV_btn_decharger;
		x = 0.355; w = 0.18;
		y = 0.66;
		sizeEx = 0.02;
		text = "$STR_R3F_LOG_dlg_CV_btn_decharger";
		action = "execVM ""R3F_ARTY_AND_LOG\R3F_LOG\transporteur\decharger.sqf"";";
	};
	
	class R3F_LOG_dlg_CV_btn_fermer : R3F_LOG_dlg_CV_btn
	{
		x = 0.537; w = 0.16;
		y = 0.66;
		text = "$STR_R3F_LOG_dlg_CV_btn_fermer";
		action = "closeDialog 0;"; 
	};
};/**
 * Sélectionne un objet à charger dans un transporteur
 * 
 * @param 0 l'objet à sélectionner
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat localize "STR_R3F_LOG_mutex_action_en_cours";
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	
	R3F_LOG_objet_selectionne = _this select 0;
	player globalChat format [localize "STR_R3F_LOG_action_selectionner_objet_charge_fait", getText (configFile >> "CfgVehicles" >> (typeOf R3F_LOG_objet_selectionne) >> "displayName")];
	
	R3F_LOG_mutex_local_verrou = false;
};/**
 * Initialise un véhicule transporteur
 * 
 * @param 0 le transporteur
 */

private ["_transporteur", "_est_desactive", "_objets_charges"];

_transporteur = _this select 0;

_est_desactive = _transporteur getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then
{
	_transporteur setVariable ["R3F_LOG_disabled", fals