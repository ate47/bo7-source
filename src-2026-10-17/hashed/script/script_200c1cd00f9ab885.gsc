#using script_1260535c202c8074;
#using script_151f9510acfc6ac9;
#using script_15efdb5808058ab7;
#using script_193e3e231841082f;
#using script_3397bed1b741f042;
#using script_36d7680b337b15b;
#using script_51003dec974513a9;
#using scripts\common\utility;

#namespace zombie_deathworm_asm;

// Namespace zombie_deathworm_asm
// Params 1
// Checksum 0x11d016c9, Offset: 0x9b
// Size: 0x27
function init_asm_precache( aitypescriptbundle )
{
    zombie_deathworm::init_beam_attack_precache( aitypescriptbundle );
    zombie_deathworm::init_burrow_precache( aitypescriptbundle );
    zombie_deathworm::init_mobile_spawner_precache( aitypescriptbundle );
}

// Namespace zombie_deathworm_asm
// Params 0, eflags: 0x4
// Checksum 0x82326d05, Offset: 0xca
// Size: 0x21
function private function_5dcf3bb8aa3149be()
{
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
}

// Namespace zombie_deathworm_asm
// Params 3
// Checksum 0xaf42452, Offset: 0xf3
// Size: 0x78
function function_e87e7eda93105917( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_5dcf3bb8aa3149be );
    namespace_636cb8a8ba015294::init_snake_bite();
    namespace_6698c489bf4d184b::init_head_banger();
    zombie_deathworm::init_burrow();
    zombie_deathworm::init_mobile_spawner();
    zombie_deathworm::init_spittle();
    zombie_deathworm::init_beam_attack();
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

