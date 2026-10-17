#using script_16ea1b94f0f381b3;
#using scripts\common\powerups;
#using scripts\common\utility;

#namespace full_clock;

// Namespace full_clock
// Params 0, eflags: 0x1
// Checksum 0x4b3b6eb3, Offset: 0x84
// Size: 0x1b
function autoexec main()
{
    if ( getdvarint( @"hash_a8a1c3f248fabf7b", 0 ) )
    {
        return;
    }
    
    init_full_clock();
}

// Namespace full_clock
// Params 0
// Checksum 0x8d8f9745, Offset: 0xa7
// Size: 0x1d
function init_full_clock()
{
    powerups::register_powerup( "full_clock", &grab_full_clock, &function_bd1193ffe96734c3, &modify_drop_chance );
}

// Namespace full_clock
// Params 2
// Checksum 0x893f6a7b, Offset: 0xcc
// Size: 0xcf
function grab_full_clock( str_powerup, ent_powerup )
{
    a_players = powerups::get_powerup_players( str_powerup );
    
    foreach ( player in a_players )
    {
        player thread namespace_9d8e359c3b1041e5::showpoweruphudsharedfunc( str_powerup );
    }
    
    if ( utility::issharedfuncdefined( #"powerup_full_clock", #"give_clock" ) )
    {
        utility::callsharedfunc( #"powerup_full_clock", #"give_clock" );
        return;
    }
}

// Namespace full_clock
// Params 0
// Checksum 0x1f2e59a5, Offset: 0x1a3
// Size: 0x38
function function_bd1193ffe96734c3()
{
    if ( utility::issharedfuncdefined( #"powerup_full_clock", #"should_drop" ) )
    {
        return utility::callsharedfunc( #"powerup_full_clock", #"should_drop" );
    }
    
    return 1;
}

// Namespace full_clock
// Params 2
// Checksum 0x45dd5caa, Offset: 0x1e4
// Size: 0x4e
function modify_drop_chance( chance, context )
{
    if ( utility::issharedfuncdefined( #"powerup_full_clock", #"modify_drop_chance" ) )
    {
        return utility::callsharedfunc( #"powerup_full_clock", #"modify_drop_chance", chance, context );
    }
    
    return chance;
}

