#using scripts\common\callbacks;
#using scripts\mp\hud_util;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\teams;

#namespace namespace_6db61cded148a258;

// Namespace namespace_6db61cded148a258
// Params 0, eflags: 0x5
// Checksum 0xaabdbcd0, Offset: 0x15b
// Size: 0x68
function private autoexec main()
{
    level.var_c267f3cfc720a3be = [];
    level.var_e8baaf9a6a5a10e0 = [];
    level callback::add( #"player_spawned", &function_600f8b7419162a39 );
    level callback::add( #"player_death", &function_98936ace4ab4a08d );
    level callback::add( #"player_disconnect", &function_206cd317b7bfb88b );
    level waittill( "player_spawned" );
    level thread function_d8ccbe4b018e8e42();
}

// Namespace namespace_6db61cded148a258
// Params 0, eflags: 0xc
// Checksum 0x3638e7c5, Offset: 0x1cb
// Size: 0x604
function private function_d8ccbe4b018e8e42()
{
    self notify( "c0ec1230e3abbc18" );
    self endon( "c0ec1230e3abbc18" );
    level endon( "game_ended" );
    var_26ec15f9a70d8e05 = level.gametypebundle.var_b1e27964aaf48faa ?? 450;
    var_c88fddf399613d53 = level.gametypebundle.var_8e409e5c9f302892 ?? 550;
    var_8eb047d7501b6d69 = var_26ec15f9a70d8e05 * var_26ec15f9a70d8e05;
    var_8d3d04bfce2adc63 = var_c88fddf399613d53 * var_c88fddf399613d53;
    var_6bd3f38e74c5e069 = level.gametypebundle.var_2a4f915c8cf0c18 ?? 1;
    
    while ( true )
    {
        var_57c628ef01bc26e9 = level.players;
        
        if ( !var_57c628ef01bc26e9 || var_57c628ef01bc26e9.size == 0 )
        {
            wait 0.05;
            continue;
        }
        
        foreach ( player in var_57c628ef01bc26e9 )
        {
            if ( !player::isreallyalive( player ) || !player.var_ec98e3eda15a64c.size )
            {
                wait 0.05;
                continue;
            }
            
            foreach ( var_180441f3613d6cf7 in player.var_ec98e3eda15a64c )
            {
                allies = teams::getfriendlyplayers( player.team, 1 );
                
                if ( !isdefined( allies ) )
                {
                    wait 0.05;
                    continue;
                }
                
                var_d05dee405244ee21 = level.var_e8baaf9a6a5a10e0[ var_180441f3613d6cf7.perkname ];
                playerentnum = player getentitynumber();
                
                foreach ( ally in allies )
                {
                    if ( ally == player )
                    {
                        continue;
                    }
                    
                    var_c907c3fa4b0ac53b = ally getentitynumber();
                    
                    if ( isdefined( var_180441f3613d6cf7.var_a0fb81c343ec70c4[ var_c907c3fa4b0ac53b ] ) && player.var_1828e46f63d057c8[ var_c907c3fa4b0ac53b ] > 0 )
                    {
                        if ( isdefined( ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_180441f3613d6cf7.perkname ] ) )
                        {
                            ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_180441f3613d6cf7.perkname ] notify( "stop_pulse_tps_hud" );
                            ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_180441f3613d6cf7.perkname ] hud_util::showelem();
                        }
                    }
                    
                    player.var_1828e46f63d057c8[ var_c907c3fa4b0ac53b ] = 0;
                    
                    if ( isdefined( var_180441f3613d6cf7.var_a0fb81c343ec70c4[ var_c907c3fa4b0ac53b ] ) )
                    {
                        continue;
                    }
                    
                    if ( ally.var_86c4b1b610f8536b[ var_d05dee405244ee21 ] > 0 )
                    {
                        ally.var_86c4b1b610f8536b[ var_d05dee405244ee21 ]++;
                    }
                    else
                    {
                        ally.var_86c4b1b610f8536b[ var_d05dee405244ee21 ] = 1;
                        ally perk::giveperk( var_d05dee405244ee21 );
                        var_3d67f5e4ab052e35 = level.perkbundles[ var_d05dee405244ee21 ].var_fd9b39439920c808 ?? "uin_cer_notify_fieldupgrade_ready";
                        ally playlocalsound( var_3d67f5e4ab052e35 );
                        function_8ef6bf3a8a58cac( ally, ally.var_86c4b1b610f8536b );
                        function_fa87874cd0a700f5( ally, ally.var_180441f3613d6cf7, ally.var_86c4b1b610f8536b );
                    }
                    
                    var_180441f3613d6cf7.var_a0fb81c343ec70c4[ var_c907c3fa4b0ac53b ] = ally;
                    
                    if ( !isdefined( ally.var_c4b4f21cb358d87c[ var_d05dee405244ee21 ] ) )
                    {
                        ally.var_c4b4f21cb358d87c[ var_d05dee405244ee21 ] = [];
                    }
                    
                    ally.var_c4b4f21cb358d87c[ var_d05dee405244ee21 ] = arraycombineunique( ally.var_c4b4f21cb358d87c[ var_d05dee405244ee21 ], [ player ] );
                    
                    if ( isdefined( var_180441f3613d6cf7.var_a0fb81c343ec70c4[ var_c907c3fa4b0ac53b ] ) )
                    {
                        if ( player.var_1828e46f63d057c8[ var_c907c3fa4b0ac53b ] == 0 && ally.var_86c4b1b610f8536b[ var_d05dee405244ee21 ] == 1 )
                        {
                            if ( isdefined( ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_180441f3613d6cf7.perkname ] ) && !ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_d05dee405244ee21 ].hidden )
                            {
                                ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_180441f3613d6cf7.perkname ] thread function_dad19e31d30d5fa8( 0 );
                            }
                        }
                        
                        if ( player.var_1828e46f63d057c8[ var_c907c3fa4b0ac53b ] >= var_6bd3f38e74c5e069 )
                        {
                            if ( isdefined( ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_180441f3613d6cf7.perkname ] ) )
                            {
                                ally.var_efd27494c014d76f.var_8ab514ae7e451e74[ var_180441f3613d6cf7.perkname ] notify( "stop_pulse_tps_hud" );
                            }
                            
                            player.var_1828e46f63d057c8[ var_c907c3fa4b0ac53b ] = 0;
                            var_180441f3613d6cf7.var_a0fb81c343ec70c4[ var_c907c3fa4b0ac53b ] = undefined;
                            ally.var_c4b4f21cb358d87c[ var_d05dee405244ee21 ] = arrayremove( ally.var_c4b4f21cb358d87c[ var_d05dee405244ee21 ], player );
                            level function_ecf040cd334ea790( ally, var_d05dee405244ee21 );
                        }
                        
                        player.var_1828e46f63d057c8[ var_c907c3fa4b0ac53b ] += 0.05 * var_57c628ef01bc26e9.size;
                    }
                }
            }
            
            wait 0.05;
        }
    }
}

