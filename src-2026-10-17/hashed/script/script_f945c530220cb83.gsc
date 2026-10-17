#using script_151f9510acfc6ac9;
#using script_2cd07641bf71242a;
#using script_359b0b3edb7487ee;
#using script_612247297c9694c8;
#using script_6c2f6a14fa53759e;
#using script_769dd81873f99e4f;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_amalgam_asm;

// Namespace zombie_amalgam_asm
// Params 0, eflags: 0x4
// Checksum 0x1e542afc, Offset: 0xd0
// Size: 0x10
function private function_cfbb84b3d7bc65b8()
{
    namespace_a60ccad3ba8b2b4f::function_8bf5e3edf86ea58d();
    namespace_14bc21a938ce7ab8::function_59a7855b0081fa78();
}

// Namespace zombie_amalgam_asm
// Params 3
// Checksum 0xc76fa598, Offset: 0xe8
// Size: 0x105
function function_81aa6d5dd7d092d8( asmname, statename, params )
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
    variant_asm::function_1e9b4a2fe400d128( "melee" );
    namespace_14bc21a938ce7ab8::init_zombie_amalgam_move();
    namespace_a60ccad3ba8b2b4f::init_zombie_amalgam_melee();
    zombie_ranged_attack_asm::init_ranged_attack_asm();
    zombie_traverse_asm::init_zombie_traverse_asm();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_amalgam_asm
// Params 1, eflags: 0x4
// Checksum 0xe78552c9, Offset: 0x1f5
// Size: 0x2f
function private on_ai_init( params )
{
    zombie_utils::function_a8ce00e0448cb6f0( "sprint", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

