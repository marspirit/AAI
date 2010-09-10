// F2A2 - ShackTactical Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

switch (faction player) do
{

// ====================================================================================

// MARKERS: USMC
// Markers seen by players in USMC slots (includes black markers for CDF groups). 

       case "USMC":
       {
               ["GrpUSMC_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	           ["GrpUSMC_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	           ["GrpUSMC_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_ST1",  6, "ST1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";        
               ["GrpUSMC_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpUSMC_SF1", 6, "SF1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
		       ["GrpUSMC_SF2", 6, "SF2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpUSMC_Foxtrot_Lead", 8, "FL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Foxtrot_1", 8, "F1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Foxtrot_2", 8, "F2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Foxtrot_3", 8, "F3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_Lead", 9, "GL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_1", 9, "G1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_2", 9, "G2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_3", 9, "G3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_DM1", 2, "DM1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_DM2", 2, "DM2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_DM3", 2, "DM3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               
               ["GrpCDF_1Plt_PltHQ", 0, "PltHQ", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_Alpha", 1, "ASL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_A1", 2, "A1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_A2", 2, "A2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_A3", 2, "A3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_Bravo", 1, "BSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_B1", 2, "B1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_B2", 2, "B2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_B3", 2, "B3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_Charlie", 1, "CSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_C1", 2, "C1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_C2", 2, "C2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_C3", 2, "C3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_ST2", 1, "ST2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AA1", 2, "AA1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AA2", 2, "AA2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AA3", 2, "AA3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_EN", 1, "EN", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpCDF_1Plt_AR1", 2, "AR1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpCDF_1Plt_AR2", 2, "AR2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AR3", 2, "AR3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MMG1", 3, "MMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MMG2", 3, "MMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MMG3", 3, "MMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MAT1", 4, "MAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MAT2", 4, "MAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MAT3", 4, "MAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HAT1", 5, "HAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HAT2", 5, "HAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HAT3", 5, "HAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_ST1",  6, "ST1", "ColorBlack"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpCDF_HMG1",  7, "HMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HMG2",  7, "HMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HMG3",  7, "HMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpCDF_Foxtrot_Lead", 8, "FL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Foxtrot_1", 8, "F1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Foxtrot_2", 8, "F2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Foxtrot_3", 8, "F3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_Lead", 9, "GL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_1", 9, "G1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_2", 9, "G2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_3", 9, "G3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
       };

// ====================================================================================

// MARKERS: CDF
// Markers seen by players in CDF slots (includes black markers for USMC groups). 

       case "CDF":
       {
               ["GrpCDF_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpCDF_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpCDF_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_ST1",  6, "ST1", "ColorOrange"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpCDF_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpCDF_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpCDF_Foxtrot_Lead", 8, "FL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Foxtrot_1", 8, "F1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Foxtrot_2", 8, "F2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Foxtrot_3", 8, "F3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_Lead", 9, "GL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_1", 9, "G1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_2", 9, "G2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpCDF_Golf_3", 9, "G3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";

               ["GrpUSMC_1Plt_PltHQ", 0, "PltHQ", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_Alpha", 1, "ASL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_A1", 2, "A1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_A2", 2, "A2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_A3", 2, "A3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_Bravo", 1, "BSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_B1", 2, "B1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_B2", 2, "B2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_B3", 2, "B3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_Charlie", 1, "CSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_C1", 2, "C1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_C2", 2, "C2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_C3", 2, "C3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_ST2", 1, "ST2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AA1", 2, "AA1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AA2", 2, "AA2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AA3", 2, "AA3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_EN", 1, "EN", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpUSMC_1Plt_AR1", 2, "AR1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpUSMC_1Plt_AR2", 2, "AR2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_1Plt_AR3", 2, "AR3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MMG1", 3, "MMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MMG2", 3, "MMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MMG3", 3, "MMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MAT1", 4, "MAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MAT2", 4, "MAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_MAT3", 4, "MAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HAT1", 5, "HAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HAT2", 5, "HAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HAT3", 5, "HAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_ST1",  6, "ST1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpUSMC_HMG1",  7, "HMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HMG2",  7, "HMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpUSMC_HMG3",  7, "HMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpUSMC_SF1", 2, "SF1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpUSMC_SF2", 2, "SF2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Foxtrot_Lead", 8, "FL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Foxtrot_1", 8, "F1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Foxtrot_2", 8, "F2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Foxtrot_3", 8, "F3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_Lead", 9, "GL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_1", 9, "G1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_2", 9, "G2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpUSMC_Golf_3", 9, "G3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";			   
       };

// ====================================================================================

// MARKERS: RUSSIAN
// Markers seen by players in Russian slots (includes black markers for ChDKZ groups).

       case "RU":
       {
               ["GrpRU_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpRU_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpRU_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_ST1",  6, "ST1", "ColorOrange"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpRU_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpRU_SF1", 6, "SF1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
		       ["GrpRU_SF2", 6, "SF2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_Lead", 8, "FL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_1", 8, "F1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_2", 8, "F2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_3", 8, "F3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_Lead", 9, "GL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_1", 9, "G1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_2", 9, "G2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_3", 9, "G3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_DM1", 2, "DM1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_DM2", 2, "DM2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_DM3", 2, "DM3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";

               ["GrpINS_1Plt_PltHQ", 0, "PltHQ", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Alpha", 1, "ASL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A1", 2, "A1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A2", 2, "A2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A3", 2, "A3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Bravo", 1, "BSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B1", 2, "B1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B2", 2, "B2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B3", 2, "B3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Charlie", 1, "CSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C1", 2, "C1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C2", 2, "C2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C3", 2, "C3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_ST2", 1, "ST2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA1", 2, "AA1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA2", 2, "AA2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA3", 2, "AA3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_EN", 1, "EN", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpINS_1Plt_AR1", 2, "AR1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpINS_1Plt_AR2", 2, "AR2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AR3", 2, "AR3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG1", 3, "MMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG2", 3, "MMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG3", 3, "MMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT1", 4, "MAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT2", 4, "MAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT3", 4, "MAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT1", 5, "HAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT2", 5, "HAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT3", 5, "HAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_ST1",  6, "ST1", "ColorBlack"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpINS_HMG1",  7, "HMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HMG2",  7, "HMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HMG3",  7, "HMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpINS_Foxtrot_Lead", 8, "FL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_1", 8, "F1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_2", 8, "F2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_3", 8, "F3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_Lead", 9, "GL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_1", 9, "G1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_2", 9, "G2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_3", 9, "G3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";			   
       };

// ====================================================================================

// MARKERS: CHDKZ
// Markers seen by players in ChDKZ slots (includes black markers for ChDKZ groups).

       case "INS":
       {
               ["GrpINS_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpINS_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpINS_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_ST1",  6, "ST1", "ColorOrange"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpINS_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpINS_Foxtrot_Lead", 8, "FL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_1", 8, "F1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_2", 8, "F2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_3", 8, "F3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_Lead", 9, "GL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_1", 9, "G1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_2", 9, "G2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_3", 9, "G3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";

               ["GrpRU_1Plt_PltHQ", 0, "PltHQ", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Alpha", 1, "ASL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A1", 2, "A1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A2", 2, "A2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A3", 2, "A3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Bravo", 1, "BSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B1", 2, "B1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B2", 2, "B2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B3", 2, "B3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Charlie", 1, "CSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C1", 2, "C1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C2", 2, "C2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C3", 2, "C3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_ST2", 1, "ST2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA1", 2, "AA1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA2", 2, "AA2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA3", 2, "AA3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_EN", 1, "EN", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpRU_1Plt_AR1", 2, "AR1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpRU_1Plt_AR2", 2, "AR2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AR3", 2, "AR3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG1", 3, "MMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG2", 3, "MMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG3", 3, "MMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT1", 4, "MAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT2", 4, "MAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT3", 4, "MAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT1", 5, "HAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT2", 5, "HAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT3", 5, "HAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_ST1",  6, "ST1", "ColorBlack"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpRU_HMG1",  7, "HMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HMG2",  7, "HMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HMG3",  7, "HMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_Lead", 8, "FL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_1", 8, "F1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_2", 8, "F2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_3", 8, "F3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_Lead", 9, "GL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_1", 9, "G1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_2", 9, "G2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_3", 9, "G3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";			   
       };

// ====================================================================================

// MARKERS: NAPA
// Markers seen by players in NAPA slots.

       case "GUE":
       {
               ["GrpGUE_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpGUE_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpGUE_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_ST1",  6, "ST1", "ColorOrange"] execVM  "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpGUE_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpGUE_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			    ["GrpGUE_Foxtrot_Lead", 8, "FL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_Foxtrot_1", 8, "F1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_Foxtrot_2", 8, "F2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_Foxtrot_3", 8, "F3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_Golf_Lead", 9, "GL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_Golf_1", 9, "G1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_Golf_2", 9, "G2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_Golf_3", 9, "G3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_DM1", 2, "DM1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_DM2", 2, "DM2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpGUE_DM3", 2, "DM3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
       };
	   
// ====================================================================================

// MARKERS: ACE_GRU
// Markers seen by players in Russian slots (includes black markers for ChDKZ groups).

       case "ACE_GRU":
       {
               ["GrpRU_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpRU_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpRU_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_ST1",  6, "ST1", "ColorOrange"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpRU_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpRU_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			     ["GrpRU_SF1", 6, "SF1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
		       ["GrpRU_SF2", 6, "SF2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_Lead", 8, "FL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_1", 8, "F1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_2", 8, "F2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Foxtrot_3", 8, "F3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_Lead", 9, "GL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_1", 9, "G1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_2", 9, "G2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_Golf_3", 9, "G3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_DM1", 2, "DM1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_DM2", 2, "DM2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpRU_DM3", 2, "DM3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";

               ["GrpINS_1Plt_PltHQ", 0, "PltHQ", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Alpha", 1, "ASL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A1", 2, "A1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A2", 2, "A2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_A3", 2, "A3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Bravo", 1, "BSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B1", 2, "B1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B2", 2, "B2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_B3", 2, "B3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_Charlie", 1, "CSL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C1", 2, "C1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C2", 2, "C2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_C3", 2, "C3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_ST2", 1, "ST2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA1", 2, "AA1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA2", 2, "AA2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AA3", 2, "AA3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_EN", 1, "EN", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpINS_1Plt_AR1", 2, "AR1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
	       ["GrpINS_1Plt_AR2", 2, "AR2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_1Plt_AR3", 2, "AR3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG1", 3, "MMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG2", 3, "MMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MMG3", 3, "MMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT1", 4, "MAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT2", 4, "MAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_MAT3", 4, "MAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT1", 5, "HAT1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT2", 5, "HAT2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HAT3", 5, "HAT3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_ST1",  6, "ST1", "ColorBlack"] execVM  "f\common\ShackTac_localGroupMarker.sqf";               
               ["GrpINS_HMG1",  7, "HMG1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HMG2",  7, "HMG2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
               ["GrpINS_HMG3",  7, "HMG3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
			   ["GrpINS_Foxtrot_Lead", 8, "FL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_1", 8, "F1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_2", 8, "F2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Foxtrot_3", 8, "F3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_Lead", 9, "GL", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_1", 9, "G1", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_2", 9, "G2", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";
				["GrpINS_Golf_3", 9, "G3", "ColorBlack"] execVM "f\common\ShackTac_localGroupMarker.sqf";			   
       };

// ====================================================================================

// MARKERS: CIVILIAN (CHERNARUS)
// Markers seen by players in civilian (Chernarus) slots. Not used by default.

       case "CIV":
       {
//             ["GrpUSMC_1Plt_PltHQ", 0, "PltHQ", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_Alpha", 1, "ASL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_A1", 2, "A1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_A2", 2, "A2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_A3", 2, "A3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_Charlie", 1, "CSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_C1", 2, "C1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_C2", 2, "C2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_C3", 2, "C3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_ST2", 1, "ST2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AA1", 2, "AA1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AA2", 2, "AA2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AA3", 2, "AA3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpUSMC_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpUSMC_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MMG1", 3, "MMG1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MMG2", 3, "MMG2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MMG3", 3, "MMG3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MAT1", 4, "MAT1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MAT2", 4, "MAT2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MAT3", 4, "MAT3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HAT1", 5, "HAT1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HAT2", 5, "HAT2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HAT3", 5, "HAT3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_ST1",  6, "ST1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HMG1",  7, "HMG1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HMG2",  7, "HMG2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HMG3",  7, "HMG3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpCDF_1Plt_PltHQ", 0, "PltHQ", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_Alpha", 1, "ASL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_A1", 2, "A1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_A2", 2, "A2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_A3", 2, "A3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_Bravo", 1, "BSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_B1", 2, "B1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_B2", 2, "B2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_B3", 2, "B3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_ST2", 1, "ST2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AA1", 2, "AA1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AA2", 2, "AA2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AA3", 2, "AA3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_EN", 1, "EN", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpCDF_1Plt_AR1", 2, "AR1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpCDF_1Plt_AR2", 2, "AR2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AR3", 2, "AR3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MMG1", 3, "MMG1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MMG2", 3, "MMG2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MMG3", 3, "MMG3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MAT1", 4, "MAT1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MAT2", 4, "MAT2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MAT3", 4, "MAT3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HAT1", 5, "HAT1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HAT2", 5, "HAT2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HAT3", 5, "HAT3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_ST1",  6, "ST1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HMG1",  7, "HMG1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HMG2",  7, "HMG2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HMG3",  7, "HMG3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpRU_1Plt_PltHQ", 0, "PltHQ", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_Bravo", 1, "BSL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_B1", 2, "B1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_B2", 2, "B2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_B3", 2, "B3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_Charlie", 1, "CSL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_C1", 2, "C1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_C2", 2, "C2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_C3", 2, "C3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_EN", 1, "EN", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpRU_1Plt_AR1", 2, "AR1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpRU_1Plt_AR2", 2, "AR2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AR3", 2, "AR3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MMG1", 3, "MMG1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MMG2", 3, "MMG2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MMG3", 3, "MMG3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MAT1", 4, "MAT1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MAT2", 4, "MAT2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MAT3", 4, "MAT3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HAT1", 5, "HAT1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HAT2", 5, "HAT2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HAT3", 5, "HAT3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_ST1",  6, "ST1", "ColorRed"] execVM  "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HMG1",  7, "HMG1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HMG2",  7, "HMG2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HMG3",  7, "HMG3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpINS_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_Alpha", 1, "ASL", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_A1", 2, "A1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_A2", 2, "A2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_A3", 2, "A3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_Bravo", 1, "BSL", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_B1", 2, "B1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_B2", 2, "B2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_B3", 2, "B3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_Charlie", 1, "CSL", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_C1", 2, "C1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_C2", 2, "C2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_C3", 2, "C3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_ST2", 1, "ST2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AA1", 2, "AA1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AA2", 2, "AA2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AA3", 2, "AA3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_EN", 1, "EN", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpINS_1Plt_AR1", 2, "AR1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpINS_1Plt_AR2", 2, "AR2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AR3", 2, "AR3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MMG1", 3, "MMG1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MMG2", 3, "MMG2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MMG3", 3, "MMG3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MAT1", 4, "MAT1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MAT2", 4, "MAT2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MAT3", 4, "MAT3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HAT1", 5, "HAT1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HAT2", 5, "HAT2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HAT3", 5, "HAT3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_ST1",  6, "ST1", "ColorYellow"] execVM  "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HMG1",  7, "HMG1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HMG2",  7, "HMG2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HMG3",  7, "HMG3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpGUE_1Plt_PltHQ", 0, "PltHQ", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_Alpha", 1, "ASL", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_A1", 2, "A1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_A2", 2, "A2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_A3", 2, "A3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_Bravo", 1, "BSL", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_B1", 2, "B1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_B2", 2, "B2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_B3", 2, "B3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_Charlie", 1, "CSL", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_C1", 2, "C1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_C2", 2, "C2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_C3", 2, "C3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_ST2", 1, "ST2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AA1", 2, "AA1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AA2", 2, "AA2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AA3", 2, "AA3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_EN", 1, "EN", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpGUE_1Plt_AR1", 2, "AR1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpGUE_1Plt_AR2", 2, "AR2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AR3", 2, "AR3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_ST1",  6, "ST1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf"; 
//             ["GrpGUE_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
       };
	   

// ====================================================================================

// MARKERS: CIVILIAN (RUSSIA)
// Markers seen by players in civilian (RUSSIA) slots. Not used by default.

       case "CIV_RU":
       {
//             ["GrpUSMC_1Plt_PltHQ", 0, "PltHQ", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_Alpha", 1, "ASL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_A1", 2, "A1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_A2", 2, "A2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_A3", 2, "A3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_Bravo", 1, "BSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_B1", 2, "B1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_B2", 2, "B2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_B3", 2, "B3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_Charlie", 1, "CSL", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_C1", 2, "C1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_C2", 2, "C2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_C3", 2, "C3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_ST2", 1, "ST2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AA1", 2, "AA1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AA2", 2, "AA2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AA3", 2, "AA3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_EN", 1, "EN", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpUSMC_1Plt_AR1", 2, "AR1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpUSMC_1Plt_AR2", 2, "AR2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_1Plt_AR3", 2, "AR3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MMG1", 3, "MMG1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MMG2", 3, "MMG2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MMG3", 3, "MMG3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MAT1", 4, "MAT1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MAT2", 4, "MAT2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_MAT3", 4, "MAT3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HAT1", 5, "HAT1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HAT2", 5, "HAT2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HAT3", 5, "HAT3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_ST1",  6, "ST1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HMG1",  7, "HMG1", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HMG2",  7, "HMG2", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpUSMC_HMG3",  7, "HMG3", "ColorBlue"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpCDF_1Plt_PltHQ", 0, "PltHQ", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_Alpha", 1, "ASL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_A1", 2, "A1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_A2", 2, "A2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_A3", 2, "A3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_Bravo", 1, "BSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_B1", 2, "B1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_B2", 2, "B2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_B3", 2, "B3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_Charlie", 1, "CSL", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_C1", 2, "C1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_C2", 2, "C2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_C3", 2, "C3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_ST2", 1, "ST2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AA1", 2, "AA1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AA2", 2, "AA2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AA3", 2, "AA3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_EN", 1, "EN", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpCDF_1Plt_AR1", 2, "AR1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpCDF_1Plt_AR2", 2, "AR2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_1Plt_AR3", 2, "AR3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MMG1", 3, "MMG1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MMG2", 3, "MMG2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MMG3", 3, "MMG3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MAT1", 4, "MAT1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MAT2", 4, "MAT2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_MAT3", 4, "MAT3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HAT1", 5, "HAT1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HAT2", 5, "HAT2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HAT3", 5, "HAT3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_ST1",  6, "ST1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HMG1",  7, "HMG1", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HMG2",  7, "HMG2", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpCDF_HMG3",  7, "HMG3", "ColorGreen"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpRU_1Plt_PltHQ", 0, "PltHQ", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_Alpha", 1, "ASL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_A1", 2, "A1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_A2", 2, "A2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_A3", 2, "A3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_Bravo", 1, "BSL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_B1", 2, "B1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_B2", 2, "B2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_B3", 2, "B3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_Charlie", 1, "CSL", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_C1", 2, "C1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_C2", 2, "C2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_C3", 2, "C3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_ST2", 1, "ST2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AA1", 2, "AA1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AA2", 2, "AA2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AA3", 2, "AA3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_EN", 1, "EN", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpRU_1Plt_AR1", 2, "AR1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpRU_1Plt_AR2", 2, "AR2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_1Plt_AR3", 2, "AR3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MMG1", 3, "MMG1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MMG2", 3, "MMG2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MMG3", 3, "MMG3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MAT1", 4, "MAT1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MAT2", 4, "MAT2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_MAT3", 4, "MAT3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HAT1", 5, "HAT1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HAT2", 5, "HAT2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HAT3", 5, "HAT3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_ST1",  6, "ST1", "ColorRed"] execVM  "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HMG1",  7, "HMG1", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HMG2",  7, "HMG2", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpRU_HMG3",  7, "HMG3", "ColorRed"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpINS_1Plt_PltHQ", 0, "PltHQ", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_Alpha", 1, "ASL", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_A1", 2, "A1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_A2", 2, "A2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_A3", 2, "A3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_Bravo", 1, "BSL", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_B1", 2, "B1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_B2", 2, "B2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_B3", 2, "B3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_Charlie", 1, "CSL", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_C1", 2, "C1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_C2", 2, "C2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_C3", 2, "C3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_ST2", 1, "ST2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AA1", 2, "AA1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AA2", 2, "AA2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AA3", 2, "AA3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_EN", 1, "EN", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpINS_1Plt_AR1", 2, "AR1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpINS_1Plt_AR2", 2, "AR2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_1Plt_AR3", 2, "AR3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MMG1", 3, "MMG1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MMG2", 3, "MMG2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MMG3", 3, "MMG3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MAT1", 4, "MAT1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MAT2", 4, "MAT2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_MAT3", 4, "MAT3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HAT1", 5, "HAT1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HAT2", 5, "HAT2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HAT3", 5, "HAT3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_ST1",  6, "ST1", "ColorYellow"] execVM  "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HMG1",  7, "HMG1", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HMG2",  7, "HMG2", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpINS_HMG3",  7, "HMG3", "ColorYellow"] execVM "f\common\ShackTac_localGroupMarker.sqf";


//             ["GrpGUE_1Plt_PltHQ", 0, "PltHQ", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_Alpha", 1, "ASL", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_A1", 2, "A1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_A2", 2, "A2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_A3", 2, "A3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_Bravo", 1, "BSL", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_B1", 2, "B1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_B2", 2, "B2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_B3", 2, "B3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_Charlie", 1, "CSL", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_C1", 2, "C1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_C2", 2, "C2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_C3", 2, "C3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_ST2", 1, "ST2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AA1", 2, "AA1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AA2", 2, "AA2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AA3", 2, "AA3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_EN", 1, "EN", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpGUE_1Plt_AR1", 2, "AR1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//	       ["GrpGUE_1Plt_AR2", 2, "AR2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_1Plt_AR3", 2, "AR3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MMG1", 3, "MMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MMG2", 3, "MMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MMG3", 3, "MMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MAT1", 4, "MAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MAT2", 4, "MAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_MAT3", 4, "MAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HAT1", 5, "HAT1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HAT2", 5, "HAT2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HAT3", 5, "HAT3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_ST1",  6, "ST1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf"; 
//             ["GrpGUE_HMG1",  7, "HMG1", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HMG2",  7, "HMG2", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
//             ["GrpGUE_HMG3",  7, "HMG3", "ColorOrange"] execVM "f\common\ShackTac_localGroupMarker.sqf";
       };
};

// ====================================================================================

if (true) exitWith {};