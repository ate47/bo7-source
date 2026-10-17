#using script_4ca4a30b15eb95bb;
#using script_4f9ce8d249a99f4a;
#using script_6a3544644b02bfb7;
#using scripts\common\callbacks;

#namespace specialty_gas_grenade_resist;

// Namespace specialty_gas_grenade_resist
// Params 0, eflags: 0x1
// Checksum 0xc18fe2e, Offset: 0x96
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_gas_grenade_resist
// Params 1
// Checksum 0x43626912, Offset: 0xb6
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_gas_grenade_resist", &function_7677e5d8f7c742ce, &function_4e32d86ebfb2dd4f, [] );
    }
}

// Namespace specialty_gas_grenade_resist
// Params 0
// Checksum 0xccd4f758, Offset: 0xf8
// Size: 0x1f
function function_7677e5d8f7c742ce()
{
    perks::function_70e4256c5fb41ada( "specialty_gas_grenade_resist" );
    
    if ( player::isreallyalive() )
    {
        return;
    }
    
    gas_grenade::gas_updateplayereffects();
}

// Namespace specialty_gas_grenade_resist
// Params 0
// Checksum 0x8a42c6a9, Offset: 0x11f
// Size: 0x13
function function_4e32d86ebfb2dd4f()
{
    if ( player::isreallyalive() )
    {
        return;
    }
    
    gas_grenade::gas_updateplayereffects();
}

