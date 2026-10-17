#using script_194f8050b4a6d3a1;
#using script_1aae2eb1ef28b239;
#using script_53d999e26576a580;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\system;
#using scripts\mp\br\br_black_market;

#namespace activity_black_market_cash;

// Namespace activity_black_market_cash
// Params 0, eflags: 0x5
// Checksum 0xe5da0202, Offset: 0xe7
// Size: 0x33
function private autoexec __init__system__()
{
    system::register( #"activity_black_market_cash", [ #"br_activity_manager", #"activity_common" ], &function_538033a540e63c70, undefined );
}

// Namespace activity_black_market_cash
// Params 0, eflags: 0x4
// Checksum 0xe6d8e8f7, Offset: 0x122
// Size: 0x13
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "BR_BLACK_MARKET_CASH", &activity_type_init );
}

// Namespace activity_black_market_cash
// Params 0
// Checksum 0xb636f312, Offset: 0x13d
// Size: 0x6d
function activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_CASH", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_CASH", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_CASH", 2, &activity_ended );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_CASH", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &br_activity_util::function_d0dded8c467ac5dd, "BR_BLACK_MARKET_CASH" );
    
    /#
        debug_init();
    #/
}

// Namespace activity_black_market_cash
// Params 0
// Checksum 0xead2e167, Offset: 0x1b2
// Size: 0x32
function activity_setup()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.variantdata = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    activity_instance_common::function_46135a69bddfec2c( self );
}

// Namespace activity_black_market_cash
// Params 0
// Checksum 0xaefb11d9, Offset: 0x1ec
// Size: 0xe8
function activity_begin()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.collectedcash = 0;
    
    if ( self.varianttag == "black_market_cash" )
    {
        self.totalcash = getdvarint( @"hash_9b3b583ef8794804", self.variantdata.totalcash );
    }
    else
    {
        self.totalcash = getdvarint( @"hash_9b3b5b3ef8794e9d", self.variantdata.totalcash );
    }
    
    br_black_market::set_objective_omnvars( self.uiindex, self.objectiveindex, self.collectedcash, self.totalcash * 10 );
    self.callbackparams = { #activity:self };
    level callback::add( "currency_add", &on_currency_add, self.callbackparams );
}

// Namespace activity_black_market_cash
// Params 0
// Checksum 0x25cf299d, Offset: 0x2dc
// Size: 0x8c
function activity_ended()
{
    self endon( #"instance_destroyed" );
    succeeded = activity_instance_common::function_6bb0be4a3940d6e3( self );
    
    if ( succeeded )
    {
        level callback::callback( self.activitycallback, { #activity:self, #team:self.team } );
    }
    
    if ( level callback::exists( "currency_add", &on_currency_add, self.callbackparams ) )
    {
        level callback::remove( "currency_add", &on_currency_add, self.callbackparams );
    }
}

// Namespace activity_black_market_cash
// Params 0
// Checksum 0xf361f877, Offset: 0x370
// Size: 0x1c
function activity_destroy()
{
    activity = self;
    activity endon( #"instance_destroyed" );
}

// Namespace activity_black_market_cash
// Params 2
// Checksum 0x3c3cbc85, Offset: 0x394
// Size: 0x187
function on_currency_add( params, additionalparams )
{
    activity = additionalparams.activity;
    
    if ( !activity_participation::function_e7fc1202ac164928( activity, self ) )
    {
        return;
    }
    
    foreach ( player in teams::getteamdata( activity.team, "players" ) )
    {
        if ( params.originalowner == player )
        {
            return;
        }
    }
    
    activity.collectedcash += params.amount;
    activity br_black_market::function_538557e757f948f0( activity.uiindex, activity.collectedcash * 10 );
    br_black_market::function_89707e63629ff7e6( activity.team, activity.varianttag, string( activity.collectedcash ) + " / " + string( activity.totalcash ) + " cash acquired." );
    
    if ( activity.collectedcash >= activity.totalcash )
    {
        activity.completed = 1;
        activity_instance_common::endactivity( activity, 1 );
    }
}

/#

    // Namespace activity_black_market_cash
    // Params 0
    // Checksum 0x9d09e26e, Offset: 0x523
    // Size: 0x2e, Type: dev
    function debug_init()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x43>", "<dev string:x51>", &debug_collect_cash );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace activity_black_market_cash
    // Params 0
    // Checksum 0xccc8e9ad, Offset: 0x559
    // Size: 0xdf, Type: dev
    function debug_collect_cash()
    {
        var_657a3abce2509b48 = activity_participation::function_e8eabd79cc49540e( level.players[ 0 ], [ "<dev string:x71>" ] );
        
        if ( var_657a3abce2509b48.size == 0 )
        {
            return;
        }
        
        cashactivity = level.activities.instances[ getfirstarraykey( var_657a3abce2509b48 ) ];
        cashactivity.collectedcash += 100;
        cashactivity br_black_market::function_538557e757f948f0( cashactivity.uiindex, cashactivity.collectedcash * 10 );
        
        if ( cashactivity.collectedcash >= cashactivity.totalcash )
        {
            cashactivity.collectedcash = cashactivity.totalcash;
            cashactivity.completed = 1;
            activity_instance_common::endactivity( cashactivity, 1 );
        }
    }

#/
