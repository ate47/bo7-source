#using script_aa3bac81ad4fc8e;
#using scripts\common\powerups;
#using scripts\common\system;

#namespace zm_bgb_reign_drops;

// Namespace zm_bgb_reign_drops
// Params 0, eflags: 0x5
// Checksum 0xc5657bda, Offset: 0x111
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "reign_drops", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_reign_drops
// Params 0
// Checksum 0xdd8da4c2, Offset: 0x136
// Size: 0x21
function __init__()
{
    bgb::register( "reign_drops", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_reign_drops
// Params 0
// Checksum 0xcf53aa23, Offset: 0x15f
// Size: 0x2f5
function activation()
{
    self endon( #"disconnect", #"bled_out" );
    root = powerups::get_powerups_root();
    a_origins = [ get_powerup_origin_grid( 1 ), get_powerup_origin_grid( 2 ), get_powerup_origin_grid( 3 ), get_powerup_origin_grid( 4 ), get_powerup_origin_grid( 5 ), get_powerup_origin_grid( 6 ), get_powerup_origin_grid( 7 ), get_powerup_origin_grid( 8 ), get_powerup_origin_grid( 9 ) ];
    var_9529a4f450c98260 = bgb::function_5e53a4c5e5a4250e( a_origins );
    
    if ( isdefined( root.powerups[ "full_power" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "full_power", get_powerup_origin_grid( 1 ) );
        }
        else
        {
            thread powerups::powerup_activate( "full_power" );
        }
    }
    
    if ( isdefined( root.powerups[ "bonus_points_team" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "bonus_points_team", get_powerup_origin_grid( 2 ) );
        }
        else
        {
            thread powerups::powerup_activate( "bonus_points_team" );
        }
    }
    
    if ( isdefined( root.powerups[ "nuke" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "nuke", get_powerup_origin_grid( 3 ) );
        }
        else
        {
            thread bgb::function_9ecd75f64d86a93f( "nuke", undefined, 1 );
        }
    }
    
    if ( isdefined( root.powerups[ "full_armor" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "full_armor", get_powerup_origin_grid( 4 ) );
        }
        else
        {
            thread powerups::powerup_activate( "full_armor" );
        }
    }
    
    if ( isdefined( root.powerups[ "free_perk" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "free_perk", get_powerup_origin_grid( 5 ) );
        }
        else
        {
            thread powerups::powerup_activate( "free_perk" );
        }
    }
    
    if ( isdefined( root.powerups[ "fire_sale" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "fire_sale", get_powerup_origin_grid( 6 ) );
        }
        else
        {
            thread powerups::powerup_activate( "fire_sale" );
        }
    }
    
    if ( isdefined( root.powerups[ "insta_kill" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "insta_kill", get_powerup_origin_grid( 7 ) );
        }
        else
        {
            thread powerups::powerup_activate( "insta_kill" );
        }
    }
    
    if ( isdefined( root.powerups[ "full_ammo" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "full_ammo", get_powerup_origin_grid( 8 ) );
        }
        else
        {
            thread powerups::powerup_activate( "full_ammo" );
        }
    }
    
    if ( isdefined( root.powerups[ "double_points" ] ) )
    {
        if ( var_9529a4f450c98260 )
        {
            level thread bgb::function_9ecd75f64d86a93f( "double_points", get_powerup_origin_grid( 9 ) );
        }
        else
        {
            thread powerups::powerup_activate( "double_points" );
        }
    }
    
    self.reign_drops_live = 1;
    thread powerup_timeout_watcher();
}

// Namespace zm_bgb_reign_drops
// Params 0
// Checksum 0x8be7e3d1, Offset: 0x45c
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

// Namespace zm_bgb_reign_drops
// Params 0
// Checksum 0x3f8d944c, Offset: 0x469
// Size: 0x6f
function powerup_timeout_watcher()
{
    waitframe();
    n_start_time = gettime();
    n_total_time = 0;
    
    while ( isdefined( level.active_powerups ) && level.active_powerups.size )
    {
        wait 0.5;
        n_current_time = gettime();
        n_total_time = ( n_current_time - n_start_time ) / 1000;
        
        if ( n_total_time >= 28 )
        {
            break;
        }
    }
    
    self.reign_drops_live = undefined;
}

// Namespace zm_bgb_reign_drops
// Params 1
// Checksum 0xb60b2888, Offset: 0x4e0
// Size: 0x1bf
function get_powerup_origin_grid( n_position )
{
    v_powerup = bgb::get_player_dropped_powerup_origin();
    v_up = ( 0, 0, 5 );
    var_4e17aad4283fd15e = v_powerup + anglestoforward( self.angles ) * 60 + v_up;
    var_4e17abd4283fd391 = var_4e17aad4283fd15e + anglestoforward( self.angles ) * 60 + v_up;
    
    switch ( n_position )
    {
        case 1:
            v_origin = v_powerup + anglestoright( self.angles ) * -60 + v_up;
            break;
        case 2:
            v_origin = v_powerup;
            break;
        case 3:
            v_origin = v_powerup + anglestoright( self.angles ) * 60 + v_up;
            break;
        case 4:
            v_origin = var_4e17aad4283fd15e + anglestoright( self.angles ) * -60 + v_up;
            break;
        case 5:
            v_origin = var_4e17aad4283fd15e;
            break;
        case 6:
            v_origin = var_4e17aad4283fd15e + anglestoright( self.angles ) * 60 + v_up;
            break;
        case 7:
            v_origin = var_4e17abd4283fd391 + anglestoright( self.angles ) * -60 + v_up;
            break;
        case 8:
            v_origin = var_4e17abd4283fd391;
            break;
        case 9:
            v_origin = var_4e17abd4283fd391 + anglestoright( self.angles ) * 60 + v_up;
            break;
        default:
            v_origin = v_powerup;
            break;
    }
    
    return v_origin;
}

