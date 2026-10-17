#using script_194f8050b4a6d3a1;
#using script_1aae2eb1ef28b239;
#using script_31805e8ef07bfa53;
#using script_77873e194e406c6d;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\conditional_container;
#using scripts\common\player_broadcasting;
#using scripts\common\utility;
#using scripts\mp\ob\activities\ob_activity_definition_utils;
#using scripts\mp\ob\systems\region_difficulty_manager;

#namespace namespace_e1c8f2179967550d;

// Namespace namespace_e1c8f2179967550d
// Params 1
// Checksum 0x978ed3af, Offset: 0x1e3
// Size: 0x208
function function_28efaa36817be8e7( relevantparameters )
{
    assert( isarray( relevantparameters ) && relevantparameters.size == 1 && isplayer( relevantparameters[ 0 ] ), "<dev string:x24>" );
    var_4949085b18f0d529 = relevantparameters[ 0 ];
    squad = teams::getsquadmates( var_4949085b18f0d529.team, var_4949085b18f0d529.sessionsquadid, 0 );
    var_3dfe43044e41aeea = activity_participation::function_e8eabd79cc49540e( var_4949085b18f0d529 );
    
    foreach ( activityinfostruct in var_3dfe43044e41aeea )
    {
        activityinstance = level.activities.instances[ activityinfostruct.instanceid ];
        
        if ( activityinstance.category == "Contract" )
        {
            activity_participation::function_61aa2b2879f2c0a2( activityinstance, var_4949085b18f0d529, 1 );
        }
    }
    
    if ( squad.size >= 2 )
    {
        var_5e05b63a19f5ae26 = squad[ 0 ];
        
        if ( var_5e05b63a19f5ae26 == var_4949085b18f0d529 )
        {
            var_5e05b63a19f5ae26 = squad[ 1 ];
        }
        
        var_670b784a3e3985b = activity_participation::function_e8eabd79cc49540e( var_5e05b63a19f5ae26 );
        
        foreach ( activityinfostruct in var_670b784a3e3985b )
        {
            activityinstance = level.activities.instances[ activityinfostruct.instanceid ];
            
            if ( namespace_9085ae059032a84f::function_f35ffc5fdda1d8eb( activityinstance ) )
            {
                if ( !activity_participation::function_e7fc1202ac164928( activityinstance, var_4949085b18f0d529 ) )
                {
                    activity_participation::function_bc67362dace4370c( activityinstance, var_4949085b18f0d529, "PlayerJoinedSquad" );
                }
            }
        }
    }
}

// Namespace namespace_e1c8f2179967550d
// Params 2
// Checksum 0xae846be, Offset: 0x3f3
// Size: 0x95, Type: bool
function function_639c1a40c3369424( activityinstance, params )
{
    assert( params.size == 1 && isdefined( params[ 0 ] ), "<dev string:xc6>" );
    player = params[ 0 ];
    playerregion = region_difficulty_manager::get_region( player.origin );
    activityorigin = activity_instance_common::function_776ee11e7acc64a5( activityinstance );
    activityregion = region_difficulty_manager::get_region( activityorigin );
    return playerregion.index == activityregion.index;
}

// Namespace namespace_e1c8f2179967550d
// Params 2
// Checksum 0x92f6268e, Offset: 0x491
// Size: 0x31, Type: bool
function function_a185cc42dd8b626c( player, params )
{
    var_2414d468a1bc3d36 = namespace_e55955ff7520be97::function_ea1e42420617891c( player, "REV_OB_EXFIL" );
    return !var_2414d468a1bc3d36;
}

// Namespace namespace_e1c8f2179967550d
// Params 2
// Checksum 0x12046252, Offset: 0x4cb
// Size: 0x55, Type: bool
function function_cfd7cf741d27af35( player, params )
{
    return !level.var_bb86f77304f193c4.var_3d6368d667a0a3df || level.var_99540244ff335aea || player.var_4a59d674db96c66a && !player.var_8b4dd1978732538;
}

