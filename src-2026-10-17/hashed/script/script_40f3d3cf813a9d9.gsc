#using script_380194b81c38cd1a;
#using scripts\common\utility;

#namespace zombie_hermes_audio;

// Namespace zombie_hermes_audio
// Params 0
// Checksum 0x47766db1, Offset: 0x13f
// Size: 0x6e
function function_7d58d6c5ab44526f()
{
    if ( utility::flag( "hermes_audio" ) )
    {
        return;
    }
    
    utility::flag_set( "hermes_audio" );
    zombie_vox::register_vox_state( "pain_vox", "pain_vox", "vox_ai_hermes_pain", 3, 2600 );
    zombie_vox::register_vox_state( "big_missile_attack_vox", "big_missile_attack_vox", "vox_ai_hermes_big_missile_attack", 3, 3600 );
    zombie_vox::register_vox_state( "big_missile_attack_end_vox", "big_missile_attack_end_vox", "vox_ai_hermes_big_missile_attack_end", 3, 2700 );
}

// Namespace zombie_hermes_audio
// Params 0
// Checksum 0x76ae7ea9, Offset: 0x1b5
// Size: 0xe
function init_zombie_hermes_audio()
{
    zombie_vox::register_play_vox_fn( &function_8dbbaafd4479600f );
}

// Namespace zombie_hermes_audio
// Params 6, eflags: 0x4
// Checksum 0xc45df16a, Offset: 0x1cb
// Size: 0x47
function private function_8dbbaafd4479600f( event, zombie, scriptable_state, alias, priority, vox_length )
{
    zombie_vox::play_vox( zombie, scriptable_state, alias, priority, vox_length );
}

// Namespace zombie_hermes_audio
// Params 1, eflags: 0x4
// Checksum 0x59b11a47, Offset: 0x21a
// Size: 0x38
function private play_death_vo( params )
{
    assert( isdefined( params.body ) );
    
    if ( self isscriptable() )
    {
        self setscriptablepartstate( "sound_vo", "off" );
    }
}

