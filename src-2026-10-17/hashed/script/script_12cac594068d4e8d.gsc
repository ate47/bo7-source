#using script_380194b81c38cd1a;
#using scripts\common\callbacks;

#namespace zombie_loom_minion_audio;

// Namespace zombie_loom_minion_audio
// Params 0
// Checksum 0x274f48ba, Offset: 0xc4
// Size: 0xa
function function_21b025ba754e4741()
{
    level thread manage_ambient_cap();
}

// Namespace zombie_loom_minion_audio
// Params 0
// Checksum 0xfb7cf92c, Offset: 0xd6
// Size: 0x1a
function init_zombie_loom_minion_audio()
{
    thread play_zombie_ambient_repeating();
    callback::add( "killed_body_cloned", &play_death_vo );
}

// Namespace zombie_loom_minion_audio
// Params 1, eflags: 0x4
// Checksum 0xee821f7e, Offset: 0xf8
// Size: 0x57
function private play_death_vo( params )
{
    assert( isdefined( params.body ) );
    
    if ( self isscriptable() )
    {
        self setscriptablepartstate( "sound_vo", "off" );
    }
    
    level thread zombie_vox::play_vox( params.body, "death", "vox_ai_loom_minion_death", 4 );
}

// Namespace zombie_loom_minion_audio
// Params 0
// Checksum 0x78129998, Offset: 0x157
// Size: 0x2
function play_zombie_ambient_repeating()
{
    
}

// Namespace zombie_loom_minion_audio
// Params 0, eflags: 0x4
// Checksum 0x71b48fdf, Offset: 0x161
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

