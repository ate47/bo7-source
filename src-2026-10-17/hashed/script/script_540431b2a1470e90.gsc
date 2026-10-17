#using script_359c9cda9983c8fc;
#using scripts\asm\asm;
#using scripts\common\utility;

#namespace namespace_7a57a365d91f07dc;

// Namespace namespace_7a57a365d91f07dc
// Params 1
// Checksum 0x4371584, Offset: 0x109
// Size: 0x61
function function_d517660e6fe7222a( var_7e46bfe69c8b823d )
{
    if ( self.var_80527e900b54c4ec > gettime() )
    {
        self._blackboard.zombieunreachableisattacking = 0;
        return;
    }
    
    self.var_80527e900b54c4ec = gettime() + self.zombieaisettings.var_7502a7ba1077f41a * 1000;
    thread function_ef51d4762cd59efe( var_7e46bfe69c8b823d );
}

// Namespace namespace_7a57a365d91f07dc
// Params 1, eflags: 0x4
// Checksum 0x7b5b99b8, Offset: 0x172
// Size: 0xb6
function private function_ef51d4762cd59efe( var_7e46bfe69c8b823d )
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    assert( !self._blackboard.var_99f794dc99944d15, "<dev string:x24>" );
    assert( isdefined( self.zombieaisettings.projectileattachtag ), "<dev string:x5a>" );
    thread function_dc7f82a94ca45948();
    
    if ( !var_7e46bfe69c8b823d )
    {
        asm::function_7256f5ba459c840b( "lava_toss_in" );
        thread track_target_angles();
    }
    
    thread function_2b8e2f68dbdc2171( var_7e46bfe69c8b823d );
    utility::waittill_any_timeout( 9, "terminate_ranged_attack" );
    self function_af99635258e79543( 0 );
    self function_a8fe8d86843b9cee( 0 );
}

