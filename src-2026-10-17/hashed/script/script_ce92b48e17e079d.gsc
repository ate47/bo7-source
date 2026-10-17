#using scripts\common\callbacks;

#namespace perk_deadshot_mp;

// Namespace perk_deadshot_mp
// Params 0, eflags: 0x1
// Checksum 0x997313e2, Offset: 0xe6
// Size: 0x18
function autoexec main()
{
    level callback::add( #"register_perk", &perk_register );
}

// Namespace perk_deadshot_mp
// Params 1
// Checksum 0x40a25918, Offset: 0x106
// Size: 0x6f
function perk_register( params )
{
    bundle = level.perkbundles[ "specialty_deadshot" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_deadshot", &perk_set, &perk_unset, [ "specialty_bulletaccuracy", "specialty_quickdraw" ] );
    }
}

// Namespace perk_deadshot_mp
// Params 0
// Checksum 0xa5955524, Offset: 0x17d
// Size: 0x3a
function perk_set()
{
    self.var_5ebb751ddafea9f7 = 2;
    
    if ( !callback::exists( #"hash_2346898712859996", &function_a31bf077b88f64ce ) )
    {
        callback::add( #"hash_2346898712859996", &function_a31bf077b88f64ce );
    }
}

// Namespace perk_deadshot_mp
// Params 0
// Checksum 0x6875114b, Offset: 0x1bf
// Size: 0x38
function perk_unset()
{
    self.var_5ebb751ddafea9f7 = undefined;
    
    if ( callback::exists( #"hash_2346898712859996", &function_a31bf077b88f64ce ) )
    {
        callback::remove( #"hash_2346898712859996", &function_a31bf077b88f64ce );
    }
}

// Namespace perk_deadshot_mp
// Params 1, eflags: 0x4
// Checksum 0xe591964e, Offset: 0x1ff
// Size: 0xc0
function private function_a31bf077b88f64ce( params )
{
    if ( !isdefined( params.eattacker.var_5ebb751ddafea9f7 ) )
    {
        return;
    }
    
    if ( params.objweapon.ismelee || params.smeansofdeath == "MOD_MELEE" )
    {
        return;
    }
    
    if ( params.shitloc == "head" || params.shitloc == "neck" || params.shitloc == "helmet" )
    {
        params.idamage *= params.eattacker.var_5ebb751ddafea9f7;
    }
}

