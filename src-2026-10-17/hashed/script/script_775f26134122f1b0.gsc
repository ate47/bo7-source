#using script_1aae2eb1ef28b239;
#using script_4d5934d09ed188d8;
#using script_53d999e26576a580;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\system;

#namespace namespace_74f52497490ff026;

// Namespace namespace_74f52497490ff026
// Params 0, eflags: 0x5
// Checksum 0x4a1062c4, Offset: 0x10a
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_8ed10dcc366ca3a3", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_74f52497490ff026
// Params 0, eflags: 0x4
// Checksum 0x29ec120a, Offset: 0x133
// Size: 0x28
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "BR_PUBLIC_EVENT_BLOOD_MONEY", &activity_type_init );
    br_publicevents::function_54d95495df246a2b( getxhashasset( "BR_PUBLIC_EVENT_BLOOD_MONEY" ), &function_323fab1b62a2d5d4 );
}

// Namespace namespace_74f52497490ff026
// Params 1
// Checksum 0xbebdc22f, Offset: 0x163
// Size: 0xc
function function_323fab1b62a2d5d4( eventinfo )
{
    
}

// Namespace namespace_74f52497490ff026
// Params 0
// Checksum 0x420ef6aa, Offset: 0x177
// Size: 0x70
function activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "BR_PUBLIC_EVENT_BLOOD_MONEY", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "BR_PUBLIC_EVENT_BLOOD_MONEY", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "BR_PUBLIC_EVENT_BLOOD_MONEY", 3, &activity_destroy );
    assert( isdefined( game[ "<dev string:x24>" ] ) );
    game[ "dialog" ][ "public_events_blood_money_start" ] = "bldm_wzan_name";
    game[ "dialog" ][ "public_events_blood_money_active" ] = "bldm_wzan_boos";
}

// Namespace namespace_74f52497490ff026
// Params 0
// Checksum 0xeb887c75, Offset: 0x1ef
// Size: 0x45
function activity_setup()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance.variantdata = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_74f52497490ff026
// Params 0
// Checksum 0x67b184a1, Offset: 0x23c
// Size: 0x5e
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level notify( #"hash_b4d39322f030555c" );
    br_activity_util::function_f255dbc3d969ce02( activity_instance.variantdata.time, 10 );
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_74f52497490ff026
// Params 0
// Checksum 0xa0c60540, Offset: 0x2a2
// Size: 0x36
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
    br_activity_util::function_f24cad5d113f4f52();
    level.br_pe_data[ %"bloodmoney" ] = undefined;
}

