private ["_tgt", "_dir", "_start", "_startX", "_startY", "_inc"];
_tgt = _this select 0;
_dir = _this select 1;
_start = position _tgt;
_startX = _start select 0;
_startY = _start select 1;

_inc = 0.1 + (1 / ((_tgt distance player) / 2));

switch (_dir) do 
{
case 0: 
{
while {(((position _tgt) select 0) < (_startX + 29.5))} do 
{
_tgt setPos [((position _tgt) select 0) + _inc, _startY, 0];
sleep 0.01;
};
};

case 1: 
{
_inc = -_inc; 

while {(((position _tgt) select 0) > (_startX - 29.5))} do 
{
_tgt setPos [((position _tgt) select 0) + _inc, _startY, 0];
sleep 0.01;
};
};

default {};
};
