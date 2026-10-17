#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\common\devgui;
#using scripts\common\utility;

#namespace zombie_callisto_claw_attack;

/#

    // Namespace zombie_callisto_claw_attack
    // Params 0
    // Checksum 0x605a656d, Offset: 0xa0
    // Size: 0xc, Type: dev
    function function_24effdc384d55c98()
    {
        setup_claw_attack_devgui();
    }

#/

// Namespace zombie_callisto_claw_attack
// Params 0
// Checksum 0x72e59bb, Offset: 0xb4
// Size: 0xba
function init_zombie_callisto_claw_attack()
{
    callisto_settings = self.zombieaisettings.var_d3de1a9faac42deb;
    assert( isdefined( callisto_settings ) );
    self.claw_attack_cooldown = int( utility::function_4b74c15943231980( callisto_settings.var_4c00f5b79a73340 ) );
    self.claw_attack_damage = callisto_settings.var_819c78838284d278 * ( self.var_fe048a2106d8ef00[ #"claw_attack" ] ?? 1 );
    self.claw_swipe_cone_angle = callisto_settings.var_8bcac136170ef14d;
    self.var_72438d00bd2b6b24 = callisto_settings.var_661dd9199c920a1d;
    self function_786bb6aa1b76c7ee( "claw_attack_cooldown", self.claw_attack_cooldown );
    thread watch_claw_attack();
}

// Namespace zombie_callisto_claw_attack
// Params 0, eflags: 0x4
// Checksum 0x1386ed2e, Offset: 0x176
// Size: 0x2f
function private watch_claw_attack()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"do_claw_attack" );
        asm::function_7256f5ba459c840b( "claw_attack_in" );
    }
}

/#

    // Namespace zombie_callisto_claw_attack
    // Params 0
    // Checksum 0x720987c6, Offset: 0x1ad
    // Size: 0x2e, Type: dev
    function setup_claw_attack_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x3e>", "<dev string:x50>", &function_579d05c896d653fe );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_callisto_claw_attack
    // Params 0, eflags: 0x4
    // Checksum 0x1040dda6, Offset: 0x1e3
    // Size: 0x45, Type: dev
    function private function_579d05c896d653fe()
    {
        callisto = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x6b>" );
        
        if ( isdefined( callisto ) )
        {
            callisto function_786bb6aa1b76c7ee( "<dev string:x7b>", 0 );
        }
    }

#/
