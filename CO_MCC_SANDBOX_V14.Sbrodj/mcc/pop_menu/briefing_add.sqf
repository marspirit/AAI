disableSerialization;
private ["_type","_string"];
_string = _this select 0;
_type = _this select 1;

switch (_type) do
{
   case 0:
   {_exe = player createDiaryRecord ["diary", ["Situation",_string]];
   mcc_sync=mcc_sync + FORMAT ["_string='%1';player createDiaryRecord ['diary', ['Situation',_string]];sleep 1;",_string];};
   case 1:
   {_exe = player createDiaryRecord ["diary", ["Enemy Forces",_string]];
    mcc_sync=mcc_sync + FORMAT ["_string='%1';player createDiaryRecord ['diary', ['Enemy Forces',_string]];sleep 1;",_string];};
   case 2:
   {_exe = player createDiaryRecord ["diary", ["Friendly Forces",_string]];
   mcc_sync=mcc_sync + FORMAT ["_string='%1';player createDiaryRecord ['diary', ['Friendly Forces',_string]];sleep 1;",_string];};
   case 3:
   {_exe = player createDiaryRecord ["diary", ["Mission",_string]];
	mcc_sync=mcc_sync + FORMAT ["_string='%1';player createDiaryRecord ['diary', ['Mission',_string]];sleep 1;",_string];};
   case 4:
   {_exe = player createDiaryRecord ["diary", ["SpecialTasks",_string]];
	mcc_sync=mcc_sync + FORMAT ["_string='%1';player createDiaryRecord ['diary', ['SpecialTasks',_string]];sleep 1;",_string];};
   case 5:
   {_exe = player createDiaryRecord ["diary", ["Fire Support",_string]];
	mcc_sync=mcc_sync + FORMAT ["_string='%1';player createDiaryRecord ['diary', ['Fire Support',_string]];sleep 1;",_string];};
};



 
		