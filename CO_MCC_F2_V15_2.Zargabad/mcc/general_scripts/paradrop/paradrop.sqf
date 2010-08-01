deleteMarker "dropzone";
_Marker = createmarker ["dropzone", _this];
_Marker setMarkerType "Destroy";
_Marker setMarkerColor "ColorBlue";
_Marker setMarkertext  "Drop Zone";

mPos = getMarkerPos "dropzone";

c130_para = "C130J_static_EP1" createVehicle mPos;
c130_para setPosasl [(mPos select 0), (mPos select 1), 5000];

_helopilot = creategroup civilian; 
_c130= createVehicle ["C130J", mPos, [], 0, "FLY"];
_c130 setPosasl [(mPos select 0), (mPos select 1), 5020];
_pilot1 = _helopilot createUnit ["Pilot", mPos, [], 0, "NONE"];
_pilot1 assignAsDriver _c130;
_pilot1 moveindriver _c130;
_c130 hideobject true;
_c130 animate ["ramp_bottom",1];
_c130 animate ["ramp_top",1];

_c130 setposasl [position c130_para select 0,position c130_para select 1,5020];
_c130 enableSimulation false;

["sf_para", [mpos]] call CBA_fnc_globalEvent;

[] spawn {n = 0; while {true} do {sleep 0.01; c130_para setvectorup [(sin n)/36,(sin n)/36,1];n = n + random 1;}};

UnitUSMC_SF1_SF1L setposasl [(mPos select 0)-0.6, (mPos select 1), 5001];
UnitUSMC_SF1_SFHg setposasl [(mPos select 0)-0.6, (mPos select 1)-1, 5001];
UnitUSMC_SF1R setposasl [(mPos select 0)-0.6, (mPos select 1)-2, 5001];
UnitUSMC_SF1_SFM setposasl [(mPos select 0)-0.6, (mPos select 1)-3, 5001];
UnitUSMC_SF1_SFS setposasl [(mPos select 0)-0.6, (mPos select 1)-4, 5001];
UnitUSMC_SF1_SFC setposasl [(mPos select 0)-0.6, (mPos select 1)-5, 5001];

UnitUSMC_SF2_SF1L setposasl [(mPos select 0)+0.6, (mPos select 1), 5001];
UnitUSMC_SF2_SFHg setposasl [(mPos select 0)+0.6, (mPos select 1)-1, 5001];
UnitUSMC_SF2R setposasl [(mPos select 0)+0.6, (mPos select 1)-2, 5001];
UnitUSMC_SF2_SFM setposasl [(mPos select 0)+0.6, (mPos select 1)-3, 5001];
UnitUSMC_SF2_SFS setposasl [(mPos select 0)+0.6, (mPos select 1)-4, 5001];
UnitUSMC_SF2_SFC setposasl [(mPos select 0)+0.6, (mPos select 1)-5, 5001];

UnitRU_SF1L setposasl [(mPos select 0)-0.6, (mPos select 1), 5001];
UnitRU_SF1Hg setposasl [(mPos select 0)-0.6, (mPos select 1)-1, 5001];
UnitRU_SF1R setposasl [(mPos select 0)-0.6, (mPos select 1)-2, 5001];
UnitRU_SF1M setposasl [(mPos select 0)-0.6, (mPos select 1)-3, 5001];
UnitRU_SF1S setposasl [(mPos select 0)-0.6, (mPos select 1)-4, 5001];
UnitRU_SF1C setposasl [(mPos select 0)-0.6, (mPos select 1)-5, 5001];

UnitRU_SF2L setposasl [(mPos select 0)+0.6, (mPos select 1), 5001];
UnitRU_SF2Hg setposasl [(mPos select 0)+0.6, (mPos select 1)-1, 5001];
UnitRU_SF2R setposasl [(mPos select 0)+0.6, (mPos select 1)-2, 5001];
UnitRU_SF2M setposasl [(mPos select 0)+0.6, (mPos select 1)-3, 5001];
UnitRU_SF2S setposasl [(mPos select 0)+0.6, (mPos select 1)-4, 5001];
UnitRU_SF2C setposasl [(mPos select 0)+0.6, (mPos select 1)-5, 5001];





sleep 15;
sleep random 30;

_IR_Strobe_Target2 = "ACE_Knicklicht_Object_G" createVehicle mPos;
_IR_Strobe_Target2 setposasl [(mPos select 0)-1.4, (mPos select 1), 5003.3];
_IR_Strobe_Target3 = "ACE_Knicklicht_Object_G" createVehicle mPos;
_IR_Strobe_Target3 setposasl [(mPos select 0)+1.4, (mPos select 1), 5003.3];
_IR_Strobe_Target4 = "ACE_Knicklicht_Object_G" createVehicle mPos;
_IR_Strobe_Target4 setposasl [(mPos select 0)-1.4, (mPos select 1)-2, 5003.3];
_IR_Strobe_Target5 = "ACE_Knicklicht_Object_G" createVehicle mPos;
_IR_Strobe_Target5 setposasl [(mPos select 0)+1.4, (mPos select 1)-2, 5003.3];
_IR_Strobe_Target6 = "ACE_Knicklicht_Object_G" createVehicle mPos;
_IR_Strobe_Target6 setposasl [(mPos select 0)-1.4, (mPos select 1)-4, 5003.3];
_IR_Strobe_Target7 = "ACE_Knicklicht_Object_G" createVehicle mPos;
_IR_Strobe_Target7 setposasl [(mPos select 0)+1.4, (mPos select 1)-4, 5003.3];

sleep 10; 
c130_para animate ["ramp_bottom",1];
c130_para animate ["ramp_top",1];

sleep 15;
_c130 setdir 150;
_c130 hideobject false;
_c130 enablesimulation true;
//_c130 setvelocity [0,120,0];
_c130 flyinheight _alt;
deletevehicle c130_para;

deletevehicle _IR_Strobe_Target2;
deletevehicle _IR_Strobe_Target3;
deletevehicle _IR_Strobe_Target4;
deletevehicle _IR_Strobe_Target5;
deletevehicle _IR_Strobe_Target6;
deletevehicle _IR_Strobe_Target7;

sleep 90;
deletevehicle _c130;
deletevehicle _pilot1;

 
_smokered = "SmokeShellRed" createvehicle mPos;
for [{_x=1},{_x<=5},{_x=_x+1}] do {
_IR_Strobe_Target = "ACE_Knicklicht_Object_R" createVehicle mPos;
_IR_Strobe_Target setPosATL [(mPos select 0) + random 5 ,(mPos select 1) + random 5 , mPos select 2];
};
