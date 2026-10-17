#namespace namespace_41b3c10212179324;

// Namespace namespace_41b3c10212179324
// Params 0
// Checksum 0xc72c4a4f, Offset: 0x76
// Size: 0x2
function function_115f39adad17c83b()
{
    
}

// Namespace namespace_41b3c10212179324
// Params 0
// Checksum 0xe09f2a3c, Offset: 0x80
// Size: 0x2
function init_zombie_phobos_spithose()
{
    
}

/#

    // Namespace namespace_41b3c10212179324
    // Params 0, eflags: 0x4
    // Checksum 0x4eed869, Offset: 0x8a
    // Size: 0x16, Type: dev
    function private debug_spit()
    {
        return getdvarint( @"hash_be2ddf6ebf01a118", 0 ) > 0;
    }

    // Namespace namespace_41b3c10212179324
    // Params 2, eflags: 0x4
    // Checksum 0x4ecccbb0, Offset: 0xa8
    // Size: 0x5b, Type: dev
    function private spit_print( text, pos )
    {
        if ( debug_spit() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:x24>" + text, ( 1, 0, 0 ) );
        }
    }

#/
