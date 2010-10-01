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
         [ ["Item", "Menu 2: > "], ["Action", "closeDialog 0;_ok = createDialog 'ExtrasDialog';"] ],
		 [ ["Item", "Menu 3: > "], ["Action", "closeDialog 0;_ok = createDialog 'ExtrasDialog2';"] ]
		]        
      ]
    ]
  ]
];

nul=_MenuStructureArray execVM "mcc\Dialogs\mcc_PopupMenu.sqf";
