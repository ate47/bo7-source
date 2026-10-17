#using script_151f9510acfc6ac9;
#using script_16ea1b94f0f381b3;
#using scripts\asm\shared\mp\utility;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_wither;

// Namespace zombie_wither
// Params 0, eflags: 0x4
// Checksum 0x8670f9b2, Offset: 0x14c
// Size: 0xdb
function private function_ef37a583b9259b59()
{
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
    level.scr_anim[ self.animname ][ "spawn_fast" ] = "spawn_fast";
    level.scr_anim[ self.animname ][ "attack" ] = "attack";
    level.scr_anim[ self.animname ][ "rise" ] = "rise";
    level.scr_anim[ self.animname ][ "react" ] = "react";
    level.scr_anim[ self.animname ][ "move" ] = "move";
    level.scr_anim[ self.animname ][ "grappled" ] = "grappled";
}

// Namespace zombie_wither
// Params 3
// Checksum 0x8e4782b4, Offset: 0x22f
// Size: 0x92
function function_6a29a724b2396239( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_ef37a583b9259b59 );
    callback::add( "killed_body_cloned", &function_aa40647fd314df22 );
    self.noragdoll = 1;
    utility::ent_flag_set( "zombie_asm_init_finished" );
    
    if ( utility::function_4c656524ecb504d6( "spawn" ) )
    {
        thread namespace_9d8e359c3b1041e5::animscripted_sharedfunc( "spawn", "spawn" );
    }
    
    return anim.success;
}

// Namespace zombie_wither
// Params 1
// Checksum 0xdda744b, Offset: 0x2ca
// Size: 0x7c
function function_aa40647fd314df22( params )
{
    if ( isdefined( params.body ) )
    {
        playworldsound( params.body.origin, #"hash_45caa435d8b4e3e8" );
        params.body utility::function_7c10ea82c1e305b8( "shadow_soul_fx", "death" );
        wait 1;
        
        if ( isdefined( params.body ) )
        {
            params.body delete();
        }
    }
}

// Namespace zombie_wither
// Params 3
// Checksum 0x130f913b, Offset: 0x34e
// Size: 0xa3
function function_cdbe8de20930399a( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_8bd377b5da60d82a );
    
    if ( self.subclass != "zombie_wither" && self.subclass != "zombie_wither_boss_fight" )
    {
        callback::add( "killed_body_cloned", &function_c3be7ce0980e2a52 );
    }
    
    utility::ent_flag_set( "zombie_asm_init_finished" );
    
    if ( utility::function_4c656524ecb504d6( "spawn" ) )
    {
        thread namespace_9d8e359c3b1041e5::animscripted_sharedfunc( "spawn", "spawn" );
    }
}

// Namespace zombie_wither
// Params 0, eflags: 0x4
// Checksum 0x429cbc3e, Offset: 0x3f9
// Size: 0x5f
function private function_8bd377b5da60d82a()
{
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
    level.scr_anim[ self.animname ][ "spawn_fast" ] = "spawn_fast";
    level.scr_anim[ self.animname ][ "laugh" ] = "laugh";
}

// Namespace zombie_wither
// Params 1, eflags: 0x4
// Checksum 0x5f8394d6, Offset: 0x460
// Size: 0x57
function private function_c3be7ce0980e2a52( params )
{
    if ( isdefined( params.body ) )
    {
        params.body utility::function_7c10ea82c1e305b8( "wither_fx", "death" );
        waitframe();
        
        if ( isdefined( params.body ) )
        {
            params.body delete();
        }
    }
}

