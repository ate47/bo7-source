#using script_1aae2eb1ef28b239;
#using script_53d999e26576a580;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\system;
#using scripts\mp\br\br_black_market;

#namespace activity_black_market_killstreaks;

// Namespace activity_black_market_killstreaks
// Params 0, eflags: 0x5
// Checksum 0x575e7f7e, Offset: 0xdd
// Size: 0x33
function private autoexec __init__system__()
{
    system::register( #"activity_black_market_killstreaks", [ #"br_activity_manager", #"activity_common" ], &function_538033a540e63c70, undefined );
}

// Namespace activity_black_market_killstreaks
// Params 0, eflags: 0x4
// Checksum 0xb39fda23, Offset: 0x118
// Size: 0x13
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "BR_BLACK_MARKET_KILLSTREAKS", &activity_type_init );
}

// Namespace activity_black_market_killstreaks
// Params 0
// Checksum 0xe371c1c6, Offset: 0x133
// Size: 0x6d
function activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_KILLSTREAKS", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_KILLSTREAKS", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_KILLSTREAKS", 2, &activity_ended );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_KILLSTREAKS", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &br_activity_util::function_d0dded8c467ac5dd, "BR_BLACK_MARKET_KILLSTREAKS" );
    
    /#
        debug_init();
    #/
}

// Namespace activity_black_market_killstreaks
// Params 0
// Checksum 0xd7534589, Offset: 0x1a8
// Size: 0x32
function activity_setup()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.variantdata = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    activity_instance_common::function_46135a69bddfec2c( self );
}

// Namespace activity_black_market_killstreaks
// Params 0
// Checksum 0xaeae3401, Offset: 0x1e2
// Size: 0xe9
function activity_begin()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.killstreaksused = 0;
    
    if ( self.varianttag == "black_market_killstreaks" )
    {
        self.numkillstreaks = getdvarint( @"hash_9ca127d137468ba6", self.variantdata.numkillstreaks );
    }
    else
    {
        self.numkillstreaks = getdvarint( @"hash_9ca126d137468973", self.variantdata.numkillstreaks );
    }
    
    br_black_market::set_objective_omnvars( self.uiindex, self.objectiveindex, self.killstreaksused, self.numkillstreaks );
    self.callbackparams = { #activity:self };
    level callback::add( #"killstreak_begin_use", &on_killstreak_used, self.callbackparams );
}

// Namespace activity_black_market_killstreaks
// Params 0
// Checksum 0x184e8d73, Offset: 0x2d3
// Size: 0x94
function activity_ended()
{
    self endon( #"instance_destroyed" );
    succeeded = activity_instance_common::function_6bb0be4a3940d6e3( self );
    
    if ( succeeded )
    {
        level callback::callback( self.activitycallback, { #activity:self, #team:self.team } );
    }
    
    if ( level callback::exists( #"killstreak_begin_use", &on_killstreak_used, self.callbackparams ) )
    {
        level callback::remove( #"killstreak_begin_use", &on_killstreak_used, self.callbackparams );
    }
}

// Namespace activity_black_market_killstreaks
// Params 0
// Checksum 0xcee05c99, Offset: 0x36f
// Size: 0x1c
function activity_destroy()
{
    activity = self;
    activity endon( #"instance_destroyed" );
}

// Namespace activity_black_market_killstreaks
// Params 2
// Checksum 0xf368c573, Offset: 0x393
// Size: 0x1dd
function on_killstreak_used( params, additional_params )
{
    activity = additional_params.activity;
    
    if ( !activity_participation::function_e7fc1202ac164928( activity, params.streakinfo.owner ) )
    {
        return;
    }
    
    if ( !isdefined( activity ) )
    {
        return;
    }
    
    if ( activity.completed )
    {
        return;
    }
    
    if ( params.streakinfo.usedbefore )
    {
        return;
    }
    
    if ( isdefined( params.streakinfo.var_245b79f81d8bea18 ) )
    {
        foreach ( team in params.streakinfo.var_245b79f81d8bea18 )
        {
            if ( params.streakinfo.owner.team == team )
            {
                return;
            }
        }
    }
    
    activity.killstreaksused++;
    activity br_black_market::function_538557e757f948f0( activity.uiindex, activity.killstreaksused );
    br_black_market::function_89707e63629ff7e6( activity.team, activity.varianttag, string( activity.killstreaksused ) + " / " + string( activity.numkillstreaks ) + " killstreaks used." );
    
    if ( activity.killstreaksused >= activity.numkillstreaks )
    {
        activity.completed = 1;
        activity_instance_common::endactivity( activity, 1 );
    }
}

/#

    // Namespace activity_black_market_killstreaks
    // Params 0
    // Checksum 0x143a250b, Offset: 0x578
    // Size: 0x2e, Type: dev
    function debug_init()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x4a>", "<dev string:x5e>", &debug_use_killstreak );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace activity_black_market_killstreaks
    // Params 0
    // Checksum 0x1923c2b9, Offset: 0x5ae
    // Size: 0xce, Type: dev
    function debug_use_killstreak()
    {
        var_657a3abce2509b48 = activity_participation::function_e8eabd79cc49540e( level.players[ 0 ], [ "<dev string:x80>" ] );
        
        if ( var_657a3abce2509b48.size == 0 )
        {
            return;
        }
        
        killstreakactivity = level.activities.instances[ getfirstarraykey( var_657a3abce2509b48 ) ];
        killstreakactivity.killstreaksused++;
        killstreakactivity br_black_market::function_538557e757f948f0( killstreakactivity.uiindex, killstreakactivity.killstreaksused );
        
        if ( killstreakactivity.killstreaksused >= killstreakactivity.numkillstreaks )
        {
            killstreakactivity.killstreaksused = killstreakactivity.numkillstreaks;
            killstreakactivity.completed = 1;
            activity_instance_common::endactivity( killstreakactivity, 1 );
        }
    }

#/
