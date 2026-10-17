#using script_463d4782331167a7;
#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_galileo_move;

// Namespace zombie_galileo_move
// Params 0
// Checksum 0xe9259259, Offset: 0x100
// Size: 0x22
function function_d0eff41dd77b3b53()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &on_move_speed_changed );
}

// Namespace zombie_galileo_move
// Params 0
// Checksum 0x745838f7, Offset: 0x12a
// Size: 0x51
function init_zombie_galileo_move()
{
    self.var_c5f6992b5d40a78b = 0;
    self.min_run_speed = getanimspeedthreshold( self, "run" );
    self.max_run_speed = getanimspeedthreshold( self, "run_fast" );
    self.run_speed_frac = 0;
    self function_6e8526b0ec373745( 0.01 );
    
    /#
        thread function_c2e1dfbc38e5ab76();
    #/
}

// Namespace zombie_galileo_move
// Params 1, eflags: 0x4
// Checksum 0x2ac295b6, Offset: 0x183
// Size: 0x13
function private on_move_speed_changed( params )
{
    update_run_speed();
}

// Namespace zombie_galileo_move
// Params 0
// Checksum 0xc00b1167, Offset: 0x19e
// Size: 0xbd
function update_run_speed()
{
    if ( self._blackboard.movetype == "run" )
    {
        min_run_speed = self.min_run_speed ?? getanimspeedthreshold( self, "run" );
        max_run_speed = self.max_run_speed ?? getanimspeedthreshold( self, "run_fast" );
        run_speed_frac = self.run_speed_frac ?? 0;
        
        /#
            if ( isdvardefined( @"hash_5821ef02f1466039" ) )
            {
                run_speed_frac = getdvarfloat( @"hash_5821ef02f1466039" );
            }
        #/
        
        run_speed = lerp( min_run_speed, max_run_speed, run_speed_frac, 1 );
        self aisetdesiredspeed( run_speed );
        self aisettargetspeed( run_speed );
    }
}

// Namespace zombie_galileo_move
// Params 2
// Checksum 0xb841ad7c, Offset: 0x263
// Size: 0xd7
function function_fd99272b36c06f23( taskid, params )
{
    if ( getdvarfloat( @"hash_34d4da870a58855f", 0 ) > 0 )
    {
        return anim.success;
    }
    
    if ( self getaiblackboarddynamic( "in_turning" ) == 1 )
    {
        return anim.success;
    }
    
    if ( self getaiblackboarddynamic( "in_exit" ) == 1 )
    {
        return anim.success;
    }
    
    if ( self getaiblackboarddynamic( "pause_patrol" ) )
    {
        return anim.success;
    }
    
    if ( self.moving_to )
    {
        goal_pos = self.moving_to.origin;
        
        if ( !function_d2f1531271073998( goal_pos ) )
        {
            zombie_utils::update_bt_goal( goal_pos );
            return anim.running;
        }
    }
    
    function_5c5c88218e115c1();
    return anim.running;
}

