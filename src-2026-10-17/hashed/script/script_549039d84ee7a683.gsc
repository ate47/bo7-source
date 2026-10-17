#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\mp\zm\ztron\ztron_arena;
#using scripts\mp\zm\ztron\ztron_hazard;
#using scripts\mp\zm\ztron\ztron_sound;
#using scripts\mp\zm\ztron\ztron_utility;

#namespace namespace_e7a4e93bdfe04b45;

// Namespace namespace_e7a4e93bdfe04b45
// Params 0, eflags: 0x5
// Checksum 0xdffefb49, Offset: 0x1e0
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_f930152bf4af153a", #"hash_4599115b7d4d2ff0", undefined, &init );
}

// Namespace namespace_e7a4e93bdfe04b45
// Params 0
// Checksum 0x1d6eb572, Offset: 0x209
// Size: 0x84
function init()
{
    ztron_hazard::function_6f661fac5fd31f1( #"flogger", #"create", &function_f91630ded89ad41a );
    ztron_hazard::function_6f661fac5fd31f1( #"flogger", #"arenaspawn", &function_eb5bbc5bb206e944 );
    ztron_sound::function_4ac735395b173fe( "ztron_hazard_flogger_eng_start", "evt_ztron_hazard_flogger_eng_start" );
    ztron_sound::function_4ac735395b173fe( "ztron_hazard_flogger_eng_loop", "evt_ztron_hazard_flogger_eng_loop", 1 );
    ztron_sound::function_4ac735395b173fe( "ztron_hazard_flogger_eng_stop", "evt_ztron_hazard_flogger_eng_stop" );
    ztron_sound::function_4ac735395b173fe( "ztron_hazard_flogger_impact", "evt_ztron_hazard_flogger_impact" );
}

// Namespace namespace_e7a4e93bdfe04b45
// Params 0
// Checksum 0x5dbc4302, Offset: 0x295
// Size: 0xb1
function function_eb5bbc5bb206e944()
{
    level.ztron.var_8b8d2de78e07aa9e = [];
    traps = level.ztron.active_arena ztron_arena::function_eb3bad474c41ae42( "flogger" );
    
    foreach ( trap in traps )
    {
        function_f91630ded89ad41a( trap );
    }
}

// Namespace namespace_e7a4e93bdfe04b45
// Params 2
// Checksum 0x234b8c15, Offset: 0x34e
// Size: 0x59
function function_f91630ded89ad41a( trap, page = 0 )
{
    if ( page )
    {
        level.ztron.var_8b8d2de78e07aa9e[ level.ztron.var_8b8d2de78e07aa9e.size ] = trap;
        return;
    }
    
    function_6b768bb0cd876d65( trap );
}

// Namespace namespace_e7a4e93bdfe04b45
// Params 2
// Checksum 0x71362fbd, Offset: 0x3af
// Size: 0x166
function function_6b768bb0cd876d65( trap, paged = 0 )
{
    hazard = utility::spawn_model( "sat_zm_trap_flogger", trap.origin, trap.angles );
    hazard.hazardtype = "flogger";
    trap.script_model = hazard;
    trap.paged = paged;
    trap.trigger = [];
    trap.spinrate = 1;
    trap.minwait = 3;
    trap.maxwait = 5;
    trap.maxloops = 11;
    
    if ( isdefined( trap.script_parameters ) )
    {
        args = strtok( trap.script_parameters, ";" );
        
        if ( args.size > 0 )
        {
            trap.spinrate = float( args[ 0 ] );
        }
        
        if ( args.size > 1 )
        {
            trap.minwait = float( args[ 1 ] );
        }
        
        if ( args.size > 2 )
        {
            trap.maxwait = float( args[ 2 ] );
        }
        
        if ( args.size > 3 )
        {
            trap.maxloops = int( args[ 3 ] );
        }
    }
    
    trap thread function_57d96e9d431c55e8();
    return trap;
}

// Namespace namespace_e7a4e93bdfe04b45
// Params 0, eflags: 0xc
// Checksum 0x48ac9c04, Offset: 0x51e
// Size: 0x31f
function private function_57d96e9d431c55e8()
{
    self notify( #"hash_f6248ef53d63696c" );
    self endon( #"hash_f6248ef53d63696c" );
    level endon( #"ztron_game_is_over" );
    self endon( #"destroy_hazard" );
    thread function_39ec2ecdeae1bea();
    self.script_model solid();
    length = 10;
    self.triggers = [];
    triggersize = ( 12, 70, 12 );
    
    for ( i = 0; i < 2 ; i++ )
    {
        trigger = spawn( "trigger_box", self.origin, 0, triggersize, triggersize + ( 1, 1, 1 ) );
        trigger.owner = self;
        trigger.isoneshot = 1;
        trigger enablelinkto();
        trigger triggerdisable();
        self.triggers[ self.triggers.size ] = trigger;
        
        /#
            trigger thread flogger_debug();
        #/
    }
    
    tag = "tag_origin";
    self.triggers[ 0 ] linkto( self.script_model, tag, ( -100, 0, 0 ), ( 0, 0, 0 ) );
    self.triggers[ 1 ] linkto( self.script_model, tag, ( 100, 0, 0 ), ( 0, 0, 0 ) );
    animationrate = self.spinrate;
    length /= animationrate;
    
    while ( true )
    {
        ztron_sound::ztron_playsound( "ztron_hazard_flogger_eng_start", undefined, self.script_model );
        wait 1;
        
        foreach ( trigger in self.triggers )
        {
            trigger triggerenable();
            trigger thread hazard_kill_think( self );
        }
        
        ztron_sound::ztron_playsound( "ztron_hazard_flogger_eng_loop", undefined, self.script_model );
        self.script_model rotatepitch( -360 * self.maxloops, length, 0.5, 0.5 );
        wait length;
        ztron_sound::ztron_stopsound( self.script_model );
        ztron_sound::ztron_playsound( "ztron_hazard_flogger_eng_stop", undefined, self.script_model );
        
        foreach ( trigger in self.triggers )
        {
            trigger triggerdisable();
        }
        
        wait randomfloatrange( self.minwait, self.maxwait );
    }
}

// Namespace namespace_e7a4e93bdfe04b45
// Params 1, eflags: 0xc
// Checksum 0xd7278dec, Offset: 0x845
// Size: 0x1bb
function private hazard_kill_think( trap )
{
    self notify( #"hash_a90b248cf760d9c7" );
    self endon( #"hash_a90b248cf760d9c7" );
    self endon( #"death", #"hazard_trigger_released" );
    fling_force = 6000;
    
    while ( isdefined( self ) )
    {
        self waittill( #"trigger", guy );
        
        if ( isdefined( guy ) )
        {
            if ( !isdefined( guy.var_fe7c8f5f718fd9d5 ) )
            {
                guy.var_fe7c8f5f718fd9d5 = 0;
            }
            
            if ( guy.var_fe7c8f5f718fd9d5 < gettime() )
            {
                guy.var_fe7c8f5f718fd9d5 = gettime() + 500;
            }
            
            if ( guy.var_3729e99427f12e73 || guy.ztron.boss )
            {
                continue;
            }
            
            if ( isplayer( guy ) || guy vehicle::is_vehicle() )
            {
                guy dodamage( ( trap.damage ?? guy.health ) + 100, guy.origin, self );
                guy playrumbleonentity( "damage_heavy" );
                continue;
            }
            
            if ( !guy.no_ragdoll )
            {
                v_centroid = guy getcentroid();
                v_away_from_source = vectornormalize( v_centroid - self.origin );
                v_away_from_source *= 512;
                v_away_from_source = ( v_away_from_source[ 0 ], v_away_from_source[ 1 ], randomintrange( 128, 200 ) );
                guy thread ztron_util::function_afa1f6a404783c8a( v_away_from_source, fling_force );
                continue;
            }
            
            guy.forceannihilate = 1;
            
            if ( !guy.marked_for_death )
            {
                guy thread ztron_util::function_ea0a0be5c5468c48( 0.5, undefined, undefined, 0 );
            }
        }
    }
}

// Namespace namespace_e7a4e93bdfe04b45
// Params 0
// Checksum 0x10613965, Offset: 0xa08
// Size: 0x123
function function_39ec2ecdeae1bea()
{
    self notify( #"hash_a1050bcef46b02d3" );
    self endon( #"hash_a1050bcef46b02d3" );
    thread ztron_hazard::function_4d643b159a80c647();
    self waittill( #"destroy_hazard" );
    
    if ( self.paged )
    {
        level.ztron.var_8b8d2de78e07aa9e = arrayremove( level.ztron.var_8b8d2de78e07aa9e, self );
    }
    
    if ( isdefined( self.triggers ) )
    {
        foreach ( trigger in self.triggers )
        {
            trigger delete();
        }
        
        self.triggers = undefined;
    }
    
    if ( isdefined( self.script_model ) )
    {
        self.script_model delete();
        self.script_model = undefined;
    }
    
    self.paged = undefined;
}

/#

    // Namespace namespace_e7a4e93bdfe04b45
    // Params 0
    // Checksum 0xa5e95349, Offset: 0xb33
    // Size: 0x5a, Type: dev
    function flogger_debug()
    {
        self endon( #"death" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_e0d1acd921d5fdb5", 0 ) >= 1 )
            {
                if ( self istriggerenabled() )
                {
                    drawtrigger( self, ( 1, 0, 0 ), 0, 1, 0, ( 1, 0, 0 ) );
                }
            }
            
            waitframe();
        }
    }

#/
