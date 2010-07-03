//by Bon_Inf*

#include "definitions.sqf"

class ArtilleryDialog {
	idd = BON_ARTY_DIALOG;
	movingEnable = true; 
	onLoad = "[] execVM 'bon_artillery\dialog\bon_initartillery.sqf'";

	class controlsBackground {
		class HW_ArtiBckgrnd : HW_RscPicture {
			idc = -1;
			moving = true;
			x = 0.0; y = 0.0;
			w = 1.25; h = 1.25;
			text = "\ca\ui\data\igui_background_diary_ca.paa";
		};
		class HW_ArtiListBckgrnd : HW_RscText {
			idc = -1;
			moving = true;
			colorBackground[] = { 0, 0, 0, 0.6 };
			colorText[] = { 1, 1, 1, 0 };
			x = 0.005; y = 0.420;
			w = 0.285; h = 0.275;
			text = "";
		};
	};

	class controls {
		class HW_ArtiTextField : HW_RscText {
			idc = -1;
			style = ST_LEFT;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			x = 0.3; y = 0.05;
			w = 0.3; h = 0.05;
			sizeEx = 0.03;
			text = "";
		};
		class HW_ArtiInstructions : HW_ArtiTextField {
			idc = BON_ARTY_SUMMARY;
			style = ST_MULTI;
			linespacing = 1.00000;
			x = 0.005; y = 0.031;
			w = 0.2875; h = 0.389;
			sizeEx = 0.0225;
			text = "Always use 'Cancel' to unregister without actually executing a fire mission.\n\n\n\n\n\n\n\n\n\n\n\n\n\nWritten by Bon_Inf*.";
		};
		class HW_ArtiShellsLeft : HW_ArtiTextField {
			idc = BON_ARTY_SHELLSLEFT;
			text = "Shells left: 0815";
		};
		class HW_Articoord : HW_ArtiTextField {
			y = 0.0725 + 0.05;
			w = 0.22;
			text = "Your current position:";
		};
		class HW_ArtiXcoord : HW_ArtiTextField {
			idc = BON_ARTY_XRAY;
			style = ST_RIGHT;
			y = 0.0725 + 0.05 + 0.05;
			w = 0.175;
		};
		class HW_ArtiYcoord : HW_ArtiTextField {
			idc = BON_ARTY_YANKEE;
			style = ST_RIGHT;
			y = 0.0725 + 0.05 + 0.05 + 0.05;
			w = 0.175;
		};


		class HW_ArtiCannonList : HW_RscGUIListBox {
			idc = BON_ARTY_CANNONLIST;
			style = LB_MULTI;
			default = 1;
			x = 0.005; y = 0.420;
			w = 0.2875; h = 0.275;
			onLBSelChanged = "[] call arti_dlgUpdate";
			onLBDblClick = "";
			rowHeight = 0.04;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};


		class HW_ArtiXcoordunit : HW_RscText {
			idc = BON_ARTY_XRAYEDIT;
			type = CT_EDIT;
			style = ST_LEFT;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			colorSelection[] = { 1, 1, 1, 1 };
			colorBorder[] = { 1, 1, 1, 1 };
			BorderSize = 0.01;
			autocomplete = false;  
			x = 0.65; y = 0.125;
			w = 0.065; h = 0.035;

			sizeEx = 0.035;
			text = "";
		};
		class HW_ArtiYcoordunit : HW_ArtiXCoordunit {
			idc = BON_ARTY_YANKEEEDIT;
			y = 0.125 + 0.05;
		};
		class HW_ArtiDirection : HW_ArtiXCoordunit {
			idc = BON_ARTY_DIRECTION;
			y = 0.125 + 0.05 + 0.05;
		};
		class HW_ArtiDistance : HW_ArtiXCoordunit {
			idc = BON_ARTY_DISTANCE;
			y = 0.125 + 0.05 + 0.05 + 0.05;
		};

		class HW_ArtiXCoordUnitDescr : HW_ArtiXcoordunit {
			idc = -1;
			type = CT_STATIC; 
			x = 0.55; y = 0.125;
			w = 0.75;
			text = "x-ray";
		};
		class HW_ArtiYCoordUnitDescr : HW_ArtiXCoordUnitDescr {
			y = 0.125 + 0.05;
			text = "yankee";
		};
		class HW_ArtiDirDescr : HW_ArtiXCoordUnitDescr {
			y = 0.125 + 0.05 + 0.05;
			text = "direction";
		};
		class HW_ArtiDistDescr : HW_ArtiXCoordUnitDescr {
			y = 0.125 + 0.05 + 0.05 + 0.05;
			text = "distance";
		};

