#using script_6c2f6a14fa53759e;
#using script_6cff0e2cbf0ff341;
#using script_d6d19e875fd7d86;
#using scripts\asm\asm;
#using scripts\common\devgui;
#using scripts\common\utility;

#namespace namespace_5d8c8e7c63b470d5;

/#

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 0
    // Checksum 0x19acc60d, Offset: 0x102
    // Size: 0xc, Type: dev
    function function_54867ff0ab30fc90()
    {
        function_df8816bb4ca5a48d();
    }

#/

// Namespace namespace_5d8c8e7c63b470d5
// Params 0
// Checksum 0x21515e69, Offset: 0x116
// Size: 0x55
function function_57593f2c96dd64bc()
{
    if ( self.var_80527e900b54c4ec > gettime() )
    {
        self._blackboard.zombieunreachableisattacking = 0;
        return;
    }
    
    self.var_80527e900b54c4ec = gettime() + self.zombieaisettings.var_7502a7ba1077f41a * 1000;
    thread manage_spit();
}

// Namespace namespace_5d8c8e7c63b470d5
// Params 0, eflags: 0x4
// Checksum 0x335873cc, Offset: 0x173
// Size: 0x9c
function private manage_spit()
{
    self endon( #"death" );
    self endon( #"spit_end" );
    assert( !self._blackboard.var_99f794dc99944d15, "<dev string:x24>" );
    assert( isdefined( self.zombieaisettings.projectileattachtag ), "<dev string:x5a>" );
    thread function_eb0857bc6f481830();
    asm::function_7256f5ba459c840b( "spit_in" );
    thread track_target_angles();
    
    if ( isdefined( self.enemy ) )
    {
        self.rangedattacktarget = self.enemy;
    }
    
    thread fire_spit();
}

// Namespace namespace_5d8c8e7c63b470d5
// Params 0, eflags: 0x4
// Checksum 0x43ba0368, Offset: 0x217
// Size: 0x26d
function private fire_spit()
{
    self endon( #"death" );
    self endon( #"spit_end" );
    spitweapon = self.grenadeweapon;
    thread function_19c8fffa6488eee6();
    utility::waittill_notify_or_timeout( "launch_spit", 10 );
    thread function_b7142a03331eed94();
    anglediff = -1 * self.angles[ 1 ];
    upvec = anglestoup( self.angles );
    var_8b712f5809f82032 = self gettagorigin( self.zombieaisettings.projectileattachtag ) - self.origin;
    var_8b712f5809f82032 = rotatepointaroundvector( upvec, var_8b712f5809f82032, anglediff );
    targetorigin = undefined;
    
    if ( true )
    {
        forwardvec = anglestoforward( self.angles );
        displacement = forwardvec * 500;
        targetorigin = getclosestpointonnavmesh( self.origin + displacement );
    }
    else
    {
        targetorigin = self.rangedattacktarget.origin;
        navorigin = getclosestpointonnavmesh( targetorigin, self, 0, 1 );
        
        if ( isdefined( navorigin ) )
        {
            tacpoint = function_5a577f4e6e89a130( self.origin, navorigin, 0, 500, 150 );
            
            if ( isdefined( tacpoint ) )
            {
                targetorigin = tacpoint.origin;
            }
        }
    }
    
    self._blackboard.zombieattackpoint = targetorigin;
    to_target = targetorigin - self.origin;
    var_eab1a0cb19041ba2 = self function_d5e40e88a4ac1386( spitweapon, undefined, 0, 0, 300, 300, 0, var_8b712f5809f82032 );
    
    if ( !isdefined( var_eab1a0cb19041ba2 ) )
    {
        return;
    }
    
    startpos = self gettagorigin( self.zombieaisettings.projectileattachtag );
    spit = magicgrenademanual( spitweapon, startpos, var_eab1a0cb19041ba2, self.zombieaisettings.var_f3ce124063bf11bf, self );
    
    if ( isdefined( spit ) )
    {
        spit.angles = self gettagangles( self.zombieaisettings.projectileattachtag );
        spit utility::function_32b24db3127bff40( "projectile", "aerial" );
        
        if ( !isdefined( self.var_86c5033c7c02d454 ) )
        {
            self.var_86c5033c7c02d454 = [];
        }
        
        self.var_86c5033c7c02d454[ self.var_86c5033c7c02d454.size ] = spit;
        thread function_5089804af7b391e3( spit );
    }
}

// Namespace namespace_5d8c8e7c63b470d5
// Params 1, eflags: 0x4
// Checksum 0xe2545763, Offset: 0x48c
// Size: 0x11e
function private function_5089804af7b391e3( spit )
{
    self endon( #"death" );
    spit endon( #"delay_death" );
    var_962bca9b8744cf88 = anglestoright( spit.angles );
    spit waittill( #"explode", origin, var_4cd1a139c1b0c2b7 );
    origin = getclosestpointonnavmesh( origin, self );
    normal = isvector( var_4cd1a139c1b0c2b7 ) ? var_4cd1a139c1b0c2b7 : undefined;
    var_261228b72ebe8a1d = undefined;
    impactangles = undefined;
    
    if ( isdefined( normal ) )
    {
        var_261228b72ebe8a1d = vectorcross( normal, var_962bca9b8744cf88 );
        impactangles = axistoangles( var_261228b72ebe8a1d, var_962bca9b8744cf88, normal );
    }
    else
    {
        impactangles = self.angles;
    }
    
    radiusdamage( origin, 128, 50, 50, self );
    post_fx = self.zombieaisettings.var_d3de1a9faac42deb.toxic_gas_postfx_bundle;
    thread zombie_toxic_gas::spawn_toxic_gas( self, origin, ( 0, 0, 0 ), "from_spit", 5, 256, 64, "roar_end" );
}

// Namespace namespace_5d8c8e7c63b470d5
// Params 0, eflags: 0x4
// Checksum 0x1fa67b93, Offset: 0x5b2
// Size: 0x1ae
function private track_target_angles()
{
    self endon( #"death" );
    self endon( #"spit_end" );
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
            
            /#
                spit_print( "<dev string:xb5>" + targetyaw, self.origin );
            #/
        }
        
        waitframe();
    }
}

// Namespace namespace_5d8c8e7c63b470d5
// Params 0, eflags: 0x4
// Checksum 0xc8a2aba4, Offset: 0x768
// Size: 0x2d
function private function_eb0857bc6f481830()
{
    msg = utility::waittill_any_return( "spit_end", "death", "spit_end" );
    self.rangedattacktarget = undefined;
}

// Namespace namespace_5d8c8e7c63b470d5
// Params 0, eflags: 0x4
// Checksum 0xf47b58a9, Offset: 0x79d
// Size: 0x3b
function private function_19c8fffa6488eee6()
{
    self endon( #"death" );
    utility::function_32b24db3127bff40( "spit_charge", "mouth" );
    wait 2;
    
    if ( isdefined( self ) )
    {
        utility::function_32b24db3127bff40( "spit_charge", "off" );
    }
}

// Namespace namespace_5d8c8e7c63b470d5
// Params 0, eflags: 0x4
// Checksum 0xdab51b0d, Offset: 0x7e0
// Size: 0x3b
function private function_b7142a03331eed94()
{
    self endon( #"death" );
    utility::function_32b24db3127bff40( "spit_spit", "mouth" );
    wait 2;
    
    if ( isdefined( self ) )
    {
        utility::function_32b24db3127bff40( "spit_spit", "off" );
    }
}

/#

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 0, eflags: 0x4
    // Checksum 0xbb156956, Offset: 0x823
    // Size: 0x86, Type: dev
    function private function_df8816bb4ca5a48d()
    {
        devgui::function_9082edeb5db93280( "<dev string:xc2>" );
        devgui::add_devgui_func( "<dev string:xdf>", "<dev string:xea>", &force_spit );
        devgui::add_devgui_func( "<dev string:xfc>", "<dev string:x107>", &function_97eadf002416e539 );
        devgui::add_devgui_func( "<dev string:x119>", "<dev string:x129>", &spawn_phobos_toxic_gas );
        devgui::add_devgui_func( "<dev string:x140>", "<dev string:x15a>", &function_bc78c4f067b745a );
        devgui::add_devgui_func( "<dev string:x17b>", "<dev string:x18f>", &clear_all_phobos_toxic_gas );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 1, eflags: 0x4
    // Checksum 0xc41aa0e5, Offset: 0x8b1
    // Size: 0x4b, Type: dev
    function private force_spit( params )
    {
        phobos = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x1aa>" );
        
        if ( isdefined( phobos ) )
        {
            phobos function_57593f2c96dd64bc();
        }
    }

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 0, eflags: 0x4
    // Checksum 0x2bf37d3d, Offset: 0x904
    // Size: 0x70, Type: dev
    function private spawn_phobos_toxic_gas()
    {
        look_at_pos = devgui::function_97024c0a6d1256a6();
        phobos = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x1aa>" );
        
        if ( isdefined( phobos ) )
        {
            thread zombie_toxic_gas::spawn_toxic_gas( phobos, look_at_pos, ( 0, 0, 0 ), "<dev string:x1b8>", 5, 256, 64, "<dev string:x1c2>" );
        }
    }

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 0, eflags: 0x4
    // Checksum 0xcc0812d7, Offset: 0x97c
    // Size: 0x98, Type: dev
    function private function_bc78c4f067b745a()
    {
        look_at_pos = devgui::function_97024c0a6d1256a6();
        phobos = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x1aa>" );
        
        if ( isdefined( phobos ) )
        {
            post_fx = phobos.zombieaisettings.var_d3de1a9faac42deb.toxic_gas_postfx_bundle;
            thread zombie_toxic_gas::spawn_toxic_gas( phobos, look_at_pos, ( 0, 0, 0 ), "<dev string:x1b8>", undefined, 350, 64, "<dev string:x1c2>" );
        }
    }

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 0, eflags: 0x4
    // Checksum 0x240c9279, Offset: 0xa1c
    // Size: 0x41, Type: dev
    function private clear_all_phobos_toxic_gas()
    {
        phobos = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x1aa>" );
        
        if ( isdefined( phobos ) )
        {
            zombie_phobos_spit::function_13c285f3a5c52573( phobos );
        }
    }

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 0, eflags: 0x4
    // Checksum 0xaf415424, Offset: 0xa65
    // Size: 0x1a, Type: dev
    function private function_97eadf002416e539()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x1cb>", @"hash_be2ddf6ebf01a118" );
    }

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 0, eflags: 0x4
    // Checksum 0xfaec2478, Offset: 0xa87
    // Size: 0x16, Type: dev
    function private debug_spit()
    {
        return getdvarint( @"hash_be2ddf6ebf01a118", 0 ) > 0;
    }

    // Namespace namespace_5d8c8e7c63b470d5
    // Params 2, eflags: 0x4
    // Checksum 0x3f6f2841, Offset: 0xaa5
    // Size: 0x5b, Type: dev
    function private spit_print( text, pos )
    {
        if ( debug_spit() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:x1dd>" + text, ( 1, 0, 0 ) );
        }
    }

#/
