#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\laststand;
#using scripts\mp\zm\systems\zone_manager;

#namespace namespace_415b9206a2930add;

// Namespace namespace_415b9206a2930add
// Params 0, eflags: 0x5
// Checksum 0x3ad8e8a8, Offset: 0x9d
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"nowhere_but_there_zm", "nowhere_but_there", &pre_main, undefined );
}

// Namespace namespace_415b9206a2930add
// Params 0, eflags: 0x4
// Checksum 0xccfb85c6, Offset: 0xc2
// Size: 0x44
function private pre_main()
{
    utility::registersharedfunc( "nowhere_but_there", #"get_best_spawnpoint", &get_best_spawnpoint );
    utility::registersharedfunc( "nowhere_but_there", #"revive_nearby_players", &revive_nearby_players );
    level.var_a5075772bb06b565 = &function_fd0bac65e140209a;
}

// Namespace namespace_415b9206a2930add
// Params 1, eflags: 0x4
// Checksum 0x2a8bcc2e, Offset: 0x10e
// Size: 0x212
function private get_best_spawnpoint( e_player )
{
    var_283b52cb73b75f6e = e_player.origin + anglestoforward( e_player.angles ) * 64;
    var_283b52cb73b75f6e = getrandomnavpoint( var_283b52cb73b75f6e, 110 );
    
    for ( n_count = 0; n_count < 5 && ( !isdefined( var_283b52cb73b75f6e ) || positionwouldtelefrag( var_283b52cb73b75f6e ) || !zone_manager::is_point_inside_enabled_zone( var_283b52cb73b75f6e ) ) ; n_count++ )
    {
        var_283b52cb73b75f6e = getrandomnavpoint( e_player.origin, 110 );
    }
    
    if ( isdefined( var_283b52cb73b75f6e ) && !positionwouldtelefrag( var_283b52cb73b75f6e ) )
    {
        v_dir = vectornormalize( e_player.origin - var_283b52cb73b75f6e + ( 0, 0, 32 ) );
        v_angles = vectortoangles( v_dir );
        var_3efd316f3946501d = spawnstruct();
        var_3efd316f3946501d.is_temp_respawn = 1;
        var_3efd316f3946501d.origin = var_283b52cb73b75f6e;
        var_3efd316f3946501d.angles = v_angles;
        self.var_860f55942efed674 = var_283b52cb73b75f6e;
        
        if ( zone_manager::is_point_inside_enabled_zone( var_283b52cb73b75f6e ) )
        {
            return var_3efd316f3946501d;
        }
    }
    
    self.var_860f55942efed674 = e_player.origin;
    a_s_valid_respawn_points = [];
    
    if ( isdefined( level.var_9980bb185b6144a5 ) )
    {
        a_s_valid_respawn_points = [[ level.var_9980bb185b6144a5 ]]( a_s_valid_respawn_points );
    }
    
    s_player_respawn = undefined;
    a_s_valid_respawn_points = utility::get_array_of_closest( self.var_860f55942efed674, a_s_valid_respawn_points );
    
    foreach ( var_670db601def3a0d0 in a_s_valid_respawn_points )
    {
        if ( !positionwouldtelefrag( var_670db601def3a0d0.origin ) && zone_manager::is_point_inside_enabled_zone( var_670db601def3a0d0.origin ) )
        {
            return var_670db601def3a0d0;
        }
    }
}

// Namespace namespace_415b9206a2930add
// Params 1, eflags: 0x4
// Checksum 0x6ec1f267, Offset: 0x329
// Size: 0xb5
function private revive_nearby_players( s_respawn_point )
{
    a_players = getplayersinradius( s_respawn_point.origin, 220 );
    
    foreach ( player in a_players )
    {
        if ( player != self && player.inlaststand )
        {
            player laststand::auto_revive( self, "last_stand_bgb" );
        }
    }
}

// Namespace namespace_415b9206a2930add
// Params 0
// Checksum 0x6eb1ecc8, Offset: 0x3e6
// Size: 0x9
function function_fd0bac65e140209a()
{
    zone_manager::function_fc479cad41a1ae1d();
}

