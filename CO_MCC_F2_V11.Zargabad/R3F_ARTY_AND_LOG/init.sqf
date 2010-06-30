/**
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
 * A partir de la v1.3 l'exécution par execVM prend l'avantage pour 3 raisons :
 *     - permettre des appels conditionnels optimisés (ex : seulement pour des slots particuliers)
 *     - l'execVM est mieux connu et compris par l'éditeur de mission
 *     - l'init client de l'arty devient bloquant : il attend une PUBVAR du serveur (le point d'attache)
 */
[] spawn
{
	if (isServer) then
	{
		// Service offert par le serveur : orienter un objet (car setDir est à argument local)
		R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir =
		{
			private ["_objet", "_direction"];
			_objet = _this select 1 select 0;
			_direction = _this select 1 select 1;
			
			// Orienter l'objet et broadcaster l'effet
			_objet setDir _direction;
			_objet setPos (getPos _objet);
		};
		"R3F_ARTY_AND_LOG_PUBVAR_setDir" addPublicVariableEventHandler R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
	};
	
	#include "R3F_ARTY_disable_enable.sqf"
	#ifdef R3F_ARTY_enable
		R3F_ARTY_active = true;
		#include "R3F_ARTY\init.sqf"
	#endif
	
	#include "R3F_LOG\init.sqf"
	
	// Un serveur dédié n'en a pas besoin
	if !(isServer && isDedicated) then
	{
		execVM "R3F_ARTY_AND_LOG\surveiller_nouveaux_objets.sqf";
	};
};