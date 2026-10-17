#using scripts\common\callbacks;
#using scripts\mp\stealth\stealth_music;

#namespace stealth_music_mp;

// Namespace stealth_music_mp
// Params 0
// Checksum 0xee22e9fb, Offset: 0x76
// Size: 0x17
function init()
{
    callback::add( #"player_spawned", &stealth_music::function_5197bc70e9265f24 );
}

