#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace specialty_survivor;

// Namespace specialty_survivor
// Params 0, eflags: 0x1
// Checksum 0xb1789930, Offset: 0x8c
// Size: 0x36
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
    utility::registersharedfunc( #"specialty_survivor", #"hasselfrevive", &hasselfrevive );
}

// Namespace specialty_survivor
// Params 1
// Checksum 0x3ecb70e3, Offset: 0xca
// Size: 0x3a
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_survivor", &setsurvivor, &unsetsurvivor, [] );
    }
}

// Namespace specialty_survivor
// Params 0
// Checksum 0xf1668ccd, Offset: 0x10c
// Size: 0x2b
function setsurvivor()
{
    perkbundle = self.var_9842326056fd7207;
    self.survivorselfrevive = perkbundle.survivorselfrevive;
}

// Namespace specialty_survivor
// Params 0
// Checksum 0x7bc0507b, Offset: 0x13f
// Size: 0xc
function unsetsurvivor()
{
    self.survivorselfrevive = undefined;
}

// Namespace specialty_survivor
// Params 0
// Checksum 0xc19e4cde, Offset: 0x153
// Size: 0x1f, Type: bool
function hasselfrevive()
{
    return isdefined( self.perks[ "specialty_survivor" ] ) && self.survivorselfrevive;
}

