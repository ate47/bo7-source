#using script_4f9ce8d249a99f4a;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_tracking;

#namespace mp_sat_sm_abyss_periscope;

// Namespace mp_sat_sm_abyss_periscope
// Params 0
// Checksum 0x73b59e89, Offset: 0x232
// Size: 0x185
function init_periscope()
{
    level.vehiclecount = 0;
    level.maxvehiclecount = 2;
    t_periscope_trigger = getent( "periscope_trigger", #script_noteworthy );
    var_db688516f41eacea = { #angles:( 0, -90, 0 ), #origin:( 0, -176, 375 ) };
    var_871f757264eca6d5 = { #angles:( 0, 90, 0 ), #origin:( 0, 226, 375 ) };
    var_e7bca9a56155c5bf = { #var_d4238a09ea3a0e5b:undefined, #var_45574d26f574faeb:undefined, #var_10fa5a526e665eca:undefined, #var_86e21b7c3ea7b7f:0, #b_in_use:0, #var_a4bebdec17e6e27e:[ var_db688516f41eacea, var_871f757264eca6d5 ] };
    utility::flag_wait( "scriptables_ready" );
    
    foreach ( s_periscope in var_e7bca9a56155c5bf.var_a4bebdec17e6e27e )
    {
        function_282d4824b009d356( s_periscope );
    }
    
    t_periscope_trigger init_periscope_controls( var_e7bca9a56155c5bf );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0x112883bf, Offset: 0x3bf
// Size: 0xc6
function private function_282d4824b009d356( var_d951ae46b3b561be )
{
    s_spawn_data = { #owner:undefined, #targetname:"veh_sat_remote_periscope", #vehicletype:"veh_remote_periscope", #angles:var_d951ae46b3b561be.angles, #origin:var_d951ae46b3b561be.origin };
    var_23a4eb2abfe738d9 = spawnstruct();
    e_turret = vehicle_tracking::spawn_vehicle( s_spawn_data, var_23a4eb2abfe738d9 );
    
    if ( !e_turret )
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    function_18832d7a758f7b1( e_turret, var_d951ae46b3b561be );
    vehicle_tracking::register_instance( e_turret );
    vehicle_occupancy::register_instance( e_turret );
    var_d951ae46b3b561be.e_turret = e_turret;
}

// Namespace mp_sat_sm_abyss_periscope
// Params 2, eflags: 0x4
// Checksum 0x1acdc73, Offset: 0x48d
// Size: 0x41
function private function_18832d7a758f7b1( e_turret, var_d951ae46b3b561be )
{
    e_turret notsolid();
    e_turret dontinterpolate();
    e_turret vehicle_teleport( var_d951ae46b3b561be.origin, var_d951ae46b3b561be.angles, 0 );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0x6f5ee27f, Offset: 0x4d6
// Size: 0x83
function private init_periscope_controls( var_e7bca9a56155c5bf )
{
    var_e7bca9a56155c5bf.var_45574d26f574faeb = 1;
    val::group_register( "remotePeriscopeUse", [ "allow_movement", "usability", "killstreaks", "supers", "reload", "offhand_weapons", "melee" ] );
    function_96b85365e21c4ab7( var_e7bca9a56155c5bf );
    thread function_18923b18a840d619( var_e7bca9a56155c5bf, 95 );
    thread function_7a9a8e06c05bd61c( var_e7bca9a56155c5bf );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 2, eflags: 0x4
// Checksum 0x184be5a3, Offset: 0x561
// Size: 0x9d
function private function_18923b18a840d619( var_e7bca9a56155c5bf, var_8815e5b4aa038ff1 )
{
    level endon( #"game_ended" );
    self setuserange( var_8815e5b4aa038ff1 ?? 100 );
    self sethintdisplayrange( var_8815e5b4aa038ff1 ?? 100 );
    self sethintdisplayfov( 60 );
    self setusefov( 60 );
    
    while ( true )
    {
        if ( var_e7bca9a56155c5bf.b_in_use )
        {
            self setusableenabled( 0 );
            self sethintinoperable( 1 );
        }
        else
        {
            self setusableenabled( 1 );
            self sethintstring( &"mp/use_periscope" );
            self setcursorhint( "HINT_BUTTON" );
            self sethintinoperable( 0 );
        }
        
        waitframe();
    }
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0x50fd5bee, Offset: 0x606
// Size: 0x69
function private function_7a9a8e06c05bd61c( var_e7bca9a56155c5bf )
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"trigger", e_player );
        
        if ( isplayer( e_player ) && var_e7bca9a56155c5bf.var_d4238a09ea3a0e5b != e_player )
        {
            e_player function_f63c1b6bb98ab439( var_e7bca9a56155c5bf, var_e7bca9a56155c5bf.var_45574d26f574faeb );
        }
    }
}

// Namespace mp_sat_sm_abyss_periscope
// Params 2, eflags: 0x4
// Checksum 0xfd728613, Offset: 0x677
// Size: 0x74
function private function_f63c1b6bb98ab439( var_e7bca9a56155c5bf, var_f86051884e71f22e )
{
    function_618fbd53a3c28b0f( var_e7bca9a56155c5bf.var_a4bebdec17e6e27e[ var_f86051884e71f22e ].e_turret );
    self waittill( #"periscope_transition_complete" );
    
    if ( !player::isreallyalive( self ) || player::isinlaststand( self ) )
    {
        self setclientomnvar( o"ui_using_killstreak_remote", 0 );
        return;
    }
    
    function_cc4115e7079b690c( var_e7bca9a56155c5bf, var_f86051884e71f22e );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0x14399c16, Offset: 0x6f3
// Size: 0x4b
function private function_618fbd53a3c28b0f( e_turret )
{
    e_turret.remotecontrolled = 1;
    val::group_set( "remotePeriscopeUse", 0 );
    self setclientomnvar( o"ui_using_killstreak_remote", 1 );
    thread function_c5d11d3e13cca60();
    self notify( #"using_remote" );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 2, eflags: 0x4
// Checksum 0x727f2708, Offset: 0x746
// Size: 0x93
function private function_cc4115e7079b690c( var_e7bca9a56155c5bf, var_f86051884e71f22e )
{
    self.restoreangles = self getplayerangles();
    self setclientomnvar( "ui_veh_vehicle", 42 );
    var_e7bca9a56155c5bf.var_a4bebdec17e6e27e[ var_f86051884e71f22e ].e_turret setturretscriptcontrolled( 0, 0 );
    self usevehicle( var_e7bca9a56155c5bf.var_a4bebdec17e6e27e[ var_f86051884e71f22e ].e_turret, 0, 0 );
    var_e7bca9a56155c5bf.var_d4238a09ea3a0e5b = self;
    var_e7bca9a56155c5bf.b_in_use = 1;
    thread function_ee970a2ad6067ce9( var_e7bca9a56155c5bf );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0x93afe9dc, Offset: 0x7e1
// Size: 0x63
function private function_ee970a2ad6067ce9( var_e7bca9a56155c5bf )
{
    self endon( #"disconnect" );
    self endon( #"periscope_exit" );
    thread function_9e19e79f34d003ad( var_e7bca9a56155c5bf );
    thread function_ac3a9fd9c761a17( var_e7bca9a56155c5bf, 0.75 );
    thread function_ccc2d458e4358( var_e7bca9a56155c5bf );
    thread function_61995c5a0fece022( var_e7bca9a56155c5bf );
    self waittill( #"hash_597999d7b5a801e2" );
    exit_periscope( var_e7bca9a56155c5bf );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0x39594f98, Offset: 0x84c
// Size: 0xa2
function private exit_periscope( var_e7bca9a56155c5bf )
{
    self setclientomnvar( "ui_veh_vehicle", -1 );
    thread function_c5d11d3e13cca60();
    self waittill( #"periscope_transition_complete" );
    self setclientomnvar( o"ui_using_killstreak_remote", 0 );
    val::group_reset( "remotePeriscopeUse" );
    
    if ( self.restoreangles )
    {
        self setplayerangles( self.restoreangles );
    }
    
    if ( self isvehicleactive() )
    {
        self leavevehicle( 0, 1 );
    }
    
    var_e7bca9a56155c5bf.var_d4238a09ea3a0e5b = undefined;
    var_e7bca9a56155c5bf.b_in_use = 0;
    function_96b85365e21c4ab7( var_e7bca9a56155c5bf );
    self notify( #"periscope_exit" );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0x2ff12fc, Offset: 0x8f6
// Size: 0x10b
function private function_9e19e79f34d003ad( var_e7bca9a56155c5bf )
{
    if ( !( isdefined( self ) && isdefined( var_e7bca9a56155c5bf ) ) )
    {
        return;
    }
    
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    self endon( #"end_remote" );
    self endon( #"periscope_exit" );
    var_cf359a0daa47f00a = 0;
    var_e7bca9a56155c5bf.var_86e21b7c3ea7b7f = 0;
    
    while ( true )
    {
        var_881e2eeb7b4a8c9b = self weaponswitchbuttonpressed();
        var_6fcef49c75e83359 = var_881e2eeb7b4a8c9b && !var_cf359a0daa47f00a;
        
        if ( var_6fcef49c75e83359 && !var_e7bca9a56155c5bf.var_86e21b7c3ea7b7f )
        {
            var_e7bca9a56155c5bf.var_86e21b7c3ea7b7f = 1;
            self setclientomnvar( "ui_veh_vehicle", -1 );
            thread function_c5d11d3e13cca60();
            self waittill( #"periscope_transition_complete" );
            
            if ( var_e7bca9a56155c5bf.var_45574d26f574faeb == 0 )
            {
                switch_periscope( var_e7bca9a56155c5bf, 1 );
            }
            else
            {
                switch_periscope( var_e7bca9a56155c5bf, 0 );
            }
            
            var_e7bca9a56155c5bf.var_86e21b7c3ea7b7f = 0;
        }
        
        var_cf359a0daa47f00a = var_881e2eeb7b4a8c9b;
        waitframe();
    }
}

// Namespace mp_sat_sm_abyss_periscope
// Params 2, eflags: 0x4
// Checksum 0x9150da21, Offset: 0xa09
// Size: 0x107
function private function_ac3a9fd9c761a17( var_e7bca9a56155c5bf, n_hold_time )
{
    if ( !( isdefined( self ) && isdefined( var_e7bca9a56155c5bf ) ) )
    {
        return;
    }
    
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    self endon( #"end_remote" );
    self endon( #"periscope_exit" );
    
    while ( self usebuttonpressed() )
    {
        waitframe();
    }
    
    n_update_interval = level.framedurationseconds;
    var_a1b84707893d6e4d = 1;
    
    while ( true )
    {
        n_time_used = 0;
        
        if ( var_a1b84707893d6e4d == 1 )
        {
            self setclientomnvar( "ui_exit_progress", 0 );
            var_a1b84707893d6e4d = 0;
        }
        
        while ( self usebuttonpressed() )
        {
            if ( !self usinggamepad() && !self getuseholdkbmprofile() )
            {
                self notify( #"hash_597999d7b5a801e2" );
                return;
            }
            
            n_time_used += n_update_interval;
            var_a1b84707893d6e4d = 1;
            self setclientomnvar( "ui_exit_progress", n_time_used / n_hold_time );
            
            if ( n_time_used > n_hold_time )
            {
                self notify( #"hash_597999d7b5a801e2" );
                return;
            }
            
            wait n_update_interval;
        }
        
        wait n_update_interval;
    }
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0xd79e1f61, Offset: 0xb18
// Size: 0x5d
function private function_ccc2d458e4358( var_e7bca9a56155c5bf )
{
    level endon( #"game_ended" );
    self endon( #"end_remote" );
    self endon( #"periscope_exit" );
    utility::waittill_any( "death", "meatshield_victim_start" );
    
    if ( var_e7bca9a56155c5bf.var_d4238a09ea3a0e5b == self )
    {
        self notify( #"hash_597999d7b5a801e2" );
    }
}

// Namespace mp_sat_sm_abyss_periscope
// Params 2, eflags: 0x4
// Checksum 0x39758a8f, Offset: 0xb7d
// Size: 0x85
function private switch_periscope( var_e7bca9a56155c5bf, var_dfeecc9fb2613d0f )
{
    if ( self isvehicleactive() )
    {
        self leavevehicle( 0, 1 );
        waitframe();
    }
    
    if ( self )
    {
        self setclientomnvar( "ui_veh_vehicle", 42 );
        var_e7bca9a56155c5bf.var_a4bebdec17e6e27e[ var_dfeecc9fb2613d0f ].e_turret setturretscriptcontrolled( 0, 0 );
        self usevehicle( var_e7bca9a56155c5bf.var_a4bebdec17e6e27e[ var_dfeecc9fb2613d0f ].e_turret, 0, 0 );
        var_e7bca9a56155c5bf.var_45574d26f574faeb = var_dfeecc9fb2613d0f;
    }
}

// Namespace mp_sat_sm_abyss_periscope
// Params 0, eflags: 0x4
// Checksum 0xf78394d4, Offset: 0xc0a
// Size: 0x6a
function private function_c5d11d3e13cca60()
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    var_a87be348174e54d = { #postfxbundlename:"sat_remote_periscope_transition" };
    self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( var_a87be348174e54d );
    wait 0.2;
    self notify( #"periscope_transition_complete" );
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0xd16d1c10, Offset: 0xc7c
// Size: 0xa3
function private function_96b85365e21c4ab7( var_e7bca9a56155c5bf )
{
    if ( true )
    {
        foreach ( var_d951ae46b3b561be in var_e7bca9a56155c5bf.var_a4bebdec17e6e27e )
        {
            var_d951ae46b3b561be.e_turret setturrettargetlocalangles( ( 10, 0, 0 ), 0, 1 );
        }
    }
}

// Namespace mp_sat_sm_abyss_periscope
// Params 1, eflags: 0x4
// Checksum 0xa30c5959, Offset: 0xd27
// Size: 0x150
function private function_61995c5a0fece022( var_e7bca9a56155c5bf )
{
    self endon( #"disconnect" );
    level endon( #"game_ended" );
    self endon( #"periscope_exit" );
    self endon( #"end_remote" );
    currentfov = self playerads();
    currentangle = 0;
    self setclientomnvar( "ui_killstreak_zoom_percentage", currentfov );
    self setclientomnvar( "ui_altimeter_vertical_movement_state", 0 );
    
    while ( true )
    {
        turret = var_e7bca9a56155c5bf.var_a4bebdec17e6e27e[ var_e7bca9a56155c5bf.var_45574d26f574faeb ].e_turret;
        
        if ( !isdefined( turret ) )
        {
            waitframe();
            continue;
        }
        
        turretpitch = turret getturretworldangles()[ 0 ] * -1;
        
        if ( turretpitch < 0.1 && turretpitch > -0.1 )
        {
            turretpitch = 0;
        }
        
        if ( self playerads() != currentfov )
        {
            currentfov = self playerads();
            self setclientomnvar( "ui_killstreak_zoom_percentage", currentfov );
        }
        
        if ( turretpitch > 0 )
        {
            self setclientomnvar( "ui_altimeter_vertical_movement_state", 1 );
        }
        else if ( turretpitch < 0 )
        {
            self setclientomnvar( "ui_altimeter_vertical_movement_state", 2 );
        }
        else
        {
            self setclientomnvar( "ui_altimeter_vertical_movement_state", 0 );
        }
        
        if ( turretpitch != currentangle )
        {
            currentangle = turretpitch;
            self setclientomnvar( "ui_altimeter_altitude_hiprecise_m", currentangle );
        }
        
        waitframe();
    }
}

