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
         [ ["Item", "Menu2: LHD/AirDrop/UAV/CAS/Artillery/IED/Convoy > "], ["Action", "closeDialog 0;_ok = createDialog 'ExtrasDialog';"] ],
		 [ ["Item", "Menu3: Markers/Briefing/Brushes/Tasks/Evac/JukeBox> "], ["Action", "closeDialog 0;_ok = createDialog 'ExtrasDialog2';"] ],
		 [ ["Item", "Menu4: Triggers/Gita> "], ["Action", "closeDialog 0;_ok = createDialog 'ExtrasDialog3';"] ]
		]        
      ]
    ]
  ]
];

nul=_MenuStructureArray execVM "mcc\Dialogs\mcc_PopupMenu.sqf";
