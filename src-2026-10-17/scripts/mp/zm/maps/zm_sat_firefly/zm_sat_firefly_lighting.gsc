#using scripts\common\utility;

#namespace zm_sat_firefly_lighting;

// Namespace zm_sat_firefly_lighting
// Params 0
// Checksum 0xee14e37d, Offset: 0xad
// Size: 0xa
function main()
{
    level thread function_3f31de061733d510();
}

// Namespace zm_sat_firefly_lighting
// Params 0
// Checksum 0xf8165fe1, Offset: 0xbf
// Size: 0x24
function function_3f31de061733d510()
{
    level endon( #"game_ended" );
    utility::flag_wait( "doorbuy_sunken_brothel_bought" );
    activateworldevent( "we_lgt_ruby_rabbit" );
}

