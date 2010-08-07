//Make some cool arrays to make config file dynamic read

// NOW make that menu finaly FFS
_MenuStructureArray =
[
 ["MainMenu",
   [
     ["Caption", format["MCC, %1 (%2)",mcc_faction, mcc_sidename ]],
     ["Items",
       [
         [ ["Item", "Spawn on LHD >"], ["SubMenu", "LHD"] ],
		 [ ["Item", "Place Booby Traps >"], ["SubMenu", "traps"] ],
		 [ ["Item", "Convoy Generator >"], ["SubMenu", "convoy"] ],
		 [ ["Item", "Extra >"], ["SubMenu", "extras"] ]
//        [ ["Item", "Safe/load             >"], ["SubMenu", "Safeload"] ],
	      
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
		 [ ["Item", "-"] ],
		 [ ["Item", "Put Hostages >"], ["SubMenu", "hostages"] ],
		 [ ["Item", "Put artillery site >"], ["SubMenu", "artysite"] ],
		 [ ["Item", "Put UAV site >"], ["SubMenu", "uav"] ],
		 [ ["Item", "-"] ],
		 [ ["Item", "Call Artillery>"], ["SubMenu", "Artillery"] ],
		 [ ["Item", "Call Evac >"], ["SubMenu", "evac"] ]
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
 
//Evac
["evac",
    [
      ["Caption", "evac"],
      ["Items",
        [
		[ ["Item", "----Spawn----"] ],
		[ ["Item", "Spwan heli - Small (LHD)"], ["Action",  "heli_size = 0; nul=[3] execVM 'mcc\general_scripts\evac\request_heli.sqf';"] ],
		[ ["Item", "Spwan heli - Big (LHD)"], ["Action",  "heli_size = 1; nul=[3] execVM 'mcc\general_scripts\evac\request_heli.sqf';"] ],
		[ ["Item", "Relocate Spawned Evac (MapClick)"], ["Action",  "heli_size = 2; nul=[3] execVM 'mcc\general_scripts\evac\request_heli_mc.sqf';"] ],
		[ ["Item", "----Manage----"] ],
		[ ["Item", "Delete pilot"], ["Action",  "evac_d = 0; nul=[3] execVM 'mcc\general_scripts\evac\delete_heli.sqf';"] ],
		[ ["Item", "Respawn pilot"], ["Action",  "evac_d = 1; nul=[3] execVM 'mcc\general_scripts\evac\delete_heli.sqf';"] ],
		[ ["Item", "Delete all"], ["Action",  "evac_d = 2; nul=[3] execVM 'mcc\general_scripts\evac\delete_heli.sqf';"] ],
		[ ["Item", "----Start----"] ],
		[ ["Item", "Start-Evac (3 Wp)"], ["Action",  "nul=[3] execVM 'mcc\general_scripts\evac\move_heli.sqf'"] ],
		[ ["Item", "Start-Evac single WP"], ["Action",  "nul=[3] execVM 'mcc\general_scripts\evac\add_wp_heli.sqf'"] ],
		[ ["Item", "Evac-Return to LHD"], ["Action",  "nul=[3] execVM 'mcc\general_scripts\evac\return_to_lhd.sqf'"] ],
		[ ["Item", "----Set fly In Hight----"] ],
		[ ["Item", "50 meters"], ["Action",  "fly_in_hight= 50"] ],
		[ ["Item", "100 meters"], ["Action",  "fly_in_hight= 100"] ],
		[ ["Item", "200 meters"], ["Action",  "fly_in_hight= 200"] ],
		[ ["Item", "300 meters"], ["Action",  "fly_in_hight= 300"] ],
		[ ["Item", "400 meters"], ["Action",  "fly_in_hight= 400"] ],
		[ ["Item", "500 meters"], ["Action",  "fly_in_hight= 500"] ]
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
         [ ["Item", format["Spawn %1 >",plane1_name ]], ["SubMenu", "plane1"] ],
		 [ ["Item", format["Spawn %1 >",plane2_name ]], ["SubMenu", "plane2"] ],
		 [ ["Item", format["Spawn %1 >",plane3_name ]], ["SubMenu", "plane3"] ],
		 [ ["Item", "----Helicopters----"] ],
		 [ ["Item", format["Spawn %1 >",heli1_name ]], ["SubMenu", "heli1"] ],
		 [ ["Item", format["Spawn %1 >",heli2_name ]], ["SubMenu", "heli2"] ],
		 [ ["Item", format["Spawn %1 >",heli3_name ]], ["SubMenu", "heli3"] ],
		 [ ["Item", format["Spawn %1 >",heli4_name ]], ["SubMenu", "heli4"] ],
		 [ ["Item", format["Spawn %1 >",heli5_name ]], ["SubMenu", "heli5"] ],
		 [ ["Item", format["Spawn %1 >",heli6_name ]], ["SubMenu", "heli6"] ],
		 [ ["Item", format["Spawn transport: %1 >",transport_name ]], ["Action", format["lhdtype=""%1"";if (((getdir deck) +90) > 360) then {dirlhd = (getdir deck +90)- 360;} else {dirlhd = getdir deck +90};lhdpos=getmarkerpos ""pos8""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", transport_class ]] ],
		 [ ["Item", "----Trucks----"] ],
		 [ ["Item", format["Spawn %1 >",ammo_name ]], ["Action", format["lhdtype=""%1"";dirlhd = getdir deck;lhdpos=getmarkerpos ""pos9""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", ammo_class ]] ],
		 [ ["Item", format["Spawn %1 >",refuel_name ]], ["Action", format["lhdtype=""%1"";dirlhd = getdir deck;lhdpos=getmarkerpos ""pos10""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", refuel_class ]] ],
		 [ ["Item", format["Spawn %1 >",repair_name ]], ["Action", format["lhdtype=""%1"";dirlhd = getdir deck;lhdpos=getmarkerpos ""pos11""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", repair_class ]] ]
		]        
      ]
    ]
  ],
//LHD - plane1
["plane1",
    [
      ["Caption", "plane1"],
      ["Items",
        [
         [ ["Item", "pos1"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos1""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane1_class ]] ],
		 [ ["Item", "pos2"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos2""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane1_class ]] ],
		 [ ["Item", "pos3"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos3""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane1_class ]] ]
		]        
      ]
    ]
  ],
//LHD - plane2
["plane2",
    [
      ["Caption", "plane2"],
      ["Items",
        [
         [ ["Item", "pos1"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos1""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane2_class ]] ],
		 [ ["Item", "pos2"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos2""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane2_class ]] ],
		 [ ["Item", "pos3"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos3""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane2_class ]] ]
		 ]        
      ]
    ]
  ],
