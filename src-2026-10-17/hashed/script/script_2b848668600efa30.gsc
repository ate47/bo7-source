#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_5327d50d93090f10;

// Namespace namespace_5327d50d93090f10
// Params 0
// Checksum 0xe3e17a72, Offset: 0xfa
// Size: 0x91
function register_melee_variant()
{
    variant_asm::register_anim_variant( "melee", &function_a51510d63b8a632, &function_3301a5711e996c8 );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, undefined, 0 ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, undefined, 1 ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "walk", undefined ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "run", undefined ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "sprint", undefined ) );
}

// Namespace namespace_5327d50d93090f10
// Params 0
// Checksum 0x94dae63a, Offset: 0x193
// Size: 0x42
function function_34a612cca324de27()
{
    callback::get_template( self.animsetname ) callback::add( "on_is_moving_melee_changed", &function_e0d499c13803af86 );
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &melee_on_move_speed_changed );
}

// Namespace namespace_5327d50d93090f10
// Params 0
// Checksum 0x4494b9a7, Offset: 0x1dd
// Size: 0xe
function init_zombie_mangler_melee()
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_5327d50d93090f10
// Params 1, eflags: 0x4
// Checksum 0x37a55094, Offset: 0x1f3
// Size: 0x18
function private function_e0d499c13803af86( params )
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_5327d50d93090f10
// Params 1, eflags: 0x4
// Checksum 0x6c92877f, Offset: 0x213
// Size: 0x18
function private melee_on_move_speed_changed( params )
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_5327d50d93090f10
// Params 3, eflags: 0x4
// Checksum 0x6d729bdb, Offset: 0x233
// Size: 0x5a
function private function_774051f9d32fd993( is_moving_melee, move_type, is_single_armed )
{
    struct = spawnstruct();
    struct.is_moving_melee = is_moving_melee;
    struct.move_type = move_type;
    struct.is_single_armed = is_single_armed;
    return struct;
}

// Namespace namespace_5327d50d93090f10
// Params 1, eflags: 0x4
// Checksum 0xeae62326, Offset: 0x296
// Size: 0x10f
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
    
    if ( isdefined( struct.is_single_armed ) )
    {
        alias += struct.is_single_armed ? ( alias != "" ? "_" : "" ) + "single_armed" : "";
        
        if ( self.var_d54138bfd4334f7d != struct.is_single_armed )
        {
            return;
        }
    }
    
    return alias;
}

// Namespace namespace_5327d50d93090f10
// Params 1, eflags: 0x4
// Checksum 0x884276f0, Offset: 0x3ae
// Size: 0x19
function private function_3301a5711e996c8( alias )
{
    self function_695b8e1b655c2796( "melee", alias );
}

