round(random 20); if (_rnd>1) then {_unittype=format["Civilian%1",_rnd]}};
			
			_grp=createGroup _side;
			
			_lead = _grp createUnit [_unittype, _position, [], 0, "form"];
			_lead setVehicleInit _initlstr;
			[_lead] join _grp;
			_grp selectLeader _lead;
			sleep 1;
			
			// copy team members (skip the leader)
			_c=0;
			{
				_c=_c+1;
				if (_c>1) then {
					_newpos = _position findEmptyPosition [10, 200];
					sleep .4;
					if (count _newpos <= 0) then {_newpos = _position};
					_newunit = _grp createUnit [_x, _newpos, [],0,"form"];								
					_newunit setVehicleInit _initstr;
					[_newunit] join _grp;
				};
			} foreach _membertypes;
			

			{				
				_newpos = _position findEmptyPosition [10, 200];
				sleep .4;
				if (count _newpos <= 0) then {_newpos = _po