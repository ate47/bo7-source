#using scripts\common\snd\snd;

#namespace snd_mp;

// Namespace snd_mp
// Params 0, eflags: 0x1
// Checksum 0x720139eb, Offset: 0x76
// Size: 0x3b
function autoexec mp_init()
{
    assert( !isstruct( level.snd ), "<dev string:x24>" );
    snd::init();
    level.snd.fnplaysoundonmovingent = &playsoundonmovingent;
}

