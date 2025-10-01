#using scripts\common\callbacks;

#namespace namespace_669c39849ec31630;

// Namespace namespace_669c39849ec31630
// Params 0, eflags: 0x1
// Checksum 0x741262f7, Offset: 0xcb
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_8af0e02974a10428 );
}

// Namespace namespace_669c39849ec31630
// Params 1
// Checksum 0xe913f671, Offset: 0xeb
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
// Checksum 0x139e3ea6, Offset: 0x167
// Size: 0x2
function private function_afa8646bfb9cde5b()
{
    
}

// Namespace namespace_669c39849ec31630
// Params 0, eflags: 0x4
// Checksum 0x19fbfaa1, Offset: 0x171
// Size: 0x2
function private function_b4aea9e1e36ec07d()
{
    
}

// Namespace namespace_669c39849ec31630
// Params 0, eflags: 0x4
// Checksum 0xb3c1013a, Offset: 0x17b
// Size: 0x2
function private function_1f74ecdf2bbab970()
{
    
}

