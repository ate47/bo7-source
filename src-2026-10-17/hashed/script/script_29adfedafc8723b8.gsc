#using script_2373da272a381e70;
#using script_614a6922f8440723;
#using script_7980b6b79a1821a0;
#using script_d63697598f8e713;

#namespace neutral;

// Namespace neutral
// Params 0
// Checksum 0x8679f3e3, Offset: 0x8b
// Size: 0x88
function main()
{
    if ( isdefined( self.stealth ) )
    {
        return;
    }
    
    enemy::init_settings();
    self.neutralsenses = 1;
    self.stealth_groupname = self.script_stealthgroup;
    enemy::init_flags();
    group::addtogroup( self.script_stealthgroup, self );
    self setpatrolstylebase();
    event::event_init_entity();
    thread enemy::monitor_damage_thread();
    
    /#
        thread debug::debug_enemy();
    #/
    
    self function_2534a85eba6b0e0b( "noncombat" );
    enemy::bt_set_stealth_state( "idle" );
    enemy::stealth_init_goal_radius();
}

