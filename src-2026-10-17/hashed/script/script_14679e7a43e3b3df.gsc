#using script_1301524c1c5465db;
#using script_151f9510acfc6ac9;
#using script_2cd07641bf71242a;
#using script_6b518f9d5a2dd127;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_vermin_asm;

// Namespace zombie_vermin_asm
// Params 0, eflags: 0x4
// Checksum 0xe1b79dfc, Offset: 0x145
// Size: 0xe2
function private function_b6861f92da3ebf0c()
{
    namespace_f8183ce4e15db3da::function_b1c1009e68f9b112();
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
    level.scr_anim[ self.animname ][ "spawn_fast" ] = "spawn_fast";
    level.scr_anim[ self.animname ][ "spawn_wall" ] = "spawn_wall";
    level.scr_anim[ self.animname ][ "spawn_standing_emergence" ] = "spawn_standing_emergence";
    level.scr_anim[ self.animname ][ "spawn_collapsing_emergence" ] = "spawn_collapsing_emergence";
    level.scr_anim[ self.animname ][ "scare_jump_01" ] = "scare_jump_01";
    level.scr_anim[ self.animname ][ "scare_jump_02" ] = "scare_jump_02";
}

// Namespace zombie_vermin_asm
// Params 3
// Checksum 0xcf6daf3b, Offset: 0x22f
// Size: 0xf2
function function_c27b70c619647d79( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_b6861f92da3ebf0c );
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm::asm_setmoveplaybackrate( 1 );
    namespace_f8183ce4e15db3da::init_zombie_vermin_move();
    namespace_c05812b5323b8226::init_zombie_vermin_leap_attack();
    zombie_traverse_asm::init_zombie_traverse_asm();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_vermin_asm
// Params 1, eflags: 0x4
// Checksum 0x21738b1, Offset: 0x329
// Size: 0x2f
function private on_ai_init( params )
{
    zombie_utils::function_a8ce00e0448cb6f0( "run", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

