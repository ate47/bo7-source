#using scripts\common\callbacks;

#namespace perk_speedcola_mp;

// Namespace perk_speedcola_mp
// Params 0, eflags: 0x1
// Checksum 0x87f96070, Offset: 0xf7
// Size: 0x18
function autoexec main()
{
    level callback::add( #"register_perk", &perk_register );
}

// Namespace perk_speedcola_mp
// Params 1
// Checksum 0xa0f255c8, Offset: 0x117
// Size: 0x79
function perk_register( params )
{
    bundle = level.perkbundles[ "specialty_speedcola" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_speedcola", undefined, undefined, [ "specialty_fastreload", "specialty_faster_field_upgrade", "specialty_quickswap", "specialty_fastoffhand" ] );
    }
}

