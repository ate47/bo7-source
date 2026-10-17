#using script_380194b81c38cd1a;
#using scripts\common\utility;

#namespace zombie_phobos_audio;

// Namespace zombie_phobos_audio
// Params 0
// Checksum 0xb42969a9, Offset: 0xc8
// Size: 0x38
function function_41f16ac1f5cce9f4()
{
    if ( utility::flag( "phobos_audio" ) )
    {
        return;
    }
    
    utility::flag_set( "phobos_audio" );
    zombie_vox::register_vox_state( "pain_vox", "pain_vox", "vox_ai_zombie_phobos_pain_short", 3, 2600 );
}

// Namespace zombie_phobos_audio
// Params 0
// Checksum 0x2731d480, Offset: 0x108
// Size: 0xe
function init_zombie_phobos_audio()
{
    zombie_vox::register_play_vox_fn( &function_8dbbaafd4479600f );
}

// Namespace zombie_phobos_audio
// Params 6, eflags: 0x4
// Checksum 0x95c25b43, Offset: 0x11e
// Size: 0x47
function private function_8dbbaafd4479600f( event, zombie, scriptable_state, alias, priority, vox_length )
{
    zombie_vox::play_vox( zombie, scriptable_state, alias, priority, vox_length );
}

// Namespace zombie_phobos_audio
// Params 1, eflags: 0x4
// Checksum 0x5587bf2a, Offset: 0x16d
// Size: 0x38
function private play_death_vo( params )
{
    assert( isdefined( params.body ) );
    
    if ( self isscriptable() )
    {
        self setscriptablepartstate( "sound_vo", "off" );
    }
}

