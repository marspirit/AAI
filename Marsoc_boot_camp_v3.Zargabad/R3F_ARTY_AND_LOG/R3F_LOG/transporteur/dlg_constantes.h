_LOG\objet_deplacable\deplacer.sqf";
		}
		else
		{
			private ["_dimension_max"];
			_dimension_max = (((boundingBox _objet_a_decharger select 1 select 1) max (-(boundingBox _objet_a_decharger select 0 select 1))) max ((boundingBox _objet_a_decharger select 1 select 0) max (-(boundingBox _objet_a_decharger select 0 select 0))));
			
			player globalChat localize "STR_R3F_LOG_action_decharger_en_cours";
			
			sleep 2;
			
			// On pose l'objet au hasard vers l'arrière du transporteur
			_objet_a_decharger setPos [
				(getPos _transporteur select 0) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*sin (getDir _transporteur - 90+random 180)),
				(getPos _transporteur select 1) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*cos (getDir _transporteur - 90+random 180)),
				0
			];
			_objet_a_decharger setVelocity [0, 0, 0];
			
			player globalChat localize "STR_R3F_LOG_action_decharger_fait";
		};
	}
	else
	{
		player globalChat localize "STR_R3F_LOG_action_decharger_deja_fait";
	};
	
	R3F_LOG_mutex_local_verrou = false;
};/**
 * Constantes pour rendre les définitions des boîtes de dialogue plus lisible et maintenable
 */

#define R3F_ARTY_ID_transporteur_START 65430

#define R3F_LOG_IDD_dlg_contenu_vehicule (R3F_ARTY_ID_transporteur_START + 1)

#define R3F_LOG_IDC_dlg_CV_capacite_vehicule (R3F_ARTY_ID_transporteur_START + 2)
#define R3F_LOG_IDC_dlg_CV_liste_contenu (R3F_ARTY_ID_transporteur_START + 3)
#define R3F_LOG_IDC_dlg_CV_btn_decharger (R3F_ARTY_ID_transporteur_START + 4)

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUT_BUTTON  16 // Arma 2 - textured button

#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_List