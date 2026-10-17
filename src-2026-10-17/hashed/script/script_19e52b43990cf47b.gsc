#using scripts\common\callbacks;

#namespace perk_vulture_aid_mp;

// Namespace perk_vulture_aid_mp
// Params 0, eflags: 0x1
// Checksum 0xfa06e69a, Offset: 0xb9
// Size: 0x18
function autoexec main()
{
    level callback::add( #"register_perk", &perk_register );
}

// Namespace perk_vulture_aid_mp
// Params 1
// Checksum 0xe84b4a36, Offset: 0xd9
// Size: 0x5e
function perk_register( params )
{
    bundle = level.perkbundles[ "specialty_vulture_aid" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_vulture_aid", undefined, undefined, [ "specialty_scavenger_ammo_and_equipment" ] );
    }
}

