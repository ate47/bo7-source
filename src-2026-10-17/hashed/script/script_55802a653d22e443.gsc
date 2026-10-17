#using script_25a8fa2ac8997425;
#using script_31e159e3b40e909e;
#using scripts\common\callbacks;
#using scripts\common\system;

#namespace zm_relic_challenge_no_perks;

// Namespace zm_relic_challenge_no_perks
// Params 0, eflags: 0x5
// Checksum 0xa754801b, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_b93845b982c2109e", undefined, &init_relic_challenge_no_perks, undefined );
}

// Namespace zm_relic_challenge_no_perks
// Params 0
// Checksum 0x64daf3f3, Offset: 0x97
// Size: 0xa
function init_relic_challenge_no_perks()
{
    level thread function_5c5b4fa086ebd347();
}

// Namespace zm_relic_challenge_no_perks
// Params 0
// Checksum 0x8a82f164, Offset: 0xa9
// Size: 0x1c
function function_5c5b4fa086ebd347()
{
    zm_relic_challenges::register_relic_challenge_functions( #"no_perks", &function_b6d36c5b3dc10317, &function_87a5cbd52fa99eb2 );
}

// Namespace zm_relic_challenge_no_perks
// Params 0
// Checksum 0xfabfab7d, Offset: 0xcd
// Size: 0xd9
function function_b6d36c5b3dc10317()
{
    callback::add( #"player_spawned", &on_player_spawned );
    level.var_c139731c583cae6b = 1;
    
    foreach ( player in level.players )
    {
        if ( isplayer( player ) )
        {
            player_id = player getentitynumber();
            level.var_f49c7a329d0512d[ player_id ] = player zombie_perks::get_perks_str_array();
            player zombie_perks::function_89001bef9994a3cb();
        }
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_challenge_no_perks
// Params 0
// Checksum 0x9b9c3c1c, Offset: 0x1ae
// Size: 0x135
function function_87a5cbd52fa99eb2()
{
    callback::remove( #"player_spawned", &on_player_spawned );
    level.var_c139731c583cae6b = undefined;
    
    foreach ( player in level.players )
    {
        if ( isplayer( player ) )
        {
            player_id = player getentitynumber();
            
            foreach ( perk in level.var_f49c7a329d0512d[ player_id ] )
            {
                player zombie_perks::give_perk( perk );
            }
        }
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x4c>" );
    #/
}

// Namespace zm_relic_challenge_no_perks
// Params 1, eflags: 0xc
// Checksum 0xb62c7bd3, Offset: 0x2eb
// Size: 0x69
function private on_player_spawned( params )
{
    self notify( #"hash_a6ed485b71929684" );
    self endon( #"hash_a6ed485b71929684" );
    self endon( #"death_or_disconnect" );
    wait 0.5;
    
    if ( isplayer( self ) )
    {
        player_id = self getentitynumber();
        level.var_f49c7a329d0512d[ player_id ] = zombie_perks::get_perks_str_array();
        zombie_perks::function_89001bef9994a3cb();
    }
}