		class HW_ArtiHeightSlider : HW_RscSlider {
			idc = BON_ARTY_HEIGHT;
			style = SL_VERT;
			x = 0.8; y = 0.075;
			w = 0.035; h = 0.3;
		};
		class HW_ArtiSliderTitle : HW_RscText {
			idc = -1;
			style = ST_MULTI;
			linespacing = 1.00000;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			x = 0.8 - 0.025; y = 0.075 + 0.05;
			w = 0.03; h = 0.18;
			sizeEx = 0.03;
			text = "Height";
		};
		class HW_ArtiSliderDescr : HW_RscText {
			idc = BON_ARTY_HEIGHTINDEX;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			x = 0.785; y = 0.075 + 0.295;
			w = 0.045; h = 0.05;
			sizeEx = 0.025;
			text = "";
		};

		class HW_ArtiType : HW_RscComboBox {
			idc = BON_ARTY_TYPE;
			style = ST_LEFT;
			colorText[] = { 1, 1, 1, 1 };
			colorSelect[] = { 1.0, 0.35, 0.3, 1 };
			colorBackground[] = { 0, 0, 0, 0.6 };
			colorSelectBackground[] = { 0, 0, 0, 1 };
			font = "BitStream";
			sizeEx = 0.028;
			x = 0.425; y = 0.47;
			w = 0.15; h = 0.028;
		};
		class HW_ArtiNrShells : HW_ArtiType {
			idc = BON_ARTY_NRSHELLS;
			y = 0.47 + 0.05;
		};
		class HW_ArtiSpread : HW_ArtiType {
			idc = BON_ARTY_SPREAD;
			y = 0.47 + 0.05 + 0.05;
		};
		class HW_ArtiMission : HW_ArtiType {
			idc = BON_ARTY_MISSIONTYPE;
			y = 0.47 + 0.05 + 0.05 + 0.05;
		};

		class HW_ArtiTypeTitle : HW_RscText {
			idc = -1;
			style = ST_LEFT;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			x = 0.3; y = 0.47 - 0.015;
			w = 0.22; h = 0.05;
			sizeEx = 0.03;
			text = "Type:";
		};
		class HW_ArtiNrShellsTitle : HW_ArtiTypeTitle {
			y = 0.47 - 0.015 + 0.05;
			text = "Nr. Shells:";
		};
		class HW_ArtiSpreadTitle : HW_ArtiTypeTitle {
			y = 0.47 - 0.015 + 0.05 + 0.05;
			text = "Spread:";
		};
		class HW_ArtiMissionTitle : HW_ArtiTypeTitle {
			y = 0.47 - 0.015 + 0.05 + 0.05 + 0.05;
			text = "Fire:";
		};



		class HW_ArtiDelayDescr : HW_ArtiTextField {
			x = 0.63; y = 0.4375;
			w = 0.125;
			text = "delay in sec.";
		};
		class HW_ArtiDelayunit : HW_ArtiXCoordunit {
			idc = BON_ARTY_DELAYEDIT;
			x = 0.63 + 0.145; y = 0.445;
		};
		class HW_ArtiConfirmButton : HW_RscGUIShortcutButton {
			idc = -1;
			colorDisabled[] = {1, 0.4, 0.3, 0.8};
			x = 0.75; y = 0.5;
			w = 0.105825; h = 0.0422876;
			size = 0.02821;
			sizeEx = 0.02821;
			text = "Confirm";
			onButtonClick = "[] execVM 'bon_artillery\bon_arti_setup.sqf'";
		};
		class HW_ArtiClearButton : HW_ArtiConfirmButton {
			x = 0.75 - 0.125;
			text = "Reset";
			onButtonClick = "[] execVM 'bon_artillery\bon_arti_clearcannons.sqf'";
		};
		class HW_artiCoordApplyButton : HW_RscButton {
			x = 0.3; y = 0.0725 + 0.05;
			w = 0.225; h = 0.15;
			colorText[] = { 0, 0, 0, 0 };
			colorFocused[] = { 0, 0, 0, 0 };
			colorDisabled[] = { 0, 0, 0, 0 };
			colorBackground[] = { 0, 0, 0, 0 };
			colorBackgroundDisabled[] = { 0, 0, 0, 0 };
			colorBackgroundActive[] = { 0, 0, 0, 0 };
			colorShadow[] = { 0, 0, 0, 0 };
			colorBorder[] = { 0, 0, 0, 0 };
			text = "";
			onButtonClick = "[] execVM 'bon_artillery\dialog\apply_pos.sqf'";			
		};

