private ["_logicPrevious", "_townIniteurope", "_townInitArab", "_dummyGroup", "_dummy", "_townStyle", "_pos", "_radius", "_townDamage", "_townStyle", "_townName"];
_pos = _this select 0; 
_radius = _this select 1;
_townDamage = _this select 2;
_townStyle = _this select 3;
_townName = _this select 4; 


if (townCount > 0) then {_logicPrevious = call compile format ["BIS_Gita_%1",townCount - 1];
_logicPrevious setvariable ["status",1,true];_logicPrevious execvm "ca\modules_e\gita\data\scripts\fn_createMarkers.sqf";};

townCount = townCount + 1; 

_townIniteurope = format ["this setvariable [""townsize"",%1]; this setvariable [""name"",""%2""]; this setvariable [""destroyed"",%3];
this setvariable [""houseclassesstart"",[""Land_A_BuildingWIP"",""Land_A_Office01"",""Land_A_Office02"",""Land_A_Hospital"", ""Land_A_statue01"",""Land_A_statue02"",
""Land_Church_03"", ""Land_Church_05R"", ""Land_HouseB_Tenement""]]; this setvariable [""houseclasses"",[""Land_A_FuelStation_Build"",""Land_A_FuelStation_Shed"",""Land_A_Pub_01"",""Land_A_Pub_01""
,""Land_Barn_Metal"",""Land_Barn_W_01"",""Land_Barn_W_02"",""Land_Church_01"",""Land_Farm_Cowshed_a"",""Land_Farm_Cowshed_b"",""Land_Farm_Cowshed_c"",""Land_Hangar_2""
,""Land_Hlidac_budka"",""Land_HouseBlock_A1"",""Land_HouseBlock_A1_1"",""Land_HouseBlock_A2"",""Land_HouseBlock_A2_1"",""Land_HouseBlock_A3"",""Land_HouseBlock_B1""
,""Land_HouseBlock_B2"",""Land_HouseBlock_B3"",""Land_HouseBlock_B4"",""Land_HouseBlock_B5"",""Land_HouseBlock_B6"",""Land_HouseBlock_C2"",""Land_HouseBlock_C3""
,""Land_HouseBlock_C4"",""Land_HouseBlock_C5"",""Land_HouseBlock_D1"",""Land_HouseBlock_D2"",""Land_HouseV2_01A"",""Land_HouseV2_01B"",""Land_HouseV2_02_Interier""
,""Land_HouseV2_03"",""Land_HouseV2_03B"",""Land_HouseV2_04_interier"",""Land_HouseV2_05"",""Land_HouseV_1I1"",""Land_HouseV_1I2"",""Land_HouseV_1I3""
,""Land_HouseV_1I4"",""Land_HouseV_1L1"",""Land_HouseV_1L2"",""Land_HouseV_1T"",""Land_HouseV_2I"",""Land_HouseV_2L"",""Land_HouseV_3I1"",""Land_HouseV_3I2""
,""Land_HouseV_3I3"",""Land_HouseV_3I4"",""Land_Ind_Vysypka"",""Land_Ind_Stack_Big"",""Land_Ind_Workshop01_01"",""Land_Ind_Workshop01_02"",""Land_Ind_Workshop01_03"",""Land_Ind_Workshop01_04""]];",_radius, _townName, _townDamage];

_townInitArab = format ["this setvariable [""townsize"",%1]; this setvariable [""name"",""%2""]; this setvariable [""destroyed"",%3];",_radius, _townName, _townDamage];

_dummyGroup = creategroup civilian; 
if (_townStyle ==0) then {_dummy = "GitaManager" createunit [_pos, _dummyGroup, _townIniteurope,0,"PRIVATE"];} else {_dummy = "GitaManager" createunit [_pos, _dummyGroup, _townInitArab,0,"PRIVATE"];};



