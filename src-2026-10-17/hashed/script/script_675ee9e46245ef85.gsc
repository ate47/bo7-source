#using script_380194b81c38cd1a;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_triton_audio;

// Namespace zombie_triton_audio
// Params 0
// Checksum 0x2f8ba5c5, Offset: 0x257
// Size: 0x130
function function_de4b52c5108673f3()
{
    if ( utility::flag( "triton_audio" ) )
    {
        return;
    }
    
    utility::flag_set( "triton_audio" );
    zombie_vox::register_vox_state( "vox_roar_large", "vox_roar_large", "vox_ai_triton_roar_large", 3, 5300 );
    zombie_vox::register_vox_state( "vox_armor_break", "vox_armor_break", "vox_ai_triton_armor_break", 3, 3000 );
    zombie_vox::register_vox_state( "vox_ground_slam", "vox_ground_slam", "vox_ai_triton_ground_slam", 3, 1600 );
    zombie_vox::register_vox_state( "vox_lava_spit", "vox_lava_spit", "vox_ai_triton_lava_spit", 3, 1200 );
    zombie_vox::register_vox_state( "vox_lava_spit_end", "vox_lava_spit_end", "vox_ai_triton_lava_spit_end", 3, 1000 );
    zombie_vox::register_vox_state( "vox_leap", "vox_leap", "vox_ai_triton_leap", 3, 700 );
    zombie_vox::register_vox_state( "vox_leap_slam", "vox_leap_slam", "vox_ai_triton_leap_slam", 3, 1200 );
    zombie_vox::register_vox_state( "vox_stasis_break", "vox_stasis_break", "vox_ai_triton_stasis_break", 3, 1800 );
    zombie_vox::register_vox_state( "vox_stomp_roar", "vox_stomp_roar", "vox_ai_triton_stomp_roar", 3, 1300 );
    callback::get_template( self.animsetname ) callback::add( "killed_body_cloned", &play_death_vo );
}

// Namespace zombie_triton_audio
// Params 0
// Checksum 0xf9b04685, Offset: 0x38f
// Size: 0xe
function init_zombie_triton_audio()
{
    zombie_vox::register_play_vox_fn( &function_8dbbaafd4479600f );
}

// Namespace zombie_triton_audio
// Params 6, eflags: 0x4
// Checksum 0x4b43c946, Offset: 0x3a5
// Size: 0x47
function private function_8dbbaafd4479600f( event, zombie, scriptable_state, alias, priority, vox_length )
{
    zombie_vox::play_vox( zombie, scriptable_state, alias, priority, vox_length );
}

// Namespace zombie_triton_audio
// Params 1, eflags: 0x4
// Checksum 0xbc4be800, Offset: 0x3f4
// Size: 0x71
function private play_death_vo( params )
{
    assert( isdefined( params.body ) );
    
    if ( isdefined( self ) )
    {
        if ( self isscriptable() )
        {
            utility::function_7c10ea82c1e305b8( "sound_vo", "off" );
        }
        
        if ( !val::get( "allow_vo" ) )
        {
            return;
        }
        
        str_channel = zombie_vox::function_60b4e7f5dcc09735();
        
        if ( function_9ab89894f4bcc56c( str_channel ) )
        {
            self stopsoundchannel( str_channel );
        }
    }
}