		class HW_RequestButton : HW_RscGUIShortcutButton {
			idc = BON_ARTY_REQUESTBUTTON;
			colorDisabled[] = {1, 0.4, 0.3, 0.8};
			x = 0.7; y = 0.72;
			text = "Execute";
			onButtonClick = "player execVM 'bon_artillery\bon_arti_request.sqf'";
		};
		class HW_CancelButton : HW_RequestButton {
			idc = -1;
			x = 0.7 - 0.2;
			text = "Cancel";
			onButtonClick = "player execVM 'bon_artillery\bon_arti_cancle.sqf'";
		};


		class HW_ArtiXCorrTitle : HW_ArtiTextField {
			x = 0.6; y = 0.63;
			w = 0.2;
			sizeEx = 0.028;
			text = "Corr. left-right";
		};
		class HW_ArtiArrowRight : HW_RscPicture {
			x = 0.85; y = 0.635;
			w = 0.025; h = 0.025;
			text = "bon_artillery\dialog\arrow_right.paa";
		};
		class HW_ArtiRightCorrection : HW_RscButton {
			x = 0.85; y = 0.635;
			w = 0.025; h = 0.025;
			colorText[] = { 0, 0, 0, 0 };
			colorFocused[] = { 1, 1, 1, 0 };
			colorDisabled[] = { 1, 1, 1, 0 };
			colorBackground[] = { 1, 1, 1, 0 };
			colorBackgroundDisabled[] = { 1, 1, 1, 0 };
			colorBackgroundActive[] = { 1, 1, 1, 0 };
			colorShadow[] = { 1, 1, 1, 0 };
			colorBorder[] = { 1, 1, 1, 0 };
			text = "";
			onButtonClick = "'Right' execVM 'bon_artillery\bon_arti_correction.sqf'";
		};
		class HW_ArtiXCorrectionunit : HW_ArtiXCoordunit {
			idc = BON_ARTY_XCORRECTION;
			style = ST_CENTER;
			x = 0.775; y = 0.635;
			text = "0";
		};
		class HW_ArtiArrowLeft : HW_ArtiArrowRight {
			x = 0.74; y = 0.635;
			text = "bon_artillery\dialog\arrow_left.paa";
		};
		class HW_ArtiLeftCorrection : HW_ArtiRightCorrection {
			x = 0.74; y = 0.635;
			onButtonClick = "'Left' execVM 'bon_artillery\bon_arti_correction.sqf'";
		};


		class HW_ArtiYCorrTitle : HW_ArtiTextField {
			x = 0.6; y = 0.575;
			w = 0.2;
			sizeEx = 0.028;
			text = "Corr. distance";
		};
		class HW_ArtiArrowUp : HW_ArtiArrowRight {
			x = 0.85; y = 0.58;
			text = "bon_artillery\dialog\arrow_up.paa";
		};
		class HW_ArtiUpCorrection : HW_ArtiRightCorrection {
			x = 0.85; y = 0.58;
			text = "";
			onButtonClick = "'Up' execVM 'bon_artillery\bon_arti_correction.sqf'";
		};
		class HW_ArtiYCorrectionunit : HW_ArtiXCoordunit {
			idc = BON_ARTY_YCORRECTION;
			style = ST_CENTER;
			x = 0.775; y = 0.58;
			text = "0";
		};
		class HW_ArtiArrowDown : HW_ArtiArrowRight {
			x = 0.74; y = 0.58;
			text = "bon_artillery\dialog\arrow_down.paa";
		};
		class HW_ArtiDownCorrection : HW_ArtiRightCorrection {
			x = 0.74; y = 0.58;
			onButtonClick = "'Down' execVM 'bon_artillery\bon_arti_correction.sqf'";
		};
	};
};