#using scripts\common\callbacks;

#namespace perk_huntmaster;

// Namespace perk_huntmaster
// Params 0, eflags: 0x1
// Checksum 0xa2b2caaf, Offset: 0xc0
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_8af0e02974a10428 );
}

// Namespace perk_huntmaster
// Params 1
// Checksum 0x85f9fd00, Offset: 0xe0
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
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_huntmaster", &sethuntmaster, &unsethuntmaster, [ "specialty_tracker_pro", "specialty_kill_report" ], &inithuntmaster );
    }
}

// Namespace perk_huntmaster
// Params 0, eflags: 0x4
// Checksum 0x139e3ea0, Offset: 0x15c
// Size: 0x2
function private inithuntmaster()
{
    
}

// Namespace perk_huntmaster
// Params 0, eflags: 0x4
// Checksum 0x19fbfaa9, Offset: 0x166
// Size: 0x2
function private sethuntmaster()
{
    
}

// Namespace perk_huntmaster
// Params 0, eflags: 0x4
// Checksum 0xb3c10142, Offset: 0x170
// Size: 0x2
function private unsethuntmaster()
{
    
}

