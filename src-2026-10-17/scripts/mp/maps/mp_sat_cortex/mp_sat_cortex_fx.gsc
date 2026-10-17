#using scripts\common\scene;
#using scripts\common\utility;

#namespace mp_sat_cortex_fx;

// Namespace mp_sat_cortex_fx
// Params 0
// Checksum 0x8f8a2c83, Offset: 0xf1
// Size: 0x18c
function main()
{
    /#
        if ( isofflinetoolrun( 31 ) )
        {
            return;
        }
    #/
    
    var_861cdf549ddef0ca = [ "twitch_a", "twitch_b", "twitch_c" ];
    var_7290f4afcb38a695 = [ 2, 4 ];
    var_3397fa5c44b006f1 = utility::getstructarray( "sat_mp_vig_cortex_lab_pose", "script_noteworthy" );
    
    foreach ( s_lab_pose in var_3397fa5c44b006f1 )
    {
        if ( isdefined( s_lab_pose ) )
        {
            s_lab_pose thread function_21d92089d62ecf52( "idle_loop", var_861cdf549ddef0ca, var_7290f4afcb38a695 );
        }
    }
    
    var_1135787fbcc7058e = getentarray( "world_event_trigger", #script_noteworthy );
    
    foreach ( t_world_event_trigger in var_1135787fbcc7058e )
    {
        if ( isdefined( t_world_event_trigger.script_fxid ) )
        {
            t_world_event_trigger thread watch_players_inside( t_world_event_trigger.script_fxid );
        }
    }
}

// Namespace mp_sat_cortex_fx
// Params 3, eflags: 0x4
// Checksum 0xc96a0ce2, Offset: 0x285
// Size: 0xa5
function private function_21d92089d62ecf52( s_idle, var_377b575de709460a, var_7290f4afcb38a695 )
{
    level endon( #"hash_ee6c6cbce51ca4db" );
    level waittill( #"scriptables_ready" );
    wait randomfloatrange( 0.1, 0.5 );
    
    while ( true )
    {
        s_shot_name = utility::array_random( var_377b575de709460a );
        scene::play( undefined, s_shot_name, undefined );
        n_rand = randomintrange( var_7290f4afcb38a695[ 0 ], var_7290f4afcb38a695[ 1 ] );
        
        for ( i = 0; i < n_rand ; i++ )
        {
            scene::play( undefined, s_idle, undefined );
        }
    }
}

// Namespace mp_sat_cortex_fx
// Params 1, eflags: 0x4
// Checksum 0x122111bf, Offset: 0x332
// Size: 0xef
function private watch_players_inside( s_world_event )
{
    level endon( #"hash_ee6c6cbce51ca4db" );
    b_playing = 0;
    
    while ( true )
    {
        if ( !b_playing )
        {
            self waittill( #"trigger" );
            activateworldevent( s_world_event );
            b_playing = 1;
        }
        else
        {
            b_players_in_trigger = 0;
            
            foreach ( player in level.players )
            {
                if ( player istouching( self ) )
                {
                    b_players_in_trigger = 1;
                    break;
                }
            }
            
            if ( b_players_in_trigger == 0 )
            {
                deactivateworldevent( s_world_event );
                b_playing = 0;
            }
        }
        
        wait 0.25;
    }
}

