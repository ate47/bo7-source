#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;

#namespace specialty_scrambler_resist;

// Namespace specialty_scrambler_resist
// Params 0, eflags: 0x1
// Checksum 0x590e150a, Offset: 0x94
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_scrambler_resist
// Params 1
// Checksum 0xfbbb13ab, Offset: 0xb4
// Size: 0x36
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_scrambler_resist", &setspecialty, undefined, [] );
    }
}

// Namespace specialty_scrambler_resist
// Params 0
// Checksum 0xd63f076b, Offset: 0xf2
// Size: 0xe
function setspecialty()
{
    perks::function_70e4256c5fb41ada( "specialty_scrambler_resist" );
}

