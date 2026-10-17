#using scripts\asm\cap;

#namespace base_interaction;

// Namespace base_interaction
// Params 3
// Checksum 0x91061d8b, Offset: 0xae
// Size: 0x68
function initcap( asmname, statename, params )
{
    if ( isai( self ) )
    {
        self animmode( "noclip" );
        self orientmode( "face current" );
    }
    else
    {
        self.fnasm_handlenotetrack = level._defaultnotetrackhandler;
    }
    
    if ( isdefined( self.var_9a42f5f373740892 ) )
    {
        self.var_9a42f5f373740892 = undefined;
    }
}

// Namespace base_interaction
// Params 0
// Checksum 0x91b2cb4e, Offset: 0x11e
// Size: 0x2
function cap_playturnanim()
{
    
}

// Namespace base_interaction
// Params 0
// Checksum 0xe33ff31d, Offset: 0x128
// Size: 0x2
function cap_chooseturnanim()
{
    
}

// Namespace base_interaction
// Params 3
// Checksum 0x423add3b, Offset: 0x132
// Size: 0x8a
function function_ae24fbc88667e655( asmname, statename, params )
{
    if ( !isdefined( self._blackboard.cowerstate ) )
    {
        self._blackboard.cowerstate = "a";
    }
    
    if ( self._blackboard.cowerstate == "b" )
    {
        return asm_cap::cap_chooseanim( asmname, statename, "a_to_b" );
    }
    
    return asm_cap::cap_chooseanim( asmname, statename, "b_to_a" );
}

// Namespace base_interaction
// Params 3
// Checksum 0xd48503dd, Offset: 0x1c4
// Size: 0x1f, Type: bool
function function_9e80a6e7189e6598( asmname, statename, params )
{
    return false;
}

// Namespace base_interaction
// Params 3
// Checksum 0x122d14f2, Offset: 0x1ec
// Size: 0x1f, Type: bool
function function_6e2803391355f287( asmname, statename, params )
{
    return false;
}

// Namespace base_interaction
// Params 3
// Checksum 0x4130743, Offset: 0x214
// Size: 0x4e
function function_9def69dc812bfa55( asmname, statename, params )
{
    if ( isdefined( self.interaction_angles ) )
    {
        self forceteleport( self.origin, self.interaction_angles );
    }
    
    asm_cap::cap_playanim( asmname, statename, params );
}

// Namespace base_interaction
// Params 3
// Checksum 0xec3e113, Offset: 0x26a
// Size: 0x33
function base_interaction_cap_exit( asmname, statename, params )
{
    self.interaction_angles = undefined;
    asm_cap::cap_exit( asmname, statename, params );
}

