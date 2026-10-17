#using script_380194b81c38cd1a;
#using scripts\common\callbacks;

#namespace zombie_vermin_audio;

// Namespace zombie_vermin_audio
// Params 0
// Checksum 0x2d572111, Offset: 0xbf
// Size: 0xa
function init_zombie_vermin_audio_global()
{
    level thread manage_ambient_cap();
}

// Namespace zombie_vermin_audio
// Params 0
// Checksum 0xc2193511, Offset: 0xd1
// Size: 0x1a
function init_zombie_vermin_audio()
{
    thread play_zombie_ambient_repeating();
    callback::add( "killed_body_cloned", &play_death_vo );
}

// Namespace zombie_vermin_audio
// Params 1, eflags: 0x4
// Checksum 0x39d4707f, Offset: 0xf3
// Size: 0x57
function private play_death_vo( params )
{
    assert( isdefined( params.body ) );
    
    if ( self isscriptable() )
    {
        self setscriptablepartstate( "sound_vo", "off" );
    }
    
    level thread zombie_vox::play_vox( params.body, "death", "vox_ai_vermin_death", 4 );
}

// Namespace zombie_vermin_audio
// Params 0
// Checksum 0xe1c6a9cd, Offset: 0x152
// Size: 0x2
function play_zombie_ambient_repeating()
{
    
}

// Namespace zombie_vermin_audio
// Params 0, eflags: 0x4
// Checksum 0xe860bf8a, Offset: 0x15c
// Size: 0x30
function private manage_ambient_cap()
{
    level endon( #"game_ended" );
    level.zombie_ambient_count = 0;
    
    while ( true )
    {
        level.zombie_ambient_count = 0;
        wait 0.1;
    }
}

