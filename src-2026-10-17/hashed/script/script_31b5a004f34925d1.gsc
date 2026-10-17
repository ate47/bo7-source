#using script_1aae2eb1ef28b239;
#using script_4d5934d09ed188d8;
#using script_53d999e26576a580;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\system;

#namespace namespace_eb941675117c7d0d;

// Namespace namespace_eb941675117c7d0d
// Params 0, eflags: 0x5
// Checksum 0xedff0813, Offset: 0xb1
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_3ea746b197689711", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_eb941675117c7d0d
// Params 0, eflags: 0x4
// Checksum 0x2f074c6f, Offset: 0xda
// Size: 0x28
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "BR_PUBLIC_EVENT_ACTIVITY_SPAWNER", &activity_type_init );
    br_publicevents::function_54d95495df246a2b( getxhashasset( "BR_PUBLIC_EVENT_ACTIVITY_SPAWNER" ), &function_323fab1b62a2d5d4 );
}

// Namespace namespace_eb941675117c7d0d
// Params 1
// Checksum 0xe6ce4f04, Offset: 0x10a
// Size: 0xc
function function_323fab1b62a2d5d4( eventinfo )
{
    
}

// Namespace namespace_eb941675117c7d0d
// Params 0
// Checksum 0xb887b8e2, Offset: 0x11e
// Size: 0x27
function activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "BR_PUBLIC_EVENT_ACTIVITY_SPAWNER", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "BR_PUBLIC_EVENT_ACTIVITY_SPAWNER", 1, &activity_begin );
}

// Namespace namespace_eb941675117c7d0d
// Params 0
// Checksum 0x51c1f090, Offset: 0x14d
// Size: 0x46
function activity_setup()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance.variantdata = namespace_9085ae059032a84f::function_9129cd8075c85c09( activity_instance );
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_eb941675117c7d0d
// Params 0
// Checksum 0x3a89d5a2, Offset: 0x19b
// Size: 0xe7
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    
    foreach ( variant in activity_instance.variantdata.activityvariants )
    {
        thread activity_instance_common::function_9b387cb1af0d5b4b( variant.tag, ( 0, 0, 0 ) );
        br_activity_util::activitylog( activity_instance, "Spawning activity: " + variant.tag );
    }
    
    activity_instance_common::endactivity( activity_instance, 1 );
}

