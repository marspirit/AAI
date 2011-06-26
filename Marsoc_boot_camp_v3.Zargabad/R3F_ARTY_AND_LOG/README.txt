_i = 0}, {_i < count _tab_objets}, {_i = _i + 1}] do
		{
			private ["_index", "_icone"];
			
			_icone = getText (configFile >> "CfgVehicles" >> (_tab_objets select _i) >> "icon");
			
			// Si l'icône est valide
			if (toString ([toArray _icone select 0]) == "\") then
			{
				_index = _ctrl_liste lbAdd (getText (configFile >> "CfgVehicles" >> (_tab_objets select _i) >> "displayName") + format [" (%1x)", _tab_quantite select _i]);
				_ctrl_liste lbSetPicture [_index, _icone];
			}
			else
			{
				// Si le téléphone satellite est utilisé pour un PC d'artillerie
				if (!(isNil "R3F_ARTY_active") && (_tab_objets select _i) == "SatPhone") then
				{
					_index = _ctrl_liste lbAdd ("     " + (localize "STR_R3F_LOG_nom_pc_arti") + format [" (%1x)", _tab_quantite select _i]);
				}
				else
				{
					_index = _ctrl_liste lbAdd ("     " + getText (configFile >> "CfgVehicles" >> (_tab_objets select _i) >> "displayName") + format [" (%1x)", _tab_quantite select _i]);
				};
			};
			
			_ctrl_liste lbSetData [_index, _tab_objets select _i];
		};
	};
	
	R3F_LOG_mutex_local_verrou = false;
};[R3F] Artillery and Logistic : Manual artillery and advanced logistic (mission script)
--------------------------------------------------------------------------------------
You have the manual artillery and advanced logistic system for ArmA 2,
developed by the R3F (Régiment Force de Frappe Française, team-r3f.org).

You can get the full version of the [R3F] Artillery and Logistic (with the installation guide and the GPL license) here : http://forums.bistudio.com/showthread.php?t=94280

Feel free to give your feedback on the BIS topic : http://forums.bistudio.com/showthread.php?t=94280

	Copyright (C) 2010 madbull ~R3F~
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

Contact : madbull@team-r3f.org


[R3F] Artillery and Logistic : Artillerie manuelle et logistique avancée (script de mission)
--------------------------------------------------------------------------------------------
Vous disposez du système d'artillerie manuelle et de logistique avancée pour ArmA 2,
mis au point par le R3F (Régiment Force