// Namespace namespace_e1c8f2179967550d
// Params 2
// Checksum 0x9c38a463, Offset: 0x529
// Size: 0x8b, Type: bool
function function_40cd7a0b02ad86f7( player, params )
{
    assert( isarray( params ) && params.size == 2, "<dev string:xef>" );
    broadcastinstance = params[ 0 ];
    activityinstance = params[ 1 ];
    broadcasttype = broadcastinstance player_broadcasting::getbroadcasttype();
    
    if ( broadcasttype == "Overlord" )
    {
        if ( isdefined( level.var_50bffd5c74875fc0 ) )
        {
            if ( [[ level.var_50bffd5c74875fc0 ]]() )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace namespace_e1c8f2179967550d
// Params 1
// Checksum 0x764fe128, Offset: 0x5bd
// Size: 0xb8
function function_17b1aba9c6f1eb57( relevantparameters )
{
    assert( isarray( relevantparameters ) && relevantparameters.size == 3, "<dev string:x130>" );
    activityinstance = relevantparameters[ 0 ];
    player = relevantparameters[ 1 ];
    playerinzone = relevantparameters[ 2 ];
    assert( activity_instance_common::isactivityinstance( activityinstance ), "<dev string:x1a9>" );
    assert( isplayer( player ), "<dev string:x1ef>" );
    
    if ( playerinzone )
    {
        if ( ob_activity_definition_utils::function_3b4776b96de74fb9( activityinstance ) )
        {
            activityinstance thread function_802a9fdb4705d274( player );
        }
        else
        {
            activity_participation::function_bc67362dace4370c( activityinstance, player, "PlayerJoinedProximity" );
        }
        
        return;
    }
    
    player notify( #"leave_proximity_join_zone" );
}

// Namespace namespace_e1c8f2179967550d
// Params 1, eflags: 0x4
// Checksum 0x64544bae, Offset: 0x67d
// Size: 0xce
function private function_802a9fdb4705d274( player )
{
    var_502a5f74699d2293 = namespace_e55955ff7520be97::function_ef912bdece1bc4ef( player );
    
    if ( var_502a5f74699d2293.var_ec35f87299d3788 )
    {
        return;
    }
    
    var_e44515e5d93fde4d = conditional_container::function_fc04dbbd557e99c1( self.participationconditions, player );
    
    if ( var_e44515e5d93fde4d.var_2060d7fd72693be3 )
    {
        var_502a5f74699d2293.var_ec35f87299d3788 = 1;
        
        if ( function_a775a2e9ee41b871( player ) )
        {
            activity_participation::function_bc67362dace4370c( self, player, "PlayerJoinedProximity" );
        }
        
        var_502a5f74699d2293.var_ec35f87299d3788 = 0;
        return;
    }
    
    if ( namespace_634561435cfb3169::function_a940a26e08d4ac7e( @"hash_39bc09a8c55a7875" ) )
    {
        /#
            namespace_634561435cfb3169::activitynexuslog( "<dev string:x228>" + var_e44515e5d93fde4d.var_59e679186bcfdb0f, @"hash_39bc09a8c55a7875", self, [ player ] );
        #/
    }
}

// Namespace namespace_e1c8f2179967550d
// Params 1, eflags: 0x4
// Checksum 0xa0db3976, Offset: 0x753
// Size: 0x1b3
function private function_a775a2e9ee41b871( player )
{
    result = 0;
    player setclientomnvar( "ui_activity_acknowledgement", 10 );
    acceptcmds = [ "+activate", "+usereload" ];
    rejectcmds = [ "reject_activity", "-actionslot 4", "+actionslot 4" ];
    
    foreach ( cmd in acceptcmds )
    {
        player notifyonplayercommand( "accept_activity", cmd );
    }
    
    foreach ( cmd in rejectcmds )
    {
        player notifyonplayercommand( "reject_activity", cmd );
    }
    
    thread function_6e8ccc8f353f3f20( player, acceptcmds, rejectcmds );
    msg = player utility::waittill_any_timeout( 10, "accept_activity", "reject_activity", "leave_proximity_join_zone", "death_or_disconnect", "join_acknowledgement_cleanup" );
    
    if ( msg == "accept_activity" && self.state == "Idle" )
    {
        result = 1;
    }
    
    function_191cae5be8c60042( player, acceptcmds, rejectcmds );
    return result;
}

// Namespace namespace_e1c8f2179967550d
// Params 3, eflags: 0x4
// Checksum 0x148279fa, Offset: 0x90f
// Size: 0x59
function private function_6e8ccc8f353f3f20( player, acceptcmds, rejectcmds )
{
    player endon( #"death_or_disconnect" );
    player endon( #"join_acknowledgement_cleanup" );
    utility::waittill_any( "ActivityBegin", "activity_ended", "instance_destroyed" );
    function_191cae5be8c60042( player, acceptcmds, rejectcmds );
}

// Namespace namespace_e1c8f2179967550d
// Params 3, eflags: 0x4
// Checksum 0x190f2692, Offset: 0x970
// Size: 0x124
function private function_191cae5be8c60042( player, acceptcmds, rejectcmds )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    foreach ( cmd in acceptcmds )
    {
        player notifyonplayercommandremove( "accept_activity", cmd );
    }
    
    foreach ( cmd in rejectcmds )
    {
        player notifyonplayercommandremove( "reject_activity", cmd );
    }
    
    player setclientomnvar( "ui_activity_acknowledgement", 0 );
    player notify( #"join_acknowledgement_cleanup" );
}

