#namespace util;

// Namespace util
// Params 1
// Checksum 0x2662da49, Offset: 0x96
// Size: 0x58
function test_print( msg )
{
    msg = "SCR_TEST: " + msg;
    sysprint( msg );
    
    /#
        if ( !isdefined( level.var_49a2bb622d327d98 ) )
        {
            level.var_49a2bb622d327d98 = getdvarint( @"hash_afbf853954f73b57", 0 ) != 0;
        }
        
        if ( level.var_49a2bb622d327d98 )
        {
            println( msg );
        }
    #/
}

// Namespace util
// Params 1
// Checksum 0x4e7e9f49, Offset: 0xf6
// Size: 0x1b
function test_begin( tag )
{
    test_print( tag + "_begin" );
}

// Namespace util
// Params 1
// Checksum 0xfb8e10e3, Offset: 0x119
// Size: 0x1b
function test_end( tag )
{
    test_print( tag + "_end" );
}

