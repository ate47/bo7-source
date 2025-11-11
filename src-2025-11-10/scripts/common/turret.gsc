#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\engine\math;
#using scripts\engine\throttle;

#namespace turret;

// Namespace turret
// Params 0
// Checksum 0xff6976f, Offset: 0x131
// Size: 0xa6
function turret_vm_playeranims_think()
{
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "turretownerchange" );
        player = self getturretowner();
        weap = undefined;
        
        if ( isplayer( player ) && !isbot( player ) )
        {
            player giveweapon( self.weaponinfo );
            weap = player getcurrentweapon();
            player switchtoweaponimmediate( self.weaponinfo );
        }
        
        self waittill( "turretownerchange" );
        
        if ( isplayer( player ) && !isbot( player ) )
        {
            player switchtoweaponimmediate( weap );
            player takeweapon( self.weaponinfo );
        }
    }
}

// Namespace turret
// Params 1
// Checksum 0xc0fd1efb, Offset: 0x1df
// Size: 0x31
function function_9b1f535339c80a4( turretindex )
{
    if ( !isdefined( turretindex ) )
    {
        turretindex = 0;
    }
    
    thread turret_update_targeting( turretindex );
    thread function_1210e1b3a51df4a( turretindex );
    thread function_912c602e8d3066fe( turretindex );
}

// Namespace turret
// Params 1
// Checksum 0xcd18d6c, Offset: 0x218
// Size: 0x43
function function_9a0fa09f3acbc0cd( turretindex )
{
    if ( !isdefined( turretindex ) )
    {
        turretindex = 0;
    }
    
    self notify( "turret_disable" );
    self.turret_target = undefined;
    self clearturrettarget( turretindex );
    self function_dc687ac632f02272( 0, turretindex );
    self.shootstate = 0;
}

// Namespace turret
// Params 2
// Checksum 0x301bf656, Offset: 0x263
// Size: 0x51
function function_40a195262f7f99ab( turretindex, targetteams )
{
    if ( !isarray( self.var_8c4f0ae240813c2d ) )
    {
        self.var_8c4f0ae240813c2d = [];
    }
    
    if ( !isarray( targetteams ) )
    {
        targetteams = [ targetteams ];
    }
    
    self.var_8c4f0ae240813c2d[ turretindex ] = targetteams;
}

// Namespace turret
// Params 1
// Checksum 0x5a500967, Offset: 0x2bc
// Size: 0x131
function turret_update_targeting( turretindex )
{
    self endon( "death" );
    self endon( "turret_disable" );
    
    if ( !level.var_149c6f9e292662bf )
    {
        function_ed71b42f05d4d7d7( "j_head" );
    }
    
    if ( !isdefined( level.var_200e327217d288d9 ) )
    {
        level.var_200e327217d288d9 = throttle::throttle_initialize( "turret_update_targeting", 4 );
    }
    
    while ( true )
    {
        if ( !self.turret_target )
        {
            self.turret_target = function_cd54e45808e43fd2( turretindex );
            
            if ( self.turret_target )
            {
                thread function_120a01902f184185( turretindex );
            }
            else if ( self getturrettargetent( turretindex ) )
            {
                self clearturrettarget( turretindex );
            }
        }
        
        /#
            if ( self.turret_target && getdvarint( @"hash_cb665e9de213e524" ) )
            {
                origin = self.turret_target getcentroid();
                radius = 40;
                color = ( 0, 0.8, 0 );
                duration = 1;
                sphere( origin, radius, color, duration );
            }
        #/
        
        waitframe();
        throttle::function_cc0eee553a602af0( level.var_200e327217d288d9, self );
    }
}

