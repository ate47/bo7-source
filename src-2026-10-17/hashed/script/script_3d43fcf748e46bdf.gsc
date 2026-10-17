#using script_7e916efe0ee8c563;
#using scripts\common\debug;
#using scripts\common\trace;
#using scripts\common\vehicle;

#namespace zombie_shade_swipe;

// Namespace zombie_shade_swipe
// Params 0
// Checksum 0x80ebeb0, Offset: 0x95
// Size: 0x2d
function init_zombie_shade_swipe()
{
    self._blackboard.var_f98a47aa5cd0dadf = 50;
    self.var_d4a397a6f6cddafa = &function_d4a397a6f6cddafa;
    thread function_2b47e5d6bd48cb65();
}

// Namespace zombie_shade_swipe
// Params 0, eflags: 0x4
// Checksum 0x1a636204, Offset: 0xca
// Size: 0x6c
function private function_2b47e5d6bd48cb65()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"double_swipe_start" );
        original_melee_damage = self.melee_damage;
        self.melee_damage = int( self.melee_damage * 0.5 );
        self waittill( #"double_swipe_end" );
        self.melee_damage = original_melee_damage;
    }
}

// Namespace zombie_shade_swipe
// Params 2, eflags: 0x4
// Checksum 0xa967e189, Offset: 0x13e
// Size: 0x1b0
function private function_d4a397a6f6cddafa( msg, melee_direction )
{
    target = self.var_3eaa5cd097e43179;
    
    if ( isplayer( target ) && isdefined( level.wonder_veh.occupants ) && level.wonder_veh.occupants[ "gunner" ] == target && isdefined( level.var_1290e4d5ec608e82 ) )
    {
        turret = vehicle::function_95e3c2e0c6eec800( level.wonder_veh, level.var_1290e4d5ec608e82 );
        
        if ( isdefined( turret ) )
        {
            if ( self tagexists( "TAG_EYE" ) )
            {
                eyepos = self gettagorigin( "TAG_EYE" );
            }
            else
            {
                eyepos = self gettagorigin( "j_head" );
            }
            
            targetpos = turret.origin + ( 0, 0, 10 );
            melee_direction = vectornormalize( targetpos - eyepos );
            
            /#
                if ( getdvarint( @"hash_c4a93a937a73a54e", 0 ) )
                {
                    endpos = eyepos + melee_direction * ( self.melee_range + 10 );
                    debug::line( eyepos, endpos, ( 1, 0, 0 ), 10 );
                    trace = trace::ray_trace( eyepos, endpos, self );
                    
                    if ( trace[ "<dev string:x24>" ] < 1 )
                    {
                        debug::sphere( trace[ "<dev string:x2d>" ], 5, ( 0, 1, 0 ), 10 );
                    }
                    else
                    {
                        debug::sphere( targetpos, 5, ( 1, 0, 0 ), 10 );
                    }
                }
            #/
        }
    }
    
    zombie_melee::function_d4a397a6f6cddafa( msg, melee_direction );
}

// Namespace zombie_shade_swipe
// Params 1
// Checksum 0x4f05cd8b, Offset: 0x2f6
// Size: 0x80
function function_7a571d3f337c9f5e( params )
{
    target = params.meleetarget;
    
    if ( isplayer( target ) && isdefined( level.wonder_veh.occupants ) && level.wonder_veh.occupants[ "gunner" ] == target && isdefined( level.var_1290e4d5ec608e82 ) )
    {
        params.var_948a2ae89285ee6a = 10;
    }
}

