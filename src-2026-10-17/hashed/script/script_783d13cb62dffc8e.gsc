#using scripts\common\ai\ai_spawn_director;
#using scripts\common\utility;

#namespace ob_zombie_viper;

// Namespace ob_zombie_viper
// Params 2
// Checksum 0xeebff23b, Offset: 0x99
// Size: 0x4b
function precache( classname, aitypescriptbundle )
{
    if ( level.var_8b41e813c943b14f )
    {
        return;
    }
    
    level.var_8b41e813c943b14f = 1;
    utility::registersharedfunc( #"zombie_viper", #"hash_92c23ca347488bd8", &function_56e72d0c65bf972b );
}

// Namespace ob_zombie_viper
// Params 4, eflags: 0x4
// Checksum 0xd105222a, Offset: 0xec
// Size: 0x99
function private function_56e72d0c65bf972b( aitype, origin, angle, team )
{
    user_data = {};
    group_id = ai_spawn_director::function_e19f6a00c4bb7490( "zombie_viper_eject", 0, 1, 1, 1 );
    function_64ac8c4e752f4dca( group_id, 0 );
    ai_spawn_director::function_35aa3b1d92cd8207( "OnSpawned", group_id, &function_e835375bcabb9b49, user_data );
    ai_spawn_director::function_9893a28f1d682a28( group_id, aitype, origin, angle, undefined, undefined, undefined, team );
    user_data waittill( #"eject_ai_spawned", agent );
    return agent;
}

// Namespace ob_zombie_viper
// Params 4, eflags: 0x4
// Checksum 0xffc6e476, Offset: 0x18e
// Size: 0x36
function private function_e835375bcabb9b49( groupid, userdata, agent, var_6d63bc1fea0a37c2 )
{
    userdata notify( #"eject_ai_spawned", agent );
}

