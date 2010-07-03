//if(not isServer) exitWith{};

_aPos = _this;

  for [{_i=0},{_i<nshell},{_i=_i+1}] do {
   _shell = shelltype createVehicle [(_aPos select 0) + random shellspread   ,(_aPos select 1) + random shellspread , 100];
   sleep 5;
    };