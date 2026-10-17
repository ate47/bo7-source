#using scripts\common\callbacks;

#namespace wildcard_perkstreak;

// Namespace wildcard_perkstreak
// Params 0, eflags: 0x5
// Checksum 0xb8cce514, Offset: 0xc2
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_9bd727d93a1d40af );
}

// Namespace wildcard_perkstreak
// Params 1
// Checksum 0x65c4c991, Offset: 0xe2
// Size: 0x68
function function_9bd727d93a1d40af( params )
{
    bundle = level.wildcardbundles[ "wildcard_perkstreak" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "wildcard_perkstreak", undefined, undefined, [ "specialty_perkstreaks", "specialty_no_killstreaks" ], undefined );
    }
}

