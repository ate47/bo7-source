#using scripts\mp\zm\spawners\zone_spawner;

#namespace zm_zombie_abom;

// Namespace zm_zombie_abom
// Params 2
// Checksum 0xe5d7270e, Offset: 0x85
// Size: 0x26
function precache( classname, aitypescriptbundle )
{
    zone_spawner::register_can_spawn_agent( "zombie_abom", &can_spawn_abomination );
}

// Namespace zm_zombie_abom
// Params 0, eflags: 0x4
// Checksum 0x35079f81, Offset: 0xb3
// Size: 0x34, Type: bool
function private can_spawn_abomination()
{
    var_efe46fc4a3ad8f68 = zone_spawner::function_835973438f299e55( "zombie_abom" );
    var_7175eb0c319a9143 = function_dce75abc3198e5e5();
    
    if ( var_efe46fc4a3ad8f68 >= var_7175eb0c319a9143 )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_zombie_abom
// Params 0, eflags: 0x4
// Checksum 0xeef3d3eb, Offset: 0xf0
// Size: 0x6a
function private function_dce75abc3198e5e5()
{
    n_player_count = level.players.size;
    
    switch ( n_player_count )
    {
        case 1:
        default:
            return 1;
        case 2:
            return 2;
        case 3:
            return 3;
        case 4:
            return 4;
    }
}