// Namespace turret
// Params 1, eflags: 0x4
// Checksum 0xea31f851, Offset: 0x3f5
// Size: 0x121
function private function_120a01902f184185( turretindex )
{
    self endon( "death" );
    self endon( "turret_disable" );
    starttime = gettime();
    lockondelay = self function_880261ce60d8a415( turretindex );
    
    while ( self.turret_target && function_83d3d1b4438e0282( self.turret_target, turretindex ) && gettime() - starttime < lockondelay )
    {
        waitframe();
    }
    
    if ( !function_83d3d1b4438e0282( self.turret_target, turretindex ) )
    {
        self.turret_target = undefined;
        return;
    }
    
    targetoffset = function_c01238529dc3d7c9( self.turret_target ) - self.turret_target.origin;
    self setturrettargetent( self.turret_target, targetoffset, turretindex );
    starttime = gettime();
    var_61807ca3c75055cc = self function_684ad5c041f6c5de( turretindex );
    
    while ( self getturrettargetent( turretindex ) && function_83d3d1b4438e0282( self.turret_target, turretindex ) && gettime() - starttime < var_61807ca3c75055cc )
    {
        waitframe();
    }
    
    self.turret_target = undefined;
}

// Namespace turret
// Params 1
// Checksum 0x3485796f, Offset: 0x51e
// Size: 0x125
function function_cd54e45808e43fd2( turretindex )
{
    if ( !isdefined( turretindex ) )
    {
        turretindex = 0;
    }
    
    targetlist = function_59f86fe04b48ff46( turretindex );
    output = undefined;
    
    foreach ( target in targetlist )
    {
        if ( !function_83d3d1b4438e0282( target, turretindex ) )
        {
            continue;
        }
        
        var_eb12f4e776f82ef9 = self.var_8c4f0ae240813c2d[ turretindex ];
        
        if ( isarray( var_eb12f4e776f82ef9 ) && !arraycontains( var_eb12f4e776f82ef9, target.team ) )
        {
            continue;
        }
        
        if ( !output || distancesquared( self.origin, target.origin ) < distancesquared( self.origin, output.origin ) )
        {
            output = target;
        }
    }
    
    return output;
}

// Namespace turret
// Params 1
// Checksum 0x7bb88885, Offset: 0x64c
// Size: 0xa2
function function_59f86fe04b48ff46( turretindex )
{
    maxrange = self function_e7e25c06b8cfce7b( turretindex );
    targetlist = utility::charactersnear( self.origin, maxrange );
    
    if ( self.var_b4d7112df4d81e01 )
    {
        self.var_b4d7112df4d81e01 = function_5713d46873b29625( self.var_b4d7112df4d81e01 );
        targetlist = arraycombine( targetlist, self.var_b4d7112df4d81e01 );
    }
    
    if ( level.var_d143ed72b6b8509c )
    {
        level.var_d143ed72b6b8509c = function_5713d46873b29625( level.var_d143ed72b6b8509c );
        targetlist = arraycombine( targetlist, level.var_d143ed72b6b8509c );
    }
    
    return targetlist;
}

