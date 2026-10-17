#using script_66cb9fe5d1bbff6;
#using scripts\mp\zm\systems\zm_round_spawning;

#namespace zm_sat_hornet_rb;

// Namespace zm_sat_hornet_rb
// Params 0
// Checksum 0x2fc9929f, Offset: 0x76
// Size: 0x1b
function init()
{
    level thread zm_round_accelerant::init_round_accelerant();
    level thread zm_round_spawning::function_c134fd55f45903e6( %"hash_4a3641b8b2c08c26" );
}

