#namespace zombie_react;

// Namespace zombie_react
// Params 4
// Checksum 0xec0075c3, Offset: 0x80
// Size: 0x65, Type: bool
function isenemyzombie( asmname, statename, tostatename, params )
{
    return isdefined( self.enemy ) && isdefined( self.enemy.unittype ) && self.enemy.unittype == "zombie";
}

