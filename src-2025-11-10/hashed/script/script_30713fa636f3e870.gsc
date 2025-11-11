#using scripts\common\callbacks;

#namespace namespace_669c39849ec31630;

// Namespace namespace_669c39849ec31630
// Params 0, eflags: 0x1
// Checksum 0xa2b2caaf, Offset: 0xc9
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_8af0e02974a10428 );
}

// Namespace namespace_669c39849ec31630
// Params 1
// Checksum 0x85f9fd00, Offset: 0xe9
// Size: 0x74
function function_8af0e02974a10428( params )
{
    bundle = level.perkbundles[ "specialty_huntmaster" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_huntmaster", &function_b4aea9e1e36ec07d, &function_1f74ecdf2bbab970, [ "specialty_tracker_pro", "specialty_kill_report" ], &function_afa8646bfb9cde5b );
    }
}

// Namespace namespace_669c39849ec31630
// Params 0, eflags: 0x4
// Checksum 0x139e3ea0, Offset: 0x165
// Size: 0x2
function private function_afa8646bfb9cde5b()
{
    
}

// Namespace namespace_669c39849ec31630
// Params 0, eflags: 0x4
// Checksum 0x19fbfaa9, Offset: 0x16f
// Size: 0x2
function private function_b4aea9e1e36ec07d()
{
    
}

// Namespace namespace_669c39849ec31630
// Params 0, eflags: 0x4
// Checksum 0xb3c10142, Offset: 0x179
// Size: 0x2
function private function_1f74ecdf2bbab970()
{
    
}

