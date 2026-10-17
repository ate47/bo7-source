#using scripts\common\callbacks;

#namespace boss_pops_asm;

// Namespace boss_pops_asm
// Params 0, eflags: 0x4
// Checksum 0x82904c44, Offset: 0x98
// Size: 0x21
function private function_69bc49ae1be3a626()
{
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
}

// Namespace boss_pops_asm
// Params 3
// Checksum 0x9a64daaf, Offset: 0xc1
// Size: 0xa1
function function_21563b860ead0e69( asmname, statename, params )
{
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    callback::add( "on_ai_init", &on_ai_init );
}

// Namespace boss_pops_asm
// Params 1, eflags: 0x4
// Checksum 0x997c0873, Offset: 0x16a
// Size: 0x1d
function private on_ai_init( params )
{
    callback::remove( "on_ai_init", &on_ai_init );
}

