#using scripts\common\callbacks;
#using scripts\mp\loot\common_cache;

#namespace specialty_looter;

// Namespace specialty_looter
// Params 0, eflags: 0x1
// Checksum 0xcb94f11, Offset: 0x8a
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"lootcacheaddadditionalloot", &addadditionalloot );
}

// Namespace specialty_looter
// Params 1, eflags: 0x4
// Checksum 0x6d706b87, Offset: 0xaa
// Size: 0x95
function private addadditionalloot( params )
{
    if ( isplayer( self ) && self hasperk( "specialty_looter" ) )
    {
        chance = level.perkbundles[ "specialty_looter" ].looter_chance;
        
        if ( randomfloat( 100 ) < chance )
        {
            var_cab6559204c0e0d6 = common_cache::function_73fc13f2febd3a2( "specialty_looter" );
            common_cache::function_a136b84fc5c0dfab( params.cache, var_cab6559204c0e0d6.spawnlist, var_cab6559204c0e0d6.spawncount, 1 );
        }
    }
}

