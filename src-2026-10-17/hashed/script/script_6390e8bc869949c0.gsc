#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_cc86c045f1a79d83;

// Namespace namespace_cc86c045f1a79d83
// Params 0
// Checksum 0x94ed1da0, Offset: 0xfa
// Size: 0x90
function register_melee_variant()
{
    variant_asm::register_anim_variant( "melee", &function_a51510d63b8a632, &function_3301a5711e996c8 );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, undefined ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "walk" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "run" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "sprint" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "super_sprint" ) );
}

// Namespace namespace_cc86c045f1a79d83
// Params 0
// Checksum 0x1a7d3e05, Offset: 0x192
// Size: 0x42
function function_c43078902ff61814()
{
    callback::get_template( self.animsetname ) callback::add( "on_is_moving_melee_changed", &function_e0d499c13803af86 );
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &melee_on_move_speed_changed );
}

// Namespace namespace_cc86c045f1a79d83
// Params 0
// Checksum 0x18b45eef, Offset: 0x1dc
// Size: 0xe
function init_zombie_callisto_melee()
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_cc86c045f1a79d83
// Params 1, eflags: 0x4
// Checksum 0x550bc207, Offset: 0x1f2
// Size: 0x18
function private function_e0d499c13803af86( params )
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_cc86c045f1a79d83
// Params 1, eflags: 0x4
// Checksum 0xe3c15ec, Offset: 0x212
// Size: 0x18
function private melee_on_move_speed_changed( params )
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_cc86c045f1a79d83
// Params 2, eflags: 0x4
// Checksum 0x82a9c46f, Offset: 0x232
// Size: 0x43
function private function_774051f9d32fd993( is_moving_melee, move_type )
{
    struct = spawnstruct();
    struct.is_moving_melee = is_moving_melee;
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_cc86c045f1a79d83
// Params 1, eflags: 0x4
// Checksum 0x2f196c0f, Offset: 0x27e
// Size: 0xae
function private function_a51510d63b8a632( struct )
{
    alias = "";
    
    if ( isdefined( struct.is_moving_melee ) )
    {
        alias += self.is_moving_melee ? "move" : "static";
        
        if ( istrue( self.is_moving_melee ) != struct.is_moving_melee )
        {
            return;
        }
    }
    
    if ( isdefined( struct.move_type ) )
    {
        alias += "_" + struct.move_type;
        
        if ( self._blackboard.movetype != struct.move_type )
        {
            return;
        }
    }
    
    return alias;
}

// Namespace namespace_cc86c045f1a79d83
// Params 1, eflags: 0x4
// Checksum 0xdd2dc01e, Offset: 0x335
// Size: 0x19
function private function_3301a5711e996c8( alias )
{
    self function_695b8e1b655c2796( "melee", alias );
}

