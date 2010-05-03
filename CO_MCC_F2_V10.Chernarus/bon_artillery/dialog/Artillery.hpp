//by Bon_Inf*

class ArtilleryDialog {
	idd = 999900;
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
			idc = 999913;
			style = ST_MULTI;
			linespacing = 1.00000;
			x = 0.005; y = 0.031;
			w = 0.2875; h = 0.389;
			sizeEx = 0.0225;
			text = "Direction to target in degrees,\nDistance to target in metres.\n\nYou can customize each cannon separately, or mark multiple cannons for the same setup. Press 'Confirm' to store a setup to cannon(s).\n\nPress ESC to close the dialog without loosing current configuration, but remaining registered for Fire Mission. Always use 'Cancel' to unregister.\n\n\nWritten by Bon_Inf*.";
		};
		class HW_ArtiShellsLeft : HW_ArtiTextField {
			idc = 999901;
			text = "Shells left: 0815";
		};
		class HW_Articoord : HW_ArtiTextField {
			y = 0.075 + 0.05;
			w = 0.22;
			text = "Your current position:";
		};
		class HW_ArtiXcoord : HW_ArtiTextField {
			idc = 999902;
			style = ST_RIGHT;
			y = 0.075 + 0.05 + 0.05;
			w = 0.175;
		};
		class HW_ArtiYcoord : HW_ArtiTextField {
			idc = 999903;
			style = ST_RIGHT;
			y = 0.075 + 0.05 + 0.05 + 0.05;
			w = 0.175;
		};


		class HW_ArtiCannonList : HW_RscGUIListBox {
			idc = 999904;
			style = LB_MULTI;
			default = 1;
			x = 0.005; y = 0.420;
			w = 0.2875; h = 0.275;
			//lineSpacing = 0;
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
			idc = 999905;
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
			idc = 999906;
			y = 0.125 + 0.05;
		};
		class HW_ArtiDirection : HW_ArtiXCoordunit {
			idc = 999907;
			y = 0.125 + 0.05 + 0.05;
		};
		class HW_ArtiDistance : HW_ArtiXCoordunit {
			idc = 999908;
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
			idc = 999909;
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
			idc = 999910;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			x = 0.785; y = 0.075 + 0.295;
			w = 0.045; h = 0.05;
			sizeEx = 0.025;
			text = "";
		};

		class HW_ArtiType {
			idc = -1;
			type = CT_TOOLBOX;
			style = ST_CENTER;
			x = 0.425; y = 0.425;
			w = 0.45; h = 0.05;
			colorText[] = { 1, 1, 1, 1 };
			color[] = { 1, 1, 1, 1 };
			colorTextSelect[] = { 1.0, 0.35, 0.3, 1 };
			colorSelect[] = { 0.1, 0.1, 0.9, 1 };
			colorTextDisable[] = { 0.9, 0.1, 0.1, 1 };
			colorDisable[] = { 1, 1, 1, 1 };
			coloSelectedBg[] = { 1, 1, 1, 0 };
			font = "Zeppelin32";
			sizeEx = 0.035;
			rows = 1;
			columns = 6;
			strings[] = {"HE","AT","HEAT","DPICM","Smoke","Flares"};
			onToolBoxSelChanged = "arty_Type = _this select 1";
		};
		class HW_ArtiNrShells : HW_ArtiType {
			y = 0.425 + 0.05;
			rows = 1;
			columns = 5;
			strings[] = {"1","2","3","4","5"};
			onToolBoxSelChanged = "arty_NrShells=(_this select 1)+1";
		};
		class HW_ArtiSpread : HW_ArtiType {
			y = 0.425 + 0.05 + 0.05;
			rows = 1;
			columns = 4;
			strings[] = {"Precise","Tight","Scattered","Wide"};
			onToolBoxSelChanged = "arty_Spread = _this select 1";
		};
		class HW_ArtiTypeTitle : HW_RscText {
			idc = -1;
			style = ST_LEFT;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			x = 0.3; y = 0.425;
			w = 0.22; h = 0.05;
			sizeEx = 0.03;
			text = "Type:";
		};
		class HW_ArtiNrShellsTitle : HW_ArtiTypeTitle {
			y = 0.425 + 0.05;
			text = "Nr. Shells:";
		};

		class HW_ArtiSpreadTitle : HW_ArtiTypeTitle {
			y = 0.425 + 0.05 + 0.05;
			text = "Spread:";
		};


		class HW_ArtiDelayDescr : HW_ArtiTextField {
			x = 0.35;
			y = 0.6175;
			w = 0.125;
			text = "delay in sec.";
		};
		class HW_ArtiDelayunit : HW_ArtiXCoordunit {
			idc = 999911;
			x = 0.35 + 0.13;
			y = 0.625;
		};
		class HW_ArtiConfirmButton : HW_RscGUIShortcutButton {
			idc = -1;
			colorDisabled[] = {1, 0.4, 0.3, 0.8};
			x = 0.75; y = 0.63;
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


		class HW_RequestButton : HW_RscGUIShortcutButton {
			idc = 999914;
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
	};
};