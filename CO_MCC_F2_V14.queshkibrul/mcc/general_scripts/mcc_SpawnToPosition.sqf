
if (player == (leader player)) then 
   { 
	 player setPos (getPos (((units player) - [player]) select 0));
   }
else
	{
	player setPos (getPos (leader player)); 
	};


_gen = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_gen removeAction _id;