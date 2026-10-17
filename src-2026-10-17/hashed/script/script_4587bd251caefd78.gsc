#using script_151f9510acfc6ac9;
#using script_2cd07641bf71242a;
#using script_6c2f6a14fa53759e;
#using script_780a4ae7fab11b56;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_galileo_drone_asm;

// Namespace zombie_galileo_drone_asm
// Params 0, eflags: 0x4
// Checksum 0x58a17bc4, Offset: 0xc4
// Size: 0x9
function private function_c6d71513acb07c95()
{
    namespace_6d408b858fdc9ee1::init_zombie_galileo_drone_move();
}

// Namespace zombie_galileo_drone_asm
// Params 3
// Checksum 0x756c5092, Offset: 0xd5
// Size: 0xe4
function function_9f018855976702df( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_c6d71513acb07c95 );
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm::asm_setmoveplaybackrate( 1 );
    zombie_traverse_asm::init_zombie_traverse_asm();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_galileo_drone_asm
// Params 1, eflags: 0x4
// Checksum 0x43710ef2, Offset: 0x1c1
// Size: 0x2f
function private on_ai_init( params )
{
    zombie_utils::function_a8ce00e0448cb6f0( "run", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

