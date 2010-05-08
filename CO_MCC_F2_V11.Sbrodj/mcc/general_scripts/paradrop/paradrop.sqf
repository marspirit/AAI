deleteMarker "dropzone";
_Marker = createmarker ["dropzone", _this];
_Marker setMarkerType "Destroy";
_Marker setMarkerColor "ColorBlue";
_Marker setMarkertext  "Drop Zone";

mPos = getMarkerPos "dropzone";


paradrop = true; 
publicvariable "paradrop";

sleep 20;

_smokered = "SmokeShellRed" createvehicle mPos;
for [{_x=1},{_x<=5},{_x=_x+1}] do {
_irstrobe = "ACE_Knicklicht_Object_R" createVehicle mPos;
_irstrobe setPosATL [(mPos select 0) + random 5 ,(mPos select 1) + random 5 , mPos select 2];
};