// Namespace namespace_7a57a365d91f07dc
// Params 1, eflags: 0x4
// Checksum 0x7fedd8cd, Offset: 0x230
// Size: 0x43e
function private function_2b8e2f68dbdc2171( var_7e46bfe69c8b823d )
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    var_e8db7a4531b48b6c = self.grenadeweapon;
    
    if ( !var_7e46bfe69c8b823d )
    {
        thread function_5aeb7d5d4a69fbe0();
        self waittill( #"hash_dc4f7b2b8bbf03e5" );
    }
    
    thread function_60ba1debd9dafe56();
    anglediff = -1 * self.angles[ 1 ];
    upvec = anglestoup( self.angles );
    var_8b712f5809f82032 = self gettagorigin( self.zombieaisettings.projectileattachtag ) - self.origin;
    var_8b712f5809f82032 = rotatepointaroundvector( upvec, var_8b712f5809f82032, anglediff );
    
    if ( var_7e46bfe69c8b823d )
    {
        var_86d905818ccab9a4 = 500;
        forwardvec = anglestoforward( self.angles );
        var_ab24915a2a3dfe74 = forwardvec * ( var_86d905818ccab9a4 + var_86d905818ccab9a4 / 2 );
        var_8a5c71a62cd54202 = self.origin + var_ab24915a2a3dfe74;
        var_eab1a0cb19041ba2 = get_armor_break_lava_toss_projectile_velocity( var_8a5c71a62cd54202 );
    }
    else
    {
        var_eab1a0cb19041ba2 = self function_d5e40e88a4ac1386( var_e8db7a4531b48b6c, self.rangedattacktarget, 0, 0, 0, 0, 0, var_8b712f5809f82032 );
    }
    
    if ( !isdefined( var_eab1a0cb19041ba2 ) )
    {
        return;
    }
    
    var_e2592283a0b0b72a = 0.15;
    
    if ( self.var_75140e18c00d9bea > 1 )
    {
        /#
            var_498f2c03e098a89d = getdvarint( @"hash_685e011fd4073669", 0 );
        #/
        
        startpos = self gettagorigin( self.zombieaisettings.projectileattachtag );
        var_13f1098b1fe4f221 = 135;
        var_6e15bbf403e524c0 = 45;
        var_e0883dfbe537562 = 22.5;
        var_18b93264b332fbd8 = 3;
        var_5bc2b0fe745afeed = var_6e15bbf403e524c0;
        var_9da370c4066d7bab = var_18b93264b332fbd8;
        
        while ( var_9da370c4066d7bab < self.var_75140e18c00d9bea && var_5bc2b0fe745afeed <= var_13f1098b1fe4f221 )
        {
            var_9da370c4066d7bab += 2;
            var_5bc2b0fe745afeed += var_e0883dfbe537562;
        }
        
        var_f60c2f79e2e8cf74 = var_5bc2b0fe745afeed / ( self.var_75140e18c00d9bea - 1 );
        var_8c222ddb327ed902 = -1 * var_5bc2b0fe745afeed / 2;
        
        if ( var_7e46bfe69c8b823d )
        {
            vectotarget = var_8a5c71a62cd54202 - startpos;
        }
        else
        {
            vectotarget = self.rangedattacktarget getcentroid() - startpos;
        }
        
        var_98f94850a3fc6fcb = rotatepointaroundvector( upvec, vectotarget, var_8c222ddb327ed902 );
        currentvelocity = rotatepointaroundvector( upvec, var_eab1a0cb19041ba2, var_8c222ddb327ed902 );
        
        for ( i = 0; i < self.var_75140e18c00d9bea ; i++ )
        {
            /#
                if ( var_498f2c03e098a89d )
                {
                    print3d( startpos + var_98f94850a3fc6fcb + ( 0, 0, 100 ), "<dev string:xb5>" + i + 1 + "<dev string:xc0>", ( 1, 0, 0 ), 1, 1, 500, 1 );
                    sphere( startpos + var_98f94850a3fc6fcb, 5, ( 1, 0, 0 ), 0, 500 );
                }
            #/
            
            var_a3e08ae10e40f221 = vectortoangles( var_98f94850a3fc6fcb );
            lavabomb = magicgrenademanual( var_e8db7a4531b48b6c, startpos, currentvelocity, self.zombieaisettings.var_f3ce124063bf11bf, self );
            lavabomb thread zombie_triton_lava_bomb::function_f7f5dd74398250bc( var_e2592283a0b0b72a );
            lavabomb.angles = var_a3e08ae10e40f221;
            lavabomb utility::function_32b24db3127bff40( "projectile", "aerial" );
            lavabomb thread zombie_triton_lava_bomb::function_4205d8c2663ce650();
            thread zombie_triton_lava_bomb::function_966d048b40987b44( lavabomb );
            var_98f94850a3fc6fcb = rotatepointaroundvector( upvec, var_98f94850a3fc6fcb, var_f60c2f79e2e8cf74 );
            currentvelocity = rotatepointaroundvector( upvec, currentvelocity, var_f60c2f79e2e8cf74 );
            waitframe();
        }
        
        return;
    }
    
    startpos = self gettagorigin( self.zombieaisettings.projectileattachtag );
    lavabomb = magicgrenademanual( var_e8db7a4531b48b6c, startpos, var_eab1a0cb19041ba2, self.zombieaisettings.var_f3ce124063bf11bf, self );
    
    if ( var_7e46bfe69c8b823d )
    {
        lavabomb thread zombie_triton_lava_bomb::function_f7f5dd74398250bc( var_e2592283a0b0b72a );
    }
    
    lavabomb.angles = self gettagangles( self.zombieaisettings.projectileattachtag );
    lavabomb utility::function_32b24db3127bff40( "projectile", "aerial" );
    lavabomb thread zombie_triton_lava_bomb::function_4205d8c2663ce650();
    thread zombie_triton_lava_bomb::function_966d048b40987b44( lavabomb );
}

// Namespace namespace_7a57a365d91f07dc
// Params 1, eflags: 0x4
// Checksum 0xa7e63ab7, Offset: 0x676
// Size: 0xda
function private get_armor_break_lava_toss_projectile_velocity( targetpos )
{
    const_max_height = 30;
    gravity = getdvarfloat( @"bg_gravity" );
    var_78cf8bd7fad69e78 = self gettagorigin( self.zombieaisettings.projectileattachtag );
    var_222d8c32cacafcfb = ( var_78cf8bd7fad69e78[ 0 ], var_78cf8bd7fad69e78[ 1 ], targetpos[ 2 ] );
    var_6752203b2ff0e94b = targetpos - var_222d8c32cacafcfb;
    var_ffc359536ebac83b = length( var_6752203b2ff0e94b );
    var_6752203b2ff0e94b = vectornormalize( var_6752203b2ff0e94b );
    initvelocityz = sqrt( 2 * gravity * const_max_height );
    projectilespeed = self.var_ec263f0a689ef1dd;
    projectilevelocity = projectilespeed * var_6752203b2ff0e94b;
    projectilevelocity = ( projectilevelocity[ 0 ], projectilevelocity[ 1 ], initvelocityz );
    return projectilevelocity;
}

