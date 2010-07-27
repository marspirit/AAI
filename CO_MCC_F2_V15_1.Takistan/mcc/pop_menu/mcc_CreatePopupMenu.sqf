//Make some cool arrays to make config file dynamic read

// NOW make that menu finaly FFS
_MenuStructureArray =
[
 ["MainMenu",
   [
     ["Caption", format["MCC, %1 (%2)",mcc_faction, mcc_sidename ]],
     ["Items",
       [
                
         
         [ ["Item", "Zone >"], ["SubMenu", "Zone"] ],
		 [ ["Item", "Factions >"], ["SubMenu", "Factions"] ],
		 [ ["Item", "-"] ],		 
		 [ ["Item", "Groups >"], ["SubMenu", "groups"] ],
		 [ ["Item", "Units >"], ["SubMenu", "units"] ],
		 [ ["Item", "DOC >"], ["SubMenu", "doc"] ],
		 [ ["Item", "Spawn Ammo >"], ["SubMenu", "Spawnammo"] ],	//VK - Added
		 [ ["Item", "-"] ],		 
		 [ ["Item", "Spawn Settings >"], ["SubMenu", "settings"]  ],
		 [ ["Item", "-"] ],
         [ ["Item", "Start Mission >"],["SubMenu", "startmenu"]  ],
		 [ ["Item", "Mission Settings >"],["SubMenu", "mission_settings"]  ],
		 [ ["Item", "-"] ],
		 [ ["Item", "Spawn on LHD >"], ["SubMenu", "LHD"] ],
		 [ ["Item", "Place Booby Traps >"], ["SubMenu", "traps"] ],
		 [ ["Item", "Convoy Generator >"], ["SubMenu", "convoy"] ],
		 [ ["Item", "Extra >"], ["SubMenu", "extras"] ],
//        [ ["Item", "Safe/load             >"], ["SubMenu", "Safeload"] ],
		 [ ["Item", "-"] ],
         [ ["Item", "Logout as Mission Maker"], ["Action", "mcc_resetmissionmaker=true;nul=[0] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';"] ]         

        
        
       ]
     ]
   ]
 ],
//=========================================Mission's Setting=======================================
["mission_settings",
    [
      ["Caption", "mission_settings"],
      ["Items",
        [
         [ ["Item", "Set Time 00:00 - 12:000 >"], ["SubMenu", "timea"] ],
		 [ ["Item", "Set Time 13:00 - 23:000 >"], ["SubMenu", "timeb"] ],
		 [ ["Item", "Set Month >"], ["SubMenu", "month"] ],
		 [ ["Item", "Set Weather >"], ["SubMenu", "weather"] ],
		 [ ["Item", "-"] ],
		 [ ["Item", "Start RTE at player"], ["Action",  "nul=[3] execVM 'mcc\general_scripts\RTE\rte.sqf';" ] ],
		 [ ["Item", "Start RTE at map click"], ["Action",  "nul=[3] execVM 'mcc\general_scripts\RTE\rte_p.sqf';" ] ],
		 [ ["Item", "-"] ],
		 [ ["Item", "Set Grass Density - CS only>"], ["SubMenu", "grass"] ],
		 [ ["Item", "Set View Distance - CS only>"], ["SubMenu", "viewdistance"] ]
        ]        
      ]
    ]
  ],
 //time a
["timea",
    [
      ["Caption", "timea"],
      ["Items",
        [
         
        [ ["Item", "00:00"], ["Action",  "hour=0; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "01:00"], ["Action",  "hour=1; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "02:00"], ["Action",  "hour=2; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "03:00"], ["Action",  "hour=3; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "04:00"], ["Action",  "hour=4; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "05:00"], ["Action",  "hour=5; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "06:00"], ["Action",  "hour=6; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "07:00"], ["Action",  "hour=7; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "08:00"], ["Action",  "hour=8; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "09:00"], ["Action",  "hour=9; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "10:00"], ["Action",  "hour=10; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "11:00"], ["Action",  "hour=11; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "12:00"], ["Action",  "hour=12; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ]
		]        
      ]
    ]
  ],
//time b
["timeb",
    [
      ["Caption", "timeb"],
      ["Items",
        [
         
        [ ["Item", "13:00"], ["Action",  "hour=13; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "14:00"], ["Action",  "hour=14; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "15:00"], ["Action",  "hour=15; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "16:00"], ["Action",  "hour=16; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "17:00"], ["Action",  "hour=17; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "18:00"], ["Action",  "hour=18; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "19:00"], ["Action",  "hour=19; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "20:00"], ["Action",  "hour=20; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "21:00"], ["Action",  "hour=21; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "22:00"], ["Action",  "hour=22; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "23:00"], ["Action",  "hour=23; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ]
		]        
      ]
    ]
  ],
  
//time b
["month",
    [
      ["Caption", "month"],
      ["Items",
        [
         
        [ ["Item", "January"], ["Action",  "month=1; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "February"], ["Action",  "month=2; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "March"], ["Action",  "month=3; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "April"], ["Action",  "month=4; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "May"], ["Action",  "month=5; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "June"], ["Action",  "month=6; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "July"], ["Action",  "month=7; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "August"], ["Action",  "month=8; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "September"], ["Action",  "month=9; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "October"], ["Action",  "month=10; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "November"], ["Action",  "month=11; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ],
		[ ["Item", "December"], ["Action",  "month=12; nul=[3] execVM 'mcc\general_scripts\time.sqf';" ] ]
		]        
      ]
    ]
  ],
  
//weather
["weather",
    [
      ["Caption", "weather"],
      ["Items",
        [
         
        [ ["Item", "Clear"], ["Action",  "_weather = [0, 0, 0];[""cba_network_weather"", _weather] call CBA_fnc_globalEvent ;" ] ],
		[ ["Item", "Clouded"], ["Action",  "_weather = [0.5, 0.5, 0.5];[""cba_network_weather"", _weather] call CBA_fnc_globalEvent ;" ] ],
		[ ["Item", "Rainy"], ["Action",  "_weather = [0.7, 0.5, 0.1];[""cba_network_weather"", _weather] call CBA_fnc_globalEvent ;" ] ],
		[ ["Item", "Storm"], ["Action",  "_weather = [1, 0.5, 1];[""cba_network_weather"", _weather] call CBA_fnc_globalEvent ;" ] ]
				
        ]        
      ]
    ]
  ],
//ViewDistance - client side only
["viewdistance",
    [
      ["Caption", "viewdistance"],
      ["Items",
        [
         
        [ ["Item", "500"], ["Action",  "_view = 500; setViewDistance _view;" ] ],
		[ ["Item", "1000"], ["Action",  "_view = 1000;setViewDistance _view;" ] ],
		[ ["Item", "1500"], ["Action",  "_view = 1500;setViewDistance _view; ;" ] ],
		[ ["Item", "2000"], ["Action",  "_view = 2000;setViewDistance _view;" ] ],
		[ ["Item", "2500"], ["Action",  "_view = 2500;setViewDistance _view;" ] ],
		[ ["Item", "3000"], ["Action",  "_view = 3000;setViewDistance _view;" ] ],
		[ ["Item", "3500"], ["Action",  "_view = 3500;setViewDistance _view;" ] ],
		[ ["Item", "4000"], ["Action",  "_view = 4000;setViewDistance _view;" ] ],
		[ ["Item", "4500"], ["Action",  "_view = 4500;setViewDistance _view;" ] ],
		[ ["Item", "5000"], ["Action",  "_view = 5000;setViewDistance _view;" ] ],
		[ ["Item", "6000"], ["Action",  "_view = 6000;setViewDistance _view;" ] ],
		[ ["Item", "7000"], ["Action",  "_view = 7000;setViewDistance _view;" ] ],
		[ ["Item", "8000"], ["Action",  "_view = 8000;setViewDistance _view;" ] ],
		[ ["Item", "9000"], ["Action",  "_view = 9000;setViewDistance _view;" ] ],
		[ ["Item", "10000"], ["Action",  "_view = 10000;setViewDistance _view;" ] ]
		
        ]        
      ]
    ]
  ],
//Grass
["grass",
    [
      ["Caption", "grass"],
      ["Items",
        [
         
        [ ["Item", "No grass"], ["Action",  "_grass = 50; setTerrainGrid _grass;" ] ],
		[ ["Item", "Meduim grass"], ["Action",  "_grass = 25;setTerrainGrid _grass;" ] ],
		[ ["Item", "High grass"], ["Action",  "_grass = 12.5;setTerrainGrid _grass;" ] ]
		
        ]        
      ]
    ]
  ],

 
//=========================================Extras=======================================
["extras",
    [
      ["Caption", "Extras"],
      ["Items",
        [
         [ ["Item", "Enemy Para Drop >"], ["SubMenu", "paratroops"]],
		 [ ["Item", "Put Hostages >"], ["SubMenu", "hostages"] ],
		 [ ["Item", "Put artillery site >"], ["SubMenu", "artysite"] ],
		 [ ["Item", "Put UAV site >"], ["SubMenu", "uav"] ],
		 [ ["Item", "Call Artillery>"], ["SubMenu", "Artillery"] ]
		]        
      ]
    ]
  ],

//paratroops
["paratroops",
    [
      ["Caption", "paratroops"],
      ["Items",
        [
         
       	 [ ["Item", format["Small %1",mcc_sidename]], ["Action", "mcc_spawnname=1;mcc_spawntype=""PARATROOPER"";mcc_classtype=""PARATROOPER"";mcc_spawnfaction=mcc_sidename;nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';"] ],
      	 [ ["Item", format["Large %1",mcc_sidename]], ["Action", "mcc_spawnname=2;mcc_spawntype=""PARATROOPER"";mcc_classtype=""PARATROOPER"";mcc_spawnfaction=mcc_sidename;nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';"] ]
		]        
      ]
    ]
  ],
    
//Hostages
["hostages",
    [
      ["Caption", "hostages"],
      ["Items",
        [
         
       	 [ ["Item", "Civilian - doctor Male"], ["Action", "hostage = ""Doctor""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Civilian - Citizen Male"], ["Action", "hostage = ""Citizen1""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Civilian - Businessman"], ["Action", "hostage = ""Functionary1""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Civilian - Policeman"], ["Action", "hostage = ""Policeman""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Civilian - Priest"], ["Action", "hostage = ""Priest""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Civilian - Hooker"], ["Action", "hostage = ""Hooker1""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Civilian - Secretary"], ["Action", "hostage = ""RU_Secretary1""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Insurgent - Boss"], ["Action", "hostage = ""Ins_Lopotev""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Insurgent - Warlord"], ["Action", "hostage = ""Ins_Bardak""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Resistance - Warlord"], ["Action", "hostage = ""GUE_Commander""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "UN - Officer"], ["Action", "hostage = ""UN_CDF_Soldier_Officer_EP1""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Takistan army - officer"], ["Action", "hostage = ""TK_Commander_EP1""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "Takistan locals - Warlord"], ["Action", "hostage = ""TK_GUE_Warlord_EP1""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "USMC - SF soldier1"], ["Action", "hostage = ""FR_GL""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "USMC - SF soldier2"], ["Action", "hostage = ""FR_Corpsman""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "USMC - SF Commander"], ["Action", "hostage = ""FR_Commander""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "USMC -  soldier1"], ["Action", "hostage = ""USMC_SoldierS_Engineer""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "USMC -  soldier2"], ["Action", "hostage = ""FR_Assault_GL""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ],
		 [ ["Item", "USMC -  pilot"], ["Action", "hostage = ""USMC_Soldier_Pilot""; nul=[3] execVM 'mcc\general_scripts\hostages\hostage_request.sqf';"] ]

        ]        
      ]
    ]
  ],
  
 //artysite
["artysite",
    [
      ["Caption", "artysite"],
      ["Items",
        [
        
		[ ["Item", "----Static----"] ],
        [ ["Item", "Tent"], ["Action",  "artyindex = 0; nul=[3] execVM 'mcc\general_scripts\arty_site\arty_site_request.sqf';"] ],
		[ ["Item", "----Mobile----"] ],
		[ ["Item", "USMC"], ["Action",  "artyindex = 1; nul=[3] execVM 'mcc\general_scripts\arty_site\arty_site_request.sqf';"] ],
		[ ["Item", "CDF"], ["Action",  "artyindex = 2; nul=[3] execVM 'mcc\general_scripts\arty_site\arty_site_request.sqf';"] ],
		[ ["Item", "Russians"], ["Action",  "artyindex = 3; nul=[3] execVM 'mcc\general_scripts\arty_site\arty_site_request.sqf';"] ],
		[ ["Item", "Insurgent"], ["Action",  "artyindex = 4; nul=[3] execVM 'mcc\general_scripts\arty_site\arty_site_request.sqf';"] ],
		[ ["Item", "Guerilla"], ["Action",  "artyindex = 5; nul=[3] execVM 'mcc\general_scripts\arty_site\arty_site_request.sqf';"] ]				
        ]        
      ]
    ]
  ],
//UAV site
["UAV",
    [
      ["Caption", "UAV"],
      ["Items",
        [
        
		[ ["Item", "----Static----"] ],
        [ ["Item", "West-UAV"], ["Action",  "uavindex = 0; nul=[3] execVM 'mcc\general_scripts\uav\uav_request.sqf';"] ],
		[ ["Item", "West-ULB"], ["Action",  "uavindex = 1; nul=[3] execVM 'mcc\general_scripts\uav\uav_request.sqf';"] ],
		[ ["Item", "East-UAV"], ["Action",  "uavindex = 2; nul=[3] execVM 'mcc\general_scripts\uav\uav_request.sqf';"] ],
		[ ["Item", "----Mobile----"] ],
		[ ["Item", "West-UAV"], ["Action",  "uavindex = 3; nul=[3] execVM 'mcc\general_scripts\uav\uav_request.sqf';"] ],
		[ ["Item", "West-ULB"], ["Action",  "uavindex = 4; nul=[3] execVM 'mcc\general_scripts\uav\uav_request.sqf';"] ],
		[ ["Item", "East-UAV"], ["Action",  "uavindex = 5; nul=[3] execVM 'mcc\general_scripts\uav\uav_request.sqf';"] ]
	   ]        
      ]
    ]
  ],
  
 //===========================================Artillery =================================================
["Artillery",
    [
      ["Caption", "Artillery"],
      ["Items",
        [
          
          [ ["Item", "High Explosive"], ["Action",  "shelltype=""ARTY_Sh_105_HE""; nul= execVM 'mcc\general_scripts\artillery\artillery_request.sqf';"  ] ],
		   [ ["Item", "WP"], ["Action",  "shelltype=""ARTY_Sh_105_WP""; nul=[3] execVM 'mcc\general_scripts\artillery\artillery_request.sqf';"  ] ],
		  [ ["Item", "Smoke"], ["Action",  "shelltype=""Smokeshell""; nul=[3] execVM 'mcc\general_scripts\artillery\artillery_request.sqf';"  ] ],
		  [ ["Item", "Flare"], ["Action",  "shelltype=""F_40mm_White""; nul=[3] execVM 'mcc\general_scripts\artillery\artillery_request.sqf';"  ] ],
		  [ ["Item", "Change Spread"], ["SubMenu", "Spread" ] ],
		  [ ["Item", "Number of rounds"], ["SubMenu", "nshell" ] ]
        ]        
      ]
    ]
  ],

//Artillery spread menu
["Spread",
    [
      ["Caption", "Spread"],
      ["Items",
        [
          
          [ ["Item", "On-target"], ["Action",  "shellspread=1" ] ],
		  [ ["Item", "Precise"], ["Action",  "shellspread=25" ] ],
		  [ ["Item", "Tight"], ["Action",  "shellspread=70" ] ],
		  [ ["Item", "Wide"], ["Action",  "shellspread=140" ] ]
        ]        
      ]
    ]
  ],
//Artillery Number of shells
["nshell",
    [
      ["Caption", "nshell"],
      ["Items",
        [
          
          [ ["Item", "1"], ["Action",  "nshell=1" ] ],
		  [ ["Item", "3"], ["Action",  "nshell=3" ] ],
		  [ ["Item", "6"], ["Action",  "nshell=6" ] ],
		  [ ["Item", "10"], ["Action",  "nshell=10" ] ]
        ]        
      ]
    ]
  ],
  
 //===============================================Traps=============================================
["traps",
    [
      ["Caption", "traps"],
      ["Items",
        [
         
       	 [ ["Item", "Small Objects >"], ["SubMenu", "small_objects"] ],
		 [ ["Item", "Medium Objects >"], ["SubMenu", "medium_objects"] ],
		 [ ["Item", "Large Objects >"], ["SubMenu", "large_objects"] ],
		 [ ["Item", "Ammobox Objects >"], ["SubMenu", "ammobox"] ],
		 [ ["Item", "Wrecks Objects >"], ["SubMenu", "wrecks"] ],
		 [ ["Item", "Cars >"], ["SubMenu", "cars"] ],
		 [ ["Item", "Mines >"], ["SubMenu", "mines"] ],
		 [ ["Item", "Roadside charges >"], ["SubMenu", "roadside_charges"] ],
		 [ ["Item", "Armed civilans >"], ["SubMenu", "sbombers"] ],
		 [ ["Item", "----Setting----"] ],
		 [ ["Item", "Set Size >"], ["SubMenu", "trapssize"] ],
		 [ ["Item", "Set explodion proximity >"], ["SubMenu", "trapsprox"] ],
		 [ ["Item", "Set number of traps in area >"], ["SubMenu", "trapsnumber"] ],
		 [ ["Item", "Set IED target faction >"], ["SubMenu", "faction"] ]
		 		 
        ]        
      ]
    ]
  ],
//Traps - Size 
["trapssize",
    [
      ["Caption", "trapssize"],
      ["Items",
        [
         
         [ ["Item", "Set size: 50X50 "], ["Action",  "trapsx=50; trapsy=50" ] ],
		 [ ["Item", "Set size: 100X100 "], ["Action",  "trapsx=100; trapsy=100" ] ],
		 [ ["Item", "Set size: 200X200 "], ["Action",  "trapsx=200; trapsy=200" ] ],
		 [ ["Item", "Set size: 10X10 "], ["Action",  "trapsx=10; trapsy=10" ] ],
		 [ ["Item", "Set size: 10X50 "], ["Action",  "trapsx=10; trapsy=50" ] ],
		 [ ["Item", "Set size: 50X10 "], ["Action",  "trapsx=50; trapsy=10" ] ]
        ]        
      ]
    ]
  ],
//Traps - proximirty 
["trapsprox",
    [
      ["Caption", "trapsprox"],
      ["Items",
        [
         
         [ ["Item", "3 "], ["Action",  "trapdistance=1" ] ],
		 [ ["Item", "6 "], ["Action",  "trapdistance=3" ] ],
		 [ ["Item", "10 "], ["Action",  "trapdistance=6" ] ],
		 [ ["Item", "15 "], ["Action",  "trapdistance=10" ] ],
		 [ ["Item", "20 "], ["Action",  "trapdistance=15" ] ],
		 [ ["Item", "25 "], ["Action",  "trapdistance=20" ] ],
		 [ ["Item", "30 "], ["Action",  "trapdistance=25" ] ],
		 [ ["Item", "35 "], ["Action",  "trapdistance=30" ] ],
		 [ ["Item", "40 "], ["Action",  "trapdistance=35" ] ]
        ]        
      ]
    ]
  ],
//Traps - number
["trapsnumber",
    [
      ["Caption", "trapsnumber"],
      ["Items",
        [
         
         [ ["Item", "5 "], ["Action",  "trapsnumber=5" ] ],
		 [ ["Item", "10 "], ["Action",  "trapsnumber=10" ] ],
		 [ ["Item", "15 "], ["Action",  "trapsnumber=15" ] ],
		 [ ["Item", "20 "], ["Action",  "trapsnumber=20" ] ],
		 [ ["Item", "40 "], ["Action",  "trapsnumber=40" ] ],
		 [ ["Item", "60 "], ["Action",  "trapsnumber=60" ] ],
		 [ ["Item", "80 "], ["Action",  "trapsnumber=80" ] ]
		]        
      ]
    ]
  ],
//Traps - Faction 
["faction",
    [
      ["Caption", "faction"],
      ["Items",
        [
         [ ["Item", "Set West "], ["Action",  "iedside=west;" ] ],
		 [ ["Item", "Set East "], ["Action",  "iedside=east;" ] ],
		 [ ["Item", "Set Resistance "], ["Action",  "iedside=resistance;" ] ],
		 [ ["Item", "Set Civilian "], ["Action",  "iedside=civilian;" ] ]
		 ]        
      ]
    ]
  ],
//Traps - Small Objects 
["small_objects",
    [
      ["Caption", "small_objects"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
         [ ["Item", "Land_Pneu - Single"], ["Action",  "trapkind =[""Land_Pneu"",""Land_Pneu""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Notebook - Single"], ["Action",  "trapkind =[""Notebook"",""Notebook""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Radio - Single"], ["Action",  "trapkind =[""Radio"",""Radio""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "SatPhone - Single"], ["Action",  "trapkind =[""SatPhone"",""SatPhone""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "SmallTV - Single"], ["Action",  "trapkind =[""SmallTV"",""SmallTV""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Suitcase - Single"], ["Action",  "trapkind =[""Suitcase"",""Suitcase""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "ACE_Pomz - Single"], ["Action",  "trapkind =[""ACE_Pomz"",""ACE_Pomz""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Bag - Single"], ["Action",  "trapkind =[""Land_Bag_EP1"",""Land_Bag_EP1""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Canister - Single"], ["Action",  "trapkind =[""Land_Canister_EP1"",""Land_Canister_EP1""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Reservoir - Single"], ["Action",  "trapkind =[""Land_Reservoir_EP1"",""Land_Reservoir_EP1""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_tires - Single"], ["Action",  "trapkind =[""Land_tires_EP1"",""Land_tires_EP1""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "----Area spawn----"] ],
		 [ ["Item", "Small Objects - Area"], ["Action",  "trapkind =[""Land_Pneu"",""Notebook"",""Land_tires_EP1"",""Radio"",""SatPhone"",""SmallTV"",""Land_Reservoir_EP1"",""Suitcase"",""ACE_Pomz"",""Land_Bag_EP1"",""Land_Canister_EP1""]; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ]
		]        
      ]
    ]
  ],
//Traps - medium Objects 
["medium_objects",
    [
      ["Caption", "medium_objects"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
         [ ["Item", "Barrel1 - Single"], ["Action",  "trapkind =[""Barrel1"",""Barrel1""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Barrel4 - Single"], ["Action",  "trapkind =[""Barrel4"",""Barrel4""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Barrel5 - Single"], ["Action",  "trapkind =[""Barrel5"",""Barrel5""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Pneu - Single"], ["Action",  "trapkind =[""Land_Pneu"",""Land_Pneu""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Garbage_can - Single"], ["Action",  "trapkind =[""Garbage_can"",""Garbage_can""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "ACamp - Single"], ["Action",  "trapkind =[""ACamp"",""ACamp""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_A_tent - Single"], ["Action",  "trapkind =[""Land_A_tent"",""Land_A_tent""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Misc_Backpackheap - Single"], ["Action",  "trapkind =[""Misc_Backpackheap"",""Misc_Backpackheap""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Crates_stack - Single"], ["Action",  "trapkind =[""Land_Crates_stack_EP1"",""Land_Crates_stack_EP1""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_transport_crates - Single"], ["Action",  "trapkind =[""Land_transport_crates_EP1"",""Land_transport_crates_EP1""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "----Area spawn----"] ],
		 [ ["Item", "Medium Objects - Area"], ["Action",  "trapkind =[""Barrel1"",""Barrel4"",""Barrel5"",""Land_transport_crates_EP1"",""Land_Crates_stack_EP1"",""Land_Barrel_sand"",""Land_Pneu""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ]
		]        
      ]
    ]
  ],
//Traps - Large Objects 
["large_objects",
    [
      ["Caption", "large_objects"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
         [ ["Item", "Barrels - Single"], ["Action",  "trapkind =[""Barrels"",""Barrels""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "PowGen_Big - Single"], ["Action",  "trapkind =[""PowGen_Big"",""PowGen_Big""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Garbage_container - Single"], ["Action",  "trapkind =[""Garbage_container"",""Garbage_container""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Ind_TankSmall - Single"], ["Action",  "trapkind =[""Land_Ind_TankSmall"",""Land_Ind_TankSmall""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Ind_TankSmall2 - Single"], ["Action",  "trapkind =[""Land_Ind_TankSmall2"",""Land_Ind_TankSmall2""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Land_Toilet - Single"], ["Action",  "trapkind =[""Land_Toilet"",""Land_Toilet""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "PowerGenerator - Single"], ["Action",  "trapkind =[""PowerGenerator"",""PowerGenerator""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		  [ ["Item", "----Area spawn----"] ],
		 [ ["Item", "Big Objects - Area"], ["Action",  "trapkind =[""PowerGenerator"",""PowGen_Big"",""Garbage_container"",""Land_Toilet"",""Barrels"",""Land_Ind_TankSmall"",""Land_Ind_TankSmall2""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ]
        ]        
      ]
    ]
  ],
//Traps - ammobox
["ammobox",
    [
      ["Caption", "ammobox"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
         [ ["Item", "GuerillaCacheBox - Single"], ["Action",  "trapkind =[""GuerillaCacheBox"",""GuerillaCacheBox""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "LocalBasicAmmunitionBox - Single"], ["Action",  "trapkind =[""LocalBasicAmmunitionBox"",""LocalBasicAmmunitionBox""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "RUBasicAmmunitionBox - Single"], ["Action",  "trapkind =[""RUBasicAmmunitionBox"",""RUBasicAmmunitionBox""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "RUBasicWeaponsBox - Single"], ["Action",  "trapkind =[""RUBasicWeaponsBox"",""RUBasicWeaponsBox""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "USBasicAmmunitionBox - Single"], ["Action",  "trapkind =[""USBasicAmmunitionBox"",""USBasicAmmunitionBox""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "----Area spawn----"] ],
		 [ ["Item", "Ammoboxes - Area"], ["Action",  "trapkind =[""LocalBasicAmmunitionBox"",""GuerillaCacheBox"",""RUBasicAmmunitionBox"",""RUBasicWeaponsBox"",""USBasicAmmunitionBox""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ]
        ]        
      ]
    ]
  ],
//Traps - Wrecks
["wrecks",
    [
      ["Caption", "wrecks"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
         [ ["Item", "BMP2Wreck - Single"], ["Action",  "trapkind =[""BMP2Wreck"",""BMP2Wreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "BRDMWreck - Single"], ["Action",  "trapkind =[""BRDMWreck"",""BRDMWreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "HMMWVWreck - Single"], ["Action",  "trapkind =[""HMMWVWreck"",""HMMWVWreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "LADAWreck - Single"], ["Action",  "trapkind =[""LADAWreck"",""LADAWreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "Mi8Wreck - Single"], ["Action",  "trapkind =[""Mi8Wreck"",""Mi8Wreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "SKODAWreck - Single"], ["Action",  "trapkind =[""SKODAWreck"",""SKODAWreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "T72Wreck - Single"], ["Action",  "trapkind =[""T72Wreck"",""T72Wreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "UAZWreck - Single"], ["Action",  "trapkind =[""UAZWreck"",""UAZWreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "UralWreck - Single"], ["Action",  "trapkind =[""UralWreck"",""UralWreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "datsun02Wreck - Single"], ["Action",  "trapkind =[""datsun02Wreck"",""datsun02Wreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "UH60_wreck - Single"], ["Action",  "trapkind =[""UH60_wreck_EP1"",""UH60_wreck_EP1""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		 [ ["Item", "----Area spawn----"] ],
		 [ ["Item", "Ammoboxes - Area"], ["Action",  "trapkind =[""BMP2Wreck"",""BRDMWreck"",""HMMWVWreck"",""LADAWreck"",""Mi8Wreck"",""SKODAWreck"",""UAZWreck"",""UralWreck"",""T72Wreck"",""datsun02Wreck""]; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ]
        ]        
      ]
    ]
  ],

//Traps - Cars
["cars",
    [
      ["Caption", "cars"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
        [ ["Item", "Civil Cars Private - Single"], ["Action",  "trapkind =[""Lada1"",""Lada2"",""LadaLM"",""TT650_Civ"",""Skoda"",""SkodaBlue"",""SkodaGreen"",""SkodaRed"",""VWGolf"",""car_hatchback"",""car_sedan"",""datsun1_civil_1_open"",""hilux1_civil_2_covered""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "Civil Takistan Cars Private - Single"], ["Action",  "trapkind =[""Lada1_TK_CIV_EP1"",""Lada2_TK_CIV_EP1"",""LandRover_TK_CIV_EP1"",""Old_moto_TK_Civ_EP1"",""S1203_TK_CIV_EP1"",""S1203_ambulance_EP1"",""SUV_TK_CIV_EP1"",""TT650_TK_CIV_EP1"",""UAZ_Unarmed_TK_CIV_EP1"",""VolhaLimo_TK_CIV_EP1"",""Volha_1_TK_CIV_EP1"",""Volha_2_TK_CIV_EP1"",""hilux1_civil_3_open_EP1""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "Civil Cars heavy - Single"], ["Action",  "trapkind =[""tractor"",""V3S_Civ"",""UralCivil"",""UralCivil2"",""Ikarus""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "Civil Takistan Cars heavy - Single"], ["Action",  "trapkind =[""tractor"",""V3S_Open_TK_CIV_EP1"",""Ural_TK_CIV_EP1"",""Ikarus_TK_CIV_EP1""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "East Cars - Single"], ["Action",  "trapkind =[""GAZ_Vodnik"",""GAZ_Vodnik_MedEvac"",""GRAD_RU"",""Kamaz"",""UAZ_AGS30_RU"",""UAZ_RU""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "Resistance Cars - Single"], ["Action",  "trapkind =[""V3S_Gue"",""BRDM2_HQ_Gue""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "West Cars - Single"], ["Action",  "trapkind =[""HMMWV"",""HMMWV_Ambulance"",""HMMWV_M2"",""MTVR""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "----Area spawn----"] ],
		[ ["Item", "Civil Cars Private - Area"], ["Action",  "trapkind =[""Lada1"",""Lada2"",""LadaLM"",""TT650_Civ"",""Skoda"",""SkodaBlue"",""SkodaGreen"",""SkodaRed"",""VWGolf"",""car_hatchback"",""car_sedan"",""datsun1_civil_1_open"",""hilux1_civil_2_covered""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "Civil Takistan Cars Private - Area"], ["Action",  "trapkind =[""Lada1_TK_CIV_EP1"",""Lada2_TK_CIV_EP1"",""LandRover_TK_CIV_EP1"",""Old_moto_TK_Civ_EP1"",""S1203_TK_CIV_EP1"",""S1203_ambulance_EP1"",""SUV_TK_CIV_EP1"",""TT650_TK_CIV_EP1"",""UAZ_Unarmed_TK_CIV_EP1"",""VolhaLimo_TK_CIV_EP1"",""Volha_1_TK_CIV_EP1"",""Volha_2_TK_CIV_EP1"",""hilux1_civil_3_open_EP1""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "Civil Cars heavy - Area"], ["Action",  "trapkind =[""tractor"",""V3S_Civ"",""UralCivil"",""UralCivil2"",""Ikarus""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "Civil Takistan Cars heavy - Area"], ["Action",  "trapkind =[""tractor"",""V3S_Open_TK_CIV_EP1"",""Ural_TK_CIV_EP1"",""Ikarus_TK_CIV_EP1""]; trapvolume=""large""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "East Cars - Area"], ["Action",  "trapkind =[""GAZ_Vodnik"",""GAZ_Vodnik_MedEvac"",""GRAD_RU"",""Kamaz"",""UAZ_AGS30_RU"",""UAZ_RU""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "Resistance Cars - Area"], ["Action",  "trapkind =[""V3S_Gue""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "West Cars - Area"], ["Action",  "trapkind =[""HMMWV"",""HMMWV_Ambulance"",""HMMWV_M2"",""MTVR""]; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ]
        ]        
      ]
    ]
  ],
//Traps - Mines
["mines",
    [
      ["Caption", "mines"],
      ["Items",
        [
         
		[ ["Item", "----Single spawn----"] ],
        [ ["Item", "AntiHuman mine - Single"], ["Action",  "trapkind =[""ACE_BBetty_burried"",""ACE_BBetty""]; trapvolume=""small"";trapdistance = 6; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "AntiTank mine - Single"], ["Action",  "trapkind =[""Mine"",""Mine""]; trapvolume=""at"";trapdistance = 6; nul=[3] execVM 'mcc\general_scripts\traps\trap_request.sqf';" ] ],
		[ ["Item", "----Area spawn----"] ],
		[ ["Item", "AntiHuman minefield visable "], ["Action",  "trapkind =[""ACE_BBetty_burried"",""ACE_BBetty"",""Sign_Danger"",""ACE_BBetty"",""ACE_BBetty_burried"",""ACE_BBetty_burried"",""ACE_BBetty"",""ACE_BBetty"",""ACE_BBetty_burried"",""ACE_BBetty"",""ACE_BBetty""];trapdistance = 6; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "AntiHuman minefield invisable"], ["Action",  "trapkind =[""ACE_BBetty"",""ACE_BBetty_burried""]; trapvolume=""small"";trapdistance = 6; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "AntiTank minefield visable"], ["Action",  "trapkind =[""Mine"",""Mine"",""Hedgehog"",""Sign_Danger"",""Mine"",""Mine"",""Mine"",""Mine"",""Mine"",""Mine"",""Mine"",""Mine"",""Mine""];trapdistance = 6; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ],
		[ ["Item", "AntiTank minefield invisable"], ["Action",  "trapkind =[""Mine"",""Mine""];trapdistance = 6; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_request_area.sqf';" ] ]
        ]        
      ]
    ]
  ],
//Traps - roadside_charges 
["roadside_charges",
    [
      ["Caption", "roadside_charges"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
         [ ["Item", "Claymore - Single"], ["Action",  "trapkind =""ACE_Claymore"" ; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_rc_request.sqf';" ] ],
		[ ["Item", "M2Slam - Single"], ["Action",  "trapkind =""ACE_M2SLAM""; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_rc_request.sqf';" ] ],
		 [ ["Item", "Pomz - Single"], ["Action",  "trapkind =""ACE_Pomz""; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_rc_request.sqf';" ] ],
		  [ ["Item", "----Area spawn----"] ],
		 [ ["Item", "Claymore - Area"], ["Action",  "trapkind =""ACE_Claymore""; trapvolume=""small""; nul=[3] execVM 'mcc\general_scripts\traps\trap_rc_request_area.sqf';" ] ],
		 [ ["Item", "M2Slam - Area"], ["Action",  "trapkind =""ACE_M2SLAM""; trapvolume=""medium""; nul=[3] execVM 'mcc\general_scripts\traps\trap_rc_request_area.sqf';" ] ],
		 [ ["Item", "Pomz - Area"], ["Action",  "trapkind =""ACE_Pomz"";trapdistance = 6; trapvolume=""at""; nul=[3] execVM 'mcc\general_scripts\traps\trap_rc_request_area.sqf';" ] ]
        ]        
      ]
    ]
  ],
 
 //Traps - suicide bombers 
["sbombers",
    [
      ["Caption", "sbombers"],
      ["Items",
        [
         
		 [ ["Item", "----Single spawn----"] ],
         [ ["Item", "Civilian conceal weapon - Single"], ["Action",  "trapkind =[""Citizen1"",""Woodlander1"",""Woodlander2"",""Woodlander3"",""Woodlander4"",""Villager1"",""Villager2"",""Villager3"",""Villager4"",
""Worker1"",""Worker2"",""Worker3"",""Worker4""]; nul=[3] execVM 'mcc\general_scripts\traps\cw_request.sqf';" ] ],
		 [ ["Item", "Takistan Civilian conceal weapon - Single"], ["Action",  "trapkind =[""TK_CIV_Takistani01_EP1"",""TK_CIV_Takistani03_EP1"",""TK_CIV_Takistani02_EP1"",""TK_CIV_Takistani04_EP1"",""TK_CIV_Takistani05_EP1"",""TK_CIV_Takistani06_EP1"",""TK_CIV_Worker01_EP1"",""TK_CIV_Worker02_EP1""]; nul=[3] execVM 'mcc\general_scripts\traps\cw_request.sqf';" ] ],
		 [ ["Item", "----Area spawn----"] ],
		 [ ["Item", "Civilian conceal weapon - Area"], ["Action",  "trapkind =[""Citizen1"",""Woodlander1"",""Woodlander2"",""Woodlander3"",""Woodlander4"",""Villager1"",""Villager2"",""Villager3"",""Villager4"",
""Worker1"",""Worker2"",""Worker3"",""Worker4""]; nul=[3] execVM 'mcc\general_scripts\traps\cw_request_area.sqf';" ] ],
		 [ ["Item", "Civilian conceal weapon - Area"], ["Action",  "trapkind =[""TK_CIV_Takistani01_EP1"",""TK_CIV_Takistani03_EP1"",""TK_CIV_Takistani02_EP1"",""TK_CIV_Takistani04_EP1"",""TK_CIV_Takistani05_EP1"",""TK_CIV_Takistani06_EP1"",""TK_CIV_Worker01_EP1"",""TK_CIV_Worker02_EP1""]; nul=[3] execVM 'mcc\general_scripts\traps\cw_request_area.sqf';" ] ]
        ]        
      ]
    ]
  ],

//=================================================LHD - Main================================================
["LHD",
    [
      ["Caption", "LHD"],
      ["Items",
        [
         [ ["Item", "----Planes----"] ],
         [ ["Item", "Spawn AV8B GBU >"], ["SubMenu", "AV8B"] ],
		 [ ["Item", "Spawn AV8B2 GBU >"], ["SubMenu", "AV8B2"] ],
		 [ ["Item", "Spawn F35B >"], ["SubMenu", "F35B"] ],
		 [ ["Item", "----Helis----"] ],
		 [ ["Item", "Spawn Supercobra >"], ["SubMenu", "supercobra"] ],
		 [ ["Item", "Spawn Apache >"], ["SubMenu", "apache"] ],
		 [ ["Item", "Spawn UH1Y >"], ["SubMenu", "uh1y"] ],
		 [ ["Item", "Spawn LittleBird armed >"], ["SubMenu", "lba"] ],
		 [ ["Item", "Spawn LittleBird  >"], ["SubMenu", "lb"] ],
		 [ ["Item", "Spawn BlackHawk  >"], ["SubMenu", "blackhawk"] ],
		 [ ["Item", "Spawn Osprey"], ["Action",  "lhdtype=""MV22"";dirlhd=180;lhdpos=getmarkerpos ""pos8""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "----MTVR----"] ],
		 [ ["Item", "Spawn Ammo"], ["Action",  "lhdtype=""MtvrReammo"";dirlhd=90;lhdpos=getmarkerpos ""pos9""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "Spawn Refuel"], ["Action",  "lhdtype=""MtvrRefuel"";dirlhd=90;lhdpos=getmarkerpos ""pos10""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "Spawn Repair"], ["Action",  "lhdtype=""MtvrRepair"";dirlhd=90;lhdpos=getmarkerpos ""pos11""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ]
		 
        ]        
      ]
    ]
  ],
//LHD - AV8B
["AV8B",
    [
      ["Caption", "AV8B"],
      ["Items",
        [
         
         [ ["Item", "pos1"], ["Action",  "lhdtype=""AV8B"";dirlhd=270;lhdpos=getmarkerpos ""pos1""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		 [ ["Item", "pos2"], ["Action",  "lhdtype=""AV8B"";dirlhd=270;lhdpos=getmarkerpos ""pos2""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		 [ ["Item", "pos3"], ["Action",  "lhdtype=""AV8B"";dirlhd=270;lhdpos=getmarkerpos ""pos3""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		  [ ["Item", "pos4"], ["Action",  "lhdtype=""AV8B"";dirlhd=270;lhdpos=getmarkerpos ""pos4""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ]
		 
        ]        
      ]
    ]
  ],
//LHD - AV8B
["AV8B2",
    [
      ["Caption", "AV8B2"],
      ["Items",
        [
         
         [ ["Item", "pos1"], ["Action",  "lhdtype=""AV8B2"";dirlhd=270;lhdpos=getmarkerpos ""pos1""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		 [ ["Item", "pos2"], ["Action",  "lhdtype=""AV8B2"";dirlhd=270;lhdpos=getmarkerpos ""pos2""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		 [ ["Item", "pos3"], ["Action",  "lhdtype=""AV8B2"";dirlhd=270;lhdpos=getmarkerpos ""pos3""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		  [ ["Item", "pos4"], ["Action",  "lhdtype=""AV8B2"";dirlhd=270;lhdpos=getmarkerpos ""pos4""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ]
		 
        ]        
      ]
    ]
  ],
//LHD - F35B
["F35B",
    [
      ["Caption", "F35B"],
      ["Items",
        [
         
         [ ["Item", "pos1"], ["Action",  "lhdtype=""F35B"";dirlhd=270;lhdpos=getmarkerpos ""pos1""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		 [ ["Item", "pos2"], ["Action",  "lhdtype=""F35B"";dirlhd=270;lhdpos=getmarkerpos ""pos2""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		 [ ["Item", "pos3"], ["Action",  "lhdtype=""F35B"";dirlhd=270;lhdpos=getmarkerpos ""pos3""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ],
		  [ ["Item", "pos4"], ["Action",  "lhdtype=""F35B"";dirlhd=270;lhdpos=getmarkerpos ""pos4""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';"  ] ]
		 
        ]        
      ]
    ]
  ],
//LHD - SuperCobra
["supercobra",
    [
      ["Caption", "supercobra"],
      ["Items",
        [
         
         [ ["Item", "pos5"], ["Action",  "lhdtype=""AH1Z"";dirlhd=270;lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos6"], ["Action",  "lhdtype=""AH1Z"";dirlhd=270;lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos7"], ["Action",  "lhdtype=""AH1Z"";dirlhd=270;lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ]
				 
        ]        
      ]
    ]
  ],
//LHD - Apache longbow
["apache",
    [
      ["Caption", "apache"],
      ["Items",
        [
         
         [ ["Item", "pos5"], ["Action",  "lhdtype=""AH64D"";dirlhd=270;lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos6"], ["Action",  "lhdtype=""AH64D"";dirlhd=270;lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos7"], ["Action",  "lhdtype=""AH64D"";dirlhd=270;lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ]
				 
        ]        
      ]
    ]
  ],
//LHD - UH1Y
["uh1y",
    [
      ["Caption", "uh1y"],
      ["Items",
        [
         
         [ ["Item", "pos5"], ["Action",  "lhdtype=""uh1y"";dirlhd=270;lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos6"], ["Action",  "lhdtype=""uh1y"";dirlhd=270;lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos7"], ["Action",  "lhdtype=""uh1y"";dirlhd=270;lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ]
				 
        ]        
      ]
    ]
  ],
//Little Bird armed
["lba",
    [
      ["Caption", "lba"],
      ["Items",
        [
         
         [ ["Item", "pos5"], ["Action",  "lhdtype=""ACE_AH6"";dirlhd=270;lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos6"], ["Action",  "lhdtype=""ACE_AH6"";dirlhd=270;lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos7"], ["Action",  "lhdtype=""ACE_AH6"";dirlhd=270;lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ]
				 
        ]        
      ]
    ]
  ],
//Little Bird unarmed
["lb",
    [
      ["Caption", "lb"],
      ["Items",
        [
         
         [ ["Item", "pos5"], ["Action",  "lhdtype=""ACE_MH6"";dirlhd=270;lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos6"], ["Action",  "lhdtype=""ACE_MH6"";dirlhd=270;lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos7"], ["Action",  "lhdtype=""ACE_MH6"";dirlhd=270;lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ]
				 
        ]        
      ]
    ]
  ],
//Blackhawk
["blackhawk",
    [
      ["Caption", "blackhawk"],
      ["Items",
        [
         
         [ ["Item", "pos5"], ["Action",  "lhdtype=""MH60S"";dirlhd=270;lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos6"], ["Action",  "lhdtype=""MH60S"";dirlhd=270;lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ],
		 [ ["Item", "pos7"], ["Action",  "lhdtype=""MH60S"";dirlhd=270;lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';"  ] ]
				 
        ]        
      ]
    ]
  ],

//===================================================Convoy Generator ===========================================================================================
 //Convoy Generator
 ["Convoy",
    [
      ["convoy", "Convoy Generator"],
      ["Items",
        [
          
          [ ["Item", "Car 1 >"], ["SubMenu", "car_1"] ],
		  [ ["Item", "Car 1a >"], ["SubMenu", "car_1a"] ],
		  [ ["Item", "Car 2 >"], ["SubMenu", "car_2"] ],
		  [ ["Item", "Car 2a >"], ["SubMenu", "car_2a"] ],
		  [ ["Item", "Car 3 >"], ["SubMenu", "car_3"] ],	
		  [ ["Item", "Car 3a >"], ["SubMenu", "car_3a"] ],
          [ ["Item", "Car 4 >"], ["SubMenu", "car_4"] ],
		  [ ["Item", "Car 4a >"], ["SubMenu", "car_4a"] ],
          [ ["Item", "Car 5 >"], ["SubMenu", "car_5"] ],
		  [ ["Item", "Car 5a >"], ["SubMenu", "car_5a"] ],
          [ ["Item", "-"]], 		  
		  [ ["Item", "HVT's Car >"], ["SubMenu", "vip"] ],
		  [ ["Item", "Show Convoy content"], ["Action", "nul=[3] execVM 'mcc\general_scripts\convoy\show_convoy.sqf';"] ],
		  [ ["Item", "Place Convoy's WP"], ["Action", "nul=[3] execVM 'mcc\general_scripts\convoy\make_convoy_WP.sqf';"] ],
		  [ ["Item", "Start/reStart Convoy"], ["Action", "nul=[3] execVM 'mcc\general_scripts\convoy\start_convoy.sqf';"] ],
		  [ ["Item", "-"]],
		  [ ["Item", "Reset/add Waypoints"], ["Action", "nul=[3] execVM 'mcc\general_scripts\convoy\reset_convoy_WP.sqf';"] ],
		  [ ["Item", "Reset Convoy"], ["Action", "convoy_car1="""";convoy_car2="""";convoy_car3="""";convoy_car4="""";convoy_car5="""";isvip=0;"] ] 
                   
        ]        
      ]
    ]
  ],
  //convoy car 1
 ["car_1",
    [
      ["Caption", "car_1"],
      ["Items",  convoy_array1]
	]
  ],
   //convoy car 1a
 ["car_1a",
    [
      ["Caption", "car_1a"],
      ["Items",  convoy_array1a]
	]
  ],
  
  //convoy car 2
 ["car_2",
    [
      ["Caption", "car_2"],
	  ["Items",  convoy_array2]
	]
  ],
  //convoy car 2
 ["car_2a",
    [
      ["Caption", "car_2a"],
	  ["Items",  convoy_array2a]
	]
  ],
    //convoy car 3
 ["car_3",
    [
      ["Caption", "car_3"],
      ["Items",  convoy_array3]
	]
  ],
   //convoy car 3
 ["car_3a",
    [
      ["Caption", "car_3a"],
      ["Items",  convoy_array3a]
	]
  ],
    //convoy car 4
 ["car_4",
    [
      ["Caption", "car_4"],
      ["Items",  convoy_array4]
	]
  ],
   //convoy car 4a
 ["car_4a",
    [
      ["Caption", "car_4a"],
      ["Items",  convoy_array4a]
	]
  ],
    //convoy car 5
 ["car_5",
    [
      ["Caption", "car_5"],
      ["Items",  convoy_array5]
	]
  ],
   //convoy car 5a
 ["car_5a",
    [
      ["Caption", "car_5a"],
      ["Items",  convoy_array5a]
	]
  ],
  
  //HVT
["vip",
    [
      ["Caption", "vip"],
      ["Items",
	  [
	  [ ["Item", "Civilian - doctor Male"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Doctor""; isvip=1"] ],
	  [ ["Item", "Civilian - Citizen Male"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Citizen1""; isvip=1"] ],
	  [ ["Item", "Civilian - Businessman"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Functionary1""; isvip=1"] ],
	  [ ["Item", "Civilian - Policeman"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Policeman""; isvip=1"] ],
	  [ ["Item", "Civilian - Priest"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Priest"";isvip=1 "] ],
	  [ ["Item", "Civilian - Rocker"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""RU_Rocker1""; isvip=1"] ],
	  [ ["Item", "Civilian - Damsel"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Damsel1""; isvip=1"] ],
	  [ ["Item", "Civilian - Hooker"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Hooker1""; isvip=1"] ],
	  [ ["Item", "Civilian - Secretary"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""RU_Secretary1"";isvip=1 "] ],
	  [ ["Item", "Insurgent - Boss"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Ins_Lopotev""; isvip=1"] ],
	  [ ["Item", "Insurgent - Warlord"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""Ins_Bardak""; isvip=1"] ],
	  [ ["Item", "Resistance - Warlord"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""GUE_Commander""; isvip=1"] ],
	  [ ["Item", "UN - Officer"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""UN_CDF_Soldier_Officer_EP1""; isvip=1"] ],
	  [ ["Item", "Takistan army - officer"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""TK_Commander_EP1""; isvip=1"] ],
	  [ ["Item", "Takistan locals - Warlord"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""TK_GUE_Warlord_EP1""; isvip=1"] ],
	  [ ["Item", "USMC - SF soldier1"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""FR_GL""; isvip=1"] ],
	  [ ["Item", "USMC - SF soldier2"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""FR_Corpsman""; isvip=1"] ],
	  [ ["Item", "USMC - SF Commander"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""FR_Commander""; isvip=1"] ],
	  [ ["Item", "USMC -  soldier1"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""USMC_SoldierS_Engineer""; isvip=1"] ],
	  [ ["Item", "USMC -  soldier2"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""FR_Assault_GL""; isvip=1"] ],
	  [ ["Item", "USMC -  pilot"], ["Action", "convoy_car3=""SUV_TK_CIV_EP1""; vip=""USMC_Soldier_Pilot""; isvip=1"] ]

	  
	  ]
	 ]
	]
  ],
  

  
 //HIER
 ["doc",
    [
      ["doc", "Spawn doc"],
      ["Items",
        [
          
          [ ["Item", "doc1       >"], ["SubMenu", "doc1"] ],
		  [ ["Item", "doc2       >"], ["SubMenu", "doc2"] ],
		  [ ["Item", "doc3       >"], ["SubMenu", "doc3"] ],		  
          [ ["Item", "doc4       >"], ["SubMenu", "doc4"] ],
          [ ["Item", "doc5       >"], ["SubMenu", "doc5"] ],
          [ ["Item", "doc6       >"], ["SubMenu", "doc6"] ]		  	  
          
        ]        
      ]
    ]
  ],
//HIER
 ["doc1",
    [
      ["Caption", "doc1"],
      ["Items",  GEN_DOC1   ]

    ]
  ],
//HIER
 ["doc2",
    [
      ["Caption", "doc2"],
      ["Items",  GEN_DOC2   ]

    ]
  ],
//HIER
 ["doc3",
    [
      ["Caption", "doc3"],
      ["Items",  GEN_DOC3   ]

    ]
  ],
//HIER
 ["doc4",
    [
      ["Caption", "doc4"],
      ["Items",  GEN_DOC4   ]

    ]
  ],
//HIER
 ["doc5",
    [
      ["Caption", "doc5"],
      ["Items",  GEN_DOC5   ]

    ]
  ],
//HIER
 ["doc6",
    [
      ["Caption", "doc6"],
      ["Items",  GEN_DOC6   ]

    ]
  ],
 //HIER
 ["units",
    [
      ["units", "Spawn units"],
      ["Items",
        [
          
          [ ["Item", "Infantry1  >"], ["SubMenu", "soldier1"] ],
		  [ ["Item", "Infantry2  >"], ["SubMenu", "soldier2"] ],
		  [ ["Item", "Infantry3  >"], ["SubMenu", "soldier3"] ],		  
          [ ["Item", "Cars       >"], ["SubMenu", "car1"] ],
          [ ["Item", "Cars       >"], ["SubMenu", "car2"] ],
          [ ["Item", "Cars       >"], ["SubMenu", "car3"] ],		  
		  [ ["Item", "Tank       >"], ["SubMenu", "Tank"] ],
          [ ["Item", "Motorcycle >"], ["SubMenu", "motorcycle"] ],
          [ ["Item", "helicopter >"], ["SubMenu", "helicopter"] ],
          [ ["Item", "airplane   >"], ["SubMenu", "airplane"] ],  
		  [ ["Item", "ship       >"], ["SubMenu", "ship"] ]		  
          
        ]        
      ]
    ]
  ],
  //HIER
 ["tank",
    [
      ["Caption", "tank"],
      ["Items",  U_GEN_tank   ]

    ]
  ],
//TOT DAAR  
  //HIER
 ["soldier1",
    [
      ["Caption", "Soldier"],
      ["Items",  U_GEN_soldier   ]

    ]
  ],
//TOT DAAR
 //HIER
 ["soldier2",
    [
      ["Caption", "Soldier2"],
      ["Items",  U_GEN_soldier1   ]

    ]
  ],
//TOT DAAR
 //HIER
 ["soldier3",
    [
      ["Caption", "Soldier3"],
      ["Items",  U_GEN_soldier2   ]

    ]
  ],
//TOT DAAR
  //HIER
 ["Car1",
    [
      ["Caption", "Car2"],
      ["Items",  U_GEN_car   ]

    ]
  ],
//TOT DAAR
  //HIER
 ["Car2",
    [
      ["Caption", "Car2"],
      ["Items",  U_GEN_car1   ]

    ]
  ],
//TOT DAAR
  //HIER
 ["Car3",
    [
      ["Caption", "Car3"],
      ["Items",  U_GEN_car2   ]

    ]
  ],
//TOT DAAR
  //HIER
 ["Motorcycle",
    [
      ["Caption", "Motorcycle"],
      ["Items",  U_GEN_Motorcycle   ]

    ]
  ],
//TOT DAAR
  //HIER
 ["helicopter",
    [
      ["Caption", "helicopter"],
      ["Items",  U_GEN_helicopter   ]

    ]
  ],
//TOT DAAR
  //HIER
 ["airplane",
    [
      ["Caption", "airplane"],
      ["Items",  U_GEN_airplane   ]

    ]
  ],
//TOT DAAR
  //HIER
 ["ship",
    [
      ["Caption", "ship"],
      ["Items",  U_GEN_ship  ]

    ]
  ],
//TOT DAAR
  ["settings",
    [
      ["settings", "Spawn Settings"],
      ["Items",
        [
          
 		 [ ["Item", "Spawn empty on/off"], ["Action", "if mcc_spawnwithcrew then    { hint ""Spawns will be without crew       -> All spawns will be empty and on the ground.                                      ""; mcc_spawnwithcrew=false     ;} else { hint ""Spawns will have crew        -> Spawned Units will have crew and will actively patrol the zone!                            ""; mcc_spawnwithcrew=true;   };  "] ],         
         [ ["Item", "Spawn behavior       >"], ["SubMenu", "Behavior"] ],
		 [ ["Item", "Spawn Awereness      >"], ["SubMenu", "Awereness"] ],		 
		 [ ["Item", "Spawn track on/off"], ["Action", "if mcc_track_units then    { hint ""Future spawns will NOT be tracked    -> This is the default setting                                      ""; mcc_track_units=false     ;} else { hint ""Future spawns will be tracked        -> After spawn the tracking can not be disabled for that spawned unit. Only for future spawns          ""; mcc_track_units=true;   };  "] ]         		 

          
        ]        
      ]
    ]
  ],
//HIER
 ["groups",
    [
      ["groups", "Spawn Groups"],
      ["Items",
        [
          
          [ ["Item", "Infantry   >"], ["SubMenu", "group_infgroups"] ],
          [ ["Item", "Motorized  >"], ["SubMenu", "group_Motorized"] ],
          [ ["Item", "Mechanized >"], ["SubMenu", "group_Mechanized"] ],
          [ ["Item", "Armored    >"], ["SubMenu", "group_Armored"] ],
          [ ["Item", "Air        >"], ["SubMenu", "group_Air"] ]     
          
        ]        
      ]
    ]
  ],
//HIER
 ["group_Air",
    [
      ["Caption", "Air"],
      ["Items",  GEN_AIR   ]

    ]
  ],
//TOT DAAR
//HIER
 ["group_Armored",
    [
      ["Caption", "Armored"],
      ["Items",  GEN_ARMOR ]
    ]
  ],
//TOT DAAR
//HIER
 ["group_Mechanized",
    [
      ["Caption", "Mechanized infantry"],
      ["Items",  GEN_MECHANIZED]

    ]
  ],
//TOT DAAR
//HIER
 ["group_Motorized",
    [
      ["Caption", "Motorized infantry"],
      ["Items",GEN_MOTORIZED]
    ]
  ],
//TOT DAAR
//HIER
 ["group_infgroups",
    [
      ["Caption", "Infantry groups"],
      ["Items",  GEN_INFANTRY]
    ]
  ],
//TOT DAAR

 //HIER
 ["Factions",
    [
      ["Caption", "Factions"],
      ["Items",  U_FACTIONS]
    ]
  ],
//TOT DAAR

 //HIER guer START
 ["startmenu",
    [
      ["Caption", "Start Location"],
      ["Items",
        [
          
          [ ["Item", "West"], ["Action", "nul=[3] execVM 'mcc\general_scripts\mcc_start_location_west.sqf';"] ],
          [ ["Item", "East"], ["Action", "nul=[3] execVM 'mcc\general_scripts\mcc_start_location_east.sqf';"] ],
          [ ["Item", "Indep"], ["Action", "nul=[3] execVM 'mcc\general_scripts\mcc_start_location_guer.sqf';"] ],
		  [ ["Item", "SF HALO Infill"], ["Action", "nul=[3] execVM 'mcc\general_scripts\paradrop\sf_droppoint.sqf';"] ],
		  [ ["Item", "-"] ],
		  [ ["Item", "Disable Respawn  "], ["Action", "MCC_TRAINING = FALSE;publicVariable ""MCC_TRAINING"";hint ""Mission started, respawn is off"";"] ]
         
          
        ]        
      ]
    ]
  ],
//TOT DAAR
 //HIER guer START
 ["Safeload",
    [
      ["Caption", "Safe and load"],
      ["Items",
        [
          
          [ ["Item", "Save (to clipboard)"], ["Action", "mcc_safe='mcc_isloading=true;' + mcc_safe + 'mcc_isloading=false;';copyToClipboard mcc_safe;hint 'SAVED to Clipboard! Now you can paste this code where you like to save it. Simple copy it all back in clipboard (ctrl-c) and press load to rebuild your mission.';"] ],
          [ ["Item", "Load (from clipboard)"], ["Action", "mcc_safe = CopyFromClipboard; [] spawn compile mcc_safe;"] ]         
         
          
        ]        
      ]
    ]
  ],
//TOT DAAR
//HIER guer START
 ["Behavior",
    [
      ["Caption", "Behavior"],
      ["Items",
        [
          
          [ ["Item", "Agressive"], ["Action", "mcc_spawnbehavior=""MOVE"";hint ""AI Patrols zone. Will chase outside of zone on known contact. "" "] ],
          [ ["Item", "Defensive"], ["Action", "mcc_spawnbehavior=""NOFOLLOW"";hint ""AI Patrols zone. Will stay in zone even on known contact."" "] ],
          [ ["Item", "Passive  "], ["Action", "mcc_spawnbehavior=""NOMOVE"";hint ""AI does NOT patrol but stays passive. After contact they behave like Agressive."" "] ],
		  [ ["Item", "Fortify  "], ["Action", "mcc_spawnbehavior=""FORTIFY"";hint ""AI does NOT patrol but stays passive. After contact they behave like Agressive."" "] ],
          [ ["Item", "Ambush   "], ["Action", "mcc_spawnbehavior=""AMBUSH"";hint ""AI does NOT patrol but stays passive. After contact they behave like Agressive."" "] ]		  

         
          
        ]        
      ]
    ]
  ],
//TOT DAAR
//HIER guer START
 ["Awereness",
    [
      ["Caption", "Awereness"],
      ["Items",
        [
          
          [ ["Item", "Default"], ["Action", "mcc_awareness=""default"";hint ""AI Default awerness level."" "] ],
          [ ["Item", "Aware"], ["Action", "mcc_awareness=""Aware"";hint ""AI is aware of enemy in area."" "] ],
          [ ["Item", "Combat"], ["Action", "mcc_awareness=""Combat"";hint ""AI is paranoid and is in complete Combat awareness."" "] ],
		  [ ["Item", "stealth"], ["Action", "mcc_awareness=""stealth"";hint ""AI is a sneaky bastard. Crawling and sneaking."" "] ],
		  [ ["Item", "Careless"], ["Action", "mcc_awareness=""Careless"";hint ""AI behaves like humans. It doesnt give a shit."" "] ]         		  
          
        ]        
      ]
    ]
  ],
//TOT DAAR
//HIER
 ["Zone",
    [
      ["Caption", "Zone"],
      ["Items",
        [
          [ ["Item", "Sizes           >"], ["SubMenu", "Predefinedsizes"] ],
          [ ["Item", "Select zone     >"], ["SubMenu", "contextzone"] ],
          [ ["Item", "Zone properties >"], ["SubMenu", "Zoneprop"] ],
          [ ["Item", format["Create/update zone %1", mcc_zone_markername]], ["Action", "[] call PUM3_Exit;nul=[1] execVM 'mcc\general_scripts\mcc_make_the_marker.sqf';"] ]          
        ]        
      ]
    ]
  ],
//TOT DAAR
//HIER
 ["contextzone",
    [
      ["Caption", "contextzone"],
      ["Items",
        [
         [ ["Item", "1_ONE"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""1_ONE"";mcc_zone_number	=1;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 1_ONE"" "] ],
         [ ["Item", "2_TWO"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""2_TWO"";mcc_zone_number	=2;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 2_TWO"" "] ],
         [ ["Item", "3_THREE"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""3_THREE"";mcc_zone_number	=3;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 3_THREE"" "] ],
         [ ["Item", "4_FOUR"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""4_FOUR"";mcc_zone_number	=4;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 4_FOUR"" "] ],
         [ ["Item", "5_FIVE"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""5_FIVE"";mcc_zone_number	=5;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 5_FIVE"" "] ],
         [ ["Item", "6_SIX"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""6_SIX"";mcc_zone_number	=6;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 6_SIX"" "] ],
         [ ["Item", "7_SEVEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""7_SEVEN"";mcc_zone_number	=7;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 7_SEVEN"" "] ],
         [ ["Item", "8_EIGHT"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""8_EIGHT"";mcc_zone_number	=8;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 8_EIGHT"" "] ],
         [ ["Item", "9_NINE"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""9_NINE"";mcc_zone_number	=9;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 9_NINE"" "] ],
		 [ ["Item", "10_TEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""10_TEN"";mcc_zone_number	=10;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 10_TEN"" "] ],
 		 [ ["Item", "11_ELEVEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""11_ELEVEN"";mcc_zone_number	=11;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 11_ELEVEN"" "] ],
		 [ ["Item", "12_TWELVE"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""12_TWELVE"";mcc_zone_number	=12;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 12_TWELVE"" "] ],
		 [ ["Item", "13_THIRTEEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""13_THIRTEEN"";mcc_zone_number	=13;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 13_THIRTEEN"" "] ],
		 [ ["Item", "14_FOURTEEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""14_FOURTEEN"";mcc_zone_number	=14;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 14_FOURTEEN"" "] ],
		 [ ["Item", "15_FIFTEEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""15_FIFTEEN"";mcc_zone_number	=15;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 15_FIFTEEN"" "] ],
		 [ ["Item", "16_SIXTEEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""16_SIXTEEN"";mcc_zone_number	=16;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 16_SIXTEEN"" "] ],
		 [ ["Item", "17_SEVENTEEN"], ["Action", "mcc_zone_markername	setMarkerColorLocal ""ColorBlack"";mcc_zone_markername=""17_SEVENTEEN"";mcc_zone_number	=17;mcc_zone_markername	setMarkerColorLocal ""ColorYellow"";hint ""Currently working in zone 17_SEVENTEEN"" "] ]
        ]        
      ]
    ]
  ],
//TOT DAAR
//HIER
 ["Predefinedsizes",
    [
      ["Caption", "Predefined zone sizes"],
      ["Items",
        [
		 [ ["Item", "10x10"  ], ["Action", "mcc_zone_marker_X = 10;mcc_zone_marker_Y  =  10;"] ],
         [ ["Item", "50x50"  ], ["Action", "mcc_zone_marker_X = 50;mcc_zone_marker_Y  =  50;"] ],
         [ ["Item", "100x100"], ["Action", "mcc_zone_marker_X = 100;mcc_zone_marker_Y = 100;"] ],
         [ ["Item", "200x200"], ["Action", "mcc_zone_marker_X = 200;mcc_zone_marker_Y = 200;"] ],
         [ ["Item", "300x300"], ["Action", "mcc_zone_marker_X = 300;mcc_zone_marker_Y = 300;"] ],
         [ ["Item", "400x400"], ["Action", "mcc_zone_marker_X = 400;mcc_zone_marker_Y = 400;"] ],
         [ ["Item", "500x500"], ["Action", "mcc_zone_marker_X = 500;mcc_zone_marker_Y = 500;"] ],
         [ ["Item", "600x600"], ["Action", "mcc_zone_marker_X = 600;mcc_zone_marker_Y = 600;"] ],
         [ ["Item", "700x700"], ["Action", "mcc_zone_marker_X = 700;mcc_zone_marker_Y = 700;"] ],
         [ ["Item", "800x800"], ["Action", "mcc_zone_marker_X = 800;mcc_zone_marker_Y = 800;"] ],
         [ ["Item", "900x900"], ["Action", "mcc_zone_marker_X = 900;mcc_zone_marker_Y = 900;"] ],
		 [ ["Item", "1000x1000"], ["Action", "mcc_zone_marker_X = 1000;mcc_zone_marker_Y = 1000;"] ],
		 [ ["Item", "1200x1200"], ["Action", "mcc_zone_marker_X = 1200;mcc_zone_marker_Y = 1200;"] ],
		 [ ["Item", "1400x1400"], ["Action", "mcc_zone_marker_X = 1400;mcc_zone_marker_Y = 1400;"] ],
		 [ ["Item", "1600x1600"], ["Action", "mcc_zone_marker_X = 1600;mcc_zone_marker_Y = 1600;"] ],
		 [ ["Item", "1800x1800"], ["Action", "mcc_zone_marker_X = 1800;mcc_zone_marker_Y = 1800;"] ],
		 [ ["Item", "2000x2000"], ["Action", "mcc_zone_marker_X = 2000;mcc_zone_marker_Y = 2000;"] ],
		 [ ["Item", "2200x2200"], ["Action", "mcc_zone_marker_X = 2200;mcc_zone_marker_Y = 2200;"] ],
		 [ ["Item", "2400x2400"], ["Action", "mcc_zone_marker_X = 2400;mcc_zone_marker_Y = 2400;"] ],
		 [ ["Item", "2600x2600"], ["Action", "mcc_zone_marker_X = 2600;mcc_zone_marker_Y = 2600;"] ],
		 [ ["Item", "2800x2800"], ["Action", "mcc_zone_marker_X = 2800;mcc_zone_marker_Y = 2800;"] ]
        ]        
      ]
    ]
  ],
//TOT DAAR
//HIER
 ["Zoneprop",
    [
      ["Caption", "Zone properties"],
      ["Items",
        [
         [ ["Item", "Info on clear."], ["Action", "mcc_zoneinform = ""TRIGGER""; hint ""You will be informed if zone is empty. This will be done from next spawn in that zone."";"] ],
         [ ["Item", "NO Info on clear."], ["Action", "mcc_zoneinform = ""NOTHING"";hint ""You will NOT be informed if zone is empty. Unless a unit/group has already been spawned in a zone with this option on."";"] ]

        ]        
      ]
    ]
  ],
//TOT DAAR

//VKing adding ammo menu
["Spawnammo",
    [
      ["Caption", "Spawn Ammo"],
		["Items", 
			[
				[ ["Item", "Ammo      >"], ["SubMenu", "ammo"] ],
				[ ["Item", "ACE Ammo  >"], ["SubMenu", "aceammo"] ]
			]
		]
    ]
],

["ammo",
    [
      ["Caption", "Ammo"],
      ["Items",U_AMMO]
    ]
  ],
  
 ["aceammo",
    [
      ["Caption", "ACE Ammo"],
      ["Items",U_ACE_AMMO]
    ]
  ]


];
nul=_MenuStructureArray execVM "mcc\Dialogs\mcc_PopupMenu.sqf";
