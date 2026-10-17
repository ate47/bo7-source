#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_e60d35adb067df4c;

// Namespace namespace_e60d35adb067df4c
// Params 0
// Checksum 0xc95a6487, Offset: 0xd3
// Size: 0x45
function register_melee_variant()
{
    variant_asm::register_anim_variant( "melee", &function_a51510d63b8a632, &function_3301a5711e996c8 );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, undefined ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, "run" ) );
}

// Namespace namespace_e60d35adb067df4c
// Params 0
// Checksum 0xb740a65e, Offset: 0x120
// Size: 0x42
function init_melee_global()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &melee_on_move_speed_changed );
    callback::get_template( self.animsetname ) callback::add( "on_is_moving_melee_changed", &function_e0d499c13803af86 );
}

// Namespace namespace_e60d35adb067df4c
// Params 0
// Checksum 0x96df9876, Offset: 0x16a
// Size: 0xe
function init_melee()
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_e60d35adb067df4c
// Params 1, eflags: 0x4
// Checksum 0x4ffc5723, Offset: 0x180
// Size: 0x18
function private melee_on_move_speed_changed( params )
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_e60d35adb067df4c
// Params 1, eflags: 0x4
// Checksum 0x14cb80c8, Offset: 0x1a0
// Size: 0x18
function private function_e0d499c13803af86( params )
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_e60d35adb067df4c
// Params 2, eflags: 0x4
// Checksum 0x66cabb2c, Offset: 0x1c0
// Size: 0x43
function private function_774051f9d32fd993( is_moving_melee, move_type )
{
    struct = spawnstruct();
    struct.is_moving_melee = is_moving_melee;
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_e60d35adb067df4c
// Params 1, eflags: 0x4
// Checksum 0x599a79e3, Offset: 0x20c
// Size: 0x66
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
    
    return alias;
}

// Namespace namespace_e60d35adb067df4c
// Params 1, eflags: 0x4
// Checksum 0x394ebf5d, Offset: 0x27b
// Size: 0x19
function private function_3301a5711e996c8( alias )
{
    self function_695b8e1b655c2796( "melee", alias );
}

