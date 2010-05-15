//==== put silencer on  weapons=================

//who activate?
_unit = _this select 1;
_weapon = primaryWeapon _unit;

if (_weapon == "M4A1_HWS_GL_camo" || _weapon =="M4A1_HWS_GL_SD_Camo" || _weapon == "ACE_M110" || _weapon == "ACE_M110_SD" || _weapon == "M4A1_Aim_camo" ||_weapon == "M4A1_AIM_SD_camo" || _weapon == "AKS_74_U" || _weapon == "AKS_74_UN_kobra" || _weapon =="G36K" || _weapon == "G36_C_SD_eotech" || _weapon == "MP5A5" || _weapon == "MP5SD" ||_weapon == "Bizon" || _weapon == "bizon_silenced" || _weapon == "ACE_M4A1_GL" || _weapon =="ACE_M4A1_GL_SD" || _weapon == "ACE_M4A1_ACOG" || _weapon == "ACE_M4A1_ACOG_SD" || _weapon == "M4A1_AIM" ||_weapon == "ACE_M4A1_AIM_SD" || _weapon == "ACE_SOC_M4A1_Aim" || _weapon == "ACE_SOC_M4A1_AIM_SD" || _weapon =="ACE_SOC_M4A1_SHORTDOT" || _weapon == "ACE_SOC_M4A1_SHORTDOT_SD" || _weapon == "M4SPR" || _weapon == "ACE_M4SPR_SD" ||_weapon == "ACE_TAC50" || _weapon == "ACE_TAC50_SD" || _weapon == "ACE_AK74M" || _weapon == "ACE_AK74M_Kobra" || _weapon == "ACE_AK74M_GL" ||_weapon == "ACE_AK74M_GL_Kobra" || _weapon == "ACE_AKS74P" || _weapon == "ACE_AKS74P_Kobra" || _weapon =="ACE_AKS74P_GL" || _weapon == "ACE_AKS74P_GL_Kobra" || _weapon == "ACE_AK105" || _weapon == "ACE_AK105_Kobra" ||_weapon == "ACE_AK103" || _weapon == "ACE_AK103_Kobra" || _weapon == "ACE_AK103_GL" || _weapon =="ACE_AK103_GL_Kobra" || _weapon == "ACE_AK104" || _weapon == "ACE_AK104_Kobra" || _weapon == "ACE_Val" ||_weapon == "ACE_Val_Kobra" || _weapon == "ACE_HK416_D10" || _weapon == "ACE_HK416_D10_SD" || _weapon =="ACE_HK416_D14" || _weapon == "ACE_HK416_D14_SD" || _weapon == "QBZ95" || _weapon == "QBZ95_SD" || _weapon == "ACE_oc14sd" || _weapon == "ACE_oc14" || _weapon == "ACE_oc14sp" || _weapon == "ACE_oc14sdsp" || _weapon == "ACE_gr1sd" || _weapon == "ACE_gr1" || _weapon == "ACE_gr1sp" || _weapon == "ACE_gr1sdsp" || _weapon == "ACE_HK416_D10_COMPM3_SD" || _weapon == "ACE_HK416_D10_COMPM3" || _weapon == "ACE_M4A1_AIM_GL" || _weapon == "ACE_M4A1_AIM_GL_SD") then
	{
	//M4A1_RCO_GL to M4A1_HWS_GL_SD_Camo
	if (_weapon == "M4A1_HWS_GL_camo") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "M4A1_HWS_GL_camo";
		_unit addweapon "M4A1_HWS_GL_SD_Camo";
		hintsilent "Weapon changed";
		_unit selectWeapon "M4A1_HWS_GL_SD_Camo";
		};
	//and back
	if (_weapon == "M4A1_HWS_GL_SD_Camo") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "M4A1_HWS_GL_SD_Camo";
		_unit addweapon "M4A1_HWS_GL_camo";
		hintsilent "Weapon changed";
		_unit selectWeapon "M4A1_HWS_GL_camo";
		};
	
	//ACE_M110 to ACE_M110 silenced
	if (_weapon == "ACE_M110") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M110";
		_unit addweapon "ACE_M110_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M110_SD";
		};
	//and back
	if (_weapon == "ACE_M110_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M110_SD";
		_unit addweapon "ACE_M110";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M110";
		};
	
	//M4A1_Aim_camo to M4A1_Aim_camo SD
	if (_weapon == "M4A1_Aim_camo") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "M4A1_Aim_camo";
		_unit addweapon "M4A1_AIM_SD_camo";
		hintsilent "Weapon changed";
		_unit selectWeapon "M4A1_AIM_SD_camo";
		};
	//and back
	if (_weapon == "M4A1_AIM_SD_camo") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "M4A1_AIM_SD_camo";
		_unit addweapon "M4A1_Aim_camo";
		hintsilent "Weapon changed";
		_unit selectWeapon "M4A1_Aim_camo";
		};
	//AKS_74_U to AKS_74_UN_kobra
	if (_weapon == "AKS_74_U") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "AKS_74_U";
		_unit addweapon "AKS_74_UN_kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "AKS_74_UN_kobra";
		};
	//and back
	if (_weapon == "AKS_74_UN_kobra") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "AKS_74_UN_kobra";
		_unit addweapon "AKS_74_U";
		hintsilent "Weapon changed";
		_unit selectWeapon "AKS_74_U";
		};
	
	//G36K to G36_C_SD_eotech
	if (_weapon == "G36K") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "G36K";
		_unit addweapon "G36_C_SD_eotech";
		hintsilent "Weapon changed";
		_unit selectWeapon "G36_C_SD_eotech";
		};
	//and back
	if (_weapon == "G36_C_SD_eotech") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "G36_C_SD_eotech";
		_unit addweapon "G36K";
		hintsilent "Weapon changed";
		_unit selectWeapon "G36K";
		};
	
	//MP5A5 to MP5SD
	if (_weapon == "MP5A5") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "MP5A5";
		_unit addweapon "MP5SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "MP5SD";
		};
	//and back
	if (_weapon == "MP5SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "MP5SD";
		_unit addweapon "MP5A5";
		hintsilent "Weapon changed";
		_unit selectWeapon "MP5A5";
		};
	//Bizon to bizon_silenced
	if (_weapon == "Bizon") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "Bizon";
		_unit addweapon "bizon_silenced";
		hintsilent "Weapon changed";
		_unit selectWeapon "bizon_silenced";
		};
	//and back
	if (_weapon == "bizon_silenced") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "bizon_silenced";
		_unit addweapon "Bizon";
		hintsilent "Weapon changed";
		_unit selectWeapon "Bizon";
		};
	
	//ACE_M4A1_GL  to ACE_M4A1_GL_SD        
	if (_weapon == "ACE_M4A1_GL") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4A1_GL";
		_unit addweapon "ACE_M4A1_GL_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4A1_GL_SD";
		};
	//and back
	if (_weapon == "ACE_M4A1_GL_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4A1_GL_SD";
		_unit addweapon "ACE_M4A1_GL";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4A1_GL";
		};
	
	//ACE_M4A1_ACOG  to ACE_M4A1_ACOG_SD  
	if (_weapon == "ACE_M4A1_ACOG") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4A1_ACOG";
		_unit addweapon "ACE_M4A1_ACOG_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4A1_ACOG_SD";
		};
	//and back
	if (_weapon == "ACE_M4A1_ACOG_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4A1_ACOG_SD";
		_unit addweapon "ACE_M4A1_ACOG";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4A1_ACOG";
		};
	//M4A1_AIM  to ACE_M4A1_AIM_SD           
	if (_weapon == "M4A1_AIM") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "M4A1_AIM";
		_unit addweapon "ACE_M4A1_AIM_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4A1_AIM_SD";
		};
	//and back
	if (_weapon == "ACE_M4A1_AIM_SD") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4A1_AIM_SD";
		_unit addweapon "M4A1_AIM";
		hintsilent "Weapon changed";
		_unit selectWeapon "M4A1_AIM";
		};
	
	//ACE_SOC_M4A1_Aim  to ACE_SOC_M4A1_AIM_SD
	if (_weapon == "ACE_SOC_M4A1_Aim") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_SOC_M4A1_Aim";
		_unit addweapon "ACE_SOC_M4A1_AIM_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_SOC_M4A1_AIM_SD";
		};
	//and back
	if (_weapon == "ACE_SOC_M4A1_AIM_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_SOC_M4A1_AIM_SD";
		_unit addweapon "ACE_SOC_M4A1_Aim";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_SOC_M4A1_Aim";
		};
	
	//ACE_SOC_M4A1_SHORTDOT  to ACE_SOC_M4A1_SHORTDOT_SD
	if (_weapon == "ACE_SOC_M4A1_SHORTDOT") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_SOC_M4A1_SHORTDOT";
		_unit addweapon "ACE_SOC_M4A1_SHORTDOT_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_SOC_M4A1_SHORTDOT_SD";
		};
	//and back
	if (_weapon == "ACE_SOC_M4A1_SHORTDOT_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_SOC_M4A1_SHORTDOT_SD";
		_unit addweapon "ACE_SOC_M4A1_SHORTDOT";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_SOC_M4A1_SHORTDOT";
		};
	//M4SPR  to ACE_M4SPR_SD                     
	if (_weapon == "M4SPR") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "M4SPR";
		_unit addweapon "ACE_M4SPR_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4SPR_SD";
		};
	//and back
	if (_weapon == "ACE_M4SPR_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4SPR_SD";
		_unit addweapon "M4SPR";
		hintsilent "Weapon changed";
		_unit selectWeapon "M4SPR";
		};
	
	//ACE_TAC50   to ACE_TAC50_SD                 
	if (_weapon == "ACE_TAC50") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_TAC50";
		_unit addweapon "ACE_TAC50_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_TAC50_SD";
		};
	//and back
	if (_weapon == "ACE_TAC50_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_TAC50_SD";
		_unit addweapon "ACE_TAC50";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_TAC50";
		};
	//
	//ACE_AK74M  to ACE_AK74M_Kobra
	if (_weapon == "ACE_AK74M") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK74M";
		_unit addweapon "ACE_AK74M_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK74M_Kobra";
		};
	//and back
	if (_weapon == "ACE_AK74M_Kobra") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK74M_Kobra";
		_unit addweapon "ACE_AK74M";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK74M";
		};
	
	//ACE_AK74M_GL to ACE_AK74M_GL_Kobra
	if (_weapon == "ACE_AK74M_GL") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK74M_GL";
		_unit addweapon "ACE_AK74M_GL_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK74M_GL_Kobra";
		};
	//and back
	if (_weapon == "ACE_AK74M_GL_Kobra") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK74M_GL_Kobra";
		_unit addweapon "ACE_AK74M_GL";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK74M_GL";
		};
	
	//ACE_AKS74P  to ACE_AKS74P_Kobra
	if (_weapon == "ACE_AKS74P") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AKS74P";
		_unit addweapon "ACE_AKS74P_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AKS74P_Kobra";
		};
	//and back
	if (_weapon == "ACE_AKS74P_Kobra") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AKS74P_Kobra";
		_unit addweapon "ACE_AKS74P";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AKS74P";
		};
	//ACE_AKS74P_GL  to ACE_AKS74P_GL_Kobra
	if (_weapon == "ACE_AKS74P_GL") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AKS74P_GL";
		_unit addweapon "ACE_AKS74P_GL_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AKS74P_GL_Kobra";
		};
	//and back
	if (_weapon == "ACE_AKS74P_GL_Kobra") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AKS74P_GL_Kobra";
		_unit addweapon "ACE_AKS74P_GL";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AKS74P_GL";
		};
	
	//ACE_AK105 to ACE_AK105_Kobra
	if (_weapon == "ACE_AK105") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK105";
		_unit addweapon "ACE_AK105_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK105_Kobra";
		};
	//and back
	if (_weapon == "ACE_AK105_Kobra") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK105_Kobra";
		_unit addweapon "ACE_AK105";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK105";
		};
	
	//ACE_AK103 to ACE_AK103_Kobra
	if (_weapon == "ACE_AK103") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK103";
		_unit addweapon "ACE_AK103_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK103_Kobra";
		};
	//and back
	if (_weapon == "ACE_AK103_Kobra") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK103_Kobra";
		_unit addweapon "ACE_AK103";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK103";
		};
	//ACE_AK103_GL to ACE_AK103_GL_Kobra
	if (_weapon == "ACE_AK103_GL") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK103_GL";
		_unit addweapon "ACE_AK103_GL_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK103_GL_Kobra";
		};
	//and back
	if (_weapon == "ACE_AK103_GL_Kobra") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK103_GL_Kobra";
		_unit addweapon "ACE_AK103_GL";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK103_GL";
		};
	
	//ACE_AK104  to ACE_AK104_Kobra        
	if (_weapon == "ACE_AK104") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK104";
		_unit addweapon "ACE_AK104_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK104_Kobra";
		};
	//and back
	if (_weapon == "ACE_AK104_Kobra") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_AK104_Kobra";
		_unit addweapon "ACE_AK104";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_AK104";
		};
	
	//ACE_Val  to ACE_Val_Kobra  
	if (_weapon == "ACE_Val") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_Val";
		_unit addweapon "ACE_Val_Kobra";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_Val_Kobra";
		};
	//and back
	if (_weapon == "ACE_Val_Kobra") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_Val_Kobra";
		_unit addweapon "ACE_Val";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_Val";
		};
	//ACE_HK416_D10  to ACE_HK416_D10_SD           
	if (_weapon == "ACE_HK416_D10") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_HK416_D10";
		_unit addweapon "ACE_HK416_D10_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_HK416_D10_SD";
		};
	//and back
	if (_weapon == "ACE_HK416_D10_SD") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_HK416_D10_SD";
		_unit addweapon "ACE_HK416_D10";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_HK416_D10";
		};
	
	//ACE_HK416_D10_COMPM3  to ACE_HK416_D10_COMPM3_SD           
	if (_weapon == "ACE_HK416_D10_COMPM3") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_HK416_D10_COMPM3";
		_unit addweapon "ACE_HK416_D10_COMPM3_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_HK416_D10_COMPM3_SD";
		};
	//and back
	if (_weapon == "ACE_HK416_D10_COMPM3_SD") then
		{
		_unit playMove 	"AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_HK416_D10_COMPM3_SD";
		_unit addweapon "ACE_HK416_D10_COMPM3";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_HK416_D10_COMPM3";
		};
	
	//ACE_HK416_D14  to ACE_HK416_D14_SD
	if (_weapon == "ACE_HK416_D14") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_HK416_D14";
		_unit addweapon "ACE_HK416_D14_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_HK416_D14_SD";
		};
	//and back
	if (_weapon == "ACE_HK416_D14_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_HK416_D14_SD";
		_unit addweapon "ACE_HK416_D14";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_HK416_D14";
		};
	
	//QBZ95  to QBZ95_SD
	if (_weapon == "QBZ95") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "QBZ95";
		_unit addweapon "QBZ95_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "QBZ95_SD";
		};
	//and back
	if (_weapon == "QBZ95_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "QBZ95_SD";
		_unit addweapon "QBZ95";
		hintsilent "Weapon changed";
		_unit selectWeapon "QBZ95";
		};
	//ACE_oc14  to ACE_oc14sd
	if (_weapon == "ACE_oc14") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_oc14";
		_unit addweapon "ACE_oc14sd";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_oc14sd";
		};
	//and back
	if (_weapon == "ACE_oc14sd") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_oc14sd";
		_unit addweapon "ACE_oc14";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_oc14";
		};
	//ACE_oc14sp  to ACE_oc14sd
	if (_weapon == "ACE_oc14sp") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_oc14sp";
		_unit addweapon "ACE_oc14sdsp";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_oc14sdsp";
		};
	//and back
	if (_weapon == "ACE_oc14sdsp") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_oc14sdsp";
		_unit addweapon "ACE_oc14";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_oc14";
		};
	//ACE_gr1  to ACE_gr1sd
	if (_weapon == "ACE_gr1") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_gr1";
		_unit addweapon "ACE_gr1sd";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_gr1sd";
		};
	//and back
	if (_weapon == "ACE_gr1sd") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_gr1sd";
		_unit addweapon "ACE_gr1";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_gr1";
		};
	//ACE_gr1sdsp  to ACE_gr1sd
	if (_weapon == "ACE_gr1sdsp") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_gr1sdsp";
		_unit addweapon "ACE_gr1sp";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_gr1sp";
		};
	//and back
	if (_weapon == "ACE_gr1sp") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_gr1sp";
		_unit addweapon "ACE_gr1sdsp";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_gr1sdsp";
		};

	
	//ACE_M4A1_AIM_GL  to ACE_M4A1_AIM_GL_SD 
	if (_weapon == "ACE_M4A1_AIM_GL") then
		{
		_unit playmove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4A1_AIM_GL";
		_unit addweapon "ACE_M4A1_AIM_GL_SD";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4A1_AIM_GL_SD";
		};
	//and back
	if (_weapon == "ACE_M4A1_AIM_GL_SD") then
		{
		_unit playMove "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
		sleep 1.5;
		_unit removeweapon "ACE_M4A1_AIM_GL_SD";
		_unit addweapon "ACE_M4A1_AIM_GL";
		hintsilent "Weapon changed";
		_unit selectWeapon "ACE_M4A1_AIM_GL";
		};
	} else {hint "No silencer found for this Weapon"};

