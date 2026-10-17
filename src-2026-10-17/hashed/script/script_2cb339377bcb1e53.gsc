#namespace decoy_common;

// Namespace decoy_common
// Params 2
// Checksum 0xbff41bf6, Offset: 0x76
// Size: 0x12b
function function_f52dc1fe2728d92a( radius, height )
{
    if ( !isdefined( self.var_a86781dcbe906872 ) )
    {
        self.var_a86781dcbe906872 = [];
    }
    
    if ( isdefined( height ) )
    {
        vehicles = vehicle_getarrayinradius( self.origin, radius, height );
    }
    else
    {
        vehicles = vehicle_getarrayinradius( self.origin, radius );
    }
    
    sorted_vehicles = sortbydistance( vehicles, self.origin );
    
    foreach ( vehicle in sorted_vehicles )
    {
        if ( isdefined( vehicle.var_5b4cf7bb85e1db29 ) && !isdefined( self.var_a86781dcbe906872[ vehicle getentitynumber() ] ) )
        {
            vehicle thread [[ vehicle.var_5b4cf7bb85e1db29 ]]( self );
            self.var_a86781dcbe906872[ vehicle getentitynumber() ] = 1;
            return;
        }
    }
}

// Namespace decoy_common
// Params 2
// Checksum 0xaec1b517, Offset: 0x1a9
// Size: 0x23
function function_1e22c5dde3d1a4d1( ent, callbackfn )
{
    ent.var_5b4cf7bb85e1db29 = callbackfn;
}

