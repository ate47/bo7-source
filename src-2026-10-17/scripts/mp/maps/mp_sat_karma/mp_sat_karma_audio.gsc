#using script_208a12cbcccbfa63;

#namespace mp_sat_karma_audio;

// Namespace mp_sat_karma_audio
// Params 0
// Checksum 0x79e8f2eb, Offset: 0x84
// Size: 0x9
function main()
{
    thread function_1e4154c5662214da();
}

// Namespace mp_sat_karma_audio
// Params 0
// Checksum 0x6f20232c, Offset: 0x95
// Size: 0x52
function function_1e4154c5662214da()
{
    level endon( #"game_ended" );
    level waittill( #"matchstarttimer_done" );
    trig = getent( "audio_xray", #targetname );
    
    if ( isdefined( trig ) )
    {
        thread trigger::makeenterexittrigger( trig, &function_a4e1962f04160a8e, &function_c639b7d56167d118 );
    }
}

// Namespace mp_sat_karma_audio
// Params 2
// Checksum 0x90d1eba8, Offset: 0xef
// Size: 0x4f
function function_a4e1962f04160a8e( enterent, trigger )
{
    if ( isplayer( enterent ) && isalive( enterent ) )
    {
        playsoundatpos( enterent.origin + ( 0, 0, 30 ), #"hash_e3947a92aeecde4a" );
    }
}

// Namespace mp_sat_karma_audio
// Params 2
// Checksum 0x62d198aa, Offset: 0x146
// Size: 0x4f
function function_c639b7d56167d118( exitent, trigger )
{
    if ( isplayer( exitent ) && isalive( exitent ) )
    {
        playsoundatpos( exitent.origin + ( 0, 0, 30 ), #"hash_159df5021a5e3f6a" );
    }
}

