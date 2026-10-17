#using scripts\asm\asm;
#using scripts\common\ai\aitypes\aries_boss\aries_boss;

#namespace aries_boss_asm;

// Namespace aries_boss_asm
// Params 3
// Checksum 0xb7ae9567, Offset: 0xf8
// Size: 0x59
function function_3ee8405e0d6b0de8( asmname, statename, params )
{
    profilestart();
    
    if ( level.mars_ai.play_spawn_anim )
    {
        self function_786bb6aa1b76c7ee( "dragons_breath_high", 1 );
        self function_786bb6aa1b76c7ee( "in_dragons_breath", 1 );
        thread aries_boss::dragons_breath_handler( 1 );
    }
    
    profilestop();
}

// Namespace aries_boss_asm
// Params 3
// Checksum 0x6700885e, Offset: 0x159
// Size: 0x9c
function function_dba3917d50a06c58( asmname, statename, params )
{
    alias = self getaiblackboarddynamic( "dragons_breath_left" ) ? "left_" : "right_";
    
    if ( self getaiblackboarddynamic( "dragons_breath_high" ) )
    {
        alias += "up";
        alias += self.tall_head ? "_tall" : "";
    }
    else
    {
        alias += "down";
    }
    
    dragons_breath_anim = asm::asm_chooseanim( asmname, statename, alias );
    return dragons_breath_anim;
}

// Namespace aries_boss_asm
// Params 3
// Checksum 0xd829e544, Offset: 0x1fe
// Size: 0x5a
function function_f0a6ddf81962185d( asmname, statename, params )
{
    alias = self getaiblackboarddynamic( "projectile_up" ) ? "up" : "down";
    projectile_anim = asm::asm_chooseanim( asmname, statename, alias );
    return projectile_anim;
}

