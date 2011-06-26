.sqf";
			};
			
			// Si l'objet est un véhicule remorqueur
			if ({_objet isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorqueur_init.sqf";
			};
			
			// Si l'objet est un véhicule remorqueur
			if ({_objet isKindOf _x} count R3F_LOG_classes_transporteurs > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_LOG\transporteur\transporteur_init.sqf";
			};
			
			#ifdef R3F_ARTY_enable
			// Si l'objet est un pièce d'artillerie d'un type à gérer
			if ({_objet isKindOf _x} count R3F_ARTY_CFG_pieces_artillerie > 0) then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\piece\piece_init.sqf";
			};
			
			// Si c'est un calculateur
			if (typeOf _objet == "SatPhone") then
			{
				[_objet] execVM "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\calculateur_init.sqf";
			};
			#endif
			
			sleep (20/_count_liste_vehicules);
		};
		
		// Les objets ont été initialisés, on les mémorise pour ne plus les ré-initialiser
		_liste_vehicules_connus = _liste_vehicules_connus + _liste_vehicules;
	}
	else
	{
		sleep 20;
	};
};README
======

Mission: [ Insert name of mission ]
Version: [ Insert version here, format: N-N-N ]
Developer(s): [ Insert your name(s) here. ]
Description: [ Insert short mission description here ]



README CONTENTS
===============

01. VERSION HISTORY
02. COPYRIGHT STATEMENT
03. TERMS OF USE
04. LEGAL DISCLAIMER
05. INSTALLATION
06. REQUIRED ADDONS
07. NOTES
08. CHANGE HISTORY



01. VERSION HISTORY
===================

Version | Date | Notes

[ Insert version, format: N-N-N ] | [ Insert date, format: DD MM CCYY ] | [ Insert short note here. ]



02. COPYRIGHT STATEMENT
=======================

This mission is (c)[ CCYY ] [ Insert your name(s) here. ]. All rights reserved.



03. TERMS OF USE
================

This mission (hereafter 'Software') contains files to be used in the PC CD-ROM simulator "Armed Assault 2" (hereafter 'ArmA2'). To use the Software you must agree to the following conditions of use:

1. [ Insert your name(s) here. ] (hereafter 'The Author(s)') grant to you a personal, non-exclusive license to use the Software.

2. The commercial exploitation of the Software without written permission fr