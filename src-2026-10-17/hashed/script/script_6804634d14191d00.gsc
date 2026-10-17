#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;

#namespace specialty_explosive_slow_immunity;

// Namespace specialty_explosive_slow_immunity
// Params 0, eflags: 0x1
// Checksum 0x745a56eb, Offset: 0x9b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_explosive_slow_immunity
// Params 1
// Checksum 0xd4fb8baf, Offset: 0xbb
// Size: 0x36
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_explosive_slow_immunity", &setspecialty, undefined, [] );
    }
}

// Namespace specialty_explosive_slow_immunity
// Params 0
// Checksum 0xfb6b448a, Offset: 0xf9
// Size: 0xe
function setspecialty()
{
    perks::function_70e4256c5fb41ada( "specialty_explosive_slow_immunity" );
}

