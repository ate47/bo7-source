#using script_1aae2eb1ef28b239;
#using script_53d999e26576a580;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\system;
#using scripts\mp\br\br_black_market;

#namespace namespace_85226eb0462ba94d;

// Namespace namespace_85226eb0462ba94d
// Params 0, eflags: 0x5
// Checksum 0xe8b1590c, Offset: 0xcc
// Size: 0x33
function private autoexec __init__system__()
{
    system::register( #"hash_1b50322fbfaefd58", [ #"br_activity_manager", #"activity_common" ], &function_538033a540e63c70, undefined );
}

// Namespace namespace_85226eb0462ba94d
// Params 0, eflags: 0x4
// Checksum 0xc4590f63, Offset: 0x107
// Size: 0x13
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "BR_BLACK_MARKET_VEHICLE_KILLS", &activity_type_init );
}

// Namespace namespace_85226eb0462ba94d
// Params 0
// Checksum 0x2076ace5, Offset: 0x122
// Size: 0x83
function activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_VEHICLE_KILLS", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_VEHICLE_KILLS", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_VEHICLE_KILLS", 2, &activity_ended );
    activity_common::function_944074f3079c1d4e( "BR_BLACK_MARKET_VEHICLE_KILLS", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &br_activity_util::function_d0dded8c467ac5dd, "BR_BLACK_MARKET_VEHICLE_KILLS" );
    activity_common::function_2dd4f07fa5c3e911( "BRPlayerKilledMoment", &player_killed, "BR_BLACK_MARKET_VEHICLE_KILLS" );
    
    /#
        debug_init();
    #/
}

// Namespace namespace_85226eb0462ba94d
// Params 0
// Checksum 0x69624fc, Offset: 0x1ad
// Size: 0x32
function activity_setup()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.variantdata = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    activity_instance_common::function_46135a69bddfec2c( self );
}

// Namespace namespace_85226eb0462ba94d
// Params 0
// Checksum 0x84b69952, Offset: 0x1e7
// Size: 0x59
function activity_begin()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.kills = 0;
    br_black_market::set_objective_omnvars( self.uiindex, self.objectiveindex, self.kills, self.variantdata.numkills );
}

// Namespace namespace_85226eb0462ba94d
// Params 0
// Checksum 0x139497ff, Offset: 0x248
// Size: 0x54
function activity_ended()
{
    self endon( #"instance_destroyed" );
    succeeded = activity_instance_common::function_6bb0be4a3940d6e3( self );
    
    if ( succeeded )
    {
        level callback::callback( self.activitycallback, { #activity:self, #team:self.team } );
    }
}

// Namespace namespace_85226eb0462ba94d
// Params 0
// Checksum 0x1f253dec, Offset: 0x2a4
// Size: 0x1c
function activity_destroy()
{
    activity = self;
    activity endon( #"instance_destroyed" );
}

// Namespace namespace_85226eb0462ba94d
// Params 1
// Checksum 0x9671d9f2, Offset: 0x2c8
// Size: 0xa6
function player_killed( params )
{
    if ( activity_participation::function_e7fc1202ac164928( self, params.attacker ) && isdefined( params.attacker.modifiers[ "in_vehicle" ] ) )
    {
        if ( self.completed )
        {
            return;
        }
        
        self.kills++;
        br_black_market::function_538557e757f948f0( self.uiindex, self.kills );
        
        if ( self.kills >= self.variantdata.numkills )
        {
            self.completed = 1;
            activity_instance_common::endactivity( self, 1 );
        }
    }
}

/#

    // Namespace namespace_85226eb0462ba94d
    // Params 0
    // Checksum 0x76af5442, Offset: 0x376
    // Size: 0x2e, Type: dev
    function debug_init()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x4c>", "<dev string:x55>", &function_f5bfe7f122fbcdce );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_85226eb0462ba94d
    // Params 0
    // Checksum 0x10e8432b, Offset: 0x3ac
    // Size: 0xe2, Type: dev
    function function_f5bfe7f122fbcdce()
    {
        var_657a3abce2509b48 = activity_participation::function_e8eabd79cc49540e( level.players[ 0 ], [ "<dev string:x79>" ] );
        
        if ( var_657a3abce2509b48.size == 0 )
        {
            return;
        }
        
        killactivity = level.activities.instances[ getfirstarraykey( var_657a3abce2509b48 ) ];
        killactivity.kills++;
        killactivity br_black_market::function_538557e757f948f0( killactivity.uiindex, killactivity.kills );
        
        if ( killactivity.kills > killactivity.variantdata.numkills )
        {
            killactivity.kills = killactivity.variantdata.numkills;
            killactivity.completed = 1;
            activity_instance_common::endactivity( killactivity, 1 );
        }
    }

#/