// Namespace namespace_7a57a365d91f07dc
// Params 0, eflags: 0x4
// Checksum 0xd3cebb47, Offset: 0x759
// Size: 0x23d
function private track_target_angles()
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    initpitch = 0;
    inityaw = 0;
    
    if ( self._blackboard.zombieattractoristarget )
    {
        var_4ed4c245d1c63455 = vectortoangles( self._blackboard.zombieattackpoint - self.origin );
        initpitch = var_4ed4c245d1c63455[ 0 ];
        inityaw = var_4ed4c245d1c63455[ 1 ];
    }
    else if ( isdefined( self.enemy ) )
    {
        anglestoenemy = vectortoangles( self.enemy.origin - self gettagorigin( self.zombieaisettings.projectileattachtag ) );
        initpitch = anglestoenemy[ 0 ];
        inityaw = anglestoenemy[ 1 ];
    }
    
    var_cd797298853457f5 = getdvarint( @"hash_cc1304b608d6c738", 0 );
    self function_af99635258e79543( 0 );
    self function_a8fe8d86843b9cee( 0 );
    
    while ( true )
    {
        if ( isdefined( self.enemy ) )
        {
            targetpitch = vectortopitch( self.enemy.origin - self gettagorigin( self.zombieaisettings.projectileattachtag ) ) - initpitch;
            targetpitch = angleclamp180( targetpitch );
            targetpitch = clamp( targetpitch, -45, 45 );
            targetyaw = vectortoyaw( self.enemy.origin - self gettagorigin( self.zombieaisettings.projectileattachtag ) ) - inityaw;
            targetyaw = angleclamp180( targetyaw );
            targetyaw = clamp( targetyaw, -45, 45 );
            self function_af99635258e79543( targetyaw );
            self function_a8fe8d86843b9cee( targetpitch );
            
            /#
                if ( var_cd797298853457f5 )
                {
                    print3d( self.origin, "<dev string:xc9>" + targetyaw, ( 1, 0, 0 ), 1, 1, 1, 1 );
                    print3d( self.origin + ( 0, 0, -10 ), "<dev string:xd6>" + targetpitch, ( 1, 0, 0 ), 1, 1, 1, 1 );
                }
            #/
        }
        
        waitframe();
    }
}

// Namespace namespace_7a57a365d91f07dc
// Params 0, eflags: 0x4
// Checksum 0xd44495a9, Offset: 0x99e
// Size: 0x51
function private function_dc7f82a94ca45948()
{
    msg = utility::waittill_any_return( "terminate_ranged_attack", "death" );
    
    if ( msg == "terminate_ranged_attack" )
    {
        self._blackboard.var_8f2dbb63d0d0a2bd = self getaiblackboarddynamic( "lavaTossRange" );
    }
    
    self.rangedattacktarget = undefined;
}

// Namespace namespace_7a57a365d91f07dc
// Params 0, eflags: 0x4
// Checksum 0xcd03ddc1, Offset: 0x9f7
// Size: 0x3b
function private function_5aeb7d5d4a69fbe0()
{
    self endon( #"death" );
    utility::function_32b24db3127bff40( "lava_toss_charge", "mouth" );
    wait 2;
    
    if ( isdefined( self ) )
    {
        utility::function_32b24db3127bff40( "lava_toss_charge", "off" );
    }
}

// Namespace namespace_7a57a365d91f07dc
// Params 0, eflags: 0x4
// Checksum 0x17b87b04, Offset: 0xa3a
// Size: 0x3b
function private function_60ba1debd9dafe56()
{
    self endon( #"death" );
    utility::function_32b24db3127bff40( "lava_toss_spit", "mouth" );
    wait 2;
    
    if ( isdefined( self ) )
    {
        utility::function_32b24db3127bff40( "lava_toss_spit", "off" );
    }
}