// Namespace turret
// Params 2
// Checksum 0x989b6721, Offset: 0x6f7
// Size: 0x220
function function_83d3d1b4438e0282( target, turretindex )
{
    if ( !target )
    {
        return 0;
    }
    
    if ( target == self )
    {
        return 0;
    }
    
    if ( isai( target ) && !isalive( target ) )
    {
        target = undefined;
        return 0;
    }
    
    if ( self.var_d327ab4c0ad1af1 )
    {
        valid = self [[ self.var_d327ab4c0ad1af1 ]]( target, turretindex );
        
        if ( valid == 0 || self.var_1c7945832f1b0fec )
        {
            return valid;
        }
    }
    
    if ( !self function_fae0085ed443216d( target, turretindex ) )
    {
        return 0;
    }
    
    if ( self function_6c8b5f034cb28a1( turretindex ) )
    {
        players = getentarray( "player", #classname );
        
        foreach ( player in players )
        {
            if ( function_ac9a46e7219dab04( target, player, turretindex ) )
            {
                return 0;
            }
        }
    }
    
    foreach ( tag in level.var_149c6f9e292662bf )
    {
        point = target.origin;
        
        if ( tag && target tagexists( tag ) )
        {
            point = target gettagorigin( tag );
        }
        
        if ( self.var_6446335ac46dd806 )
        {
            blocked = function_8fcd9c4dc13ebc85( self function_6382f336b5e5cdca( turretindex ), point, self.var_6446335ac46dd806 );
            
            if ( blocked )
            {
                continue;
            }
        }
        
        if ( self vehicle_canturrettargetpoint( point, 1, self, turretindex ) || isplayer( target ) && target vehicle::function_502f53b13c796577() )
        {
            return 1;
        }
    }
    
    return 0;
}

// Namespace turret
// Params 1, eflags: 0x4
// Checksum 0x2c9a4222, Offset: 0x920
// Size: 0xaf
function private function_c01238529dc3d7c9( target )
{
    foreach ( tag in level.var_149c6f9e292662bf )
    {
        if ( tag && target tagexists( tag ) )
        {
            return ( target gettagorigin( tag, 1 ) ?? target.origin );
        }
    }
    
    return target.origin;
}

// Namespace turret
// Params 3, eflags: 0x4
// Checksum 0xb10adf8f, Offset: 0x9d8
// Size: 0x11e, Type: bool
function private function_ac9a46e7219dab04( target, friendly_player, turretindex )
{
    turretowner = self.owner;
    
    if ( !isdefined( friendly_player.team ) || !isdefined( turretowner.team ) )
    {
        return false;
    }
    
    if ( friendly_player.team != turretowner.team )
    {
        return false;
    }
    
    sourceorigin = self function_6382f336b5e5cdca( turretindex );
    playercenter = friendly_player getcentroid();
    var_a67e7f8fd4156052 = target getcentroid();
    playerdelta = playercenter - sourceorigin;
    playerdist = length( playerdelta );
    
    if ( playerdist < 0.001 )
    {
        return true;
    }
    
    targetdelta = var_a67e7f8fd4156052 - sourceorigin;
    anglebetween = math::anglebetweenvectors( playerdelta, targetdelta );
    var_f22d4d92488f3a6c = self function_c1d45ed8527ca93e( turretindex );
    var_f157a4b4284e57ca = atan( var_f22d4d92488f3a6c / playerdist );
    
    if ( anglebetween <= var_f157a4b4284e57ca )
    {
        return true;
    }
    
    return false;
}

// Namespace turret
// Params 2
// Checksum 0x66581582, Offset: 0xaff
// Size: 0x2b
function function_2e0a246d12d5e047( func, var_1f3418e684997b7e )
{
    self.var_d327ab4c0ad1af1 = func;
    self.var_1c7945832f1b0fec = var_1f3418e684997b7e;
}

// Namespace turret
// Params 3
// Checksum 0x40d00f75, Offset: 0xb32
// Size: 0x77
function function_3ca888c6dfade34b( var_883056895a66e2fe, start_callback, var_e45f88ea65ae1557 )
{
    assert( isdefined( self.var_7169348b3ab41964 ), "<dev string:x24>" );
    assert( self.var_7169348b3ab41964 == 4, "<dev string:x86>" );
    self.var_9ca58e7e70dee60f = var_883056895a66e2fe;
    self.var_db53e8fd42b7b31b = start_callback;
    self.var_fc63db88d80b1a32 = var_e45f88ea65ae1557;
    self notify( "custom_scanning_funcs_registered" );
}

// Namespace turret
// Params 1
// Checksum 0xec06deae, Offset: 0xbb1
// Size: 0x22
function function_99ed6a1bb065a301( pause )
{
    if ( !isdefined( pause ) )
    {
        pause = 1;
    }
    
    self.var_3e5eef8c1f6d60ff = pause;
}

// Namespace turret
// Params 1
// Checksum 0xa494c353, Offset: 0xbdb
// Size: 0x23c
function function_1210e1b3a51df4a( turretindex )
{
    self endon( "death" );
    self endon( "turret_disable" );
    self.var_7169348b3ab41964 = self function_f25217b3c53501a8( turretindex );
    
    switch ( self.var_7169348b3ab41964 )
    {
        case 0:
            return;
        case 1:
            self.var_db53e8fd42b7b31b = &function_965db87094ca8c55;
            break;
        case 2:
            self.var_9ca58e7e70dee60f = &function_3ce881663be017aa;
            self.var_db53e8fd42b7b31b = &function_8d530d727f476a04;
            self.var_fc63db88d80b1a32 = &function_d5e5609d2823a59;
            break;
        case 3:
            self.var_fc63db88d80b1a32 = &function_29d8d1f12d502d4d;
            break;
        case 4:
            self waittill( "custom_scanning_funcs_registered" );
            break;
    }
    
    if ( isdefined( self.var_9ca58e7e70dee60f ) )
    {
        self [[ self.var_9ca58e7e70dee60f ]]( turretindex );
    }
    
    var_65171929a435f0b7 = self function_ea39c0ebe91167dc( turretindex ) * 1000;
    var_b49e8e86c6df8205 = var_65171929a435f0b7 * -1;
    self.var_3b6b7692ec4025c = 1;
    
    while ( true )
    {
        if ( self getturrettargetent( turretindex ) || self.var_3e5eef8c1f6d60ff || self.shootstate && self.shootstate != 0 )
        {
            if ( self.var_3b6b7692ec4025c == 1 || self.var_3b6b7692ec4025c == 2 )
            {
                self function_dc687ac632f02272( 0, turretindex );
            }
            
            self.var_3b6b7692ec4025c = 0;
            waitframe();
            continue;
        }
        
        switch ( self.var_3b6b7692ec4025c )
        {
            case 0:
                self.var_3b6b7692ec4025c = 1;
                var_b49e8e86c6df8205 = gettime();
                break;
            case 1:
                if ( gettime() - var_b49e8e86c6df8205 >= var_65171929a435f0b7 )
                {
                    self.var_3b6b7692ec4025c = 2;
                    self function_dc687ac632f02272( 1, turretindex );
                    
                    if ( isdefined( self.var_db53e8fd42b7b31b ) )
                    {
                        self [[ self.var_db53e8fd42b7b31b ]]( turretindex );
                    }
                }
                
                break;
            case 2:
                if ( isdefined( self.var_fc63db88d80b1a32 ) )
                {
                    self [[ self.var_fc63db88d80b1a32 ]]( turretindex );
                }
                
                break;
        }
        
        waitframe();
    }
}

// Namespace turret
// Params 1
// Checksum 0x6dbf57c4, Offset: 0xe1f
// Size: 0x26
function function_3ce881663be017aa( turretindex )
{
    self.var_4f459d9242bc26c7 = self function_dacab85c937113ec( turretindex );
    self.var_89ee8a2a5206fad6 = 0;
}

// Namespace turret
// Params 1
// Checksum 0x1dcdeb2f, Offset: 0xe4d
// Size: 0x2e
function function_8d530d727f476a04( turretindex )
{
    self.targetangle = function_23d8726f2f7090bd( turretindex );
    self setturrettargetlocalangles( self.targetangle, turretindex );
}

// Namespace turret
// Params 1
// Checksum 0x1e6ea37a, Offset: 0xe83
// Size: 0xa6
function function_d5e5609d2823a59( turretindex )
{
    if ( !self function_e1197b29fb821650( turretindex ) )
    {
        if ( !self.var_89ee8a2a5206fad6 )
        {
            self.var_89ee8a2a5206fad6 = 1;
            self.var_b49e8e86c6df8205 = gettime();
            return;
        }
        
        if ( gettime() - self.var_b49e8e86c6df8205 >= self.var_4f459d9242bc26c7 )
        {
            self.var_89ee8a2a5206fad6 = 0;
            self.targetangle = self.targetangle == function_23d8726f2f7090bd( turretindex ) ? function_769c06c642b7459( turretindex ) : function_23d8726f2f7090bd( turretindex );
            self setturrettargetlocalangles( self.targetangle, turretindex );
        }
    }
}

// Namespace turret
// Params 1
// Checksum 0x4be24d34, Offset: 0xf31
// Size: 0x1c
function function_965db87094ca8c55( turretindex )
{
    self setturrettargetlocalangles( function_d985fd6089567a4e( turretindex ), turretindex );
}

// Namespace turret
// Params 1
// Checksum 0x1b7ac0d0, Offset: 0xf55
// Size: 0x65
function function_4913664506477ce0( turretindex )
{
    var_5d9554d97272ef8a = combineanglesinverted( self.angles, self getturretworldangles( turretindex ) );
    targetpitch = function_23d8726f2f7090bd( turretindex )[ 0 ];
    self.targetangle = ( targetpitch, var_5d9554d97272ef8a[ 1 ], var_5d9554d97272ef8a[ 2 ] );
    self setturrettargetlocalangles( self.targetangle, turretindex );
}

// Namespace turret
// Params 1
// Checksum 0x6aee4bba, Offset: 0xfc2
// Size: 0xca
function function_29d8d1f12d502d4d( turretindex )
{
    assert( self function_2e4c26b468c76e8b() + self function_74ab97c7348ee9ba() >= 360 || self function_13ce8d74c484fd89() + self function_1957721f68ffab81() >= 360, "<dev string:xe5>" );
    
    if ( self.targetangle )
    {
        if ( self function_e1197b29fb821650( turretindex ) )
        {
            return;
        }
        else
        {
            self.targetangle = undefined;
        }
    }
    
    yawoffset = 120;
    var_5d9554d97272ef8a = combineanglesinverted( self.angles, self getturretworldangles( turretindex ) );
    var_9f14cb68372709ed = ( function_23d8726f2f7090bd( turretindex )[ 1 ] > 0 ? 1 : -1 ) * yawoffset;
    targetlocalangles = var_5d9554d97272ef8a + ( 0, var_9f14cb68372709ed, 0 );
    self setturrettargetlocalangles( targetlocalangles, turretindex );
}

// Namespace turret
// Params 1
// Checksum 0x7e8947ac, Offset: 0x1094
// Size: 0x36
function function_23d8726f2f7090bd( turretindex )
{
    if ( !isdefined( self.var_18ebdbfa122a4a18 ) )
    {
        self.var_18ebdbfa122a4a18 = ( 0, self function_2e4c26b468c76e8b( turretindex ), 0 );
    }
    
    return self.var_18ebdbfa122a4a18;
}

// Namespace turret
// Params 1
// Checksum 0x7f254ed3, Offset: 0x10d3
// Size: 0x39
function function_769c06c642b7459( turretindex )
{
    if ( !isdefined( self.var_3fc8b804838c5f6a ) )
    {
        self.var_3fc8b804838c5f6a = ( 0, self function_74ab97c7348ee9ba( turretindex ) * -1, 0 );
    }
    
    return self.var_3fc8b804838c5f6a;
}

// Namespace turret
// Params 1
// Checksum 0x5b2c72c6, Offset: 0x1115
// Size: 0x20
function function_d985fd6089567a4e( turretindex )
{
    return ( function_23d8726f2f7090bd( turretindex ) + function_769c06c642b7459( turretindex ) ) / 2;
}

// Namespace turret
// Params 1
// Checksum 0x79260374, Offset: 0x113e
// Size: 0x17
function function_e2d699d813d8eac1( var_973d235e3665908a )
{
    self.var_18ebdbfa122a4a18 = var_973d235e3665908a;
}

// Namespace turret
// Params 1
// Checksum 0xcd31961c, Offset: 0x115d
// Size: 0x17
function function_42ec7ba446a3e025( var_973d235e3665908a )
{
    self.var_3fc8b804838c5f6a = var_973d235e3665908a;
}

// Namespace turret
// Params 1
// Checksum 0x4a31bf49, Offset: 0x117c
// Size: 0x24
function function_fa954b6b6aadaec0( smoketype )
{
    if ( !smoketype )
    {
        smoketype = "all";
    }
    
    self.var_6446335ac46dd806 = smoketype;
}

// Namespace turret
// Params 1
// Checksum 0xe2bfd9a2, Offset: 0x11a8
// Size: 0x4d
function function_42cbdea0305c3246( target )
{
    if ( !self.var_b4d7112df4d81e01 )
    {
        self.var_b4d7112df4d81e01 = [];
    }
    
    if ( !arraycontains( self.var_b4d7112df4d81e01, target ) )
    {
        self.var_b4d7112df4d81e01[ self.var_b4d7112df4d81e01.size ] = target;
    }
}

// Namespace turret
// Params 1
// Checksum 0xbec733d4, Offset: 0x11fd
// Size: 0x4d
function function_6697525b8034338a( target )
{
    if ( !level.var_d143ed72b6b8509c )
    {
        level.var_d143ed72b6b8509c = [];
    }
    
    if ( !arraycontains( level.var_d143ed72b6b8509c, target ) )
    {
        level.var_d143ed72b6b8509c[ level.var_d143ed72b6b8509c.size ] = target;
    }
}

// Namespace turret
// Params 1
// Checksum 0x187d92c1, Offset: 0x1252
// Size: 0x4e
function function_c5399067c9aded68( target )
{
    if ( !level.var_d143ed72b6b8509c )
    {
        level.var_d143ed72b6b8509c = [];
    }
    
    if ( !arraycontains( level.var_d143ed72b6b8509c, target ) )
    {
        level.var_d143ed72b6b8509c = arrayremove( level.var_d143ed72b6b8509c, target );
    }
}

// Namespace turret
// Params 2
// Checksum 0x89c922e0, Offset: 0x12a8
// Size: 0x49
function function_ed71b42f05d4d7d7( bonetag, var_8c8bec4ff50633dc )
{
    if ( var_8c8bec4ff50633dc || !level.var_149c6f9e292662bf )
    {
        level.var_149c6f9e292662bf = [];
    }
    
    level.var_149c6f9e292662bf[ level.var_149c6f9e292662bf.size ] = bonetag;
}

// Namespace turret
// Params 2
// Checksum 0x83cc6050, Offset: 0x12f9
// Size: 0x4a
function function_b1f9869724ef3655( var_8bed03034cd26489, var_8c8bec4ff50633dc )
{
    if ( var_8c8bec4ff50633dc || !level.var_149c6f9e292662bf )
    {
        level.var_149c6f9e292662bf = [];
    }
    
    level.var_149c6f9e292662bf = arraycombine( level.var_149c6f9e292662bf, var_8bed03034cd26489 );
}

// Namespace turret
// Params 1
// Checksum 0x75350eb6, Offset: 0x134b
// Size: 0x3cb
function function_912c602e8d3066fe( turretindex )
{
    self endon( "death" );
    self endon( "kill_turret" );
    self endon( "turret_disable" );
    
    if ( !level.var_149c6f9e292662bf )
    {
        function_ed71b42f05d4d7d7( "j_head" );
    }
    
    assert( self function_4a982264b67c1076( turretindex ) == -1, "<dev string:x131>" );
    self.shootstate = 0;
    weapon = self getturretweapon( turretindex );
    targetorigin = undefined;
    nextfiretime = 0;
    var_d32eab37e3674f4c = 0;
    var_8f509956b8acdf7b = 0;
    var_4b5db818db78e154 = 0;
    self.var_db9866782a912974 = self.turretoverrides[ turretindex ].var_f1c93ce3fcc75a1c ?? self function_1b900f8f8b28d016( turretindex );
    self.var_dbbb54782ab74996 = self.turretoverrides[ turretindex ].var_f1a62ae3fca0eace ?? self function_1bb4018f8b512c04( turretindex );
    self.var_2f7bafbafd2e9525 = self.turretoverrides[ turretindex ].var_2362505b36930b0e ?? self function_6ba877f4ddccdd97( turretindex );
    self.var_2f9eb9bafd54f2db = self.turretoverrides[ turretindex ].var_233f425b366ca48c ?? self function_6bcb85f4ddf34419( turretindex );
    self.var_5ddb53a32812c124 = self.turretoverrides[ turretindex ].var_4f189248a397f8c3 ?? self function_9cd5d66ae45e614a( turretindex );
    
    while ( true )
    {
        turrettarget = self getturrettargetent( turretindex );
        
        if ( !turrettarget )
        {
            if ( self.shootstate == 1 )
            {
                var_4b5db818db78e154 = gettime();
                self.shootstate = 3;
                
                if ( targetorigin )
                {
                    self setturrettargetvec( targetorigin );
                }
            }
            
            var_a6bcbebb3767f5df = gettime() - var_4b5db818db78e154;
            
            if ( self.shootstate == 3 && var_a6bcbebb3767f5df >= self.var_5ddb53a32812c124 )
            {
                self clearturrettarget( turretindex );
                self.shootstate = 0;
            }
            
            if ( self.shootstate == 0 )
            {
                waitframe();
                continue;
            }
        }
        else if ( self.shootstate == 3 )
        {
            self.shootstate = 0;
        }
        
        if ( self.shootstate == 0 )
        {
            var_d32eab37e3674f4c = randomintrange( self.var_db9866782a912974, self.var_dbbb54782ab74996 + 1 );
            self.shootstate = 1;
        }
        
        if ( self.shootstate == 1 && var_d32eab37e3674f4c <= 0 )
        {
            if ( self.var_2f7bafbafd2e9525 < self.var_2f9eb9bafd54f2db )
            {
                nextfiretime = gettime() + randomfloatrange( self.var_2f7bafbafd2e9525, self.var_2f9eb9bafd54f2db );
            }
            else
            {
                nextfiretime = gettime() + self.var_2f7bafbafd2e9525;
            }
            
            self.shootstate = 2;
        }
        
        if ( gettime() < nextfiretime )
        {
            waitframe();
            continue;
        }
        
        if ( self.shootstate == 2 )
        {
            var_d32eab37e3674f4c = randomintrange( self.var_db9866782a912974, self.var_dbbb54782ab74996 + 1 );
            self.shootstate = 1;
        }
        
        if ( self.shootstate == 1 )
        {
            canshoottarget = function_d2a9430b5ab39ab1( turretindex );
        }
        
        if ( self.shootstate == 3 || canshoottarget )
        {
            var_92d241a5b3e64d7c = self function_bdbb3ebff33d06( turretindex );
            var_d32eab37e3674f4c -= var_92d241a5b3e64d7c - var_8f509956b8acdf7b;
            var_8f509956b8acdf7b = var_92d241a5b3e64d7c;
            
            if ( var_d32eab37e3674f4c > 0 )
            {
                if ( weapontype( weapon ) == "bullet" )
                {
                    self function_eb437fa9d3f6a423( turretindex );
                }
                else if ( weapontype( weapon ) == "projectile" )
                {
                    projectile = self fireweapon( turretindex );
                    projectile.streakinfo = self.streakinfo;
                }
                
                nextfiretime = gettime() + weaponfiretime( weapon ) * 1000;
            }
        }
        
        waitframe();
    }
}

// Namespace turret
// Params 1
// Checksum 0xfa84e887, Offset: 0x171e
// Size: 0xc7, Type: bool
function function_d2a9430b5ab39ab1( turretindex )
{
    targetorigin = undefined;
    var_c073081be612a366 = self getturrettargetent( turretindex );
    
    if ( var_c073081be612a366 )
    {
        if ( isai( var_c073081be612a366 ) && !isalive( var_c073081be612a366 ) )
        {
            return false;
        }
        
        targetorigin = function_c01238529dc3d7c9( var_c073081be612a366 );
    }
    else if ( self function_b20c65c46755e7cd( turretindex ) )
    {
        targetorigin = self function_b20c65c46755e7cd( turretindex );
    }
    else
    {
        return false;
    }
    
    turretorigin = self function_6382f336b5e5cdca( turretindex );
    turretangles = self getturretworldangles( turretindex );
    turretdir = anglestoforward( turretangles );
    targetdir = targetorigin - turretorigin;
    deltaangle = math::anglebetweenvectors( turretdir, targetdir );
    return deltaangle <= self function_18782539d1486456( turretindex );
}

// Namespace turret
// Params 1
// Checksum 0xd9ec26cf, Offset: 0x17ee
// Size: 0x31, Type: bool
function function_f04860bfe1c3c27d( turretindex )
{
    if ( !turretindex )
    {
        turretindex = 0;
    }
    
    return self.shootstate == 1 || self.shootstate == 3;
}

