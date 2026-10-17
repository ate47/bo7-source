#using scripts\common\metabone;

#namespace zombie_galileo_metabones;

// Namespace zombie_galileo_metabones
// Params 0, eflags: 0x1
// Checksum 0xdf6d8465, Offset: 0x9e
// Size: 0x13
function autoexec main()
{
    metabone::function_cd947f1a3391c065( "zombie_galileo", &on_metabone_destroyed );
}

// Namespace zombie_galileo_metabones
// Params 0
// Checksum 0xc68bbdb5, Offset: 0xb9
// Size: 0x11
function init_zombie_galileo_metabones()
{
    level.var_ebdd7f5c86437212 = metabone::function_30d906ccb9fe2142();
}

// Namespace zombie_galileo_metabones
// Params 0
// Checksum 0xef0a99c2, Offset: 0xd2
// Size: 0x101
function init_metabones_state()
{
    all_metabones = metabone::function_30d906ccb9fe2142();
    
    foreach ( metabone_name in level.var_ebdd7f5c86437212 )
    {
        all_metabones = arrayremove( all_metabones, metabone_name );
        self setscriptablepartstate( metabone_name, "armored" );
    }
    
    foreach ( metabone_name in all_metabones )
    {
        metabone::set_metabone_active( metabone_name, 0 );
    }
}

// Namespace zombie_galileo_metabones
// Params 1, eflags: 0x4
// Checksum 0x2307c79b, Offset: 0x1db
// Size: 0x1e
function private on_metabone_destroyed( params )
{
    function_6f9f3a371b224bac( params.metabone_name );
}

// Namespace zombie_galileo_metabones
// Params 1, eflags: 0x4
// Checksum 0xbde04b07, Offset: 0x201
// Size: 0x5c
function private function_6f9f3a371b224bac( metabone_name )
{
    if ( self getscriptablehaspart( metabone_name ) )
    {
        self setscriptablepartstate( metabone_name, "exposed" );
        metabone::set_metabone_state( metabone_name, "exposed" );
        level.var_ebdd7f5c86437212 = arrayremove( level.var_ebdd7f5c86437212, metabone_name );
        return;
    }
    
    assertmsg( "<dev string:x24>" + metabone_name );
}

