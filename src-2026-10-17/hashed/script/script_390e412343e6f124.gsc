#using script_5b77eb93d54c2f86;
#using script_6995a3eb7d571a9f;
#using scripts\common\utility;
#using scripts\common\vehicle_damage;
#using scripts\mp\sentientpoolmanager;

#namespace hover_jet_mp;

// Namespace hover_jet_mp
// Params 0
// Checksum 0xb038185a, Offset: 0x83
// Size: 0x47
function init()
{
    killstreaks::registerkillstreak( "hover_jet", &hover_jet::tryusehoverjetfromstruct );
    utility::registersharedfunc( "hover_jet", #"set_vehicle_hit_damage_data", &function_6391e1672631fc73 );
    utility::registersharedfunc( "hover_jet", #"registersentient", &hover_jet_registersentient );
}

// Namespace hover_jet_mp
// Params 2
// Checksum 0x17a630bd, Offset: 0xd2
// Size: 0x1f
function function_6391e1672631fc73( ref, hitstokill )
{
    vehicle_damage::set_vehicle_hit_damage_data( ref, hitstokill );
}

// Namespace hover_jet_mp
// Params 2
// Checksum 0xd3099116, Offset: 0xf9
// Size: 0x1f
function hover_jet_registersentient( threatbiasgroup, var_7abeff39c291fc41 )
{
    sentientpoolmanager::registersentient( threatbiasgroup, var_7abeff39c291fc41 );
}

