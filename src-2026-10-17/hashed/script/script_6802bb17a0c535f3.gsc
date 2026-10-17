#namespace aar_tracking;

// Namespace aar_tracking
// Params 0, eflags: 0x1
// Checksum 0xec42cab8, Offset: 0x76
// Size: 0x10
function autoexec init()
{
    level.var_bff21c0484526cca = &function_c16e883e235c2d95;
}

// Namespace aar_tracking
// Params 2
// Checksum 0xccb2ce8f, Offset: 0x8e
// Size: 0x39
function function_e32d863f90d794a1( aar_tracking_ref, callback_func )
{
    if ( !isdefined( level.var_3269fc6fc2e5d4ef ) )
    {
        level.var_3269fc6fc2e5d4ef = [];
    }
    
    level.var_3269fc6fc2e5d4ef[ aar_tracking_ref ] = callback_func;
}

// Namespace aar_tracking
// Params 0, eflags: 0x4
// Checksum 0x52c2b36d, Offset: 0xcf
// Size: 0x93
function private function_c16e883e235c2d95()
{
    if ( !isdefined( level.var_3269fc6fc2e5d4ef ) )
    {
        return;
    }
    
    foreach ( aar_tracking_ref, callback in level.var_3269fc6fc2e5d4ef )
    {
        level [[ callback ]]( aar_tracking_ref );
    }
    
    level.var_3269fc6fc2e5d4ef = undefined;
}

