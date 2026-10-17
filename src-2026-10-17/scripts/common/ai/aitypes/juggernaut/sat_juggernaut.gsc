#using scripts\common\callbacks;

#namespace sat_juggernaut;

// Namespace sat_juggernaut
// Params 2
// Checksum 0x395a50be, Offset: 0x157
// Size: 0x3c
function precache( classname, aitypescriptbundle )
{
    if ( !level callback::exists( "on_agent_spawned", &agent_on_spawned ) )
    {
        level callback::add( "on_agent_spawned", &agent_on_spawned );
    }
}

// Namespace sat_juggernaut
// Params 1
// Checksum 0x321b0660, Offset: 0x19b
// Size: 0x80, Type: bool
function is_agent_juggernaut( agent )
{
    return issubstr( agent.agent_type, "sat_ob_enemy_specialist_jugg_minigun" ) || issubstr( agent.agent_type, "sat_ob_enemy_cradle_specialist_jugg_minigun" ) || issubstr( agent.agent_type, "sat_ob_enemy_specialist_jugg_minigun_hunt" ) || issubstr( agent.agent_type, "sat_ob_enemy_hvt_jugg_minigun" ) || issubstr( agent.agent_type, "sat_ob_enemy_cradle_hvt_jugg_minigun" );
}

// Namespace sat_juggernaut
// Params 1, eflags: 0x4
// Checksum 0x1bddb5d5, Offset: 0x224
// Size: 0x5d
function private agent_on_spawned( params )
{
    agent = params.agent;
    
    if ( !is_agent_juggernaut( agent ) )
    {
        return;
    }
    
    self.allowpain = 1;
    self.minpaindamage = 15;
    self.var_2ffc71aa3aa17005 = 750;
    self.var_cf5b234b05d52123 = 30;
}

