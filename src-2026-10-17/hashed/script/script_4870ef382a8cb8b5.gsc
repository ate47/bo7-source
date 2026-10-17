#using script_ac32c5a74321662;

#namespace namespace_38f5f28e3f2f0fab;

// Namespace namespace_38f5f28e3f2f0fab
// Params 2
// Checksum 0xa439224d, Offset: 0x9f
// Size: 0xb9
function function_eb224126b23f84da( taskid, params )
{
    if ( !self._blackboard.var_2ae163fc4d461251 )
    {
        return anim.failure;
    }
    
    if ( self getaiblackboarddynamic( "in_float_move" ) )
    {
        namespace_7143065cf1b062e3::function_49e69160997ef8d6();
    }
    
    var_9ca004c5114849f2 = self._blackboard.var_2ccb0e03a4937933;
    float_move_speed = undefined;
    
    if ( isfloat( params ) )
    {
        float_move_speed = params;
    }
    else if ( isstring( params ) )
    {
        float_move_speed = self getaiblackboarddynamic( params );
    }
    
    self clearpath();
    self setbtgoalpos( 0, var_9ca004c5114849f2 );
    namespace_7143065cf1b062e3::function_dce35a336383305c( var_9ca004c5114849f2, float_move_speed, 0 );
    return anim.success;
}

// Namespace namespace_38f5f28e3f2f0fab
// Params 2
// Checksum 0x7f6bb137, Offset: 0x161
// Size: 0xaf
function function_7ac8b4c83dc8549( taskid, params )
{
    if ( self getaiblackboarddynamic( "in_float_move" ) )
    {
        self animmode( "noclip" );
        
        if ( isdefined( self.var_c7f4f9790bc868e1 ) )
        {
            next_point_index = int( min( self.var_c7f4f9790bc868e1.current_index + 1, self.var_c7f4f9790bc868e1.points.size - 1 ) );
            self orientmode( "face point", self.var_c7f4f9790bc868e1.points[ next_point_index ] );
        }
        
        return anim.running;
    }
    
    return anim.success;
}

// Namespace namespace_38f5f28e3f2f0fab
// Params 2
// Checksum 0xf161498f, Offset: 0x219
// Size: 0x3a
function function_6d90bac3a6bf0b07( taskid, params )
{
    self._blackboard.var_2ae163fc4d461251 = 0;
    namespace_7143065cf1b062e3::function_49e69160997ef8d6();
    return anim.success;
}

