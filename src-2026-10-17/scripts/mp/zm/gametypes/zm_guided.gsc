#using script_49e4a4c208f44b76;
#using script_789c50e394f0bf40;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\magicbox;
#using scripts\mp\zm\gametypes\zm_rb;
#using scripts\mp\zm\systems\zm_quest;

#namespace zm_guided;

// Namespace zm_guided
// Params 0
// Checksum 0x308a9dec, Offset: 0x8c
// Size: 0x111
function main()
{
    zm_rb::main();
    
    if ( !isdefined( level.directed_mode ) )
    {
        level.directed_mode = spawnstruct();
    }
    
    level.directed_mode.var_f1879f50f4eeaca3 = [];
    level.directed_mode.var_fcdcd383b4f959ed = "";
    
    if ( !isdefined( level.directed_mode.var_23edf8dfb11e1bf ) )
    {
        level.directed_mode.var_23edf8dfb11e1bf = [];
    }
    
    if ( !isdefined( level.directed_mode.var_8c6c59fc89ab90d1 ) )
    {
        level.directed_mode.var_8c6c59fc89ab90d1 = [];
    }
    
    utility::registersharedfunc( #"directed_mode", #"get_interact_func", &get_interact_func );
    utility::registersharedfunc( #"directed_mode", #"get_interact_string", &get_interact_string );
    level thread zm_quest::update_round_cap( 3, 1, 0 );
    level magicbox::function_2e49cd8681e36211( 1 );
    callback::add( "doorbuy_opened", &on_doorbuy_opened );
    zm_exfil_sat::function_5f8dd7f4c8fd2bd9();
}

// Namespace zm_guided
// Params 1, eflags: 0x4
// Checksum 0x3bebfd30, Offset: 0x1a5
// Size: 0x6e
function private on_doorbuy_opened( params )
{
    if ( isdefined( params.door.a_interacts[ 0 ].s_doorbuy.var_11e530db74c0a830 ) )
    {
        level thread zm_quest::update_round_cap( params.door.a_interacts[ 0 ].s_doorbuy.var_11e530db74c0a830 );
    }
}

// Namespace zm_guided
// Params 2
// Checksum 0x9b5092ca, Offset: 0x21b
// Size: 0xa0
function register_interact_func( ref, func )
{
    assert( game_utility::getgametype() == "<dev string:x24>", "<dev string:x2e>" );
    assert( isxhash( ref ) || isxhashasset( ref ), "<dev string:x70>" );
    assert( isfunction( func ), "<dev string:x84>" );
    
    if ( !isdefined( level.directed_mode ) )
    {
        level.directed_mode = { #var_8c6c59fc89ab90d1:[], #var_23edf8dfb11e1bf:[] };
    }
    
    level.directed_mode.var_23edf8dfb11e1bf[ ref ] = func;
}

// Namespace zm_guided
// Params 1
// Checksum 0x5e224fa0, Offset: 0x2c3
// Size: 0x7c
function get_interact_func( ref )
{
    assert( game_utility::getgametype() == "<dev string:x24>", "<dev string:x2e>" );
    assert( isxhash( ref ) || isxhashasset( ref ), "<dev string:x70>" );
    assert( isdefined( level.directed_mode.var_23edf8dfb11e1bf[ ref ] ), "<dev string:xa2>" );
    return level.directed_mode.var_23edf8dfb11e1bf[ ref ];
}

// Namespace zm_guided
// Params 2
// Checksum 0xa22e35a0, Offset: 0x348
// Size: 0xa0
function register_interact_string( ref, loc )
{
    assert( game_utility::getgametype() == "<dev string:x24>", "<dev string:x2e>" );
    assert( isxhash( ref ) || isxhashasset( ref ), "<dev string:x70>" );
    assert( isistring( loc ), "<dev string:xc4>" );
    
    if ( !isdefined( level.directed_mode ) )
    {
        level.directed_mode = { #var_8c6c59fc89ab90d1:[], #var_23edf8dfb11e1bf:[] };
    }
    
    level.directed_mode.var_8c6c59fc89ab90d1[ ref ] = loc;
}

// Namespace zm_guided
// Params 1
// Checksum 0x456964a5, Offset: 0x3f0
// Size: 0x7c
function get_interact_string( ref )
{
    assert( game_utility::getgametype() == "<dev string:x24>", "<dev string:x2e>" );
    assert( isxhash( ref ) || isxhashasset( ref ), "<dev string:x70>" );
    assert( isdefined( level.directed_mode.var_8c6c59fc89ab90d1[ ref ] ), "<dev string:xda>" );
    return level.directed_mode.var_8c6c59fc89ab90d1[ ref ];
}

