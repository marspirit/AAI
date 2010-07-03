deleteMarker "dropzone";
_Marker = createmarker ["dropzone", _this];
_Marker setMarkerType "Destroy";
_Marker setMarkerColor "ColorBlue";
_Marker setMarkertext  "Drop Zone";

mPos = getMarkerPos "dropzone";

c130_para = "C130J_static_EP1" createVehicle mPos;
c130_para setPosasl [(mPos select 0), (mPos select 1), 2500];

_helopilot = creategroup civilian; 
_c130= createVehicle ["C130J", mPos, [], 0, "FLY"];
_c130 setPosasl [(mPos select 0), (mPos select 1), 2520];
_pilot1 = _helopilot createUnit ["Pilot", mPos, [], 0, "NONE"];
_pilot1 assignAsDriver _c130;
_pilot1 moveindriver _c130;
_c130 hideobject true;
_c130 animate ["ramp_bottom",1];
_c130 animate ["ramp_top",1];

_c130 setposasl [position c130_para select 0,position c130_para select 1,2520];
_c130 enableSimulation false;

paradrop = true; 
publicvariable "paradrop";

[] spawn {n = 0; while {true} do {sleep 0.01; c130_para setvectorup [(sin n)/36,(sin n)/36,1];n = n + random 1;}};

sleep 15;
sleep random 30;

c130_para animate ["ramp_bottom",1];
c130_para animate ["ramp_top",1];

sleep 6;
_c130 setdir (direction c130_para);
_c130 hideobject false;
_c130 enablesimulation true;
//_c130 setvelocity [0,120,0];
_c130 flyinheight _alt;
deletevehicle c130_para;

sleep 90;
deletevehicle _c130;
deletevehicle _pilot1;
 
_smokered = "SmokeShellRed" createvehicle mPos;
for [{_x=1},{_x<=5},{_x=_x+1}] do {
_irstrobe = "ACE_Knicklicht_Object_R" createVehicle mPos;
_irstrobe setPosATL [(mPos select 0) + random 5 ,(mPos select 1) + random 5 , mPos select 2];
};
