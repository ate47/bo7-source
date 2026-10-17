#using scripts\common\callbacks;

#namespace perk_death_perception_mp;

// Namespace perk_death_perception_mp
// Params 0, eflags: 0x1
// Checksum 0x162244c9, Offset: 0xab
// Size: 0x18
function autoexec main()
{
    level callback::add( #"register_perk", &perk_register );
}

// Namespace perk_death_perception_mp
// Params 1
// Checksum 0xfd902bbe, Offset: 0xcb
// Size: 0x5e
function perk_register( params )
{
    bundle = level.perkbundles[ "specialty_death_perception" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_death_perception", undefined, undefined, [ "specialty_operative" ] );
    }
}

