#using script_1aae2eb1ef28b239;
#using script_4d5934d09ed188d8;
#using script_53d999e26576a580;
#using script_651411145972e333;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_cbfafb82baff51c;

// Namespace namespace_cbfafb82baff51c
// Params 0, eflags: 0x5
// Checksum 0x4d176c42, Offset: 0x11e
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_10f9a363b48c37c3", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_cbfafb82baff51c
// Params 0, eflags: 0x4
// Checksum 0xac0b88ec, Offset: 0x147
// Size: 0x28
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "BR_PUBLIC_EVENT_CONTRACTOR", &activity_type_init );
    br_publicevents::function_54d95495df246a2b( getxhashasset( "BR_PUBLIC_EVENT_CONTRACTOR" ), &function_323fab1b62a2d5d4 );
}

// Namespace namespace_cbfafb82baff51c
// Params 1
// Checksum 0xdc1dc715, Offset: 0x177
// Size: 0xc
function function_323fab1b62a2d5d4( eventinfo )
{
    
}

// Namespace namespace_cbfafb82baff51c
// Params 0
// Checksum 0xdc939c32, Offset: 0x18b
// Size: 0x7b
function activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "BR_PUBLIC_EVENT_CONTRACTOR", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "BR_PUBLIC_EVENT_CONTRACTOR", 1, &activity_begin );
    utility::registersharedfunc( #"gametype", #"modifybasecontractrewards", &function_905d84825ea5ee23 );
    assert( isdefined( game[ "<dev string:x24>" ] ) );
    game[ "dialog" ][ "public_events_contractor_start" ] = "ctrc_wzan_name";
    game[ "dialog" ][ "public_events_contractor_active" ] = "ctrc_wzan_boos";
}

// Namespace namespace_cbfafb82baff51c
// Params 0
// Checksum 0x8928794f, Offset: 0x20e
// Size: 0x45
function activity_setup()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance.variantdata = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_cbfafb82baff51c
// Params 0
// Checksum 0x1166330, Offset: 0x25b
// Size: 0x112
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level notify( #"hash_881e9f95ede4ddd4" );
    br_activity_util::function_f255dbc3d969ce02( self.variantdata.time, 11 );
    multiplier = activity_instance.variantdata.multiplier;
    
    foreach ( activity in level.activitymanager.activeinstances )
    {
        if ( activity_instance_common::getactivitycategory( activity ) == "Contract" )
        {
            activity.var_65289d100d651a15 = multiplier;
        }
    }
    
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_cbfafb82baff51c
// Params 3
// Checksum 0x794f0914, Offset: 0x375
// Size: 0x13b
function function_905d84825ea5ee23( team, contract, rewards )
{
    if ( !isdefined( rewards[ "plunder" ] ) )
    {
        return;
    }
    
    multiplier = 1;
    
    foreach ( activity in level.activitymanager.activeinstances )
    {
        if ( activity_instance_common::getactivitytype( activity ) == "BR_PUBLIC_EVENT_CONTRACTOR" )
        {
            activity_multiplier = namespace_9085ae059032a84f::function_9129cd8075c85c09( activity ).multiplier;
            
            if ( activity_multiplier )
            {
                multiplier *= activity_multiplier;
                
                if ( contract.var_65289d100d651a15 )
                {
                    contract.var_65289d100d651a15 = undefined;
                }
            }
        }
    }
    
    multiplier *= contract.var_65289d100d651a15 ?? 1;
    
    if ( multiplier == 1 )
    {
        return;
    }
    
    br_quest_util::giveteamplunderflat( team, rewards[ "plunder" ] * ( multiplier - 1 ), 1 );
}

