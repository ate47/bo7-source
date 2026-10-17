#using scripts\common\status_effects\status_effects;

#namespace effect_charm;

// Namespace effect_charm
// Params 5
// Checksum 0x80cb5aa7, Offset: 0x7f
// Size: 0x109
function charm( durations, attacker, end_callback, element_type, setmaxhealth = 1 )
{
    if ( !isdefined( self ) || isplayer( self ) || !self.aisettings.var_abb7ad1e6db7fa37 || status_effects::function_98e705c3c729bbbc( "charm" ) )
    {
        return 0;
    }
    
    assert( isdefined( attacker.team ) );
    charm_effect = status_effects::function_93edde8d0fe48bb6( "charm", durations, undefined, &start_charm, &end_charm, element_type );
    charm_effect.original_team = self.team;
    charm_effect.attacker = attacker;
    charm_effect.new_team = attacker.team;
    charm_effect.end_callback = end_callback;
    charm_effect.setmaxhealth = setmaxhealth;
    return status_effects::start_effect( charm_effect );
}

// Namespace effect_charm
// Params 1, eflags: 0x4
// Checksum 0x13e8d02, Offset: 0x191
// Size: 0x5b
function private start_charm( effect )
{
    if ( isdefined( self ) && isdefined( effect ) )
    {
        if ( effect.setmaxhealth )
        {
            self.health = self.maxhealth;
        }
        
        self.allowpain = 0;
        self.team = effect.new_team;
        self clearpath();
    }
}

// Namespace effect_charm
// Params 1, eflags: 0x4
// Checksum 0x93ff23d8, Offset: 0x1f4
// Size: 0x5a
function private end_charm( effect )
{
    if ( isdefined( self ) && isdefined( effect ) )
    {
        self.allowpain = 1;
        self.team = effect.original_team;
        self clearpath();
        
        if ( isdefined( effect.end_callback ) )
        {
            self [[ effect.end_callback ]]();
        }
    }
}

