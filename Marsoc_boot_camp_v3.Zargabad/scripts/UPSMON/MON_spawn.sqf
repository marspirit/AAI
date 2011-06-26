UPS_INIT==1};
	
private ["_artillery","_smoke1","_i","_area","_position","_maxcadence","_mincadence","_sleep","_rounds"];
_range = 800;
_area = 150;
_maxcadence = 10;
_mincadence = 5;
_sleep = 0;
_rounds = 1;
_bullet = "ARTY_Sh_81_HE";	
_vector =[];

_artillery  = _this select 0;
//if (KRON_UPS_Debug>0) then {player globalchat format["MON_artillery_add before %1 %2 %3",isnull _artillery,alive _artillery]};		
if (isnull _artillery || !alive _artillery) exitwith{};
if ((count _this) > 1) then {_rounds = _this select 1;};	
if ((count _this) > 2) then {_range = _this select 2;};
if ((count _this) > 3) then {_area = _this select 3;};	
if ((count _this) > 4) then {_maxcadence = _this select 4;};	
if ((count _this) > 5) then {_mincadence = _this select 5;};	
if ((count _this) > 6) then {_bullet = _this select 6;};	

//Add artillery to array of artilleries
_vector = [_artillery,_rounds,_range,_area,_maxcadence,_mincadence,_bullet];
if (isnil "KRON_UPS_ARTILLERY_UNITS" ) then  {KRON_UPS_ARTILLERY_UNITS = []};
KRON_UPS_ARTILLERY_UNITS = KRON_UPS_ARTILLERY_UNITS + [_vector];

if (true) exitwith{};
/* =====================================================================================================
	MON_spawn.sqf
	Author: Monsada (chs.monsada@gmail.com) 
		Comunidad Hispana de Simulación: 
		http://www.simulacion-esp.com
 =====================================================================================================
	Parámeters: [Param1,Param2,Param3,[Param4]]  EXECVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";	
		<-	Param1 	Id of the template to copy.
		<-	Param2 	Position to create new squad.
		<-	Param3 	Nº of squads to create
		<-	Param4	Array of parameters of UPSMON, first must be name of marc to patrol
  =====================================================================================================
  	Function that allows to spawn UPSMON squads.	
	
	1- create a squad in editor. Exec UPSMON and set TEMPLATE id, this will save members of squad, not equipement.		
		nul = [this,"town","TEMPLATE:",1] execVM "scripts\upsmon.sqf";	
	2- Exec MON_spawn on trigger or where you want telling the copy of the template to create
		and the position.
		nul = [1,[0,0,0],3,[mark, upsmon optional params]] EXECVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";		
 =====================================================================================================*/
if (!isserver) exitWith {}; 

//Waits until UPSMON is init
waitUntil {!isNil("KRON_UPS_INIT")};
waitUntil {KRON_UPS_INIT==1};	
private ["_template","_position","_params","_copies","_membertypes","_unittype","_side","_UCthis","_initstr","_grp","_lead","_newunit","_i","_newpos","_vehicle","_initlstr"];

//Parameter reading
_template  = _this select 0;
_position = _this select 1;
_copies = _this select 2;
_params = _this select 3;

//Initialization
_membertypes = [];
_side = "";
_UCthis = [];
_initstr = "";
_initlstr = "";
_grp = grpnull;
_lead = objnull;
_newunit = objnull;
_newpos=[];
_vehicle=[];

//Gets parameters of UPSMON
for [{_i=0},{_i<count _params},{_i=_i+1}] do {_e=_params select _i; if (typeName _e=="STRING") then {_e=toUpper(_e)};_UCthis set [_i,_e]};
_initstr = ["INIT:","",_UCthis] call KRON_UPSgetArg;
_initlstr = ["INITL:","",_UCthis] call KRON_UPSgetArg;
_initlstr = _initlstr + _initstr;
_spawned= if ("SPAWNED" in _UCthis) then {true} else {false};
if (!_spawned) then {_UCthis = _UCthis + ["SPAWNED"]};	

if (KRON_UPS_Debug>0) then {player globalchat format["Spawning %3 copies of template %1",_template,_position,_copies,count KRON_UPS_TEMPLATES]};	
//if (KRON_UPS_Debug>0) then {diag_log format["Spawning %3 copies of template %1 on %2 templates %4",_template,_position,_copies,count KRON_UPS_TEMPLATES]};	
	
//Search if any template	
{
	if ((_x select 0) == _template) then {
		_side = _x select 1;
		_membertypes = _x select 2;	
		_vehicletypes = _x select 3;	
		//Gets leader type
		_unittype= _membertypes select 0;		
		
		//if (KRON_UPS_Debug>0) then {player globalchat format["template %1:%2 ",_template,_membertypes]};	
		
		for [{_i=1},{_i<=_copies},{_i=_i+1}] do {
	
			// make the clones civilians
			// use random Civilian models for single unit groups
			if ((_unittype=="Civilian") && (count _members==1)) then {_rnd=1+