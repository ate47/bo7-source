#using script_151f9510acfc6ac9;
#using script_1622db5f27c31c3f;
#using script_1a6a1f7bdb57d7ff;
#using script_40b59d0e3258fa0e;
#using script_4bc38131d8ecd20b;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_orion_asm;

// Namespace zombie_orion_asm
// Params 0, eflags: 0x4
// Checksum 0xa3a213fc, Offset: 0x12f
// Size: 0x21
function private function_caae7d151750f60e()
{
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
}

// Namespace zombie_orion_asm
// Params 3
// Checksum 0x4b97e837, Offset: 0x158
// Size: 0xe4
function function_4692ae2e620caedb( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_caae7d151750f60e );
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm::asm_setmoveplaybackrate( 1 );
    thread zombie_wander::wander_listener();
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_orion_asm
// Params 1, eflags: 0x4
// Checksum 0x294d5a28, Offset: 0x244
// Size: 0x2f
function private on_ai_init( params )
{
    zombie_utils::function_a8ce00e0448cb6f0( "run", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

// Namespace zombie_orion_asm
// Params 0
// Checksum 0x2b6d5b63, Offset: 0x27b
// Size: 0x41
function cause_special_pain()
{
    if ( !zombie_stun::is_stunned() && !self isintraverse() && isalive( self ) && val::get( "special_pain" ) )
    {
        asm::function_7256f5ba459c840b( "special_pain_in" );
        thread enraged();
    }
}

// Namespace zombie_orion_asm
// Params 0, eflags: 0x4
// Checksum 0x97a53141, Offset: 0x2c4
// Size: 0xd8
function private enraged()
{
    self endon( #"death" );
    zombie_utils::function_a8ce00e0448cb6f0( "sprint", "enraged", 32 );
    zombie_projectile_attack::enable_projectile_attack( 0 );
    val::set( "enraged", "pain", 0 );
    val::set( "enraged", "special_pain", 0 );
    val::set( "enraged", "collide_with_ai_allies_smaller", 0 );
    self.is_enraged = 1;
    
    if ( self.zombieaisettings.knockdowndata_list.size > 0 && !self.zombieaisettings.var_cf239a32f7448dd1 )
    {
        thread zombie_knockdown::function_a0c03faf3694150c( &knockdown_condition );
    }
    
    wait 30;
    zombie_utils::function_a8ce00e0448cb6f0( undefined, "enraged", 30 );
    zombie_projectile_attack::enable_projectile_attack( 1 );
    val::reset_all( "enraged" );
    self.is_enraged = 0;
}

// Namespace zombie_orion_asm
// Params 0, eflags: 0x4
// Checksum 0x2cb8fdd9, Offset: 0x3a4
// Size: 0xb
function private knockdown_condition()
{
    return self.is_enraged;
}

