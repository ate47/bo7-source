#using scripts\common\utility;

#namespace spawn_scriptable;

// Namespace spawn_scriptable
// Params 1
// Checksum 0x9113254e, Offset: 0x76
// Size: 0x11c
function execute( params )
{
    scriptable = params.scriptable;
    vector_right = anglestoright( self.angles ) * params.spawndirection.x;
    vector_forward = anglestoforward( self.angles ) * params.spawndirection.y;
    vector_up = anglestoup( self.angles ) * params.spawndirection.z;
    spawn_vector = vector_right + vector_forward + vector_up;
    spawn_target_position = utility::drop_to_ground( self.origin + spawn_vector, 1 );
    spawn_target_position = getclosestpointonnavmesh( spawn_target_position );
    spawn_payload = params.payload ?? calcscriptablepayloadgravityarc( self.origin, spawn_target_position );
    spawnscriptable( scriptable, spawn_target_position, self.angles, undefined, spawn_payload );
}

