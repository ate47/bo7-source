#using script_2ad7dff7e51218da;
#using script_6995a3eb7d571a9f;
#using scripts\common\killstreaks\killstreak_shared;

#namespace juggernaut_instant;

// Namespace juggernaut_instant
// Params 0, eflags: 0x1
// Checksum 0x3f7bedfa, Offset: 0x8c
// Size: 0x17
function autoexec main()
{
    killstreak_shared::registerkillstreakinitfunction( getxhash( "juggernaut_instant" ), &killstreakinit );
}

// Namespace juggernaut_instant
// Params 0
// Checksum 0x1e7991a9, Offset: 0xab
// Size: 0x13
function killstreakinit()
{
    killstreaks::registerkillstreak( "juggernaut_instant", &function_ed3a4a8ef7047b8f );
}

// Namespace juggernaut_instant
// Params 1
// Checksum 0xb2da2c1, Offset: 0xc6
// Size: 0x17
function function_ed3a4a8ef7047b8f( streakinfo )
{
    juggernaut::tryusejuggernautfromstruct( streakinfo, 1 );
}

