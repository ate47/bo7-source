#using script_151f9510acfc6ac9;
#using script_40b59d0e3258fa0e;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_boss_virgil_asm;

// Namespace zombie_boss_virgil_asm
// Params 0, eflags: 0x4
// Checksum 0x86d42ea3, Offset: 0xdb
// Size: 0x40
function private function_7198bda0f5479fd6()
{
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
    level.scr_anim[ self.animname ][ "spawn_fast" ] = "spawn_fast";
}

// Namespace zombie_boss_virgil_asm
// Params 3
// Checksum 0x48ed16d3, Offset: 0x123
// Size: 0xe4
function function_a4ec5bc6cd9af548( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_7198bda0f5479fd6 );
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm::asm_setmoveplaybackrate( 1 );
    thread zombie_wander::wander_listener();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_boss_virgil_asm
// Params 1, eflags: 0x4
// Checksum 0x83c51f1d, Offset: 0x20f
// Size: 0x2f
function private on_ai_init( params )
{
    zombie_utils::function_a8ce00e0448cb6f0( "run", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