// Namespace namespace_6db61cded148a258
// Params 1
// Checksum 0x6712e831, Offset: 0x7d7
// Size: 0x3c
function function_600f8b7419162a39( data )
{
    self.var_c4b4f21cb358d87c = [];
    self.var_1828e46f63d057c8 = [];
    self.var_86c4b1b610f8536b = [];
    function_fa87874cd0a700f5( self, self.var_180441f3613d6cf7, [] );
}

// Namespace namespace_6db61cded148a258
// Params 1
// Checksum 0x176c4f77, Offset: 0x81b
// Size: 0x1a
function function_98936ace4ab4a08d( data )
{
    function_ac9ad18b6b43513c();
    function_ec276fc5265a02a4();
}

// Namespace namespace_6db61cded148a258
// Params 1
// Checksum 0x45128eb2, Offset: 0x83d
// Size: 0x1a
function function_206cd317b7bfb88b( data )
{
    function_ac9ad18b6b43513c();
    function_ec276fc5265a02a4();
}

// Namespace namespace_6db61cded148a258
// Params 0
// Checksum 0xb4047724, Offset: 0x85f
// Size: 0x133
function function_ac9ad18b6b43513c()
{
    foreach ( var_180441f3613d6cf7 in self.var_ec98e3eda15a64c )
    {
        var_623a8bbe14581fee = level.var_e8baaf9a6a5a10e0[ var_180441f3613d6cf7.perkname ];
        
        foreach ( ally in var_180441f3613d6cf7.var_a0fb81c343ec70c4 )
        {
            if ( ally )
            {
                ally.var_c4b4f21cb358d87c[ var_623a8bbe14581fee ] = arrayremove( ally.var_c4b4f21cb358d87c[ var_623a8bbe14581fee ], self );
                level function_ecf040cd334ea790( ally, var_623a8bbe14581fee );
            }
        }
    }
}

