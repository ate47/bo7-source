#using script_151f9510acfc6ac9;
#using script_201ae0c900017e43;
#using script_6c2f6a14fa53759e;
#using script_701cc3161aeaf522;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_triton_asm;

// Namespace zombie_triton_asm
// Params 0, eflags: 0x4
// Checksum 0xff801be6, Offset: 0xda
// Size: 0x47
function private function_cfbb84b3d7bc65b8()
{
    zombie_triton_move::function_6c6968735350f500();
    level.scr_anim[ self.animname ][ "awakening" ] = "awakening";
    level.scr_anim[ self.animname ][ "intro" ] = "intro";
}

// Namespace zombie_triton_asm
// Params 3
// Checksum 0x1cab3e3, Offset: 0x129
// Size: 0xeb
function function_2d7ed0e5caf24240( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_cfbb84b3d7bc65b8 );
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm::asm_setmoveplaybackrate( 1 );
    zombie_triton_move::init_zombie_triton_move();
    namespace_817b17979ad9848a::function_b992691c4ad426f();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_triton_asm
// Params 1, eflags: 0x4
// Checksum 0x3847348, Offset: 0x21c
// Size: 0x2f
function private on_ai_init( params )
{
    zombie_utils::function_a8ce00e0448cb6f0( "run", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

