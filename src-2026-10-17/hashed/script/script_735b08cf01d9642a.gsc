#using scripts\common\callbacks;

#namespace specialty_heavy_melee_reduction;

// Namespace specialty_heavy_melee_reduction
// Params 0, eflags: 0x1
// Checksum 0x7dc15eeb, Offset: 0x99
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_heavy_melee_reduction
// Params 1
// Checksum 0xd9889a36, Offset: 0xb9
// Size: 0x39
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_heavy_melee_reduction", &function_7ce5ce7c9672bb5c, &function_7eb80a42d6c2e2c1 );
    }
}

// Namespace specialty_heavy_melee_reduction
// Params 0, eflags: 0x4
// Checksum 0x4b087062, Offset: 0xfa
// Size: 0x40
function private function_7ce5ce7c9672bb5c()
{
    assert( !callback::exists( #"hash_652eb614ba902b3d", &reducedamage ), "<dev string:x24>" );
    callback::add( #"hash_652eb614ba902b3d", &reducedamage );
    thread function_bbae7cc5c7bb5608();
}

// Namespace specialty_heavy_melee_reduction
// Params 0, eflags: 0x4
// Checksum 0xda6b039f, Offset: 0x142
// Size: 0x38
function private function_7eb80a42d6c2e2c1()
{
    assert( callback::exists( #"hash_652eb614ba902b3d", &reducedamage ), "<dev string:x93>" );
    callback::remove( #"hash_652eb614ba902b3d", &reducedamage );
}

// Namespace specialty_heavy_melee_reduction
// Params 1, eflags: 0x4
// Checksum 0x20f07797, Offset: 0x182
// Size: 0x68
function private function_bbae7cc5c7bb5608( params )
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    self endon( #"weapon_change" );
    
    while ( true )
    {
        self waittill( #"hash_8119b2d67391dd7b" );
        self.var_62a07281787ce4eb = 1;
        self waittill( #"melee_fired" );
        self.var_62a07281787ce4eb = 0;
        waitframe();
    }
}

// Namespace specialty_heavy_melee_reduction
// Params 1, eflags: 0x4
// Checksum 0xce8ebeaa, Offset: 0x1f2
// Size: 0x57
function private reducedamage( params )
{
    if ( self.var_62a07281787ce4eb )
    {
        damagereduction = level.perkbundles[ "specialty_heavy_melee_reduction" ].var_31d545740413cae8;
        params.idamage *= damagereduction;
    }
}

