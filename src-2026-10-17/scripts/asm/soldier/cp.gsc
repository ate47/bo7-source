#namespace cp;

// Namespace cp
// Params 4
// Checksum 0x106838f1, Offset: 0x76
// Size: 0x3d, Type: bool
function transition_parachutestate( asmname, statename, tostatename, params )
{
    return self._blackboard.parachutestate == params;
}

// Namespace cp
// Params 4
// Checksum 0xf798ab71, Offset: 0xbc
// Size: 0x3a, Type: bool
function function_563c078ca2aa117c( asmname, statename, tostatename, params )
{
    return self codemoverequested() && isdefined( self.grenade );
}

