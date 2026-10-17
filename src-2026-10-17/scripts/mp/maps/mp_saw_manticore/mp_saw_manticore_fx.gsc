#using script_208a12cbcccbfa63;
#using scripts\common\utility;

#namespace mp_saw_manticore_fx;

// Namespace mp_saw_manticore_fx
// Params 0
// Checksum 0x16cc1bf2, Offset: 0x123
// Size: 0x34
function main()
{
    level._effect[ "waterfall_enter" ] = loadfxasset( "vfx_saw_levels_mp_saw_manticore_waterfall_spray_cam" );
    utility::add_fx( "waterfall_exit", "vfx_iw9_core_swimming_swim_exit_water_screen" );
    level thread function_4ba7117a3eb4cd68();
}

// Namespace mp_saw_manticore_fx
// Params 0, eflags: 0x4
// Checksum 0xdc5d927f, Offset: 0x15f
// Size: 0x35
function private function_4ba7117a3eb4cd68()
{
    var_f9b4712ba8392ac7 = getnoentvolumearray( "waterfall_entrance", #targetname )[ 0 ];
    trigger::makeenterexittrigger( var_f9b4712ba8392ac7, &waterfall_enter, &waterfall_exit );
}

// Namespace mp_saw_manticore_fx
// Params 2, eflags: 0x4
// Checksum 0xe52465e7, Offset: 0x19c
// Size: 0x44
function private waterfall_enter( ent, trigger )
{
    if ( isplayer( ent ) )
    {
        fx_loop = utility::getfx( "waterfall_enter" );
        playfxontagforclients( fx_loop, ent, "tag_eye", ent );
    }
}

// Namespace mp_saw_manticore_fx
// Params 2, eflags: 0x4
// Checksum 0xe9e49048, Offset: 0x1e8
// Size: 0x75
function private waterfall_exit( ent, trigger )
{
    if ( isplayer( ent ) )
    {
        fx = utility::getfx( "waterfall_exit" );
        playfxontagforclients( fx, ent, "tag_eye", ent );
        fx_loop = utility::getfx( "waterfall_enter" );
        stopfxontagforclients( fx_loop, ent, "tag_eye", ent );
        killfxontag( fx_loop, ent, "tag_eye" );
    }
}

