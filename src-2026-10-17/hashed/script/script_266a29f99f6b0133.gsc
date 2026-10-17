#using script_151f9510acfc6ac9;
#using script_5cf687c0317fe818;
#using script_a968e45d71a4e1f;
#using scripts\asm\asm;
#using scripts\common\utility;

#namespace ztron_papaback_asm;

// Namespace ztron_papaback_asm
// Params 0, eflags: 0x4
// Checksum 0x6b37169a, Offset: 0x92
// Size: 0x10
function private function_cfbb84b3d7bc65b8()
{
    namespace_31c251633dac8f25::register_move_variant();
    namespace_245308063ee5298c::register_melee_variant();
}

// Namespace ztron_papaback_asm
// Params 3
// Checksum 0x1e3ce8f4, Offset: 0xaa
// Size: 0x68
function function_c94fe648ad5b0806( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_cfbb84b3d7bc65b8 );
    asm::asm_setmoveplaybackrate( 1 );
    namespace_31c251633dac8f25::init_ztron_papaback_move();
    namespace_245308063ee5298c::init_ztron_papaback_melee();
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

