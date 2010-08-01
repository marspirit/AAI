/*
____________________________________________________________________________________
____________________________________________________________________________________
************************************************************************************
************************************************************************************


  ARMA2 Arresting gear script.


************************************************************************************
************************************************************************************


  Version:  1.02
  © November 2009 - Tusken Raider
____________________________________________________________________________________
____________________________________________________________________________________
*/


//Wait for JIP players to connect.
if ( (!isServer) && (player != player) ) then
{
    waitUntil {player == player};
    waitUntil {time > 10};
};
if (!(local player)) exitwith {};

//Declareing variables
private ["_landingtime1","_landingtime2","_cableslocation","_inbound","_glidepathxdev","_glidepathydev","_glidepath1x","_glidepath2x","_glidepath1y","_glidepath2y","_plane","_planeposx","_planeposy","_cablepos1","_cablepos2","_planepos","_planeposby","_velxfinal","_vel","_velx","_vely","_velz","_landing","_running","_cablesPosASL","_cablelenght","_activationdist","_cablewidth","_retardation","_angle1","_angle2","_planepostempxA","_planepostempyA","_planepostempxB","_planepostempyB","_planeposdiffx","_planeposdiffy","_planeposdifftot","_hooked","_brakeforce","_nrofbrakes","_brakeingdist","_backspeed","_elasticity","_sound","_veltotal","_velxquota","_velyquota","_anglerem","_planeanglerem","_planeanglefront","_planeangleback","_planeangle","_anglefixed","_planeanglefixed","_bothwaylanding"];
/*


____________________________________________________________________________________________________
*****These 4 variables can be edited.******
*Explainations*

_sound:		  Makes a sound at touchdown. Set to =0; if you do not want to use it.

_bothwaylanding:  Enables or disables the ability to hook on the cables from both directions.
		  Default is set to two way landing which is =1.
		  If you only want it to be possible to land from one direction set this to =0; .
		  Then the only way to land is when comming in from behind the object. (Same azimut +-30 degrees).

_cablesPosASL:	  Sets the position above sealevel of the arrestorcables.
		  In other words, when the plane reaches this altitude the braking will commence.
		  17.7 is very good for the standard LHC in the Utes map. Manually created carriers seems to be a bit higher in water.

_cablelenght:     Lenght of the Area divided by 2 on the LHC where the cables are located. This is along the ship, bow to stern.
		  If you don't think its hard enought to land. Feel free to decrease the value. The runway is about 244m in total lenght.

_activationdist:  This is how long in lenght before the cables start the script indicates that a plane is inbound.
		  Be aware that if you are reducing the cables length, make that the runway ends within this lenght-30m after the cable area.
		  This goes for whichever direction it is possible to land. If you don't you may get braked when trying to take off.
		  Check cable area lenght with the radiotrigger in the testmission, then add this number and another 30m and check that
		  that location is not on the runway. Do not set to 30 or below!

_cablewidth:	  Width of the Area divided by 2 on the LHC where the cables are located. This cross the ship, port to starboard.
		  Should be as wide as the runway. The width of the runway is about 18m.

_retardation:	  When the cables are start applying brakeing force on the aircraft this is the reversed acceleration.
		  When the brakeing sequence has begun, brakeing force will apply every time the aircraft have moved this number in meters.
		  It seemed the most realistic. As it's set to 0.3 now, the aircraft will brake once every 0.3 meter. 
		  Do not set it to larger than 100!

_brakeforce:	  When the cables are start applying brakeing force this is the amount of how much it will brake.
		  In the equation this is how much the plane's speed will be divided in both the x and y speed vector.
		  The higher the number the faster it will brake. Setting it to 1 will do nothing.
		  Lower than one and the plane will accelerate instead.
		  _retardation in conjunction with _brakeforce will decide how fast and smooth the aircraft will come to a halt.

_elasticity:	  This is a make belief elasticity of the cables which result in a reversed speed when the plane has slowed down.
		  It works realisticly so the longer your brakeing distance is the more stretched the cables are.
		  The brakeing distance is divided with this number which then sets this speed negative, divided up between each speedvector.
		  How much "kickback" you get in each direction is related to your landing speed in the x and y planes.
		  IF YOU DO NOT WANT ANY "KICKBACK" JUST SET THIS TO A VERY LARGE NUMBER.

Hints:		  Remember that it might take a half sec to activate the brakeing phase of the scipt after entering the cable area.
		  _retardation is really only making the brakeing more precise if its lowered but it will then also do more calculations.
		  Start with setting up _retardation and _brakeforce. When you have a desired brakeing distance set up the _elasticity.
		  THE BRAKEING DISTANCE WiLL ALWAYS BE DEPENDENT OF THE LANDING SPEED.
_____________________________________________________________________________________________________
*/
_sound=1;
_bothwaylanding=1;
_cablesPosASL=18.2;
_cablelenght=122;
_activationdist=50;
_cablewidth=9;
_retardation=0.3;
_brakeforce=1.02;
_elasticity=4;

