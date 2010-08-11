//==========================================================================================
//=		Inorder to add new vehicle to spawn on the LHD, replace the _name with the _name of 
//=		 the new vhicle, and replace the old _class with the class of the new one.
//=							Shay-Gman - MARSOC
//==========================================================================================

_faction = toLower (faction player);
 switch (_faction) do
      {
		case "usmc": //Lhd spawned units for USMC
		{
	    plane1_name ="AV-8B (LGB)"; plane1_class= "AV8B";
		plane2_name ="AV-8B"; plane2_class= "AV8B2";
		plane3_name ="F-35B"; plane3_class= "F35B";
		
		heli1_name = "AH-1Z"; heli1_class = "AH1Z"; 
		heli2_name = "AH-64D"; heli2_class = "AH64D_Sidewinders"; 
		heli3_name = "MH-60S"; heli3_class = "MH60S"; 
		heli4_name = "AH6J Little Bird"; heli4_class = "AH6J_EP1"; 
		heli5_name = "MH-6 Little Bird"; heli5_class = "MH6J_EP1"; 
		heli6_name = "UH60M Medevac"; heli6_class = "UH60M_MEV_EP1"; 
		
		transport_name = "MV-22"; transport_class = "MV22"; 
		
		ammo_name = "MTVR - Ammo"; ammo_class = "MtvrReammo";
		refuel_name = "MTVR - Refuel"; refuel_class = "MtvrRefuel";
		repair_name = "MTVR - Repair"; repair_class = "MtvrRepair";
		};
		
		case "ru": //Lhd spawned units for RU
		{
	     plane1_name ="Aero L-39"; plane1_class= "L39_TK_EP1";
		plane2_name ="Su-34"; plane2_class= "Su34";
		plane3_name ="Su-39"; plane3_class= "Su39";
		
		heli1_name = "Ka-52"; heli1_class = "Ka52"; 
		heli2_name = "Mi-17 medevac"; heli2_class = "Mi17_medevac_RU"; 
		heli3_name = "Mi-17 rockets"; heli3_class = "Mi17_rockets_RU"; 
		heli4_name = "Mi-24P"; heli4_class = "Mi24_P"; 
		heli5_name = "Mi-24D"; heli5_class = "Mi24_D"; 
		heli6_name = "Mi-24V"; heli6_class = "Mi24_V"; 
		
		transport_name = "Antonov An-2"; transport_class = "An2_TK_EP1"; 
		
		ammo_name = "Kamaz - Ammo"; ammo_class = "KamazReammo";
		refuel_name = "Kamaz - Ammo"; refuel_class = "KamazRefuel";
		repair_name = "Kamaz - Ammo"; repair_class = "KamazRepair";
		};
		
		case "gue": //Lhd spawned units for Guerilias
		{
	     plane1_name ="Su-25"; plane1_class= "Su25_CDF";
		plane2_name ="Su-34"; plane2_class= "Su34";
		plane3_name ="Su-39"; plane3_class= "Su39";
		
		heli1_name = "Ka-52"; heli1_class = "Ka52"; 
		heli2_name = "Mi-17 Civilian"; heli2_class = "Mi17_Civilian"; 
		heli3_name = "Mi-17 rockets"; heli3_class = "Mi17_rockets_RU"; 
		heli4_name = "Mi-24P"; heli4_class = "Mi24_P"; 
		heli5_name = "Mi-24D"; heli5_class = "Mi24_D"; 
		heli6_name = "Mi-24V"; heli6_class = "Mi24_V"; 
		
		transport_name = "Antonov An-2"; transport_class = "An2_2_TK_CIV_EP1"; 
		
		ammo_name = "V35 - Ammo"; ammo_class = "V3S_Reammo_TK_GUE_EP1";
		refuel_name = "V35 - Ammo"; refuel_class = "V3S_Refuel_TK_GUE_EP1";
		repair_name = "V35 - Ammo"; repair_class = "V3S_Repair_TK_GUE_EP1";
		};
		
		case "ace_gru": //Lhd spawned units for Guerilias
		{
	     plane1_name ="Su-25"; plane1_class= "Su25_CDF";
		plane2_name ="Su-34"; plane2_class= "Su34";
		plane3_name ="Su-39"; plane3_class= "Su39";
		
		heli1_name = "Ka-52"; heli1_class = "Ka52"; 
		heli2_name = "Mi-17 medevac"; heli2_class = "Mi17_medevac_RU"; 
		heli3_name = "Mi-17 rockets"; heli3_class = "Mi17_rockets_RU"; 
		heli4_name = "Mi-24P"; heli4_class = "Mi24_P"; 
		heli5_name = "Mi-24D"; heli5_class = "Mi24_D"; 
		heli6_name = "Mi-24V"; heli6_class = "Mi24_V"; 
		
		transport_name = "Antonov An-2"; transport_class = "An2_TK_EP1"; 
		
		ammo_name = "Kamaz - Ammo"; ammo_class = "KamazReammo";
		refuel_name = "Kamaz - Ammo"; refuel_class = "KamazRefuel";
		repair_name = "Kamaz - Ammo"; repair_class = "KamazRepair";
		};
		
		case "bis_us":  //Lhd spawned units for US army
		{
	    plane1_name ="AV-8B (LGB)"; plane1_class= "AV8B";
		plane2_name ="AV-8B"; plane2_class= "AV8B2";
		plane3_name ="F-35B"; plane3_class= "F35B";
		
		heli1_name = "AH-1Z"; heli1_class = "AH1Z"; 
		heli2_name = "AH-64D"; heli2_class = "AH64D_EP1"; 
		heli3_name = "MH-60S"; heli3_class = "MH60S"; 
		heli4_name = "AH6J Little Bird"; heli4_class = "AH6J_EP1"; 
		heli5_name = "MH-6 Little Bird"; heli5_class = "MH6J_EP1"; 
		heli6_name = "UH60M Medevac"; heli6_class = "UH60M_MEV_EP1"; 
		
		transport_name = "CH-47 Chinook"; transport_class = "CH_47F_EP1"; 
		
		ammo_name = "MTVR - Ammo"; ammo_class = "MtvrReammo_DES_EP1";
		refuel_name = "MTVR - Refuel"; refuel_class = "MtvrRefuel_DES_EP1";
		repair_name = "MTVR - Repair"; repair_class = "MtvrRepair_DES_EP1";
		};
		
		case "bis_tk": //Lhd spawned units for Takistans army
		{
	    plane1_name ="Aero L-39"; plane1_class= "L39_TK_EP1";
		plane2_name ="Su-25"; plane2_class= "Su25_TK_EP1";
		plane3_name ="Su-39"; plane3_class= "Su39";
		
		heli1_name = "Ka-52"; heli1_class = "Ka52"; 
		heli2_name = "Mi-17"; heli2_class = "Mi17_TK_EP1"; 
		heli3_name = "Mi-17 rockets"; heli3_class = "Mi17_rockets_RU"; 
		heli4_name = "Mi-24P"; heli4_class = "Mi24_P"; 
		heli5_name = "Mi-24D"; heli5_class = "Mi24_D_TK_EP1"; 
		heli6_name = "UH1H"; heli6_class = "UH1H_TK_EP1"; 
		
		transport_name = "Antonov An-2"; transport_class = "An2_TK_EP1"; 
		
		ammo_name = "Ural - Ammo"; ammo_class = "UralReammo_TK_EP1";
		refuel_name = "Ural - Ammo"; refuel_class = "UralRefuel_TK_EP1";
		repair_name = "Ural - Ammo"; repair_class = "UralSalvage_TK_EP1";
		};
		
		case "bis_tk_gue": //Lhd spawned units for Takistans Gurilias
		{
	    plane1_name ="Su-25"; plane1_class= "Su25_CDF";
		plane2_name ="Su-34"; plane2_class= "Su34";
		plane3_name ="Su-39"; plane3_class= "Su39";
		
		heli1_name = "Ka-52"; heli1_class = "Ka52"; 
		heli2_name = "Mi-17 Civilian"; heli2_class = "Mi17_Civilian"; 
		heli3_name = "Mi-17 rockets"; heli3_class = "Mi17_rockets_RU"; 
		heli4_name = "Mi-24P"; heli4_class = "Mi24_P"; 
		heli5_name = "Mi-24D"; heli5_class = "Mi24_D"; 
		heli6_name = "UH1H"; heli6_class = "UH1H_TK_GUE_EP1"; 
		
		transport_name = "Antonov An-2"; transport_class = "An2_2_TK_CIV_EP1"; 
		
		ammo_name = "V35 - Ammo"; ammo_class = "V3S_Reammo_TK_GUE_EP1";
		refuel_name = "V35 - Ammo"; refuel_class = "V3S_Refuel_TK_GUE_EP1";
		repair_name = "V35 - Ammo"; repair_class = "V3S_Repair_TK_GUE_EP1";
		};
      };
 