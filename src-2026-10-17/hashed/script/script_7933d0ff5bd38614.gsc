#using scripts\common\callbacks;

#namespace specialty_handicraft;

// Namespace specialty_handicraft
// Params 0, eflags: 0x1
// Checksum 0x94a14e1a, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_handicraft
// Params 1
// Checksum 0xc71b051c, Offset: 0xae
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_handicraft", &setspecialty, &unsetspecialty, [] );
    }
}

// Namespace specialty_handicraft
// Params 0
// Checksum 0x37f0d3d7, Offset: 0xf0
// Size: 0x2
function setspecialty()
{
    
}

// Namespace specialty_handicraft
// Params 0
// Checksum 0x74767b9, Offset: 0xfa
// Size: 0x2
function unsetspecialty()
{
    
}

