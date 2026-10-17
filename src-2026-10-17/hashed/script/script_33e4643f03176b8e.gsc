#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;

#namespace specialty_reduce_explosion_damage;

// Namespace specialty_reduce_explosion_damage
// Params 0, eflags: 0x1
// Checksum 0x62f11b9d, Offset: 0x9b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &register );
}

// Namespace specialty_reduce_explosion_damage
// Params 1
// Checksum 0x22a5ddad, Offset: 0xbb
// Size: 0x62
function register( params )
{
    bundle = level.perkbundles[ "specialty_reduce_explosion_damage" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_reduce_explosion_damage", &set, &unset, [], &init );
    }
}

// Namespace specialty_reduce_explosion_damage
// Params 0
// Checksum 0xc0d2fc7b, Offset: 0x125
// Size: 0x2
function init()
{
    
}

// Namespace specialty_reduce_explosion_damage
// Params 0
// Checksum 0xad487eb2, Offset: 0x12f
// Size: 0x77
function set()
{
    bundle = self.var_9842326056fd7207;
    
    if ( !isdefined( bundle ) && isdefined( self.perks[ "specialty_reduce_explosion_damage" ] ) )
    {
        perks::_unsetperk( "specialty_reduce_explosion_damage" );
        return;
    }
    
    self.var_e2e9f6fc2bcc1652 = bundle.var_82b891f6e1a2562d ?? 1;
    self.var_7d000e422856102b = bundle.var_cb07a1ed931ba440 ?? 1;
}

// Namespace specialty_reduce_explosion_damage
// Params 0
// Checksum 0x572b9aa5, Offset: 0x1ae
// Size: 0xc
function unset()
{
    self.var_82b891f6e1a2562d = undefined;
}

