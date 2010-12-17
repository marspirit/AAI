private ["_logicPrevious", "_townIniteurope", "_townInitArab", "_dummyGroup", "_dummy", "_townStyle", "_pos", "_radius", "_townDamage", "_townStyle", "_townName", "_houseCount"];
_pos = _this select 0; 
_radius = _this select 1;
_townDamage = _this select 2;
_townStyle = _this select 3;
_townName = _this select 4; 


if (_townStyle ==0) then {_houseCount = floor (_radius/8);} else {_houseCount = floor (_radius/4);}; //how many houses for arab and europe

if (townCount > 0) then {_logicPrevious = call compile format ["BIS_Gita_%1",townCount - 1];
_logicPrevious setvariable ["status",1,true];_logicPrevious execvm "ca\modules_e\gita\data\scripts\fn_createMarkers.sqf";};

townCount = townCount + 1; 

_townIniteurope = format ["this setvariable [""townsize"",%1]; this setvariable [""name"",""%2""]; this setvariable [""destroyed"",%3];
this setvariable [""houseclassesstart"",[""Land_A_statue01"",""Land_A_statue02"",""Land_Barn_W_02"",""Land_Church_03"", ""Land_Church_05R"",""Land_Farm_WTower""]]; 
this setvariable [""houseclasses"",[""Land_Farm_Cowshed_a"",""Land_Farm_Cowshed_c"",""Land_HouseV2_01A"",""Land_HouseV2_01B"",""Land_HouseV2_02_Interier"",""Land_HouseV2_03"",
""Land_HouseV2_03B"",""Land_HouseV2_04_interier"",""Land_HouseV2_05"",""Land_HouseV_1I1"",""Land_HouseV_1I2"",""Land_HouseV_1I3"",""Land_HouseV_1I4"",""Land_HouseV_1L1"",
""Land_HouseV_1L2"",""Land_HouseV_1T"",""Land_HouseV_2I"",""Land_HouseV_2L"",""Land_HouseV_3I1"",""Land_HouseV_3I2"",""Land_HouseV_3I3"",""Land_HouseV_3I4"",
""Land_Ind_Workshop01_04"",""Land_Panelak"",""Land_Panelak2"",""Land_Shed_M01"",""Land_Shed_W4"",""Land_Shed_wooden"",""Land_houseV_2T1"",""Land_houseV_2T2"",
""Land_ruin_01"",""Land_sara_domek_zluty"",""Land_sara_hasic_zbroj"",""Land_stodola_old_open"",""Land_stodola_open""]];this setvariable [""housecount"",%4];this setvariable [""miscclasses"",[""Garbage_can"",""Garbage_container"",
""Land_Barrel_water"",""Land_Pneu"",""Land_psi_bouda"",""Paleta1"",""Misc_TyreHeap"",""Paleta2"",""Land_Crates_EP1"",""Land_Crates_stack_EP1"",""Land_Misc_ConcOutlet_EP1"",""Land_Misc_Garb_Heap_EP1""
,""Land_Misc_Rubble_EP1"",""Land_Misc_ConcPipeline_EP1""]];this setvariable [""houseSpacing"",1.2];
this setvariable [""wallclasses"",[[""Wall_FenW2_6_EP1"",90,0.8,true]]];",_radius, _townName, _townDamage, _houseCount];

_townInitArab = format ["this setvariable [""townsize"",%1]; this setvariable [""name"",""%2""]; this setvariable [""destroyed"",%3];this setvariable [""housecount"",%4];",_radius, _townName, _townDamage, _houseCount];

_dummyGroup = creategroup civilian; 
if (_townStyle ==0) then {_dummy = "GitaManager" createunit [_pos, _dummyGroup, _townIniteurope,0,"PRIVATE"];} else {_dummy = "GitaManager" createunit [_pos, _dummyGroup, _townInitArab,0,"PRIVATE"];};