// Namespace namespace_6db61cded148a258
// Params 0
// Checksum 0x1cf4a3b3, Offset: 0x99a
// Size: 0x1a3
function function_ec276fc5265a02a4()
{
    if ( self.var_86c4b1b610f8536b.size > 0 )
    {
        foreach ( perk in getarraykeys( self.var_86c4b1b610f8536b ) )
        {
            if ( self.var_86c4b1b610f8536b[ perk ] > 0 )
            {
                level function_ecf040cd334ea790( self, perk );
            }
        }
    }
    
    playerentnum = self getentitynumber();
    
    foreach ( player in level.players )
    {
        if ( player != self )
        {
            foreach ( var_180441f3613d6cf7 in player.var_ec98e3eda15a64c )
            {
                var_180441f3613d6cf7.var_a0fb81c343ec70c4[ playerentnum ] = undefined;
            }
        }
    }
}

// Namespace namespace_6db61cded148a258
// Params 2
// Checksum 0x5da3b12, Offset: 0xb45
// Size: 0x93
function function_ecf040cd334ea790( player, var_bac8b30bd7ce8d6b )
{
    if ( player.var_86c4b1b610f8536b[ var_bac8b30bd7ce8d6b ] > 0 && var_bac8b30bd7ce8d6b != "specialty_null" )
    {
        player.var_86c4b1b610f8536b[ var_bac8b30bd7ce8d6b ]--;
        
        if ( player.var_86c4b1b610f8536b[ var_bac8b30bd7ce8d6b ] == 0 )
        {
            player perk::removeperk( var_bac8b30bd7ce8d6b );
            function_8ef6bf3a8a58cac( player, player.var_86c4b1b610f8536b );
            function_fa87874cd0a700f5( player, player.var_180441f3613d6cf7, player.var_86c4b1b610f8536b );
        }
    }
}

/#

    // Namespace namespace_6db61cded148a258
    // Params 0, eflags: 0xc
    // Checksum 0x7ff67930, Offset: 0xbe0
    // Size: 0x159, Type: dev
    function private function_2a9b1d464361b8e5()
    {
        self notify( "84274faf7ebec83" );
        self endon( "84274faf7ebec83" );
        var_26ec15f9a70d8e05 = level.gametypebundle.var_b1e27964aaf48faa ?? 450;
        var_c88fddf399613d53 = level.gametypebundle.var_8e409e5c9f302892 ?? 550;
        
        while ( true )
        {
            foreach ( player in level.players )
            {
                if ( player::isreallyalive( player ) && isbot( player ) )
                {
                    cylinder( player.origin, player.origin + ( 0, 0, 64 ), var_26ec15f9a70d8e05, ( 0, 0, 1 ) );
                    cylinder( player.origin, player.origin + ( 0, 0, 64 ), var_c88fddf399613d53, ( 1, 0, 0 ) );
                }
            }
            
            waitframe();
        }
    }

#/

// Namespace namespace_6db61cded148a258
// Params 2
// Checksum 0xad6677be, Offset: 0xd41
// Size: 0xed
function function_8ef6bf3a8a58cac( player, var_86c4b1b610f8536b )
{
    if ( !isdefined( player ) || !isdefined( var_86c4b1b610f8536b ) )
    {
        return;
    }
    
    var_a09831b242434062 = [];
    
    foreach ( var_fbefb594857ca440, value in var_86c4b1b610f8536b )
    {
        if ( value > 0 )
        {
            var_a09831b242434062[ var_a09831b242434062.size ] = var_fbefb594857ca440;
        }
    }
    
    for ( omnvarindex = 0; omnvarindex < 2 ; omnvarindex++ )
    {
        omnvarvalue = var_a09831b242434062[ omnvarindex ];
        
        if ( !isdefined( omnvarvalue ) )
        {
            omnvarvalue = "none";
        }
        
        player setclientomnvar( "ui_networked_perk_" + omnvarindex, omnvarvalue );
    }
}

