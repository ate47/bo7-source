#using script_151f9510acfc6ac9;
#using script_2cd07641bf71242a;
#using script_40b59d0e3258fa0e;
#using script_6c2f6a14fa53759e;
#using script_9add55567111158;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_viper_mini_asm;

// Namespace zombie_viper_mini_asm
// Params 0, eflags: 0x4
// Checksum 0x795f7668, Offset: 0x15a
// Size: 0xe3
function private function_b80edc60f9e6ee6f()
{
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
    level.scr_anim[ self.animname ][ "spawn_fast" ] = "spawn_fast";
    level.scr_anim[ self.animname ][ "spawn_ejection_up" ] = "spawn_ejection_up";
    level.scr_anim[ self.animname ][ "spawn_ejection_forward" ] = "spawn_ejection_forward";
    level.scr_anim[ self.animname ][ "spawn_ejection_stationary" ] = "spawn_ejection_stationary";
    level.scr_anim[ self.animname ][ "spawn_portal" ] = "spawn_portal";
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &on_move_speed_changed );
    namespace_55d38ee0bc42059f::function_5e4e942574025b35();
}

// Namespace zombie_viper_mini_asm
// Params 3
// Checksum 0x9977dec8, Offset: 0x245
// Size: 0xf2
function function_bc5712cc209b5631( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_b80edc60f9e6ee6f );
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm::asm_setmoveplaybackrate( 1 );
    zombie_traverse_asm::init_zombie_traverse_asm();
    namespace_55d38ee0bc42059f::init_zombie_viper_mini_melee();
    thread zombie_wander::wander_listener();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_viper_mini_asm
// Params 3
// Checksum 0x4c4d4b35, Offset: 0x33f
// Size: 0x36, Type: bool
function function_e6afd8e763326d76( asmname, statename, params )
{
    return ( self._blackboard.dismemberedlimbs & 3 ) == 0;
}

// Namespace zombie_viper_mini_asm
// Params 1, eflags: 0x4
// Checksum 0xeed2a6f8, Offset: 0x37e
// Size: 0x2f
function private on_ai_init( params )
{
    callback::remove( "on_ai_init", &on_ai_init );
    zombie_utils::function_a8ce00e0448cb6f0( "run", "aitype_default", 0 );
}

// Namespace zombie_viper_mini_asm
// Params 1, eflags: 0x4
// Checksum 0x7f24b503, Offset: 0x3b5
// Size: 0x39
function private on_move_speed_changed( params )
{
    if ( params.move_speed == "sprint" )
    {
        self.var_cdf48282bb6d1237 = 100;
        return;
    }
    
    self.var_cdf48282bb6d1237 = 75;
}

