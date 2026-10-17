#using script_1c6bb6c699d4cbdc;
#using script_22f61a68d5c6190b;
#using script_2ad7dff7e51218da;
#using script_2ca476d6cde2b048;
#using script_32ef8d49c67aaef5;
#using script_400030cfadc03f31;
#using script_40ba88e19d658263;
#using script_4312f2cd6172b2a7;
#using script_49e4a4c208f44b76;
#using script_50689c1d9e3ef00a;
#using script_50ef91777fbaecc3;
#using script_5b77eb93d54c2f86;
#using script_5d9e9c912716b012;
#using script_5efe37e054c73937;
#using script_67edab98a74b9c2f;
#using script_695729716dc6f653;
#using script_7070f735179785e;
#using script_728c42c3a24edb82;
#using script_785265c2027066bf;
#using script_7f269af2f05b8a3c;
#using scripts\common\killstreaks\killstreak_shared;
#using scripts\common\utility;
#using scripts\common\vehicle_omnvar_utility;

#namespace init;

// Namespace init
// Params 0
// Checksum 0x2d996efd, Offset: 0x100
// Size: 0x11b
function init()
{
    if ( getdvarint( @"hash_e6afce2cf5cf7515", 0 ) == 1 )
    {
        return;
    }
    
    if ( getdvarint( @"hash_742caa13b3c2e685", 0 ) == 1 )
    {
        return;
    }
    
    /#
        utility::issharedfuncdefined( #"killstreak", #"init", 1 );
    #/
    
    [[ utility::getsharedfunc( #"killstreak", #"init" ) ]]();
    function_a1338798aedc37e0();
    killstreak_shared::function_38dc8b5c461532cb();
    level thread function_98488fc133c50316();
    level thread airdrop::init();
    level thread airstrike::init();
    level thread juggernaut::init();
    level thread toma_strike::init();
    level thread uav::init();
    level thread helper_drone::init();
    level thread manual_turret::init();
    level thread emp_drone_targeted::init();
    level thread nuke::init();
    level thread emp_drone::init();
    level thread auto_drone::init();
    level thread cluster_spike::init();
    level thread assault_drone::init();
    level thread sentry_gun::init();
    level thread uav_bigmap::init();
    
    if ( !isbrgamemode() )
    {
        level thread hover_jet::init();
        level thread cruise_predator::init();
        level thread white_phosphorus::init();
        level thread chopper_support::init();
    }
}

// Namespace init
// Params 0
// Checksum 0xa5030f7d, Offset: 0x223
// Size: 0x57
function function_a1338798aedc37e0()
{
    leveldataforvehicle = vehicle_omnvar::clear_data( "killstreak", 1 );
    leveldataforvehicle.warningbits[ "missileLocking" ] = 2;
    leveldataforvehicle.warningbits[ "burningDown" ] = 1;
    leveldataforvehicle.warningbits[ "missileIncoming" ] = 4;
}

// Namespace init
// Params 0
// Checksum 0xdbe33537, Offset: 0x282
// Size: 0x66
function function_98488fc133c50316()
{
    if ( level.scripted_spawner_func && level.scripted_spawner_func.size > 0 )
    {
        utility::flag_wait( "strike_init_done" );
    }
    
    level.heli_structs_entrances = game_utility::getlocalestructarray( "ks_heli_entrance" );
    level.heli_structs_goals = game_utility::getlocalestructarray( "ks_heli_goal" );
    level.heli_structs_paths = game_utility::getlocalestructarray( "ks_heli_path" );
}

