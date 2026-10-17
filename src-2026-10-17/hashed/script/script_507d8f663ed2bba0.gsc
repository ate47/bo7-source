#using script_194f8050b4a6d3a1;
#using script_29f9024aee246a8e;
#using scripts\common\utility;
#using scripts\mp\supers;

#namespace assault_shield;

// Namespace assault_shield
// Params 0, eflags: 0x1
// Checksum 0x278cd9bf, Offset: 0xae
// Size: 0x17
function autoexec main()
{
    supers_mp::function_adf2820d5daa2e81( getxhash( "super_assault_shield" ), &assault_shield_init );
}

// Namespace assault_shield
// Params 0
// Checksum 0x83a4889a, Offset: 0xcd
// Size: 0x4f
function assault_shield_init()
{
    super_riotshield::riotshield_init( "super_assault_shield", "projectile_sat_me_riotshield" );
    utility::registersharedfunc( #"super_riotshield", #"hash_5bc9402162a82eca", &function_d23b435db79b7cef );
    utility::registersharedfunc( #"super_riotshield", #"hash_1a2b1e2fa879fd26", &function_9ed9cfe9b3488d5f );
}

// Namespace assault_shield
// Params 0
// Checksum 0x8f22245d, Offset: 0x124
// Size: 0x40
function function_d23b435db79b7cef()
{
    superbundle = level.riotshieldglobals.superbundle;
    
    if ( superbundle.assaultshieldhudoutline != %"" )
    {
        thread drawhudoutline();
    }
}

// Namespace assault_shield
// Params 0
// Checksum 0x6a4833aa, Offset: 0x16c
// Size: 0xcf
function drawhudoutline()
{
    self endon( #"death_or_disconnect" );
    self endon( #"hash_df941e17fc86f0d1" );
    superbundle = level.riotshieldglobals.superbundle;
    
    while ( true )
    {
        foreach ( enemy in teams::getenemyplayers( self.team, 0 ) )
        {
            enemy hudoutlineenableforclients( [ self ], superbundle.assaultshieldhudoutline );
        }
        
        waitframe();
    }
}

// Namespace assault_shield
// Params 0
// Checksum 0x7922bde9, Offset: 0x243
// Size: 0xc7
function function_9ed9cfe9b3488d5f()
{
    self notify( #"hash_df941e17fc86f0d1" );
    superbundle = level.riotshieldglobals.superbundle;
    
    if ( superbundle.assaultshieldhudoutline != %"" )
    {
        foreach ( enemy in teams::getenemyplayers( self.team, 0 ) )
        {
            enemy hudoutlinedisableforclients( [ self ] );
        }
    }
}

