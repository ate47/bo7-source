#using script_16ea1b94f0f381b3;
#using script_31e159e3b40e909e;
#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\systems\zm_quest;
#using scripts\mp\zm\zm_utility;

#namespace namespace_d83e7ada0254ced3;

// Namespace namespace_d83e7ada0254ced3
// Params 0, eflags: 0x5
// Checksum 0xed9329aa, Offset: 0x106
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_c04401646833b750", undefined, &function_116703ae731d6190, undefined );
}

// Namespace namespace_d83e7ada0254ced3
// Params 0
// Checksum 0xb5124191, Offset: 0x127
// Size: 0xa
function function_116703ae731d6190()
{
    level thread function_e84a49aba650cdd7();
}

// Namespace namespace_d83e7ada0254ced3
// Params 0
// Checksum 0x2b5b3836, Offset: 0x139
// Size: 0x1c
function function_e84a49aba650cdd7()
{
    zm_relic_challenges::register_relic_challenge_functions( #"random_scorestreaks", &function_ef25b626dc4072ab, &function_3779119a9e312926 );
}

// Namespace namespace_d83e7ada0254ced3
// Params 0
// Checksum 0xcc317ace, Offset: 0x15d
// Size: 0xb7
function function_ef25b626dc4072ab()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_eb037271d5fb2c78 );
    level callback::add( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 1;
    level.active_relic_challenge.var_f74c6dbea99bce4c = 1;
    level.active_relic_challenge.streak_options = [ "toma_strike", "dawg", "radiation_blast", "ground_drone_unit", "rcxd" ];
    callback::add( "on_relic_challenge_objective_updated", &function_90fbd895de4e36d6 );
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_d83e7ada0254ced3
// Params 0
// Checksum 0x5463899, Offset: 0x21c
// Size: 0x15b
function function_3779119a9e312926()
{
    zm_quest::function_61f7df5fddf96cd1();
    quest_bundle = getscriptbundle( level.active_relic_challenge.bundle.var_ed2af4ca9756d69f );
    zm_quest::function_fba942a1cfd85f5d( 0, 1, quest_bundle.ref, level.active_relic_challenge.bundle.ref );
    level utility::clearsharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2" );
    level callback::remove( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level callback::remove( "on_relic_challenge_objective_updated", &function_90fbd895de4e36d6 );
    level.var_cdca5e730e05bc39 = 0;
    all_zombies = getaiarray( zm_utility::get_zombie_team() );
    
    foreach ( zombie in all_zombies )
    {
        if ( isalive( zombie ) )
        {
            zombie zm_relic_challenges::function_908a1b8613e50514();
            zombie zombie_utils::function_10c0c35c21e3ed9d( &function_6fd9eb6c8ad80bbc );
        }
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x52>" );
    #/
}

// Namespace namespace_d83e7ada0254ced3
// Params 0, eflags: 0x4
// Checksum 0x48c354c2, Offset: 0x37f
// Size: 0x102
function private function_d6376e04f53b1f21()
{
    level endon( level.active_relic_challenge.current_streak );
    level endon( #"relic_challenge_end" );
    
    while ( level.active_relic_challenge )
    {
        wait 60;
        
        foreach ( craftingtable in level.var_fa3dd255ec3da526 )
        {
            spawnoptions = common_item::items_initspawnoptions_spawnfromposition( getclosestpointonnavmesh( craftingtable.origin + ( randomfloatrange( -20, 20 ), randomfloatrange( -20, 20 ), -25 ) ), ( 0, randomfloatrange( 0, 360 ), 0 ) );
            common_item::function_325e28c0fb65c36a( level.active_relic_challenge.current_streak, 1, spawnoptions );
        }
    }
}

// Namespace namespace_d83e7ada0254ced3
// Params 1, eflags: 0x4
// Checksum 0x68a65fb9, Offset: 0x489
// Size: 0x3b3
function private function_90fbd895de4e36d6( params )
{
    if ( level.active_relic_challenge.current_streak )
    {
        level notify( level.active_relic_challenge.current_streak );
    }
    
    quest_bundle = getscriptbundle( level.active_relic_challenge.bundle.var_ed2af4ca9756d69f );
    zm_quest::function_fba942a1cfd85f5d( 0, 1, quest_bundle.ref, level.active_relic_challenge.bundle.ref );
    level.active_relic_challenge.current_streak = utility::array_random( level.active_relic_challenge.streak_options );
    level.active_relic_challenge.streak_options = arrayremove( level.active_relic_challenge.streak_options, level.active_relic_challenge.current_streak );
    
    if ( level.active_relic_challenge.current_streak )
    {
        level.active_relic_challenge.bundle.ref = hashcat( #"hash_8fe2fc9b4c2a093a", level.active_relic_challenge.current_streak );
        
        foreach ( player in level.players )
        {
            if ( isdefined( player ) && !player.ismutantinjection )
            {
                player namespace_9d8e359c3b1041e5::awardkillstreaksharedfunc( level.active_relic_challenge.current_streak, "other", undefined, undefined, undefined, 1 );
            }
        }
    }
    else
    {
        level.active_relic_challenge.bundle.ref = #"hash_3e88f15b934d3081";
    }
    
    level endon( #"hash_46c89cade4c1c9cb" );
    quest_bundle = getscriptbundle( level.active_relic_challenge.bundle.var_ed2af4ca9756d69f );
    zm_quest::function_61f7df5fddf96cd1();
    zm_quest::function_cd1f2fee4749fb0a( 1, quest_bundle.ref, level.active_relic_challenge.bundle.ref );
    zm_quest::function_9f49b2a045ece8ae( 0, 1, quest_bundle.ref, level.active_relic_challenge.bundle.ref );
    zm_quest::function_bf63bf6d044ad598( level.active_relic_challenge.var_189abf4197963d87, 1, quest_bundle.ref, level.active_relic_challenge.bundle.ref );
    zm_quest::function_49f2a6a3c1320a6d( level.active_relic_challenge.var_5a5572cb1045b08f, 1, quest_bundle.ref, level.active_relic_challenge.bundle.ref );
    timer_ref = level.active_relic_challenge.bundle.ref;
    zm_quest::function_612a9ad0db22c29c( level.active_relic_challenge.bundle.var_f528330bcb9dbd5c.timelimit * 1000, 1, quest_bundle.ref, timer_ref );
}

// Namespace namespace_d83e7ada0254ced3
// Params 1, eflags: 0x4
// Checksum 0x18ab81a3, Offset: 0x844
// Size: 0x73
function private function_eb037271d5fb2c78( dmg_struct )
{
    idamage = dmg_struct.idamage;
    
    if ( !( dmg_struct.einflictor.streakinfo.streakname == level.active_relic_challenge.current_streak ) )
    {
        idamage *= 0;
        zm_relic_challenges::set_zombie_damage_invuln();
    }
    else
    {
        zm_relic_challenges::function_908a1b8613e50514();
    }
    
    return idamage;
}

// Namespace namespace_d83e7ada0254ced3
// Params 1, eflags: 0x4
// Checksum 0x8d6c780d, Offset: 0x8c0
// Size: 0x1f
function private on_zombie_ai_spawned( params )
{
    zm_relic_challenges::set_zombie_damage_invuln();
    zombie_utils::function_dfae6a5bd222c586( &function_6fd9eb6c8ad80bbc );
}

// Namespace namespace_d83e7ada0254ced3
// Params 1
// Checksum 0x135abd09, Offset: 0x8e7
// Size: 0x78
function function_6fd9eb6c8ad80bbc( params )
{
    if ( !( params.einflictor.streakinfo.streakname == level.active_relic_challenge.current_streak ) )
    {
        params.idamage *= 0;
        zm_relic_challenges::set_zombie_damage_invuln();
    }
    else
    {
        zm_relic_challenges::function_908a1b8613e50514();
    }
    
    return params.idamage;
}

