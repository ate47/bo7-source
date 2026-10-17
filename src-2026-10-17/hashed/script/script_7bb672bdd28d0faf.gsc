#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\common\devgui;
#using scripts\common\utility;

#namespace zombie_callisto_roar;

/#

    // Namespace zombie_callisto_roar
    // Params 0
    // Checksum 0x13db7332, Offset: 0xaa
    // Size: 0xc, Type: dev
    function function_2add3f1f5708b07c()
    {
        setup_roar_devgui();
    }

#/

// Namespace zombie_callisto_roar
// Params 0
// Checksum 0x6e3c1a69, Offset: 0xbe
// Size: 0x9
function init_zombie_callisto_roar()
{
    thread roar_listener();
}

// Namespace zombie_callisto_roar
// Params 0, eflags: 0x4
// Checksum 0xf15583d1, Offset: 0xcf
// Size: 0x2a
function private roar_listener()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"roar_start" );
        thread on_roar();
    }
}

// Namespace zombie_callisto_roar
// Params 0, eflags: 0x4
// Checksum 0xe41944bc, Offset: 0x101
// Size: 0x3a
function private on_roar()
{
    self endon( #"death" );
    self endon( #"end_roar" );
    thread roar_rumble();
    self waittill( #"roar_end" );
    self function_786bb6aa1b76c7ee( "in_roar", 0 );
}

// Namespace zombie_callisto_roar
// Params 0, eflags: 0x4
// Checksum 0x853f9bf7, Offset: 0x143
// Size: 0xf1
function private roar_rumble()
{
    self endon( #"death" );
    self endon( #"end_roar" );
    rumble_dist = 600;
    
    while ( self getaiblackboarddynamic( "in_roar" ) )
    {
        earthquake( 0.28, 2.3, self.origin, rumble_dist );
        players = getplayersinradius( self.origin, rumble_dist );
        
        foreach ( player in players )
        {
            if ( !player utility::ent_flag( "callisto_roar_rumble" ) )
            {
                thread roar_rumble_on_player( player, rumble_dist );
            }
        }
        
        wait 1;
    }
}

// Namespace zombie_callisto_roar
// Params 2, eflags: 0x4
// Checksum 0xdde6849d, Offset: 0x23c
// Size: 0xee
function private roar_rumble_on_player( player, rumble_dist )
{
    player endon( #"death_or_disconnect" );
    assert( !player utility::ent_flag( "<dev string:x24>" ) );
    player utility::ent_flag_set( "callisto_roar_rumble" );
    player playrumblelooponentity( "steady_rumble" );
    
    while ( true )
    {
        is_alive = isalive( self );
        is_far = 0;
        var_7eb7e23ce7ac5e38 = 0;
        
        if ( is_alive )
        {
            var_48607cfdb87ffbae = distance2dsquared( self.origin, player.origin );
            is_far = var_48607cfdb87ffbae > squared( rumble_dist );
            var_7eb7e23ce7ac5e38 = !self getaiblackboarddynamic( "in_roar" );
        }
        
        if ( !is_alive || var_7eb7e23ce7ac5e38 || is_far )
        {
            player utility::ent_flag_clear( "callisto_roar_rumble" );
            player stoprumble( "steady_rumble" );
            return;
        }
        
        waitframe();
    }
}

/#

    // Namespace zombie_callisto_roar
    // Params 0
    // Checksum 0x3a7fa634, Offset: 0x332
    // Size: 0x44, Type: dev
    function setup_roar_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x39>" );
        devgui::add_devgui_func( "<dev string:x53>", "<dev string:x5e>", &force_roar );
        devgui::add_devgui_func( "<dev string:x72>", "<dev string:x7d>", &function_7491d81ce5b766d3 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_callisto_roar
    // Params 0, eflags: 0x4
    // Checksum 0xbda2a06b, Offset: 0x37e
    // Size: 0x44, Type: dev
    function private force_roar()
    {
        callisto = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x91>" );
        
        if ( isdefined( callisto ) )
        {
            asm::function_7256f5ba459c840b( "<dev string:xa1>" );
        }
    }

    // Namespace zombie_callisto_roar
    // Params 1, eflags: 0x4
    // Checksum 0x822ed35f, Offset: 0x3ca
    // Size: 0x24, Type: dev
    function private function_7491d81ce5b766d3( params )
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xa9>", @"hash_2355de33292cc664" );
    }

    // Namespace zombie_callisto_roar
    // Params 0, eflags: 0x4
    // Checksum 0x6c2931b6, Offset: 0x3f6
    // Size: 0x16, Type: dev
    function private debug_roar()
    {
        return getdvarint( @"hash_2355de33292cc664", 0 ) > 0;
    }

#/
