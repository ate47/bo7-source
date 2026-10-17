#using script_3ef59a6cab975205;
#using scripts\common\metabone;

#namespace zombie_amalgam_metabones;

// Namespace zombie_amalgam_metabones
// Params 0, eflags: 0x1
// Checksum 0xe0c0beb9, Offset: 0x88
// Size: 0x21
function autoexec main()
{
    var_fb56e56d94279338 = "zombie_amalgam";
    metabone::function_cd947f1a3391c065( var_fb56e56d94279338, &on_metabone_destroyed );
}

// Namespace zombie_amalgam_metabones
// Params 1, eflags: 0x4
// Checksum 0x41c17760, Offset: 0xb1
// Size: 0x1e
function private on_metabone_destroyed( params )
{
    function_6f9f3a371b224bac( params.metabone_name );
}

// Namespace zombie_amalgam_metabones
// Params 1, eflags: 0x4
// Checksum 0x651afbec, Offset: 0xd7
// Size: 0x32
function private function_6f9f3a371b224bac( metabone_name )
{
    if ( self getscriptablehaspart( metabone_name ) )
    {
        zombie_amalgam_parts::destroy_part( metabone_name );
        return;
    }
    
    assertmsg( "<dev string:x24>" + metabone_name );
}

