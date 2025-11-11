#using scripts\common\vehicle;
#using scripts\common\vehicle_occupancy;
#using scripts\engine\throttle;
#using scripts\engine\utility;

#namespace battle_tracks;

// Namespace battle_tracks
// Params 0
// Checksum 0xda459294, Offset: 0x2b5
// Size: 0x1e7
function init()
{
    level.var_b4fd5efac46268bf = throttle::throttle_initialize( "monitorStandingOnVehicle_throttle", 15, 0.5 );
    projectbundle = getprojectscriptbundle();
    
    if ( isdefined( projectbundle ) )
    {
        vehicletracklistname = hashcat( %"hash_5c338ed91460dbe1", projectbundle.vehicletracklist );
    }
    else
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    level.vehicletracklist = getscriptbundle( vehicletracklistname ).vehicletracklist;
    
    if ( !isdefined( level.vehicletracklist ) )
    {
        return;
    }
    
    foreach ( index, trackinfo in level.vehicletracklist )
    {
        if ( index <= 1 )
        {
            continue;
        }
        
        if ( !isdefined( trackinfo.vehicletrack ) )
        {
            continue;
        }
        
        trackname = hashcat( %"hash_8f87dca26d14f0d", trackinfo.vehicletrack );
        var_398625bea915896 = getscriptbundlefieldvalues( trackname, [ #"ingamesfxalias", #"ingamemusicstate" ] );
        trackinfo.ingamesfxalias = var_398625bea915896.ingamesfxalias;
        trackinfo.ingamemusicstate = var_398625bea915896.ingamemusicstate;
        
        if ( !isdefined( trackinfo.ingamesfxalias ) )
        {
            assertmsg( "<dev string:x60>" + trackinfo.vehicletrack );
        }
        
        if ( !isdefined( trackinfo.ingamemusicstate ) )
        {
            assertmsg( "<dev string:x86>" + trackinfo.vehicletrack );
        }
    }
}

// Namespace battle_tracks
// Params 2
// Checksum 0x8474bdda, Offset: 0x4a4
// Size: 0x55
function function_383a3536f3b70ef1( vehicle, player )
{
    if ( function_98a4262da2114872( player ) )
    {
        function_7cc783ef7693ce1a( player );
        
        if ( !function_d0f537105677946d( vehicle, player ) )
        {
            function_482d28a40f664fcf( player );
        }
    }
    
    if ( function_175fcb8dec0707a( vehicle ) )
    {
        function_7b6150da5d44a400( vehicle, player, 0 );
    }
}

// Namespace battle_tracks
// Params 4
// Checksum 0xde441a5, Offset: 0x501
// Size: 0xac
function vehicle_occupancy_enter( vehicle, player, seatid, oldseatid )
{
    isdriverseat = vehicle_occupancy::function_d4f0603190ab379f( vehicle, seatid );
    isbattletracksowner = function_43834de46c196376( vehicle, player );
    function_7c84110a2c9c894f( vehicle, player, oldseatid );
    function_c910157cea5c0954( player );
    
    if ( isdriverseat )
    {
        if ( !isbattletracksowner )
        {
            function_b3b4a8466e3ef2b1( vehicle );
            update_battle_tracks( vehicle, player );
        }
        
        if ( function_175fcb8dec0707a( vehicle ) )
        {
            function_d451d9fddcd1aa5f( vehicle );
        }
        
        if ( !function_c808eddfd852442c( vehicle ) )
        {
            player thread toggle_think( player, vehicle );
        }
    }
}

// Namespace battle_tracks
// Params 3
// Checksum 0x3004301e, Offset: 0x5b5
// Size: 0x73
function function_76b0c3373e5be34f( vehicle, player, seatid )
{
    function_3e1312745ee699b2( vehicle.battletracksmusicstate, player, 0 );
    function_7c84110a2c9c894f( vehicle, player, seatid );
    function_c910157cea5c0954( player );
    isbattletracksowner = function_43834de46c196376( vehicle, player );
    
    if ( isbattletracksowner )
    {
        function_b3b4a8466e3ef2b1( vehicle );
        function_1a5df778dfa44f47( vehicle );
    }
}

// Namespace battle_tracks
// Params 1
// Checksum 0x38334767, Offset: 0x630
// Size: 0x4f
function function_4d496ad4a720fdd5( player )
{
    if ( !isdefined( level.var_b4fd5efac46268bf ) )
    {
        return;
    }
    
    level endon( "game_ended" );
    player endon( "disconnect" );
    
    while ( true )
    {
        throttle::function_cc0eee553a602af0( level.var_b4fd5efac46268bf, player );
        function_7d6b782d39e720af( player );
    }
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x7377626a, Offset: 0x687
// Size: 0xa8
function private update_battle_tracks( vehicle, player )
{
    vehicle.battletracks = [];
    vehicle.battletracksowner = player;
    vehicle.battletracksmusicstate = "";
    
    if ( function_25407aba6aeab037( vehicle, player ) )
    {
        function_28abebc210f16c89( vehicle, player, 1, 9 );
    }
    else
    {
        function_28abebc210f16c89( vehicle, player, 0, 9 );
    }
    
    /#
        if ( function_9255747b6c80fec5() )
        {
            vehicle.battletracks = function_870c977ebe2b0ac8( vehicle );
        }
    #/
    
    vehicle.battletracks = utility::array_randomize( vehicle.battletracks );
}

// Namespace battle_tracks
// Params 4, eflags: 0x4
// Checksum 0x7253c3de, Offset: 0x737
// Size: 0x10a
function private function_28abebc210f16c89( vehicle, player, startindex, endindex )
{
    data = vehicle::function_9f6a9bf9120d5a37( vehicle vehicle::get_ref() );
    
    for ( arrayindex = startindex; arrayindex <= endindex ; arrayindex++ )
    {
        trackindex = function_63492c16f530e2a9( vehicle, player, arrayindex, data );
        
        /#
            if ( getdvarint( @"hash_aa9c7230c056a9f8", 0 ) > 0 )
            {
                trackindex = getdvarint( @"hash_aa9c7230c056a9f8" );
            }
        #/
        
        if ( trackindex > 1 )
        {
            if ( getdvarint( @"hash_157cdff8f5182e88", 0 ) == 0 )
            {
                sfxalias = function_822ddd5a38d19c29( trackindex );
                
                if ( sfxalias )
                {
                    vehicle.battletracks[ vehicle.battletracks.size ] = sfxalias;
                    function_fab582dbfec3f8c( vehicle, trackindex );
                }
                
                continue;
            }
            
            vehicle.battletracks[ vehicle.battletracks.size ] = trackindex;
        }
    }
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x46762404, Offset: 0x849
// Size: 0x69
function private function_fab582dbfec3f8c( vehicle, trackindex )
{
    musicstate = function_6d02b9ca0dd1cd38( trackindex );
    
    if ( vehicle.battletracksmusicstate == "" )
    {
        vehicle.battletracksmusicstate = musicstate;
        return;
    }
    
    assert( vehicle.battletracksmusicstate == musicstate, "<dev string:xae>" );
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x64878d9a, Offset: 0x8ba
// Size: 0x4a, Type: bool
function private function_25407aba6aeab037( vehicle, player )
{
    data = vehicle::function_9f6a9bf9120d5a37( vehicle vehicle::get_ref() );
    firsttrackindex = function_63492c16f530e2a9( vehicle, player, 0, data );
    return firsttrackindex == 1;
}

// Namespace battle_tracks
// Params 4, eflags: 0x4
// Checksum 0xfbe89e67, Offset: 0x90d
// Size: 0xb4
function private function_63492c16f530e2a9( vehicle, player, arrayindex, data )
{
    /#
        debugindex = getdvarint( @"hash_97029a354c4876c0", 0 );
        
        if ( debugindex != 0 )
        {
            return debugindex;
        }
    #/
    
    if ( isdefined( data ) && isdefined( data.ref ) )
    {
        trackindex = player utility::callsharedfunc( #"player", #"getplayerdata", level.loadoutsgroup, "customizationSetup", "vehicleCustomization", data.ref, "tracks", arrayindex );
        return trackindex;
    }
    
    return undefined;
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0xef18b6d7, Offset: 0x9c9
// Size: 0x40
function private function_822ddd5a38d19c29( trackindex )
{
    if ( isdefined( level.vehicletracklist ) && isdefined( level.vehicletracklist[ trackindex ] ) )
    {
        return level.vehicletracklist[ trackindex ].ingamesfxalias;
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x62ef4727, Offset: 0xa11
// Size: 0x40
function private function_6d02b9ca0dd1cd38( trackindex )
{
    if ( isdefined( level.vehicletracklist ) && isdefined( level.vehicletracklist[ trackindex ] ) )
    {
        return level.vehicletracklist[ trackindex ].ingamemusicstate;
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x70f32dc1, Offset: 0xa59
// Size: 0xde
function private function_d451d9fddcd1aa5f( vehicle )
{
    if ( getdvarint( @"hash_157cdff8f5182e88", 0 ) == 0 )
    {
        all_occupants = vehicle_occupancy::function_6e6afd819ebbe705( vehicle, 1 );
        
        if ( isdefined( vehicle.turretoccupants ) )
        {
            all_occupants = arraycombineunique( all_occupants, vehicle.turretoccupants );
        }
        
        foreach ( occupant in all_occupants )
        {
            function_7b6150da5d44a400( vehicle, occupant, 0 );
        }
        
        return;
    }
    
    vehicle function_b486d879de33bb51( vehicle.battletracks );
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0xd5143fe8, Offset: 0xb3f
// Size: 0xdd
function private function_b3b4a8466e3ef2b1( vehicle )
{
    if ( getdvarint( @"hash_157cdff8f5182e88", 0 ) == 0 )
    {
        all_occupants = vehicle_occupancy::function_6e6afd819ebbe705( vehicle, 1 );
        
        if ( isdefined( vehicle.turretoccupants ) )
        {
            all_occupants = arraycombineunique( all_occupants, vehicle.turretoccupants );
        }
        
        foreach ( occupant in all_occupants )
        {
            function_3e1312745ee699b2( vehicle.battletracksmusicstate, occupant, 0 );
        }
        
        return;
    }
    
    vehicle function_b1c32abe6da15abc();
}

// Namespace battle_tracks
// Params 3, eflags: 0x4
// Checksum 0x94f42649, Offset: 0xc24
// Size: 0x126
function private function_7b6150da5d44a400( vehicle, player, var_ca21b28965eff8a3 )
{
    if ( getdvarint( @"hash_157cdff8f5182e88", 0 ) != 0 )
    {
        return;
    }
    
    isbattletracksowner = function_43834de46c196376( vehicle, player );
    
    if ( isdefined( vehicle.battletracks ) && isdefined( vehicle.battletracksmusicstate ) && isdefined( player ) )
    {
        if ( isdefined( vehicle.battletracksowner ) && ( isbattletracksowner || var_ca21b28965eff8a3 || player getwartrackpassengerenabled() ) )
        {
            vehiclebattletracksid = function_7a721cbb76c07b7a( vehicle );
            
            if ( !function_79be5acf788f128b( vehicle, player, vehiclebattletracksid ) )
            {
                /#
                    function_aafad573e2b0040( vehicle, player );
                #/
                
                player.battletracksmusicstate = vehicle.battletracksmusicstate;
                player.battletracksid = vehiclebattletracksid;
                player setplayermusicstate( vehicle.battletracksmusicstate, vehicle.battletracks, vehicle, ( 0, 0, 0 ) );
            }
        }
        
        if ( !isbattletracksowner && !var_ca21b28965eff8a3 )
        {
            player thread function_6daf9fd5aef4f91d( player, vehicle );
        }
    }
}

// Namespace battle_tracks
// Params 3, eflags: 0x4
// Checksum 0x3e973c5c, Offset: 0xd52
// Size: 0x6b, Type: bool
function private function_79be5acf788f128b( vehicle, player, vehiclebattletracksid )
{
    if ( !isdefined( player.battletracksmusicstate ) )
    {
        return false;
    }
    
    if ( !isdefined( player.battletracksid ) )
    {
        return false;
    }
    
    return player.battletracksmusicstate == vehicle.battletracksmusicstate && player.battletracksid == vehiclebattletracksid;
}

// Namespace battle_tracks
// Params 3, eflags: 0x4
// Checksum 0x28372302, Offset: 0xdc6
// Size: 0x83
function private function_3e1312745ee699b2( battletracksmusicstate, player, var_ca21b28965eff8a3 )
{
    if ( getdvarint( @"hash_157cdff8f5182e88", 0 ) != 0 )
    {
        return;
    }
    
    if ( function_98a4262da2114872( player ) )
    {
        if ( isdefined( battletracksmusicstate ) && isdefined( player ) )
        {
            /#
                function_82c62238872f4386( battletracksmusicstate, player );
            #/
            
            player.battletracksmusicstate = undefined;
            player.battletracksid = undefined;
            player stopplayermusicstate( battletracksmusicstate );
            
            if ( !var_ca21b28965eff8a3 )
            {
                player notify( "stop_battle_tracks_option_watch" );
            }
        }
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x78f83937, Offset: 0xe51
// Size: 0x27, Type: bool
function private function_98a4262da2114872( player )
{
    return isdefined( player.battletracksmusicstate ) && isdefined( player.battletracksid );
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x9435b287, Offset: 0xe81
// Size: 0x23, Type: bool
function private function_43834de46c196376( vehicle, player )
{
    return vehicle.battletracksowner == player;
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x562b692f, Offset: 0xead
// Size: 0x2d
function private function_1a5df778dfa44f47( vehicle )
{
    vehicle.battletracksowner = undefined;
    vehicle.battletracks = undefined;
    vehicle.battletracksmusicstate = undefined;
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x9ee5e518, Offset: 0xee2
// Size: 0x34, Type: bool
function private function_c808eddfd852442c( vehicle )
{
    if ( !isdefined( vehicle.battletracks ) )
    {
        return true;
    }
    
    if ( vehicle.battletracks.size == 0 )
    {
        return true;
    }
    
    return false;
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x6112d78c, Offset: 0xf1f
// Size: 0x198
function private toggle_think( player, vehicle )
{
    player notify( "stop_battle_tracks_toggle_think" );
    player endon( "stop_battle_tracks_toggle_think" );
    player endon( "death_or_disconnect" );
    player endon( "last_stand_enter" );
    function_acc1a2cc615ba009( player );
    currenttogglestate = function_56ae93e74da28929( player );
    function_ce908c3ef3968086( player, vehicle, currenttogglestate );
    requirehold = player utility::is_player_gamepad_enabled();
    
    if ( requirehold )
    {
        if ( vehicle vehicle::ishelicopter() )
        {
            player notifyonplayercommand( "update_battle_tracks_toggle_state", "+melee_zoom" );
            player notifyonplayercommand( "cancel_battle_tracks_toggle_state", "-melee_zoom" );
            player.battletracktogglebutton = "melee_zoom";
        }
        else
        {
            player notifyonplayercommand( "update_battle_tracks_toggle_state", "+frag" );
            player notifyonplayercommand( "cancel_battle_tracks_toggle_state", "-frag" );
            player.battletracktogglebutton = "frag";
        }
    }
    else
    {
        player notifyonplayercommand( "update_battle_tracks_toggle_state", "nightvision" );
        player.battletracktogglebutton = "nightvision";
    }
    
    while ( true )
    {
        player setclientomnvar( "ui_veh_music_toggle_button_holdtime", 0 );
        player waittill( "update_battle_tracks_toggle_state" );
        newtogglestate = function_755eaaa856a3fcda( player );
        
        if ( requirehold )
        {
            player childthread function_ecfb841cd2e72748();
            result = player utility::waittill_notify_or_timeout_return( "cancel_battle_tracks_toggle_state", 0.25 );
            
            if ( result == "timeout" )
            {
                player notify( "cancel_battle_tracks_toggle_state" );
                function_ce908c3ef3968086( player, vehicle, newtogglestate );
            }
            
            continue;
        }
        
        function_ce908c3ef3968086( player, vehicle, newtogglestate );
    }
}

// Namespace battle_tracks
// Params 0, eflags: 0x4
// Checksum 0x2aaebe6c, Offset: 0x10bf
// Size: 0x4a
function private function_ecfb841cd2e72748()
{
    self endon( "cancel_battle_tracks_toggle_state" );
    progress = 0;
    
    while ( true )
    {
        progress += level.framedurationseconds;
        self setclientomnvar( "ui_veh_music_toggle_button_holdtime", min( 1, progress / 0.25 ) );
        waitframe();
    }
}

// Namespace battle_tracks
// Params 3, eflags: 0x4
// Checksum 0xbca45664, Offset: 0x1111
// Size: 0x5a
function private function_ce908c3ef3968086( player, vehicle, togglestate )
{
    switch ( togglestate )
    {
        case #"hash_fa2ad6f6bd651030":
            function_85dba3849d51023c( player, vehicle );
            break;
        case #"hash_3699ac6c262c25ea":
            function_5ab9076a14525c46( player, vehicle );
            break;
    }
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x5ab3b5f4, Offset: 0x1173
// Size: 0x2c
function private function_85dba3849d51023c( player, vehicle )
{
    function_bef9b8d0951627a5( player, "on" );
    function_d451d9fddcd1aa5f( vehicle );
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0xb4dc3cb6, Offset: 0x11a7
// Size: 0x2c
function private function_5ab9076a14525c46( player, vehicle )
{
    function_bef9b8d0951627a5( player, "off" );
    function_b3b4a8466e3ef2b1( vehicle );
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x449d726d, Offset: 0x11db
// Size: 0x49
function private function_755eaaa856a3fcda( player )
{
    switch ( player.pers[ "battleTracksToggleState" ] )
    {
        case #"hash_fa2ad6f6bd651030":
            return "off";
        case #"hash_3699ac6c262c25ea":
            return "on";
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x97652e7e, Offset: 0x122c
// Size: 0x30
function private function_acc1a2cc615ba009( player )
{
    if ( !isdefined( player.pers[ "battleTracksToggleState" ] ) )
    {
        function_bef9b8d0951627a5( player, "on" );
    }
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0xc3f41eac, Offset: 0x1264
// Size: 0xae
function private function_bef9b8d0951627a5( player, value )
{
    if ( !player function_5c766d1d0140b86( "ui_veh_battle_tracks_toggle_state" ) )
    {
        return;
    }
    
    player.pers[ "battleTracksToggleState" ] = value;
    var_fb5d97f2bb9a9a3a = player getclientomnvar( "ui_veh_battle_tracks_toggle_state" );
    
    switch ( value )
    {
        case #"hash_fa2ad6f6bd651030":
            player setclientomnvar( "ui_veh_battle_tracks_toggle_state", 1 );
            
            /#
                function_c0acbf135a7bc9a7( player, var_fb5d97f2bb9a9a3a );
            #/
            
            break;
        case #"hash_3699ac6c262c25ea":
            player setclientomnvar( "ui_veh_battle_tracks_toggle_state", 2 );
            
            /#
                function_378f088ffe168eeb( player, var_fb5d97f2bb9a9a3a );
            #/
            
            break;
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0xbfa277b5, Offset: 0x131a
// Size: 0x52
function private function_c910157cea5c0954( player )
{
    if ( isdefined( player ) && player function_5c766d1d0140b86( "ui_veh_battle_tracks_toggle_state" ) )
    {
        var_fb5d97f2bb9a9a3a = player getclientomnvar( "ui_veh_battle_tracks_toggle_state" );
        player setclientomnvar( "ui_veh_battle_tracks_toggle_state", 0 );
        
        /#
            function_655c50210a09088e( player, var_fb5d97f2bb9a9a3a );
        #/
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x4be330b0, Offset: 0x1374
// Size: 0x3f
function private function_56ae93e74da28929( player )
{
    assert( isdefined( player.pers[ "<dev string:xe2>" ] ), "<dev string:xfd>" );
    return player.pers[ "battleTracksToggleState" ];
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0xf3b1cd2a, Offset: 0x13bc
// Size: 0x29, Type: bool
function private function_c15b84ee3477eee9( player, value )
{
    return player.pers[ "battleTracksToggleState" ] == value;
}

// Namespace battle_tracks
// Params 3, eflags: 0x4
// Checksum 0xb836db6d, Offset: 0x13ee
// Size: 0x49
function private function_7c84110a2c9c894f( vehicle, player, seatid )
{
    isdriverseat = isdefined( seatid ) && vehicle_occupancy::function_d4f0603190ab379f( vehicle, seatid );
    
    if ( isdriverseat )
    {
        player stop_toggle_think( player );
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x19bcdeab, Offset: 0x143f
// Size: 0xcc
function private stop_toggle_think( player )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    player notify( "stop_battle_tracks_toggle_think" );
    
    if ( isdefined( player.battletracktogglebutton ) )
    {
        switch ( player.battletracktogglebutton )
        {
            case #"hash_10931e593d5bdf":
                player notifyonplayercommandremove( "update_battle_tracks_toggle_state", "+melee_zoom" );
                player notifyonplayercommandremove( "cancel_battle_tracks_toggle_state", "-melee_zoom" );
                break;
            case #"hash_a8e4a914fb03a4d5":
                player notifyonplayercommandremove( "update_battle_tracks_toggle_state", "+frag" );
                player notifyonplayercommandremove( "cancel_battle_tracks_toggle_state", "-frag" );
                break;
            case #"hash_b4b26057ca84210d":
                player notifyonplayercommandremove( "update_battle_tracks_toggle_state", "nightvision" );
                break;
        }
        
        player.battletracktogglebutton = undefined;
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x7a4f4f10, Offset: 0x1513
// Size: 0x84, Type: bool
function private function_175fcb8dec0707a( vehicle )
{
    if ( isdefined( level.gametypebundle ) && isdefined( level.gametypebundle.battletracksenabled ) && !level.gametypebundle.battletracksenabled )
    {
        return false;
    }
    
    if ( function_c808eddfd852442c( vehicle ) )
    {
        return false;
    }
    
    if ( isdefined( vehicle.battletracksowner ) && function_c15b84ee3477eee9( vehicle.battletracksowner, "off" ) )
    {
        return false;
    }
    
    return true;
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x64392fe9, Offset: 0x15a0
// Size: 0x55
function private function_7d6b782d39e720af( player )
{
    vehicle = player getmovingplatformparent();
    
    if ( function_b52c64c08b732fc5( vehicle, player ) )
    {
        player thread function_40be3d350d9c6aad( vehicle, player );
        
        if ( !function_5dde30c1eedfbe1b( vehicle, player ) )
        {
            function_482d28a40f664fcf( player );
            function_f37887eecb8944c1( vehicle, player );
        }
    }
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x4c6b68fa, Offset: 0x15fd
// Size: 0x20
function private function_f37887eecb8944c1( vehicle, player )
{
    function_7b6150da5d44a400( vehicle, player, 0 );
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x7a5f3b87, Offset: 0x1625
// Size: 0x29
function private function_482d28a40f664fcf( player )
{
    if ( function_98a4262da2114872( player ) )
    {
        function_7cc783ef7693ce1a( player );
        function_d993f54277870b9f( player );
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x84734a33, Offset: 0x1656
// Size: 0x15
function private function_7cc783ef7693ce1a( player )
{
    player notify( "battle_tracks_standingOnVehicleTimeout" );
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x6f2ccee2, Offset: 0x1673
// Size: 0x44
function private function_40be3d350d9c6aad( vehicle, player )
{
    level endon( "game_ended" );
    player endon( "disconnect" );
    player notify( "battle_tracks_standingOnVehicleTimeout" );
    player endon( "battle_tracks_standingOnVehicleTimeout" );
    wait 1;
    function_d993f54277870b9f( player );
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0xddf538a2, Offset: 0x16bf
// Size: 0x9f
function private function_6daf9fd5aef4f91d( player, vehicle )
{
    level endon( "game_ended" );
    player endon( "disconnect" );
    player endon( "stop_battle_tracks_option_watch" );
    
    for ( var_aed76dd5af307d5e = player getwartrackpassengerenabled(); true ; var_aed76dd5af307d5e = var_14d8b6ee49763758 )
    {
        wait 0.5;
        var_14d8b6ee49763758 = player getwartrackpassengerenabled();
        
        if ( var_14d8b6ee49763758 != var_aed76dd5af307d5e )
        {
            if ( var_14d8b6ee49763758 )
            {
                if ( function_175fcb8dec0707a( vehicle ) )
                {
                    function_7b6150da5d44a400( vehicle, player, 1 );
                }
                
                continue;
            }
            
            function_3e1312745ee699b2( vehicle.battletracksmusicstate, player, 1 );
        }
    }
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0x1c58dc56, Offset: 0x1766
// Size: 0x21
function private function_d993f54277870b9f( player )
{
    function_3e1312745ee699b2( player.battletracksmusicstate, player, 0 );
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0x7bef1703, Offset: 0x178f
// Size: 0x4b, Type: bool
function private function_b52c64c08b732fc5( vehicle, player )
{
    if ( !isdefined( vehicle ) )
    {
        return false;
    }
    
    if ( !vehicle vehicle::is_vehicle() )
    {
        return false;
    }
    
    if ( !vehicle::function_8957ae4cd340941c( vehicle, player ) )
    {
        return false;
    }
    
    if ( !function_175fcb8dec0707a( vehicle ) )
    {
        return false;
    }
    
    return true;
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0xd7e9644d, Offset: 0x17e3
// Size: 0x49, Type: bool
function private function_5dde30c1eedfbe1b( vehicle, player )
{
    if ( !isdefined( player.battletracksid ) )
    {
        return false;
    }
    
    battletracksid = function_7a721cbb76c07b7a( vehicle );
    return battletracksid == player.battletracksid;
}

// Namespace battle_tracks
// Params 2, eflags: 0x4
// Checksum 0xfc350ddd, Offset: 0x1835
// Size: 0x2b, Type: bool
function private function_d0f537105677946d( vehicle, player )
{
    if ( function_c808eddfd852442c( vehicle ) )
    {
        return false;
    }
    
    return function_5dde30c1eedfbe1b( vehicle, player );
}

// Namespace battle_tracks
// Params 1, eflags: 0x4
// Checksum 0xd9583247, Offset: 0x1869
// Size: 0x47
function private function_7a721cbb76c07b7a( vehicle )
{
    vehicleid = vehicle getentitynumber() + "";
    trackownerid = vehicle.battletracksowner getentitynumber() + "";
    return vehicleid + trackownerid;
}

/#

    // Namespace battle_tracks
    // Params 0, eflags: 0x4
    // Checksum 0x1d961175, Offset: 0x18b9
    // Size: 0x1e, Type: dev
    function private function_9255747b6c80fec5()
    {
        return getdvar( @"hash_88960e36a4bc7a7d", "<dev string:x134>" ) != "<dev string:x134>";
    }

    // Namespace battle_tracks
    // Params 1, eflags: 0x4
    // Checksum 0xbadcdd37, Offset: 0x18df
    // Size: 0xd4, Type: dev
    function private function_870c977ebe2b0ac8( vehicle )
    {
        vehicle.battletracksmusicstate = "<dev string:x138>";
        result = [];
        debugwartracks = getdvar( @"hash_88960e36a4bc7a7d", "<dev string:x134>" );
        var_8ca27d53289c4f16 = strtok( debugwartracks, "<dev string:x145>" );
        
        foreach ( var_db6f5c44cef6bae1 in var_8ca27d53289c4f16 )
        {
            result[ result.size ] = int( var_db6f5c44cef6bae1 );
        }
        
        return result;
    }

    // Namespace battle_tracks
    // Params 2, eflags: 0x4
    // Checksum 0xbabfe7a, Offset: 0x19bb
    // Size: 0xec, Type: dev
    function private function_aafad573e2b0040( vehicle, player )
    {
        if ( !debug_enabled() )
        {
            return;
        }
        
        println( "<dev string:x14a>" );
        println( "<dev string:x170>" + gettime() );
        println( "<dev string:x181>" + player getentitynumber() );
        println( "<dev string:x19b>" + vehicle.battletracksmusicstate );
        
        foreach ( battletrack in vehicle.battletracks )
        {
            println( "<dev string:x1ac>" + battletrack );
        }
        
        println( "<dev string:x1b7>" );
    }

    // Namespace battle_tracks
    // Params 2, eflags: 0x4
    // Checksum 0xfdc67afd, Offset: 0x1aaf
    // Size: 0x64, Type: dev
    function private function_82c62238872f4386( battletracksmusicstate, player )
    {
        if ( !debug_enabled() )
        {
            return;
        }
        
        println( "<dev string:x1dd>" );
        println( "<dev string:x170>" + gettime() );
        println( "<dev string:x181>" + player getentitynumber() );
        println( "<dev string:x19b>" + battletracksmusicstate );
        println( "<dev string:x1b7>" );
    }

    // Namespace battle_tracks
    // Params 2, eflags: 0x4
    // Checksum 0xe9d5e9d0, Offset: 0x1b1b
    // Size: 0x94, Type: dev
    function private function_c0acbf135a7bc9a7( player, var_fb5d97f2bb9a9a3a )
    {
        if ( !debug_enabled() || !player function_5c766d1d0140b86( "<dev string:x203>" ) )
        {
            return;
        }
        
        println( "<dev string:x228>" );
        println( "<dev string:x170>" + gettime() );
        println( "<dev string:x181>" + player getentitynumber() );
        println( "<dev string:x253>" );
        println( "<dev string:x281>" + var_fb5d97f2bb9a9a3a );
        println( "<dev string:x293>" + player getclientomnvar( "<dev string:x203>" ) );
        println( "<dev string:x2a0>" );
    }

    // Namespace battle_tracks
    // Params 2, eflags: 0x4
    // Checksum 0xf31cd267, Offset: 0x1bb7
    // Size: 0x94, Type: dev
    function private function_378f088ffe168eeb( player, var_fb5d97f2bb9a9a3a )
    {
        if ( !debug_enabled() || !player function_5c766d1d0140b86( "<dev string:x203>" ) )
        {
            return;
        }
        
        println( "<dev string:x2cb>" );
        println( "<dev string:x170>" + gettime() );
        println( "<dev string:x181>" + player getentitynumber() );
        println( "<dev string:x253>" );
        println( "<dev string:x281>" + var_fb5d97f2bb9a9a3a );
        println( "<dev string:x293>" + player getclientomnvar( "<dev string:x203>" ) );
        println( "<dev string:x2f7>" );
    }

    // Namespace battle_tracks
    // Params 2, eflags: 0x4
    // Checksum 0xe0097e78, Offset: 0x1c53
    // Size: 0x94, Type: dev
    function private function_655c50210a09088e( player, var_fb5d97f2bb9a9a3a )
    {
        if ( !debug_enabled() || !player function_5c766d1d0140b86( "<dev string:x203>" ) )
        {
            return;
        }
        
        println( "<dev string:x323>" );
        println( "<dev string:x170>" + gettime() );
        println( "<dev string:x181>" + player getentitynumber() );
        println( "<dev string:x253>" );
        println( "<dev string:x281>" + var_fb5d97f2bb9a9a3a );
        println( "<dev string:x293>" + player getclientomnvar( "<dev string:x203>" ) );
        println( "<dev string:x351>" );
    }

    // Namespace battle_tracks
    // Params 0, eflags: 0x4
    // Checksum 0xfcfe29d2, Offset: 0x1cef
    // Size: 0x16, Type: dev
    function private debug_enabled()
    {
        return getdvarint( @"hash_79d2fc5a92fbfcd1", 0 ) != 0;
    }

#/
