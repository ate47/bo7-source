#using script_151f9510acfc6ac9;
#using script_1f827eec11f3e4ef;
#using script_2b848668600efa30;
#using script_2cd07641bf71242a;
#using script_33781ab60ef13663;
#using script_5b7daaca1fd43817;
#using script_620eb610e5593d47;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_mangler_asm;

// Namespace zombie_mangler_asm
// Params 0, eflags: 0x4
// Checksum 0x6b01a167, Offset: 0xc5
// Size: 0x25
function private function_cfbb84b3d7bc65b8()
{
    namespace_5aa19eac128c0939::register_move_variant();
    namespace_5327d50d93090f10::register_melee_variant();
    namespace_7e2991bc3f84c62a::function_b53ccf032ed6922f();
    namespace_3d3dd05aed5a95f5::register_shoot_variant();
    namespace_3cb33073a34a0c5::register_barrage_variant();
}

// Namespace zombie_mangler_asm
// Params 3
// Checksum 0x89f13232, Offset: 0xf2
// Size: 0x100
function function_db80dea3cf0c80de( asmname, statename, params )
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
    namespace_5aa19eac128c0939::init_zombie_mangler_move();
    namespace_5327d50d93090f10::init_zombie_mangler_melee();
    namespace_3d3dd05aed5a95f5::init_zombie_mangler_shoot();
    namespace_3cb33073a34a0c5::init_zombie_mangler_barrage();
    zombie_traverse_asm::init_zombie_traverse_asm();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_mangler_asm
// Params 1, eflags: 0x4
// Checksum 0xf761a0b0, Offset: 0x1fa
// Size: 0x2f
function private on_ai_init( params )
{
    zombie_utils::function_a8ce00e0448cb6f0( "walk", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