// Do not edit the rest of the script if you don't know what you are doing.
//---------------------------------------------------------------------------


// Creating cable location and glidepath positions.

_cablepos1=getpos cables;
_angle1=getDir cables;
_cableslocation = createLocation ["NameLocal", getpos cables, _cablewidth, _cablelenght];
_cableslocation setDirection _angle1;
_glidepathxdev=(((_cablelenght)+_activationdist)*(sin _angle1));
_glidepathydev=(((_cablelenght)+_activationdist)*(cos _angle1));
_glidepath2x=0;
_glidepath2y=0;
_glidepath1x=(_cablepos1 select 0)-_glidepathxdev;
_glidepath1y=(_cablepos1 select 1)-_glidepathydev;
if (_bothwaylanding==1) then {
	_glidepath2x=(_cablepos1 select 0)+_glidepathxdev;
	_glidepath2y=(_cablepos1 select 1)+_glidepathydev;
};

//Initiating never ending loop.
_running=true;
while {_running} do { 
	scopeName "start";
	_cablepos2=getpos cables;
	_angle2=getDir cables;
	_plane=vehicle player;
	_planeposx=getPos _plane select 0;
	_planeposy=getPos _plane select 1;

	// If cables have moved, then adjust.

	if (((_cablepos1 select 0)!=(_cablepos2 select 0)) OR ((_cablepos1 select 1)!=(_cablepos2 select 1)) OR ((_angle1!=_angle2))) then {
		_cablepos1=getpos cables;
		_angle1=getDir cables;
		_cableslocation setPosition _cablepos1;
		_cableslocation setDirection _angle1;
		_glidepathxdev=(((_cablelenght)+_activationdist)*(sin _angle1));
		_glidepathydev=(((_cablelenght)+_activationdist)*(cos _angle1));
		_glidepath1x=(_cablepos1 select 0)-_glidepathxdev;
		_glidepath1y=(_cablepos1 select 1)-_glidepathydev;
		if (_bothwaylanding==1) then {
			_glidepath2x=(_cablepos1 select 0)+_glidepathxdev;
			_glidepath2y=(_cablepos1 select 1)+_glidepathydev;
		};
	};

	// If player is in a plane and is on a glidepath. Then create a trigger and start next loop.

	if (local player && (((abs (_glidepath1x-_planeposx)<=30) && (abs (_glidepath1y-_planeposy)<=30)) OR ((abs (_glidepath2x-_planeposx)<=30) && (abs (_glidepath2y-_planeposy)<=30))) && (driver vehicle player==player) && (vehicle player!=player) && (vehicle player iskindof "Plane")) then {
		_inbound=true;
		_landingtime1=time;
	};

	while {_inbound} do {
		// Resetting some variables used later.
		_nrofbrakes=0;
		_brakeingdist=0;
		_backspeed=0;
		_velxfinal=1;
		_velyfinal=1;
		_veltotal=0;
		_velxquota=0;
		_velyquota=0;

		// If the player get close to a glidepath object again, the 10 sec resets.
		
		if (local player && (((abs (_glidepath1x-_planeposx)<=30) && (abs (_glidepath1y-_planeposy)<=30)) OR ((abs (_glidepath2x-_planeposx)<=30) && (abs (_glidepath2y-_planeposy)<=30))) && (driver vehicle player==player) && (vehicle player!=player) && (vehicle player iskindof "Plane")) then {
			_landingtime1=time;
		};
	
		// Aborting landing if player has not landed within 10 seconds.

		_landingtime2=time;
		if ((abs (_landingtime2-_landingtime1))>=10) then {
			_inbound=false;
			_landing=false;
			_hooked=false;
			_stopping=false;
			breakTo "start";
		};
	
		// Calculate the planes angle in relation to the carrier. So you can't land while flying across the ship.		 
		_angle2=getDir cables;
		_planeangle=getDir _plane;
		_anglefixed=360+_angle2;
		_planeanglefixed=360+_planeangle;
		_anglerem=((abs (_anglefixed))+360) mod 360;
		_planeanglerem=((abs (_planeanglefixed))+360) mod 360;
		_planeanglefront=(abs (_anglerem-_planeanglerem)+360);
		_planepos=getPos _plane;
		// If angles are right, the plane is in the area of the cables and low enought. Then the plane has hooked onto the cables.

		if ((((_planeanglefront>=330) && (_planeanglefront<=390)) OR ((_planeanglefront>=510) && (_planeanglefront<=570))) && (_planepos in _cableslocation) && (((getPosASL _plane) select 2)<=_cablesPosASL)) then {_hooked=true;
		};
		if (_hooked) then {

			// Setting required starting variables. And play sound.
			_landing=true;
			_planepos=getPos _plane;
			_planepostempxA=abs (_planepos select 0);
			_planepostempyA=abs (_planepos select 1);
			_planepostempxB=_planepostempxA+100;
			_planepostempyB=_planepostempyA+100;
			_hooked=false;
			if (_sound==1) then {_plane say ["Landing",1];};

			// Brakeing loop.
			
			while {_landing} do {
				_planeposdiffx=_planepostempxB-_planepostempxA;
				_planeposdiffy=_planepostempyB-_planepostempyA;
				_planeposdifftot=sqrt ((_planeposdiffx*_planeposdiffx)+(_planeposdiffy*_planeposdiffy));
				if (_planeposdifftot>=_retardation) then {
					_vel=velocity _plane;
					_velx=(_vel select 0);
					_vely=(_vel select 1);
					_velz=(_vel select 2);
					_nrofbrakes=_nrofbrakes+1;
					_brakeingdist=_nrofbrakes*_retardation;
					_backspeed=_brakeingdist/_elasticity;
					if ((abs (_velx))>_backspeed) then {_velxfinal=(_vel select 0);};
					if ((abs (_vely))>_backspeed) then {_velyfinal=(_vel select 1);};
					_plane setVelocity [(_velx/_brakeforce),(_vely/_brakeforce),_velz];
					_planepos=getPos _plane;
					_planepostempxB=abs (_planepos select 0);
					_planepostempyB=abs (_planepos select 1);
				};
				_vel=velocity _plane;
				_velx=(_vel select 0);
				_vely=(_vel select 1);
				_velz=(_vel select 2);
				_planepos=getPos _plane;
				_planepostempxA=abs (_planepos select 0);
				_planepostempyA=abs (_planepos select 1);
				if (((abs _velx)<3) && ((abs _vely)<3)) then {_landing=false; _stopping=true;};
			};

			//Speed is slow enough now lets halt it fully.

			while {_stopping} do {
			_plane setVelocity [(_velx/_brakeforce),(_vely/_brakeforce),_velz];
			sleep 0.01;
			_velx=(_vel select 0);
			_vely=(_vel select 1);
			2_velz=(_vel select 2);
			if (((abs _velx)<0.3) && ((abs _vely)<0.3)) then {
				_plane setVelocity [0,0,0];
				sleep 0.01;
				_stopping=false;
				};
			};

			// The plane has slowed down to almost no speed. Calculate and do a small elastic bounceback.
			_veltotal=(abs _velxfinal)+(abs _velyfinal);
			_velxquota=_velxfinal/_veltotal;
			_velyquota=_velyfinal/_veltotal;
			_plane setVelocity [- (_velxquota*_backspeed*(1/10)),- (_velyquota*_backspeed*(1/10)),0];
			sleep 0.01;
			_plane setVelocity [- (_velxquota*_backspeed*(1/5)),- (_velyquota*_backspeed*(1/5)),0];
			sleep 0.01;
			_plane setVelocity [- (_velxquota*_backspeed*(1/1)),- (_velyquota*_backspeed*(1/1)),0];
			_inbound=false;

			// Back to top.

			breakTo "start";
		};
	};     
};