//LHD - plane3
["plane3",
    [
      ["Caption", "plane3"],
      ["Items",
        [
         [ ["Item", "pos1"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos1""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane3_class ]] ],
		 [ ["Item", "pos2"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos2""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane3_class ]] ],
		 [ ["Item", "pos3"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos3""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn_plane.sqf';", plane3_class ]] ]
		]
	  ]
    ]
  ],
//LHD - heli1
["heli1",
    [
      ["Caption", "heli1"],
      ["Items",
        [
         [ ["Item", "pos5"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli1_class ]] ],
		 [ ["Item", "pos6"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli1_class ]] ],
		 [ ["Item", "pos7"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli1_class ]] ]
		]        
      ]
    ]
  ],
//LHD - heli2 
["heli2",
    [
      ["Caption", "heli2"],
      ["Items",
        [
        [ ["Item", "pos5"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli2_class ]] ],
		[ ["Item", "pos6"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli2_class ]] ],
		[ ["Item", "pos7"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli2_class ]] ]
        ]        
      ]
    ]
  ],
//LHD - heli3
["heli3",
    [
      ["Caption", "heli3"],
      ["Items",
        [
        [ ["Item", "pos5"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli3_class ]] ],
		[ ["Item", "pos6"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli3_class ]] ],
		[ ["Item", "pos7"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli3_class ]] ]
		]        
      ]
    ]
  ],
//LHD - heli4
["heli4",
    [
      ["Caption", "heli4"],
      ["Items",
        [
        [ ["Item", "pos5"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli4_class ]] ],
		[ ["Item", "pos6"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli4_class ]] ],
		[ ["Item", "pos7"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli4_class ]] ]
		]        
      ]
    ]
  ],
//LHD - heli5
["heli5",
    [
      ["Caption", "heli5"],
      ["Items",
        [
         [ ["Item", "pos5"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli5_class ]] ],
		[ ["Item", "pos6"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli5_class ]] ],
		[ ["Item", "pos7"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli5_class ]] ]
		]        
      ]
    ]
  ],
//LHD - heli6
["heli6",
    [
      ["Caption", "heli6"],
      ["Items",
        [
        [ ["Item", "pos5"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos5""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli6_class ]] ],
		[ ["Item", "pos6"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos6""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli6_class ]] ],
		[ ["Item", "pos7"], ["Action", format["lhdtype=""%1"";if (((getdir deck) + 180) > 360) then {dirlhd = (getdir deck + 180)- 360;} else {dirlhd = getdir deck + 180};lhdpos=getmarkerpos ""pos7""; nul=[3] execVM 'mcc\general_scripts\LHD\lhd_spawn.sqf';", heli6_class ]] ]
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
