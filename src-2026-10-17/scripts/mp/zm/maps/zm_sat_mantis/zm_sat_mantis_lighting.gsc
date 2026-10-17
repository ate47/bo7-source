#using scripts\common\utility;

#namespace zm_sat_mantis_lighting;

// Namespace zm_sat_mantis_lighting
// Params 0
// Checksum 0xb268811f, Offset: 0xb1
// Size: 0xa
function main()
{
    level thread function_4d3bfa800f12e4d8();
}

// Namespace zm_sat_mantis_lighting
// Params 0
// Checksum 0x6ce3fcd0, Offset: 0xc3
// Size: 0x3c
function function_4d3bfa800f12e4d8()
{
    level endon( #"game_ended" );
    level utility::flag_wait( "door_house2_f" );
    activateworldevent( "we_lgt_garage_flicker" );
    wait 2;
    deactivateworldevent( "we_lgt_garage_flicker" );
    activateworldevent( "we_lgt_garage" );
}

