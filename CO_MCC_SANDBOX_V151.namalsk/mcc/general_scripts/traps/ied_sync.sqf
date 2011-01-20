//Made by Shay_Gman (c) 09.10
private ["_pointA", "_pointB", "_IEDLineName", "_nearObjectsA", "_nearObjectsB"]; 

_pointA = _this select 0; 
_pointB = _this select 1; 
_IEDLineName = _this select 2; 

_nearObjectsA = pointA nearObjects ["ACE_Target_CInf",20];
_nearObjectsB = pointB nearObjects ["ACE_Target_CInf",20];
if (count _nearObjectsA>0 && count _nearObjectsB >0) then
			{
			waituntil {(_nearObjectsB select 0) getvariable "iedTrigered"}; 
			sleep random 3;
			(_nearObjectsA select 0)setvariable ["iedTrigered", true, true]; 
			[-2, {deletemarkerlocal format ["line_%1", _this];}, _IEDLineName] call CBA_fnc_globalExecute;	//de;ete IED marker 
			};