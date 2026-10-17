#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\livingworld\zm_sat_livingworld;
#using scripts\mp\zm\systems\zm_livingworld;

#namespace zm_sat_ruby_livingworld;

// Namespace zm_sat_ruby_livingworld
// Params 0, eflags: 0x5
// Checksum 0x3cac366, Offset: 0x10e
// Size: 0x33
function private autoexec __init__system__()
{
    system::register( #"zm_sat_ruby_livingworld", [ #"zm_livingworld", #"zm_sat_livingworld" ], undefined, &function_d31780e3ecb4eaec );
}

// Namespace zm_sat_ruby_livingworld
// Params 0
// Checksum 0x548ebaf9, Offset: 0x149
// Size: 0x101
function function_d31780e3ecb4eaec()
{
    if ( zm_livingworld::livingworld_is_disabled( "SAT", "zm_sat_ruby" ) )
    {
        return;
    }
    
    while ( !isdefined( level.var_1fcdd8ed8f961e97.script_funcs ) )
    {
        waitframe();
    }
    
    anim_func_pairs = [];
    anim_func_pairs[ "sat_cin_zm_living_world_hung_arms_long_zmb" ] = &zm_sat_livingworld::function_fdfab27bdcab98f;
    
    foreach ( stringid, func in anim_func_pairs )
    {
        level.var_1fcdd8ed8f961e97.script_funcs[ stringid ] = func;
    }
    
    level._effect[ "zmb_eye_glow" ] = loadfxasset( "vfx_t10_gameplay_zm_ai_zai_base_eye" );
    level utility::flag_set( "init_" + level.mapname + "_anim_func_pairs" );
}