// Namespace namespace_6db61cded148a258
// Params 3
// Checksum 0xfba84495, Offset: 0xe36
// Size: 0x40e
function function_fa87874cd0a700f5( player, var_465af984bad49ad5, var_86c4b1b610f8536b )
{
    if ( isbot( player ) || isagent( player ) )
    {
        return;
    }
    
    if ( !isdefined( player.var_efd27494c014d76f ) )
    {
        xoffset = -55;
        yoffset = 85;
        var_87ca48ecebea8b3f = 10;
        player.var_efd27494c014d76f = spawnstruct();
        player.var_efd27494c014d76f.var_10b16680f50fdb41 = player hud_util::createfontstring( "default", 1 );
        player.var_efd27494c014d76f.var_10b16680f50fdb41.color = ( 1, 1, 0 );
        player.var_efd27494c014d76f.var_10b16680f50fdb41.alpha = 1;
        player.var_efd27494c014d76f.var_10b16680f50fdb41.sort = 1;
        player.var_efd27494c014d76f.var_10b16680f50fdb41 hud_util::setpoint( "RIGHT", "RIGHT", xoffset, yoffset );
        yoffset += var_87ca48ecebea8b3f;
        player.var_efd27494c014d76f.var_8ab514ae7e451e74 = [];
        
        foreach ( buff in getarraykeys( level.var_e8baaf9a6a5a10e0 ) )
        {
            player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ] = player hud_util::createfontstring( "default", 1 );
            player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ] settext( level.var_c267f3cfc720a3be[ buff ] );
            player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ].color = ( 0, 0.75, 1 );
            player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ].alpha = 1;
            player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ].sort = 1;
            player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ] hud_util::setpoint( "RIGHT", "RIGHT", xoffset, yoffset );
            yoffset += var_87ca48ecebea8b3f;
        }
    }
    
    if ( isdefined( var_465af984bad49ad5 ) && var_465af984bad49ad5 != "specialty_null" )
    {
        player.var_efd27494c014d76f.var_10b16680f50fdb41 settext( level.var_c267f3cfc720a3be[ var_465af984bad49ad5 ] );
    }
    
    foreach ( buff in getarraykeys( level.var_e8baaf9a6a5a10e0 ) )
    {
        refname = level.var_e8baaf9a6a5a10e0[ buff ];
        
        if ( var_86c4b1b610f8536b[ refname ] > 0 )
        {
            if ( player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ].hidden )
            {
                player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ] thread function_dad19e31d30d5fa8( 1 );
            }
            
            continue;
        }
        
        if ( isdefined( player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ] ) )
        {
            player.var_efd27494c014d76f.var_8ab514ae7e451e74[ buff ] hud_util::hideelem();
        }
    }
}

// Namespace namespace_6db61cded148a258
// Params 1, eflags: 0xc
// Checksum 0xa1a84296, Offset: 0x124c
// Size: 0xca
function private function_dad19e31d30d5fa8( var_de472174a134fd26 )
{
    self notify( "cd3e16134482f0dd" );
    self endon( "cd3e16134482f0dd" );
    self endon( "stop_pulse_tps_hud" );
    time = 0;
    interval = 0.15;
    totaltime = level.gametypebundle.var_2a4f915c8cf0c18 ?? 1;
    
    if ( var_de472174a134fd26 )
    {
        interval = 0.25;
        totaltime = 0.5;
    }
    
    while ( time <= totaltime )
    {
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( self.hidden )
        {
            hud_util::showelem();
        }
        else
        {
            hud_util::hideelem();
        }
        
        time += interval;
        wait interval;
    }
    
    if ( isdefined( self ) )
    {
        if ( var_de472174a134fd26 )
        {
            hud_util::showelem();
            return;
        }
        
        hud_util::hideelem();
    }
}

// Namespace namespace_6db61cded148a258
// Params 1
// Checksum 0xc269f2a8, Offset: 0x131e
// Size: 0x5e
function function_e01aea80d74c2f37( perkname )
{
    var_180441f3613d6cf7 = { #var_a0fb81c343ec70c4:[], #perkname:perkname };
    self.var_ec98e3eda15a64c = arraycombineunique( self.var_ec98e3eda15a64c, [ var_180441f3613d6cf7 ] );
    function_fa87874cd0a700f5( self, perkname, self.var_86c4b1b610f8536b );
}

// Namespace namespace_6db61cded148a258
// Params 1
// Checksum 0xb6f3740c, Offset: 0x1384
// Size: 0xbe
function function_13d095e25c63ffc6( perkname )
{
    foreach ( var_180441f3613d6cf7 in self.var_ec98e3eda15a64c )
    {
        if ( var_180441f3613d6cf7.perkname == perkname )
        {
            self.var_ec98e3eda15a64c = arrayremove( self.var_ec98e3eda15a64c, var_180441f3613d6cf7 );
            break;
        }
    }
    
    function_fa87874cd0a700f5( self, "specialty_null", self.var_86c4b1b610f8536b );
}

