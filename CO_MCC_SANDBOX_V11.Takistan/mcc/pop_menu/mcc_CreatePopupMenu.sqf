//Make some cool arrays to make config file dynamic read

// NOW make that menu finaly FFS
_MenuStructureArray =
[
 ["MainMenu",
   [
     ["Caption", format["MCC, %1 (%2)",mcc_faction, mcc_sidename ]],
     ["Items",
       [
         [ ["Item", "Navigation >"], ["SubMenu", "nav"] ]
		]
     ]
   ]
 ],

 //=====================================Navigation=================================
["nav",
    [
      ["Caption", "Navigation"],
      ["Items",
        [
         [ ["Item", "Menu 1: > "], ["Action", "closeDialog 0;_ok = createDialog 'ExtrasDialog';"] ],
		 [ ["Item", "Call Evac >"], ["SubMenu", "evac"] ]
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
  ]
];
nul=_MenuStructureArray execVM "mcc\Dialogs\mcc_PopupMenu.sqf";
