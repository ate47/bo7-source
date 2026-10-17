#using scripts\common\callbacks;
#using scripts\common\values;

#namespace perk_d_mod_mp;

// Namespace perk_d_mod_mp
// Params 0, eflags: 0x1
// Checksum 0x837b4116, Offset: 0xd1
// Size: 0x18
function autoexec main()
{
    level callback::add( #"register_perk", &perk_register );
}

// Namespace perk_d_mod_mp
// Params 1
// Checksum 0xaca12c7a, Offset: 0xf1
// Size: 0x66
function perk_register( params )
{
    bundle = level.perkbundles[ "specialty_d_mod" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_d_mod", &perk_set, &perk_unset, [ "specialty_bulletpenetration" ] );
    }
}

// Namespace perk_d_mod_mp
// Params 0
// Checksum 0xe49c692c, Offset: 0x15f
// Size: 0x50
function perk_set()
{
    val::set( "specialty_d_mod_mp", "fire_time_scale", 80 );
    self.var_199a32a103256add = 1.5;
    
    if ( !callback::exists( #"hash_2346898712859996", &function_a31bf077b88f64ce ) )
    {
        callback::add( #"hash_2346898712859996", &function_a31bf077b88f64ce );
    }
}

// Namespace perk_d_mod_mp
// Params 0
// Checksum 0xa035b79e, Offset: 0x1b7
// Size: 0x49
function perk_unset()
{
    val::reset( "specialty_d_mod_mp", "fire_time_scale" );
    self.var_199a32a103256add = undefined;
    
    if ( callback::exists( #"hash_2346898712859996", &function_a31bf077b88f64ce ) )
    {
        callback::remove( #"hash_2346898712859996", &function_a31bf077b88f64ce );
    }
}

// Namespace perk_d_mod_mp
// Params 1, eflags: 0x4
// Checksum 0x6b6f96a0, Offset: 0x208
// Size: 0x54
function private function_a31bf077b88f64ce( params )
{
    if ( !isdefined( params.eattacker.var_199a32a103256add ) )
    {
        return;
    }
    
    params.idamage *= params.eattacker.var_199a32a103256add;
}