// Namespace zombie_galileo_move
// Params 1
// Checksum 0x17e9aa0e, Offset: 0x343
// Size: 0xb6
function function_1f7b1a6a8d9e7c89( taskid )
{
    self.ispatrolling = 1;
    utility::function_7c10ea82c1e305b8( "scan_vfx", "patrol" );
    zombie_galileo_audio::function_a1facf180db60d06( "dx_zm_agal_aiga_gali_agptrl" );
    self notify( #"galileo_patrol_start" );
    
    if ( !self.target_patrol_point )
    {
        return anim.failure;
    }
    
    self.moving_to = self.target_patrol_point;
    
    if ( !self isposreachable( self.moving_to.origin ) )
    {
        function_5c5c88218e115c1();
    }
    
    if ( !self.moving_to )
    {
        return anim.failure;
    }
    
    /#
        thread function_4b4772b42a1bcad5();
    #/
    
    return anim.success;
}

// Namespace zombie_galileo_move
// Params 1
// Checksum 0xa4a047db, Offset: 0x402
// Size: 0x35
function function_f07d1cd91dbc35f8( taskid )
{
    self.ispatrolling = 0;
    self notify( #"galileo_patrol_end" );
    self.moving_to = undefined;
    return anim.success;
}

// Namespace zombie_galileo_move
// Params 1, eflags: 0x4
// Checksum 0xdfc55c76, Offset: 0x440
// Size: 0x34, Type: bool
function private function_d2f1531271073998( goal_pos )
{
    dist_sq = distancesquared( goal_pos, self.origin );
    
    if ( dist_sq > 2500 )
    {
        return false;
    }
    
    return true;
}

// Namespace zombie_galileo_move
// Params 0, eflags: 0x4
// Checksum 0x863677ba, Offset: 0x47d
// Size: 0xda
function private function_5c5c88218e115c1()
{
    new_target_patrol_point = get_next_patrol_point();
    
    if ( !isvector( new_target_patrol_point.origin ) || !self isposreachable( new_target_patrol_point.origin ) )
    {
        function_66d52ce9089bde17();
        new_target_patrol_point = get_next_patrol_point();
        
        if ( !isvector( new_target_patrol_point.origin ) || !self isposreachable( new_target_patrol_point.origin ) )
        {
            function_66d52ce9089bde17();
            new_target_patrol_point = utility::callsharedfunc( #"zombie_galileo", #"hash_3e9d23e9e22b6d6d" );
            
            if ( !isvector( new_target_patrol_point.origin ) || !self isposreachable( new_target_patrol_point.origin ) )
            {
                return;
            }
        }
    }
    
    self.target_patrol_point = new_target_patrol_point;
    self.moving_to = self.target_patrol_point;
}

// Namespace zombie_galileo_move
// Params 0, eflags: 0x4
// Checksum 0x9329d49a, Offset: 0x55f
// Size: 0x35
function private get_next_patrol_point()
{
    if ( self.var_c5f6992b5d40a78b )
    {
        return self.target_patrol_point.prev;
    }
    
    return self.target_patrol_point.next;
}

// Namespace zombie_galileo_move
// Params 0
// Checksum 0x489e9208, Offset: 0x59d
// Size: 0x15
function function_66d52ce9089bde17()
{
    self.var_c5f6992b5d40a78b = !self.var_c5f6992b5d40a78b;
}

/#

    // Namespace zombie_galileo_move
    // Params 0, eflags: 0xc
    // Checksum 0x562700b3, Offset: 0x5ba
    // Size: 0x10c, Type: dev
    function private function_c2e1dfbc38e5ab76()
    {
        self notify( #"hash_ee0a628b845f3202" );
        self endon( #"hash_ee0a628b845f3202" );
        self endon( #"death" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_adfbed3031259b7f", 0 ) )
            {
                for ( patrolpoint = level.galileo_patrol_start_point; patrolpoint.next && !patrolpoint.next.isstartpoint ; patrolpoint = patrolpoint.next )
                {
                    sphere( patrolpoint.origin, 10, ( 0, 1, 0 ) );
                }
                
                sphere( patrolpoint.origin, 10, ( 0, 1, 0 ) );
                
                if ( isdefined( self.moving_to.origin ) )
                {
                    sphere( self.moving_to.origin, 10, ( 1, 1, 0 ) );
                }
            }
            
            waitframe();
        }
    }

    // Namespace zombie_galileo_move
    // Params 0, eflags: 0xc
    // Checksum 0x56b8f85e, Offset: 0x6ce
    // Size: 0xb1, Type: dev
    function private function_4b4772b42a1bcad5()
    {
        self notify( #"hash_73cd52e85be7aa43" );
        self endon( #"hash_73cd52e85be7aa43" );
        self endon( #"death" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_ae68d581d272ead5", 0 ) && self.ispatrolling )
            {
                cone_origin = self gettagorigin( "<dev string:x24>" );
                cone_forward = anglestoforward( self gettagangles( "<dev string:x24>" ) );
                cone_length = 900;
                cone_angle = 45;
                utility::draw_cone( cone_origin, cone_forward, cone_length, cone_angle, ( 1, 1, 0 ) );
            }
            
            waitframe();
        }
    }

#/
