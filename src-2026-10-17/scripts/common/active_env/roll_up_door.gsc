#using scripts\common\active_env\utility;
#using scripts\common\vehicle;
#using scripts\mp\damage;

#namespace roll_up_door;

// Namespace roll_up_door
// Params 0
// Checksum 0x80e05832, Offset: 0x200
// Size: 0x1cc
function roll_up_door_init()
{
    level.var_bbf68f2be46430bd = [ "ground_drone_unit", "veh_ground_drone_unit", "veh_ground_drone_unit_ob", "super_drone_launcher", "veh_ground_drone_unit_ob_capricorn", "veh_drone_launcher_bomb", "veh_drone_launcher_bomb_mp", "veh_drone_launcher_bomb_ob_capricorn" ];
    
    if ( !isdefined( self.target ) )
    {
        return;
    }
    
    self.var_6332ff0696aef6e = &function_d8cd11c793dfca45;
    self.func_activate = &door_activate;
    var_2e7acd8784d10d0a = getnoentvolumearray( self.target, #targetname );
    
    if ( var_2e7acd8784d10d0a.size == 0 )
    {
        return;
    }
    
    foreach ( t_zone in var_2e7acd8784d10d0a )
    {
        switch ( t_zone.script_noteworthy )
        {
            case #"hash_5189556aab7779fb":
                utility::function_9fc28d50a2652cd7( t_zone );
                self.t_crush_zone = t_zone;
                break;
            case #"hash_25e3470529d6c02c":
                self.t_kill_zone = t_zone;
                break;
            case #"hash_7bdab6b68c88eb97":
                self.var_e958f5af05f687d1 = t_zone;
                break;
            default:
                break;
        }
    }
    
    if ( isdefined( self.var_e958f5af05f687d1 ) )
    {
        thread function_ee411bff297583bb();
    }
    
    str_starting_state = self getscriptablepartstate( "door" );
    b_start_closed = 0;
    
    if ( str_starting_state == "closed door" )
    {
        b_start_closed = 1;
    }
}

// Namespace roll_up_door
// Params 1
// Checksum 0x130fb2b0, Offset: 0x3d4
// Size: 0x102
function door_activate( e_user )
{
    str_current_state = self getscriptablepartstate( "door" );
    self.t_crush_zone thread utility::function_5ca354a4734a1bd8();
    
    if ( str_current_state == "opened" )
    {
        thread function_e517de4d913ae9b0( 1 );
        self.t_kill_zone thread function_a48236bebed2a1bd( e_user, 1, 1 );
        
        if ( isdefined( level.var_79cd625e66d1e20f ) )
        {
            playsoundatpos( self.origin, level.var_79cd625e66d1e20f );
        }
    }
    else if ( isdefined( level.var_e0fb0ef2dae60915 ) )
    {
        playsoundatpos( self.origin, level.var_e0fb0ef2dae60915 );
    }
    
    self waittill( #"standby" );
    self.t_crush_zone thread utility::function_9074f7fdf422f8e5();
    self.t_kill_zone notify( #"stop_monitoring" );
    
    if ( isdefined( level.var_5d158751bd852b61 ) )
    {
        playsoundatpos( self.origin, level.var_5d158751bd852b61 );
    }
}

// Namespace roll_up_door
// Params 0
// Checksum 0xc8af8f38, Offset: 0x4de
// Size: 0x107, Type: bool
function function_d8cd11c793dfca45()
{
    str_current_state = self getscriptablepartstate( "door" );
    
    if ( str_current_state != "opened" )
    {
        return false;
    }
    
    var_373542293c8085a9 = getentarrayinradius( undefined, undefined, self.t_crush_zone.origin, 200 );
    
    foreach ( e_ent in var_373542293c8085a9 )
    {
        if ( e_ent.code_classname == "script_vehicle" && e_ent istouching( self.t_crush_zone ) )
        {
            return true;
        }
        
        if ( isbot( e_ent ) || isscriptedai( e_ent ) )
        {
            if ( e_ent istouching( self.var_e958f5af05f687d1 ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace roll_up_door
// Params 1, eflags: 0x4
// Checksum 0x891224be, Offset: 0x5ee
// Size: 0xf0
function private function_e517de4d913ae9b0( delay )
{
    level endon( #"game_ended" );
    self.t_crush_zone endon( #"hash_316019751c651d01" );
    wait delay;
    
    while ( true )
    {
        var_373542293c8085a9 = getentarrayinradius( "script_vehicle", #code_classname, self.t_crush_zone.origin, 200 );
        
        foreach ( e_ent in var_373542293c8085a9 )
        {
            if ( e_ent istouching( self.t_crush_zone ) )
            {
                e_ent vehicle::explode( undefined, 1 );
            }
        }
        
        waitframe();
    }
}

// Namespace roll_up_door
// Params 3, eflags: 0x4
// Checksum 0xbb264eaf, Offset: 0x6e6
// Size: 0x10c
function private function_a48236bebed2a1bd( e_user, n_delay, var_5cb4f8bc8ebba77 = undefined )
{
    level endon( #"game_ended" );
    self endon( #"stop_monitoring" );
    wait n_delay;
    
    while ( true )
    {
        self waittill( #"trigger", e_ent );
        
        if ( isplayer( e_ent ) && ispointinvolume( e_ent.origin, self, 1 ) && e_ent isonground() )
        {
            e_player = e_ent;
            e_attacker = e_user;
            
            if ( !isdefined( e_attacker ) || e_player.team == e_attacker.team )
            {
                e_attacker = e_player;
            }
            
            e_player.nocorpse = var_5cb4f8bc8ebba77;
            damage::addattacker( e_player, e_attacker, undefined, nullweapon(), 0, undefined, undefined, "default", undefined, "MOD_CRUSH" );
            e_player kill( self.origin, e_attacker, self, "MOD_CRUSH" );
        }
    }
}

// Namespace roll_up_door
// Params 0, eflags: 0x4
// Checksum 0xc8001ead, Offset: 0x7fa
// Size: 0x7e
function private function_ee411bff297583bb()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self.var_e958f5af05f687d1 waittill( #"trigger", e_ent );
        
        if ( isbot( e_ent ) || isscriptedai( e_ent ) )
        {
            function_17dea0194c4f1719( e_ent );
            continue;
        }
        
        if ( e_ent.classname == "script_vehicle" )
        {
            if ( is_valid_ai( e_ent ) )
            {
                function_17dea0194c4f1719( e_ent );
            }
        }
    }
}

// Namespace roll_up_door
// Params 1, eflags: 0x4
// Checksum 0xab327240, Offset: 0x880
// Size: 0xca, Type: bool
function private is_valid_ai( e_ent )
{
    if ( e_ent.vehiclename && arraycontains( level.var_bbf68f2be46430bd, e_ent.vehiclename ) )
    {
        return true;
    }
    else if ( e_ent.streakname && arraycontains( level.var_bbf68f2be46430bd, e_ent.streakname ) )
    {
        return true;
    }
    else if ( e_ent.streakref && arraycontains( level.var_bbf68f2be46430bd, e_ent.streakref ) )
    {
        return true;
    }
    else if ( e_ent.superref && arraycontains( level.var_bbf68f2be46430bd, e_ent.superref ) )
    {
        return true;
    }
    
    return false;
}

// Namespace roll_up_door
// Params 1, eflags: 0x4
// Checksum 0xd73bc766, Offset: 0x953
// Size: 0x84
function private function_17dea0194c4f1719( var_83b9de892b2ef898 )
{
    str_current_state = self getscriptablepartstate( "door" );
    
    if ( str_current_state != "closed" )
    {
        return;
    }
    
    var_c4c19cd0e72fe598 = getentitylessscriptablearray( self.targetname, #target );
    
    if ( var_c4c19cd0e72fe598[ 0 ] getscriptablehaspart( "arcwire_transmitter" ) )
    {
        if ( var_c4c19cd0e72fe598[ 0 ] getscriptablepartstate( "arcwire_transmitter" ) == "locked" )
        {
            return;
        }
        
        self notify( #"activate", var_c4c19cd0e72fe598[ 0 ], var_83b9de892b2ef898 );
    }
}

