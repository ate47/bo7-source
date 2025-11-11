#using scripts\common\progression_utility;
#using scripts\cp_mp\playerachievements;
#using scripts\mp\class;

#namespace namespace_628672758c64b524;

// Namespace namespace_628672758c64b524
// Params 0, eflags: 0x4
// Checksum 0xed26081b, Offset: 0x205
// Size: 0x55
function private function_608d80e79011724f()
{
    if ( isdefined( level.var_86d6d54de22b6720 ) )
    {
        return;
    }
    
    var_4fa46bb6a2edd482 = level.projectbundle.var_67327f8e51cb3a75;
    
    if ( !isdefined( var_4fa46bb6a2edd482 ) || var_4fa46bb6a2edd482 == 0 )
    {
        level.var_86d6d54de22b6720 = 48944;
    }
    
    level.var_86d6d54de22b6720 = var_4fa46bb6a2edd482;
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0xf24b6504, Offset: 0x262
// Size: 0x129
function function_7a54e5cc7d9e8e90()
{
    function_608d80e79011724f();
    
    if ( !isdefined( level.var_86d6d54de22b6720 ) || level.var_86d6d54de22b6720 == 0 )
    {
        return;
    }
    
    validplayers = [];
    
    foreach ( player in level.players )
    {
        if ( isdefined( player.pers[ "progressionVerified" ] ) || player iscodcaster() || isai( player ) )
        {
            continue;
        }
        
        player.pers[ "verifiedInitialXP" ] = 0;
        player.pers[ "verifiedPrestige" ] = 0;
        player.pers[ "progressionVerified" ] = 0;
        validplayers[ validplayers.size ] = player;
    }
    
    function_6e150ba45a6aa08( validplayers, level.var_86d6d54de22b6720 );
    level.var_686e16e6fe5b5443 = 1;
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0xa06e5a56, Offset: 0x393
// Size: 0xba
function function_776a3b17ae4523c()
{
    assert( isplayer( self ) );
    player = self;
    
    if ( !level.var_686e16e6fe5b5443 || !isdefined( level.var_86d6d54de22b6720 ) || level.var_86d6d54de22b6720 == 0 )
    {
        return;
    }
    
    if ( player iscodcaster() || isai( player ) || isdefined( player.pers[ "progressionVerified" ] ) )
    {
        return;
    }
    
    player.pers[ "verifiedInitialXP" ] = 0;
    player.pers[ "verifiedPrestige" ] = 0;
    player.pers[ "progressionVerified" ] = 0;
    self function_fdf029c4be6546a3( level.var_86d6d54de22b6720 );
}

// Namespace namespace_628672758c64b524
// Params 2
// Checksum 0x9e8ba56b, Offset: 0x455
// Size: 0x38d
function function_f9c086937d2a8eb2( achievementid, progressdata )
{
    assert( isplayer( self ) );
    player = self;
    
    if ( achievementid == level.var_86d6d54de22b6720 )
    {
        var_fad496e2fa4fdef4 = int( playerachievements::function_a550b9c75bcbee5e( "xp" ) );
        var_c28917b50c5da86a = int( playerachievements::function_a550b9c75bcbee5e( "rank" ) );
        var_1c31531e7b8a7645 = int( playerachievements::function_a550b9c75bcbee5e( "prestige" ) );
        var_ed9726821d7010fd = int( playerachievements::function_a550b9c75bcbee5e( "bc_loyalty" ) );
        xp = 0;
        prestige = 0;
        bp_bc_loyalty = 0;
        
        for ( index = 0; index < progressdata.progress_values.size ; index++ )
        {
            progress_id = int( progressdata.progress_values[ index ].progress_id );
            
            if ( progress_id == var_fad496e2fa4fdef4 )
            {
                xp = progressdata.progress_values[ index ].progress;
                continue;
            }
            
            if ( progress_id == var_1c31531e7b8a7645 )
            {
                prestige = progressdata.progress_values[ index ].progress;
                continue;
            }
            
            if ( progress_id == var_ed9726821d7010fd )
            {
                bp_bc_loyalty = progressdata.progress_values[ index ].progress;
            }
        }
        
        player_reported_xp = player function_ad429e448c443545();
        player_reported_prestige = player function_89de54a4f43714a4();
        
        if ( xp != player_reported_xp || prestige != player_reported_prestige )
        {
            event_data = [ "player_reported_xp", player_reported_xp, "player_reported_prestige", player_reported_prestige, "server_received_xp", xp, "server_received_prestige", prestige, "player_xp_at_comparison", player.pers[ "rankxp" ], "player_xp_earned_in_match", player.pers[ "prestige" ] ];
            dlog_recordevent( "dlog_event_sv_progression_validation_failure", event_data );
        }
        
        player.pers[ "verifiedInitialXP" ] = xp;
        player.pers[ "verifiedPrestige" ] = prestige;
        player.pers[ "progressionVerified" ] = 1;
        player.pers[ "rankxp" ] = xp;
        player.pers[ "prestige" ] = prestige;
        
        if ( !isdefined( player.pers[ "telemetry" ] ) )
        {
            player.pers[ "telemetry" ] = spawnstruct();
        }
        
        player.pers[ "telemetry" ].xp_at_start = xp;
        player.pers[ "telemetry" ].rank_at_start = player progression_utility::getrankforxp( xp );
        player.pers[ "telemetry" ].progression_verified = 1;
        player.pers[ "telemetry" ].prestige_at_start = prestige;
        player.pers[ "telemetry" ].blackcell_loyalty = bp_bc_loyalty;
        println( "<dev string:x24>" + player.name + "<dev string:x62>" + xp + "<dev string:x6b>" + prestige );
    }
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0xc3dd320f, Offset: 0x7ea
// Size: 0x1e
function function_a14a1871d0fbd201()
{
    assert( isplayer( self ) );
    return self.pers[ "progressionVerified" ];
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0xd7b3b752, Offset: 0x811
// Size: 0x6a
function function_ad429e448c443545()
{
    assert( isplayer( self ) );
    
    if ( !self hasplayerdata() )
    {
        return 0;
    }
    
    if ( class::function_4d362babbfd5b4b1() )
    {
        return int( max( self getplayerdata( level.loadoutsgroup, "playerState", "xp" ), 0 ) );
    }
    
    return int( max( self getplayerdata( level.loadoutsgroup, "squadMembers", "player_xp" ), 0 ) );
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0x64113932, Offset: 0x883
// Size: 0x26
function function_1f72ecc33fd16c37()
{
    assert( isplayer( self ) );
    
    if ( !self hasplayerdata() )
    {
        return 0;
    }
    
    return progression_utility::getrankforxp( function_ad429e448c443545() );
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0x6c204cdf, Offset: 0x8b2
// Size: 0x6a
function function_89de54a4f43714a4()
{
    assert( isplayer( self ) );
    
    if ( !self hasplayerdata() )
    {
        return 0;
    }
    
    if ( class::function_4d362babbfd5b4b1() )
    {
        return int( max( self getplayerdata( level.loadoutsgroup, "playerState", "prestige" ), 0 ) );
    }
    
    return int( max( self getplayerdata( level.loadoutsgroup, "squadMembers", "season_rank" ), 0 ) );
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0x64de74ae, Offset: 0x924
// Size: 0x1e
function function_f1463e2fc3079b2e()
{
    assert( isplayer( self ) );
    return self.pers[ "verifiedInitialXP" ];
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0x3904792, Offset: 0x94b
// Size: 0x1b
function function_7a2ab5e27a9084d0()
{
    assert( isplayer( self ) );
    return progression_utility::getrankforxp( function_f1463e2fc3079b2e() );
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0x81031cff, Offset: 0x96f
// Size: 0x1e
function function_613f2ac0acef366f()
{
    assert( isplayer( self ) );
    return self.pers[ "verifiedPrestige" ];
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0x74bb65eb, Offset: 0x996
// Size: 0x25
function function_fbde1ca37c2aeeb6()
{
    assert( isplayer( self ) );
    
    if ( function_a14a1871d0fbd201() )
    {
        return function_f1463e2fc3079b2e();
    }
    
    return function_ad429e448c443545();
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0xae1d8545, Offset: 0x9c4
// Size: 0x25
function function_1682192f91884908()
{
    assert( isplayer( self ) );
    
    if ( function_a14a1871d0fbd201() )
    {
        return function_7a2ab5e27a9084d0();
    }
    
    return function_1f72ecc33fd16c37();
}

// Namespace namespace_628672758c64b524
// Params 0
// Checksum 0xff4fec4d, Offset: 0x9f2
// Size: 0x25
function getprestige()
{
    assert( isplayer( self ) );
    
    if ( function_a14a1871d0fbd201() )
    {
        return function_613f2ac0acef366f();
    }
    
    return function_89de54a4f43714a4();
}

