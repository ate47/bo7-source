#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\mp\zm\spawners\agent_spawner;
#using scripts\mp\zm\systems\agent_manager;

#namespace procedural_spawner;

// Namespace procedural_spawner
// Params 0
// Checksum 0x4db639d3, Offset: 0x93
// Size: 0x1d
function init_procedural_spawner()
{
    agent_spawner::register_spawner( "procedural", &spawn_agent );
    
    /#
        function_2527aae404cb1e5f();
    #/
}

// Namespace procedural_spawner
// Params 2
// Checksum 0x984c5c03, Offset: 0xb8
// Size: 0x156
function spawn_agent( aitype, params )
{
    random_player = utility::array_random( utility::get_alive_players() );
    
    if ( isdefined( random_player ) )
    {
        var_29c712a3c9b9188c = getclosestpointonnavmesh( random_player.origin );
        spawn_positions = getrandomnavpoints( var_29c712a3c9b9188c, 500, 32 );
        
        if ( isdefined( spawn_positions ) )
        {
            valid_spawn_positions = [];
            
            foreach ( pos in spawn_positions )
            {
                if ( distance2dsquared( var_29c712a3c9b9188c, pos ) < 62500 )
                {
                    continue;
                }
                
                valid_spawn_positions[ valid_spawn_positions.size ] = pos;
            }
            
            spawn_pos = utility::array_random( valid_spawn_positions );
            
            if ( !isdefined( spawn_pos ) )
            {
                return;
            }
            
            agent = agent_manager::spawn_agent( aitype, spawn_pos );
            
            if ( isdefined( agent ) )
            {
                agent.spawn_loc = spawnstruct();
                agent.origin = spawn_pos;
                agent.spawn_source = "dev_spawned";
            }
            
            return agent;
        }
    }
}

/#

    // Namespace procedural_spawner
    // Params 0
    // Checksum 0xcfd9aa78, Offset: 0x217
    // Size: 0x3c, Type: dev
    function function_2527aae404cb1e5f()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" + "<dev string:x30>" + "<dev string:x3b>" );
        devgui::add_devgui_func( "<dev string:x3d>", "<dev string:x54>", &draw_spawn_area, 1 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace procedural_spawner
    // Params 0, eflags: 0x4
    // Checksum 0xab2c41df, Offset: 0x25b
    // Size: 0xfb, Type: dev
    function private draw_spawn_area()
    {
        while ( true )
        {
            if ( isdefined( level.players ) )
            {
                foreach ( player in level.players )
                {
                    var_29c712a3c9b9188c = getclosestpointonnavmesh( player.origin );
                    sphere( var_29c712a3c9b9188c, 2, ( 0, 0, 1 ), 1, 1 );
                    utility::draw_circle( var_29c712a3c9b9188c, 250, ( 0, 0, 1 ), 1, 1, 1 );
                    utility::draw_circle( var_29c712a3c9b9188c, 500, ( 0, 0, 1 ), 1, 1, 1 );
                }
            }
            
            waitframe();
        }
    }

#/
