#using scripts\common\metabone;

#namespace zombie_base_armored_metabones;

// Namespace zombie_base_armored_metabones
// Params 0, eflags: 0x1
// Checksum 0x6d0a70ab, Offset: 0xb5
// Size: 0x21
function autoexec main()
{
    var_fb56e56d94279338 = "zombie_base_armored";
    metabone::function_cd947f1a3391c065( var_fb56e56d94279338, &on_metabone_destroyed );
}

// Namespace zombie_base_armored_metabones
// Params 1, eflags: 0x4
// Checksum 0xf61cb2aa, Offset: 0xde
// Size: 0x1e
function private on_metabone_destroyed( params )
{
    function_6f9f3a371b224bac( params.metabone_name );
}

// Namespace zombie_base_armored_metabones
// Params 1, eflags: 0x4
// Checksum 0xe46cd7ab, Offset: 0x104
// Size: 0x5a
function private function_6f9f3a371b224bac( metabone_name )
{
    if ( self getscriptablehaspart( metabone_name ) )
    {
        self setscriptablepartstate( metabone_name, "destroyed" );
        metabone::set_metabone_state( metabone_name, "exposed" );
        
        if ( metabone_name == "armored_head" )
        {
            metabone::set_metabone_active( metabone_name, 1 );
        }
        
        return;
    }
    
    assertmsg( "<dev string:x24>" + metabone_name );
}

