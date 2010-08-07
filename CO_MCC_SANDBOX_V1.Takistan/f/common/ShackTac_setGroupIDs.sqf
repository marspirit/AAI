// F2A2 - ShackTactical Group IDs
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// Automatically assigns intelligible names to groups in USMC, CDF, Chedaki, Russia, and Guerillas:

#include "f_preprocessorUtil.h"

#define f_SETGROUP(f_DESC,f_SUFFIX)                                                                         \
    {                                                                                                       \
        if (typeName _x == "ARRAY") then {                                                                  \
            {                                                                                               \
                private ["_factId", "_idx", "_factName"];                                                   \
                _factId = faction _x;                                                                       \
                _idx = f_FACTIDS find _factId;                                                              \
                if (_idx > -1) then {_factName = f_FACTNAMES select _idx;} else {_factName = _factId;};     \
                _x setGroupID [format ["%1 %2",_factName,f_DESC],"groupColor0"];                            \
            } forEach _x;                                                                                   \
        }                                                                                                   \
    } forEach [units f_CAT(GrpUSMC_,f_SUFFIX), units f_CAT(GrpCDF_,f_SUFFIX), units f_CAT(GrpRU_,f_SUFFIX), units f_CAT(GrpINS_,f_SUFFIX), units f_CAT(GrpGUE_,f_SUFFIX)];

#define f_PLT(N) f_CAT(N,Plt)
#define f_PLT_S(N) f_STR(f_CAT(f_PLT(N), ))
#define f_PLT_G(N) f_CAT(f_PLT(N),_)

#define f_SETSQUAD(f_PLATOON,f_NAME,f_INITIAL)                                                               \
    f_SETGROUP(f_PLT_S(f_PLATOON) + f_STR(f_NAME) + " SL -",f_CAT(f_PLT_G(f_PLATOON),f_NAME))                \
    f_SETGROUP(f_PLT_S(f_PLATOON) + f_STR(f_NAME) + " FT1 -",f_CAT(f_PLT_G(f_PLATOON),f_CAT(f_INITIAL,1)))   \
    f_SETGROUP(f_PLT_S(f_PLATOON) + f_STR(f_NAME) + " FT2 -",f_CAT(f_PLT_G(f_PLATOON),f_CAT(f_INITIAL,2)))   \
    f_SETGROUP(f_PLT_S(f_PLATOON) + f_STR(f_NAME) + " FT3 -",f_CAT(f_PLT_G(f_PLATOON),f_CAT(f_INITIAL,3)))

// Faction Hashes (REQUIRED FOR #defines TO WORK!)
f_FACTIDS = ["USMC", "CDF", "RU", "INS", "GUE"];
f_FACTNAMES = ["USMC", "CDF", "Russian", "ChDKZ", "NAPA"];

// 1Plt

// === Squads ===
f_SETSQUAD(1,Alpha,A);
f_SETSQUAD(1,Bravo,B);
f_SETSQUAD(1,Charlie,C);
f_SETSQUAD(1,Delta,D);
f_SETSQUAD(1,Echo,E);

f_SETGROUP("1Plt HQ",1Plt_PltHQ);

// === Weapons Teams ===
f_SETGROUP("MMG1 -",MMG1);
f_SETGROUP("MMG2 -",MMG2);
f_SETGROUP("MMG3 -",MMG3);

f_SETGROUP("HMG1 -",HMG1);
f_SETGROUP("HMG2 -",HMG2);
f_SETGROUP("HMG3 -",HMG3);

f_SETGROUP("MAT1 -",MAT1);
f_SETGROUP("MAT2 -",MAT2);
f_SETGROUP("MAT3 -",MAT3);

f_SETGROUP("HAT1 -",HAT1);
f_SETGROUP("HAT2 -",HAT2);
f_SETGROUP("HAT3 -",HAT3);

f_SETGROUP("ST1 -",ST1);

f_SETGROUP("SF1 -",SF1);
f_SETGROUP("SF2 -",SF2);

f_SETGROUP("Foxtrot Lead -",Foxtrot_Lead);
f_SETGROUP("Foxtrot 1 -",Foxtrot_1);
f_SETGROUP("Foxtrot 2 -",Foxtrot_2);
f_SETGROUP("Foxtrot 3 -",Foxtrot_3);

f_SETGROUP("Golf Lead -",Golf_Lead);
f_SETGROUP("Golf 1 -",Golf_1);
f_SETGROUP("Golf 2 -",Golf_2);
f_SETGROUP("Golf 3 -",Golf_3);






//===================================================================================== 

if (true) exitWith {};

